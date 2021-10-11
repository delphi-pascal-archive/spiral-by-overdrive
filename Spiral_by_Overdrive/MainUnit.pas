unit MainUnit;

{
 Без использования библиотек OpenGL, DirectX и др.

 Автор программы Тян Игорь aka Overdrive
 tyanigor@inbox.ru, icq 484-402-598      
 Программа распространяется как Freeware
}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Math;

type
  TXYZPoint = record
    x, y, z: Real;
  end;
  TCircle = array[1..36] of TXYZPoint;
  
  TMainForm = class(TForm)
    Timer: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Proekcia(Point: TXYZPoint; var x, y: integer);
    procedure Povorot(xi, yi: Real; var x, y: Real; fi: Real);
    { Public declarations }
  end;

var
  MainForm   : TMainForm;
  CircleArray: array[1..16] of TCircle;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
var
  i, j: Integer;
  zc  : Real;
begin
  zc := - 144;
  for i := 1 to 16 do
  begin
    for j := 1 to 36 do
    begin
      CircleArray[i][j].x := cos(DegToRad(j * 10)) * 50;
      CircleArray[i][j].y := sin(DegToRad(j * 10)) * 50;
      CircleArray[i][j].z := zc;
      zc := zc + 0.5;
    end;
  end;
end;

procedure TMainForm.Povorot(xi, yi: Real; var x, y: Real; fi: Real);
begin
  x := xi * Cos(DegToRad(fi)) - yi * Sin(DegToRad(fi));
  y := xi * Sin(DegToRad(fi)) + yi * Cos(DegToRad(fi));
end;

procedure TMainForm.Proekcia(Point: TXYZPoint; var x, y: integer);
begin
  x := Round(Point.x + Point.z / 255);
  y := Round(Point.y + Point.z / 255);
end;

procedure TMainForm.TimerTimer(Sender: TObject);
var
  i, j, x, y: Integer;
  xf, yf    : Real;
begin
  Canvas.Rectangle(0, 0, Width, Height);
  for i := 1 to 16 do
    for j := 1 to 36 do
    begin
      Povorot(CircleArray[i][j].x, CircleArray[i][j].z, xf, yf, 1.00);
      CircleArray[i][j].x := xf;
      CircleArray[i][j].z := yf;
      Povorot(CircleArray[i][j].y, CircleArray[i][j].z, xf, yf, 1.00);
      CircleArray[i][j].y := xf;
      CircleArray[i][j].z := yf;
      Povorot(CircleArray[i][j].x, CircleArray[i][j].y, xf, yf, 1.00);
      CircleArray[i][j].x := xf;
      CircleArray[i][j].y := yf;
      Proekcia(CircleArray[i][j], x, y);
      Canvas.Lock;
      Canvas.Pixels[200 + x, 200 + y] := clWhite;
      Canvas.Unlock;
    end;
end;

end.
