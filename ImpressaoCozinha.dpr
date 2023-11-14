program ImpressaoCozinha;

uses
  Vcl.Forms,
  Main in 'src\view\Main.pas' {frmMain},
  Server in 'src\controller\Server.pas',
  DataMain in 'src\controller\DataMain.pas' {dmMain: TDataModule},
  Log in 'src\controller\Log.pas',
  ImpressaoEtiqueta in 'src\view\ImpressaoEtiqueta.pas' {frmImpressaoEtiqueta};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
