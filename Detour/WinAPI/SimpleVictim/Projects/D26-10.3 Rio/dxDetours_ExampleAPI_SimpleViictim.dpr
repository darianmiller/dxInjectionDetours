program dxDetours_ExampleAPI_SimpleViictim;

uses
  Vcl.Forms,
  dxDetours_ExampleAPI_SimpleViictim_MainForm in '..\..\Source\dxDetours_ExampleAPI_SimpleViictim_MainForm.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
