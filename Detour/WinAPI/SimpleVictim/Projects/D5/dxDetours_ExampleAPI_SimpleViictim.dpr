program dxDetours_ExampleAPI_SimpleViictim;

uses
  Forms,
  dxDetours_ExampleAPI_SimpleViictim_MainForm in '..\..\Source\dxDetours_ExampleAPI_SimpleViictim_MainForm.pas' {frmMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
