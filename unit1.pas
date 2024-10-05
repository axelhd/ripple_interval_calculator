unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    l: TEdit;
    b: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lengthPanel: TPanel;
    bombsPanel: TPanel;
    Panel1: TPanel;
    resultPanel1: TPanel;
    speedPanel: TPanel;
    calculatePanel: TPanel;
    resultPanel: TPanel;
    s: TEdit;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure lChange(Sender: TObject);
    procedure exit(Sender: TObject; var Key: Word; Shift: TShiftState);
  private

  public

  end;

var
  Form1: TForm1;

  kn_to_fps: real;
  nm_to_ft: real;

  bombing_length_nm: real;
  bombing_length_ft: real;
  bombs: Integer;
  speed_kn: Integer;
  speed_fps: real;
  spacing: real;
  interval: real;


implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
begin
     nm_to_ft := 6076.115;
     kn_to_fps := 1.68781;

     Val(l.Text, bombing_length_nm);
     Val(b.Text, bombs);
     bombs-=1;
     Val(s.Text, speed_kn);

     bombing_length_ft := bombing_length_nm * nm_to_ft;
     speed_fps := speed_kn / 60 * 6076.115 / 60;
     spacing := bombing_length_ft / bombs;
     interval := spacing / speed_fps;

     //Label4.Caption := FloatToStr(interval);
     Label4.Caption := Format('%.2f', [interval]);
     Label6.Caption := Format('%.2f', [spacing]);
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
  if Form1.CheckBox1.State = cbChecked then
  begin
    Form1.FormStyle:=fsSystemStayOnTop;
  end;
  if Form1.CheckBox1.State = cbUnchecked then
  begin
    Form1.FormStyle:=fsNormal;
  end;
end;

procedure TForm1.CheckBox2Change(Sender: TObject);
begin

end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: char);
begin

end;

procedure TForm1.FormShow(Sender: TObject);
//var c: TComponent;
begin
  {for c in Form1.GetChildren() do
    begin
      c.OnKeyDown:=TForm1.exit;
    end;}
end;

procedure TForm1.Label4Click(Sender: TObject);
begin

end;

procedure TForm1.lChange(Sender: TObject);
begin

end;

procedure TForm1.exit(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (Key = 27) then
    begin
//      ShowMessage('exit');
      Form1.Close;
    end;
end;

end.

