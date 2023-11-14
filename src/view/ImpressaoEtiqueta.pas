unit ImpressaoEtiqueta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, QuickRpt, QRCtrls,
  QRQRBarcode, Vcl.Printers;

type
  TfrmImpressaoEtiqueta = class(TForm)
    Report: TQuickRep;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel5: TQRLabel;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    QRQRDBBarcode1: TQRQRDBBarcode;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
  private
    { Private declarations }
  public
    class procedure Imprimir(const aImpressora: string = ''; const aCopias: integer = 1);
  end;

implementation

{$R *.dfm}

uses DataMain, Log;

{ TfrmImpressaoEtiqueta }

class procedure TfrmImpressaoEtiqueta.Imprimir(const aImpressora: string = ''; const aCopias: integer = 1);
var
  rep: TfrmImpressaoEtiqueta;
  idx: integer;
  impresso: boolean;
begin
  rep := TfrmImpressaoEtiqueta.Create(nil);
  try
    rep.Report.ReportTitle := 'Etiqueta';
    rep.Report.PrinterSettings.Title := 'Etiqueta';
    rep.Report.PrinterSettings.Copies := aCopias;

    if aImpressora = '' then
      TLog.Registrar('Nao se passou impressora para a impressao')
    else
    begin
      impresso := false;
      for idx := 0 to Printer.Printers.Count - 1 do
        if Printer.Printers[idx] = aImpressora then
        begin
          rep.Report.PrinterSettings.PrinterIndex := idx;
          rep.Report.Print;
          TLog.Registrar('Etiqueta impressa');
          impresso := true;
          break;
        end;

      if not impresso then
        TLog.Registrar('Impressora nao encontrada: ' + aImpressora);
    end;
  finally
    FreeAndNil(rep);
  end;
end;

end.
