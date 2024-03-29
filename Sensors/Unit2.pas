unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Sensors,
  FMX.Objects, System.Sensors.Components, FMX.Controls.Presentation,
  FMX.StdCtrls, math;

type

  TForm2 = class(TForm)
    Timer1: TTimer;
    Rectangle1: TRectangle;
    MotionSensor1: TMotionSensor;
    Label1: TLabel;
    CornerButton1: TCornerButton;
    Label2: TLabel;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    CornerButton2: TCornerButton;
    procedure Timer1Timer(Sender: TObject);
    procedure CornerButton1Click(Sender: TObject);
    procedure contact(A, B: TRectangle);
    procedure CornerButton2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  rel: boolean;
implementation

{$R *.fmx}

procedure TForm2.CornerButton1Click(Sender: TObject);
  begin
    timer1.Enabled := true;
    motionsensor1.Active := true;
    motionsensor1.Sensor.Start;
    rectangle2.visible := true;
    rectangle3.visible := true;
    rectangle4.visible := true;
    rectangle5.visible := true;
    rectangle7.visible := true;
    rectangle8.visible:= true;
    rectangle10.visible := true;
    rectangle11.visible := true;
    rectangle12.visible := true;
    rectangle13.visible:= true;
    rel := true;
   // b := MotionSensor1.Sensor.SensorType.Gyrometer3D;
  end;

procedure TForm2.CornerButton2Click(Sender: TObject);
  begin
    timer1.Enabled := true;
    motionsensor1.Active := true;
    motionsensor1.Sensor.Start;
    rectangle2.visible := false;
    rectangle3.visible := false;
    rectangle4.visible := false;
    rectangle5.visible := false;
    rectangle7.visible := false;
    rectangle8.visible := false;
    rectangle10.visible := false;
    rectangle11.visible := false;
    rectangle12.visible := false;
    rectangle13.visible := false;
    rel := false;
  end;

procedure TForm2.contact(A, B: TRectangle);
 begin
   if ((A.Position.X + A.width > B.Position.X)
         and (A.Position.X < B.Position.X + B.width))
         and ((A.Position.Y + A.height > B.Position.Y)
         and (A.Position.Y < B.Position.Y + B.height)) then
             begin
                 showmessage('�� ���������!');
                 A.Position.X := round((form2.width - A.Width) / 2);
                 A.Position.Y := form2.Height - A.Height;
                 timer1.Enabled := false;
             end;
 end;

procedure TForm2.Timer1Timer(Sender: TObject);
var Y, X, k: double;  g: integer;
  begin
     k := 0; // �����������, ����� ���������� ��������
     g := 10;
     label1.text := format('Angle X: %1.4f', [MotionSensor1.Sensor.AccelerationX]);
     label2.text := format('Angle Y: %1.4f', [MotionSensor1.Sensor.AccelerationY]);
     X := MotionSensor1.Sensor.AccelerationX;
     Y := MotionSensor1.Sensor.AccelerationY;
     if abs(Y) > k then
         begin
           if (rectangle1.Position.Y >= 0) and (rectangle1.Position.Y <=
                                      form2.Height - rectangle1.height) then
               rectangle1.Position.Y := rectangle1.Position.Y - round(Y * g);
         end;
     if (rectangle1.Position.Y >= form2.Height - rectangle1.height) then
         rectangle1.Position.Y := form2.Height - rectangle1.height;
     if (rectangle1.Position.X >= form2.width - rectangle1.width) then
         rectangle1.Position.X := form2.width - rectangle1.width;
     if (rectangle1.Position.Y <= 0) then
         rectangle1.Position.Y := 0;
     if (rectangle1.Position.X <= 0) then
         rectangle1.Position.X := 0;

     if abs(X) > k then
         begin
           if (rectangle1.Position.X >= 0) and (rectangle1.Position.X <=
                                      form2.width - rectangle1.width) then
               rectangle1.Position.X := rectangle1.Position.X + round(X * g);
         end;

     {if ((rectangle1.Position.X + rectangle1.width > rectangle2.Position.X)
         or (rectangle1.Position.X < rectangle2.Position.X + rectangle2.width))
         and ((rectangle1.Position.Y + rectangle1.height > rectangle2.Position.Y)
         or (rectangle1.Position.Y < rectangle2.Position.Y + rectangle2.height)) then
             begin
                 showmessage('�� ���������!');
                 rectangle1.Position.X := round((form2.width - rectangle1.Width) / 2);
                 rectangle1.Position.Y := form2.Height - rectangle1.Height;
             end; }
     if rel then
         begin
             contact(rectangle1, rectangle2);
             contact(rectangle1, rectangle3);
             contact(rectangle1, rectangle4);
             contact(rectangle1, rectangle5);
             contact(rectangle1, rectangle7);
             contact(rectangle1, rectangle8);
             contact(rectangle1, rectangle10);
             contact(rectangle1, rectangle11);
             contact(rectangle1, rectangle12);
             contact(rectangle1, rectangle13);
         end;
  end;

end.
