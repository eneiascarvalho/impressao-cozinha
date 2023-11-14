unit DataMain;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, JSON,
  IniFiles;

type
  TdmMain = class(TDataModule)
    Etiqueta: TFDMemTable;
    Configuracao: TFDMemTable;
    ConfiguracaoPortaServidor: TIntegerField;
    ConfiguracaoImpressoraRede: TStringField;
    ConfiguracaoInicioAutomatico: TBooleanField;
    EtiquetanomeProduto: TStringField;
    Etiquetagrupo: TStringField;
    EtiquetalocalArmazenamento: TStringField;
    EtiquetadataEntrada: TStringField;
    EtiquetadataValidade: TStringField;
    Etiquetaresponsavel: TStringField;
    EtiquetanumEtiquetas: TIntegerField;
    EtiquetaQR: TMemoField;
    procedure DataModuleCreate(Sender: TObject);
    procedure ConfiguracaoAfterPost(DataSet: TDataSet);
  private
    procedure LoadConfiguracao();
    function getArquivoIni(): string;
  public
    procedure Imprimir(const sDados: string);
    procedure GuardarConfiguracao();
  end;

var
  dmMain: TdmMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Log, ImpressaoEtiqueta;

{$R *.dfm}

{ TDataModule1 }

procedure TdmMain.ConfiguracaoAfterPost(DataSet: TDataSet);
begin
  GuardarConfiguracao();
end;

procedure TdmMain.DataModuleCreate(Sender: TObject);
begin
  LoadConfiguracao();
end;

function TdmMain.getArquivoIni: string;
begin
  Result := ExtractFilePath(ParamStr(0)) + 'app.cfg';
end;

procedure TdmMain.GuardarConfiguracao();
var
  arquivo: TIniFile;
begin
  arquivo := TiniFile.Create(getArquivoIni);
  try
    if Configuracao.State in [dsEdit, dsInsert] then
      Configuracao.Post;

    arquivo.WriteInteger('config', 'PortaServidor', ConfiguracaoPortaServidor.AsInteger);
    arquivo.WriteString('config', 'ImpressoraRede', ConfiguracaoImpressoraRede.AsString);
    arquivo.WriteBool('config', 'InicioAutomatico', ConfiguracaoInicioAutomatico.AsBoolean);
  finally
    arquivo.Free;
  end;
end;

procedure TdmMain.Imprimir(const sDados: string);
var
  dados: TJSONObject;
begin
  if sDados <> '' then
  begin
    try
      dados := TJSONObject.ParseJSONValue(sDados) as TJSONObject;
      TLog.Registrar('Dados parseados');

      Etiqueta.Close;
      Etiqueta.Open;
      Etiqueta.Append;
      EtiquetanomeProduto.AsString := dados.Get('produto').JsonValue.Value;
      Etiquetagrupo.AsString := dados.Get('grupo').JsonValue.Value;
      EtiquetalocalArmazenamento.AsString := dados.Get('local').JsonValue.Value;
      EtiquetadataEntrada.AsString := dados.Get('entrada').JsonValue.Value;
      EtiquetadataValidade.AsString := dados.Get('validade').JsonValue.Value;
      Etiquetaresponsavel.AsString := dados.Get('responsável').JsonValue.Value;
      EtiquetanumEtiquetas.AsInteger := StrToIntDef(dados.Get('numEtiquetas').JsonValue.Value, 1);

      EtiquetaQR.AsString :=
        EtiquetanomeProduto.AsString + '#' +
        Etiquetagrupo.AsString + '#' +
        EtiquetalocalArmazenamento.AsString + '#' +
        Etiquetaresponsavel.AsString;

      Etiqueta.Post;

      TThread.CreateAnonymousThread(
        procedure
        begin
          TfrmImpressaoEtiqueta.Imprimir(
            ConfiguracaoImpressoraRede.AsString,
            EtiquetanumEtiquetas.AsInteger);
        end
      ).Start();
    except
      TLog.Registrar('Erro ao converter requisicao em JSON:' + sLineBreak + sDados);
    end;
  end
  else
  // log de que os dados nao chegaram corretamente
end;

procedure TdmMain.LoadConfiguracao;
var
  arquivo: TIniFile;
begin
  arquivo := TiniFile.Create(getArquivoIni);
  try
    Configuracao.Close;
    Configuracao.Open;
    Configuracao.Append;
    ConfiguracaoPortaServidor.AsInteger := arquivo.ReadInteger('config', 'PortaServidor', 9000);
    ConfiguracaoImpressoraRede.AsString := arquivo.ReadString('config', 'ImpressoraRede', '');
    ConfiguracaoInicioAutomatico.AsBoolean := arquivo.ReadBool('config', 'InicioAutomatico', true);
    Configuracao.Post;
    GuardarConfiguracao();
  finally
    arquivo.Free;
  end;
end;

end.
