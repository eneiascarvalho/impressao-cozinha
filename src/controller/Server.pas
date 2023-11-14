unit Server;

interface

uses
  Horse,
  Horse.CORS,
  Horse.Jhonson,
  System.JSON,
  System.Classes;

type
  TServer = class
  private
    FApp: THorse;
  public
    procedure Listen(const aPort: integer);
    procedure Stop();
    function Conectado(): boolean;
    constructor Create;
  end;

implementation

uses
  DataMain, Log;

{ TServer }

function TServer.Conectado: boolean;
begin
  Result := FApp.IsRunning;
end;

constructor TServer.Create;
begin
  inherited Create;

  HorseCORS
    .AllowedOrigin('*')
    .AllowedCredentials(true)
    .AllowedHeaders('*')
    .AllowedMethods('*')
    .ExposedHeaders('*');

  FApp := THorse.Create();

  FApp.Use(CORS);
  FApp.Use(Jhonson);

  FApp.Post('/imprimir',
    procedure(req: THorseRequest; res: THorseResponse; next: TProc)
    begin
      TLog.Registrar('Post recebido:' + sLineBreak + req.Body);
      res.Send('{"status": "recebido"}');
      dmMain.Imprimir(req.Body);
    end);
end;

procedure TServer.Listen(const aPort: integer);
begin
  FApp.Listen(aPort);
end;

procedure TServer.Stop;
begin
  FApp.StopListen;
end;

end.
