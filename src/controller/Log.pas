unit Log;

interface

uses
  System.SysUtils,
  System.Classes,
  ShellApi;

type
  TLog = class
  public
    class procedure Registrar(const aTexto: string);
    class procedure VerLog();
  end;

implementation

{ TLog }

class procedure TLog.Registrar(const aTexto: string);
var
  nome_arquivo: string;
  arquivo: TStringList;
begin
  nome_arquivo := ExtractFilePath(ParamStr(0)) + FormatDateTime('dd-mm-yyyy', Date) + '.log';
  arquivo := TStringList.Create;
  try
    if FileExists(nome_arquivo) then
      arquivo.LoadFromFile(nome_arquivo);

    arquivo.Add(DateToStr(Now) + ' =============================================');
    arquivo.Add(aTexto);
    arquivo.SaveToFile(nome_arquivo);
  finally
    arquivo.Free;
  end;
end;

class procedure TLog.VerLog;
var
  nome_arquivo: string;
begin
  nome_arquivo := ExtractFilePath(ParamStr(0)) + FormatDateTime('dd-mm-yyyy', Date) + '.log';
  ShellExecute(0, 'Open', PChar(nome_arquivo), nil, '', 1);
end;

end.
