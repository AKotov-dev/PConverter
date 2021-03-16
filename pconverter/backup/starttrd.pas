unit StartTRD;

{$mode objfpc}{$H+}

interface

uses
  Classes, Process, SysUtils, ComCtrls, Graphics;

type
  StartConvert = class(TThread)
  private
  var
    command: string;

    { Private declarations }
  protected
  var
    Result: TStringList;

    procedure Execute; override;

    procedure ShowLog;
    procedure StartProgress;
    procedure StopProgress;

  end;

implementation

uses Unit1;

{ TRD }

procedure StartConvert.Execute;
var
  ExProcess: TProcess;
begin
  try
    Synchronize(@StartProgress);

    FreeOnTerminate := True; //Уничтожать по завершении
    Result := TStringList.Create;

    //Вывод гола и прогресса
    ExProcess := TProcess.Create(nil); //Рабочий процесс

    ExProcess.Executable := 'bash';
    ExProcess.Parameters.Add('-c');
    ExProcess.Parameters.Add(command + MainForm.EditButton1.Text);

    ExProcess.Options := ExProcess.Options + [poUsePipes, poStderrToOutPut];

    ExProcess.Execute;

    //Пока поток запущен, отдавать результат прогресса из консоли в MainForm.StatusText
    while ExProcess.Running do
    begin
      Result.LoadFromStream(ExProcess.Output);
      //Выводим лог конвертирования
     // if Result.Count <> 0 then
        Synchronize(@ShowLog);
    end;

  finally
    Synchronize(@StopProgress);
    Result.Free;
    ExProcess.Free;
    Terminate;
  end;
end;

{ БЛОК ОТОБРАЖЕНИЯ ЛОГА }

//Старт индикатора
procedure StartConvert.StartProgress;
begin
  with MainForm do
  begin
    ConvertBtn.Enabled := False;
    Memo1.Clear;
    Label4.Font.Color := clGreen;
    Label4.Caption := SProgressConversion;
    ProgressBar1.Style := pbstMarquee;
  end;

  //Создаём команду
  command := 'alien --to-' + MainForm.ComboBox1.Text + ' ';
  if MainForm.CheckBox1.Checked then
    command := command + '--scripts ';
  if MainForm.CheckBox2.Checked then
    command := command + '--keep-version ';
  if MainForm.CheckBox3.Checked then
    command := command + '--fixperms ';
  if MainForm.CheckBox4.Checked then
    command := command + '--nopatch ';
  if MainForm.CheckBox5.Checked then
    command := command + '--generate ';
  if MainForm.CheckBox6.Checked then
    command := command + '--single ';
  if MainForm.CheckBox7.Checked then
    command := command + '--install ';
  if MainForm.CheckBox8.Checked then
    command := command + '--anypatch ';
  if MainForm.CheckBox5.Checked then
    command := command + '--generate ';
  if MainForm.CheckBox6.Checked then
    command := command + '--single ';
  if MainForm.CheckBox7.Checked then
    command := command + '--install ';
  if MainForm.CheckBox8.Checked then
    command := command + '--anypatch ';
  if MainForm.CheckBox11.Checked then
    command := command + '--test ';
  if MainForm.CheckBox15.Checked then
    command := command + '--version=' + MainForm.Edit4.Text + ' ';
  if MainForm.CheckBox9.Checked then
    command := command + '--bump=' + MainForm.Edit1.Text + ' ';
  if MainForm.CheckBox10.Checked then
    command := command + '--verbose ';
  if MainForm.CheckBox13.Checked then
    command := command + '--patch=' + MainForm.EditButton3.Text + ' ';
  if MainForm.CheckBox14.Checked then
    command := command + '--description=' + MainForm.Edit3.Text + ' ';
end;

//Стоп индикатора
procedure StartConvert.StopProgress;
begin
  with MainForm do
  begin
    Label4.Font.Color := clDefault;
    Label4.Caption := SProgressIdle;
    ProgressBar1.Style := pbstNormal;
    ProgressBar1.Position := 0;
    ConvertBtn.Enabled := True;
  end;
end;

//Вывод лога (построчное накопление)
procedure StartConvert.ShowLog;
begin
  MainForm.Memo1.Lines.Add(Trim(Result[0]));
end;


end.
