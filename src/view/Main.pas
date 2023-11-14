unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Server, Vcl.StdCtrls, Vcl.ExtCtrls,
  JvComponentBase, JvTrayIcon, Vcl.Samples.Spin, Vcl.DBCtrls, Vcl.Mask, Data.DB;

type
  TfrmMain = class(TForm)
    trayIcon: TJvTrayIcon;
    tmrMiniminize: TTimer;
    Label1: TLabel;
    lbEstado: TLabel;
    Label2: TLabel;
    lblPorta: TLabel;
    lblImpressora: TLabel;
    chkIniciarAuto: TDBCheckBox;
    edtImpressora: TDBEdit;
    edtPorta: TDBEdit;
    dsConfiguracao: TDataSource;
    btnConectar: TButton;
    btnDesconectar: TButton;
    btnVerLog: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrMiniminizeTimer(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure btnDesconectarClick(Sender: TObject);
    procedure btnVerLogClick(Sender: TObject);
  private
    FServer: TServer;
    procedure EstadoConexao(const conectado: boolean);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses DataMain, Log;

procedure TfrmMain.btnConectarClick(Sender: TObject);
begin
  if dmMain.Configuracao.State in [dsEdit, dsInsert] then
    dmMain.Configuracao.Post;

  FServer.Listen(dmMain.ConfiguracaoPortaServidor.AsInteger);
  TLog.Registrar('Servidor conectado');
  EstadoConexao(true);
end;

procedure TfrmMain.btnDesconectarClick(Sender: TObject);
begin
  if FServer.Conectado then
    FServer.Stop;

  TLog.Registrar('Servidor desconectado');
  EstadoConexao(false);
end;

procedure TfrmMain.btnVerLogClick(Sender: TObject);
begin
  TLog.VerLog();
end;

procedure TfrmMain.EstadoConexao(const conectado: boolean);
begin
  if conectado then
  begin
    btnConectar.Enabled := false;
    btnDesconectar.Enabled := true;

    lbEstado.Caption := 'CONECTADO';
    lbEstado.Font.Color := clGreen;

    lblPorta.Enabled := false;
    edtPorta.Enabled := false;
    lblImpressora.Enabled := false;
    edtImpressora.Enabled := false;
    chkIniciarAuto.Enabled := false;
  end
  else
  begin
   btnConectar.Enabled := true;
    btnDesconectar.Enabled := false;

    lbEstado.Caption := 'DESCONECTADO';
    lbEstado.Font.Color := clRed;

    lblPorta.Enabled := true;
    edtPorta.Enabled := true;
    lblImpressora.Enabled := true;
    edtImpressora.Enabled := true;
    chkIniciarAuto.Enabled := true;
  end;
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if dmMain.Configuracao.State in [dsEdit, dsInsert] then
    dmMain.Configuracao.Post;

  btnDesconectar.Click;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FServer := TServer.Create();
  TLog.Registrar('Iniciado aplicacao');
end;

procedure TfrmMain.tmrMiniminizeTimer(Sender: TObject);
begin
  tmrMiniminize.Enabled := false;
  if dmMain.ConfiguracaoInicioAutomatico.AsBoolean then
    btnConectar.Click
  else
    btnDesconectar.Click;
end;

end.
