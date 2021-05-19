unit uProgresso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, StdCtrls, ExtCtrls;

type TProgresso = class
   private
      FForm : TForm;
      FPanel : TPanel;
      FGauge : TGauge;
      FLabel : TLabel;
   public
      constructor Create(FormWidth: Integer = 600; FormHeight: Integer = 60);
      destructor Destroy; override;
      procedure Inicializar(ValorMax, ValorMin : Integer; Mensagem: String;
                            CorBarra: TColor = clSkyBlue);
      procedure Incrementar(ValorProgresso : Integer);
end;

implementation

{ TProgresso }

constructor TProgresso.Create(FormWidth: Integer = 600; FormHeight: Integer = 60);
begin
  FForm  := TForm.Create(nil);
  FPanel := TPanel.Create(FForm);
  FLabel := TLabel.Create(FPanel);
  FGauge := TGauge.Create(FPanel);

  with FForm do
  begin
    Name := 'FForm';
    BorderStyle := bsNone;
    Caption := 'Progresso';
    Height := FormHeight;
    Width := FormWidth;
    FormStyle := fsStayOnTop;
    Position := poScreenCenter;
  end;

  with FPanel do
  begin
    Name := 'FPanel';
    Parent := FForm;
    Align := alClient;
    Caption := '';
  end;

  with FLabel do
  begin
    Name := 'Flabel';
    Parent := FPanel;
    Align := alTop;
    Alignment := taCenter;
    Caption := 'Processando...';
    Font.Size := 12;
    Font.Style := [fsBold];
  end;

  with FGauge do
  begin
    Name := 'FGauge';
    Parent := FPanel;
    Align := alClient;
    Font.Size := 12;
    Font.Style := [fsBold];
  end;

end;

destructor TProgresso.Destroy;
begin
  FreeAndNil(FForm);
  inherited;
end;

procedure TProgresso.Incrementar(ValorProgresso: Integer);
begin
   FGauge.Progress := ValorProgresso;
   FForm.Update;
end;

procedure TProgresso.Inicializar(ValorMax, ValorMin: Integer; Mensagem: String;
                                CorBarra: TColor = clSkyBlue);
begin
   FGauge.MaxValue := ValorMax;
   FGauge.MinValue := ValorMin;
   FLabel.Caption  := Mensagem;
   FGauge.Progress := 0;
   FGauge.ForeColor := CorBarra;
   FForm.Show;
end;

end.
