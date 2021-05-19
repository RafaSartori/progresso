unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, StdCtrls, ExtCtrls, uProgresso;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
   mProgresso : TProgresso;
   i : Integer;
begin
   mProgresso := TProgresso.Create(400, 40);
   mProgresso.Inicializar(1000, 0, 'Processamento 1/3');

   for i := 0 to 1000 do
   begin
      Sleep(1);
      mProgresso.Incrementar(i);
   end;

   mProgresso.Inicializar(100, 0, 'Processamento 2/3', clBlue);
   for i := 0 to 100 do
   begin
      Sleep(1);
      mProgresso.Incrementar(i);
   end;

   mProgresso.Inicializar(100, 0, 'Processamento 3/3', clGreen);
   for i := 0 to 100 do
   begin
      Sleep(1);
      mProgresso.Incrementar(i);
   end;

   mProgresso.Free;
end;

end.
