﻿unit G_U;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ColorGrd, ExtCtrls, jpeg, Grids;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    Gui: TTabSheet;
    Avatar: TTabSheet;
    Game: TTabSheet;
    rgbAvatar: TRadioGroup;
    Memo1: TMemo;
    btnLock: TButton;
    btnEnd: TButton;
    btnGot: TButton;
    Timer1: TTimer;
    pnlTime: TPanel;
    pnlScore: TPanel;
    Panel3: TPanel;
    Image1: TImage;
    Panel1: TPanel;
    Image2: TImage;
    Image4: TImage;
    Panel2: TPanel;
    Image3: TImage;
    Image5: TImage;
    pnlAvatar: TPanel;
    procedure btnGotClick(Sender: TObject);
    procedure btnLockClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEndClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  sAvatar, sPerformance : string;
  iScore, iTime, iCount : integer;

implementation

{$R *.dfm}
procedure TForm1.FormCreate(Sender: TObject);
begin
    pageControl1.Tabindex := 0;
    Timer1.Enabled := false;
    iCount := 60;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  dec(iCount);
  pnlTime.Caption := ('Time : ' + IntToStr(icount));

  if iCount = 0 then
    Timer1.Enabled := false;
end;

procedure TForm1.btnEndClick(Sender: TObject);
begin
  Timer1.Enabled := false;
  ShowMessage('Your Score: ' + IntToStr(iScore) + #13 + 'Your Performance: ' + sPerformance);
  close;
end;

procedure TForm1.btnGotClick(Sender: TObject);
begin
  pageControl1.Tabindex := 1;
end;

procedure TForm1.btnLockClick(Sender: TObject);
var
  iX, iY, iAnsw : integer;
begin
  case rgbAvatar.ItemIndex of
    0: sAvatar := ';)';
    1: sAvatar := ':)';
    2: sAvatar := ':D';
    3: sAvatar := ';P';
    4: sAvatar := 'XD';
  end;

  pnlAvatar.Caption := sAvatar;
  ShowMessage('Let The Scatter Begin!');
  pageControl1.Tabindex := 2;
  Timer1.Enabled := True;

  while iCount > 0 do
    begin
      iX := random(15) + 1;
      iY := random(15) + 1;
      iAnsw := StrToInt(inputbox('Question' , intToStr(iX) +  ' x ' + IntToStr(iY), ''));

      pnlAvatar.Font.Color := clSilver;
      pnlAvatar.Caption := sAvatar;

      if iX * iY = iAnsw then
        begin
          iScore := iScore + 10;
          pnlAvatar.Font.Color := clLime;
        end
        else
          begin
            iScore := iScore - 5;
            pnlAvatar.Font.Color := clRed;
            pnlAvatar.Caption := ':(';
          end;

      pnlScore.Caption := 'Score : ' + IntToStr(iScore);
    end;

  if (iScore >= 0) AND (iScore <= 50) then
    sPerformance := 'Poor';

  if (iScore > 50) AND (iScore <= 100) then
    sPerformance := 'Ok';

  if (iScore > 100) AND (iScore <= 150) then
    sPerformance := 'Good';

  if (iScore > 150) AND (iScore <= 200) then
    sPerformance := 'Great!';

  if (iScore > 200) AND (iScore <= 250) then
    sPerformance := 'Outstanding!';

  if (iScore > 250) AND (iScore <= 300) then
    sPerformance := 'Mythical';

  if iScore > 300 then
    sPerformance := 'A̶̠̰͗͝l̶̡̰̀̄ḯ̵̯̭͝ë̴̤̰̲́͠ń̴̳̖̿̆';

  ShowMessage('Your Score: ' + IntToStr(iScore) + #13 + 'Your Performance: ' + sPerformance);

  if iCount = 0 then
    close;

end;


end.
