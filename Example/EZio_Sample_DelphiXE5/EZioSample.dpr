program EZioSample;

uses
  Forms,
  FrmMain in 'FrmMain.pas' {FrmSample},
  GodexPrinter in 'GodexPrinter.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmSample, FrmSample);
  Application.Run;
end.
