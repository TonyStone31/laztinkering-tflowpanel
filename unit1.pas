unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    btnRemoveAll: TButton;
    btnAdd1Random: TButton;
    btnAdd10Random: TButton;
    btnAdd50Random: TButton;
    btnAdd100Random: TButton;
    FlowPanel1: TFlowPanel;
    FlowPanel2: TFlowPanel;
    ScrollBox1: TScrollBox;
    procedure btnAdd100RandomClick(Sender: TObject);
    procedure btnAdd10RandomClick(Sender: TObject);
    procedure btnAdd1RandomClick(Sender: TObject);
    procedure btnAdd50RandomClick(Sender: TObject);
    procedure btnRemoveAllClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure MakeRandomSizeBox(QTY: Integer);
    procedure FormCreate(Sender: TObject);
  private

  public
    procedure MakeTheBox(grbxX: Integer; grbxY: Integer);

  end;

var
  Form1: TForm1;
  grbxCnt: Integer = 0;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin

  MakeTheBox(125, 125);
end;

procedure TForm1.btnAdd1RandomClick(Sender: TObject);
begin
  MakeRandomSizeBox(1);
end;

procedure TForm1.btnAdd50RandomClick(Sender: TObject);
begin
  MakeRandomSizeBox(50);
end;

procedure TForm1.btnRemoveAllClick(Sender: TObject);
var
i: Integer;
grbx: TGroupBox;
begin
  for i:=(FlowPanel1.ControlCount -1) downto 0 do begin
    if FlowPanel1.Controls[i] is TGroupBox then begin
      grbx:=FlowPanel1.Controls[i] as TGroupBox;
      grbx.Free;

    end;
  end;
  grbxCnt:=0;
end;

procedure TForm1.btnAdd10RandomClick(Sender: TObject);
begin
  MakeRandomSizeBox(10);
end;

procedure TForm1.btnAdd100RandomClick(Sender: TObject);
begin
  MakeRandomSizeBox(100);
end;

procedure TForm1.MakeRandomSizeBox(QTY: Integer);
var
  i: Integer;
begin
  for i:= 0 to QTY-1 do begin
    MakeTheBox(Random(100)+Random(50)+50, Random(100)+Random(50)+50);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Randomize;
end;

procedure TForm1.MakeTheBox(grbxX: Integer; grbxY: Integer);
var
  grbx: TGroupBox;
begin
  grbx:= TGroupBox.Create(self);
  grbx.Parent:= FlowPanel1;
  grbx.Caption:='Groupbox: #' + IntToStr(grbxCnt+1);
  grbx.Width:=grbxX;
  grbx.Height:=grbxY;
  Inc(grbxCnt, 1);
end;

end.

