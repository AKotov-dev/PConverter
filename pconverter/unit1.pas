unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, ComCtrls,
  Buttons, StdCtrls, EditBtn, LCLTranslator, DefaultTranslator, IniPropStorage;

type

  { TMainForm }

  TMainForm = class(TForm)
    CheckBox1: TCheckBox;
    CheckBox10: TCheckBox;
    CheckBox11: TCheckBox;
    CheckBox13: TCheckBox;
    CheckBox14: TCheckBox;
    CheckBox15: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    CheckBox8: TCheckBox;
    CheckBox9: TCheckBox;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    EditButton1: TEditButton;
    EditButton2: TEditButton;
    EditButton3: TEditButton;
    ImageList1: TImageList;
    IniPropStorage1: TIniPropStorage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Memo1: TMemo;
    OpenDialog1: TOpenDialog;
    OpenDialog2: TOpenDialog;
    ProgressBar1: TProgressBar;
    SelectDirectoryDialog1: TSelectDirectoryDialog;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ConvertBtn: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    procedure ComboBox1Change(Sender: TObject);
    procedure EditButton3ButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ConvertBtnClick(Sender: TObject);
    procedure ToolButton9Click(Sender: TObject);
  private

  public

  end;

resourcestring
  SWarning = '1. Select the package to convert' + #10#13 +
    '2. Select the directory for the final package' + #10#13 +
    '3. Select your final package type';

  SProgressIdle = 'Idle';
  SProgressConversion = 'Conversion...';

  SFinal = '[ Select your final package type ]';
  SFinal2 =
    'alien supports conversion between Linux Standard Base (LSB), LSB-compliant .rpm packages, .deb, Stampede (.slp), Solaris (.pkg) and Slackware (.tgz, .txz, .tbz, .tlz) packages. It is also capable of automatically installing the generated packages, and can try to convert the installation scripts included in the archive well.';

  SDebian = '[ Generate a Debian package ]';
  SDebian2 =
    'For converting to (but not from) deb format, the gcc, make, debmake, dpkg-dev, and dpkg packages must be installed.';

  SRedHat = '[ Generate a Red Hat package ]';
  SRedHat2 =
    'For converting to and from rpm format the Red Hat Package Manager must be installed.';

  SSlackWare = '[ Generate a SlackWare tgz package ]';
  SSlackWare2 =
    'Note that when converting from the tgz format, alien will simply generate an output package that has the same files in it as are in the tgz file. This only works well if the tgz file has precompiled binaries in it in a standard linux directory tree. Do NOT run alien on tar files with source code in them, unless you want this source code to be installed in your root directory when you install the package!';

  SStampede = '[ Generate a Stampede slp package ]';
  SStampede2 = 'Make slp package';

  SLSB = '[ Generate a LSB package ]';
  SLSB2 =
    'Unlike the other package formats, alien can handle the depenendencies of lsb packages if the destination package format supports dependencies. Note that this means that the package generated from a lsb package will depend on a package named "lsb" -- your distribution should provide a package by that name, if it is lsb compliant. The scripts in the lsb package will be converted by default as well.';

  SSolaris = '[ Generate a Solaris pkg package ]';
  SSolaris2 =
    'To manipulate packages in the Solaris pkg format (which is really the SV datastream package format, you will need the Solaris pkginfo and pkgtrans tools.';

var
  MainForm: TMainForm;

implementation

uses StartTRD, About;

{$R *.lfm}

{ TMainForm }

procedure TMainForm.ToolButton10Click(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
    0:
    begin
      Label1.Caption := SFinal;
      Label2.Caption := SFinal2;
    end;
    1:
    begin
      Label1.Caption := SDebian;
      Label2.Caption := SDebian2;
    end;
    2:
    begin
      Label1.Caption := SRedHat;
      Label2.Caption := SRedHat2;
    end;
    3:
    begin
      Label1.Caption := SSlackWare;
      Label2.Caption := SSlackWare2;
    end;
    4:
    begin
      Label1.Caption := SStampede;
      Label2.Caption := SStampede2;
    end;
    5:
    begin
      Label1.Caption := SLSB;
      Label2.Caption := SLSB2;
    end;
    6:
    begin
      Label1.Caption := SSolaris;
      Label2.Caption := SSolaris2;
    end;
  end;
end;

procedure TMainForm.EditButton3ButtonClick(Sender: TObject);
begin
  if OpenDialog2.Execute then
    EditButton3.Text := OpenDialog2.FileName;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  if not DirectoryExists(GetEnvironmentVariable('HOME') + '/.config') then
    MkDir(GetEnvironmentVariable('HOME') + '/.config');

  IniPropStorage1.IniFileName :=
    GetEnvironmentVariable('HOME') + '/.config/pconverter.conf';

  MainForm.Caption := Application.Title;
end;

procedure TMainForm.ToolButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
    EditButton1.Text := OpenDialog1.FileName;
end;

procedure TMainForm.ToolButton3Click(Sender: TObject);
begin
  if SelectDirectoryDialog1.Execute then
    EditButton2.Text := SelectDirectoryDialog1.FileName;
end;

procedure TMainForm.ConvertBtnClick(Sender: TObject);
var
  FStartConvertThread: TThread;
begin
  //Проверяем имя пакета, директорию назначени и выбор типа пакета
  if (not FileExists(EditButton1.Text)) or (not DirectoryExists(EditButton2.Text)) or
    (ComboBox1.ItemIndex = 0) then
  begin
    MessageDlg(SWarning, mtWarning, [mbOK], 0);
    Exit;
  end
  else
    SetCurrentDir(EditButton2.Text);

  //Запуск потока сразу
  FStartConvertThread := StartConvert.Create(False);
  FStartConvertThread.Priority := tpNormal;
end;

procedure TMainForm.ToolButton9Click(Sender: TObject);
begin
  AboutForm.Show;
end;

end.
