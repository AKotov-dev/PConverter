unit about;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { TAboutForm }

  TAboutForm = class(TForm)
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  AboutForm: TAboutForm;

implementation

{$R *.lfm}

{ TAboutForm }

procedure TAboutForm.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TAboutForm.FormShow(Sender: TObject);
begin
  Label1.Caption := Application.Title;
  AboutForm.Width := Label2.Left + Label2.Width + 20;
  AboutForm.Height := BitBtn1.Top + BitBtn1.Height + 10;
end;

end.
