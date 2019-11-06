program dxDetours_InjectSelect;

uses
  Vcl.Forms,
  dxDetours_InjectSelect_MainForm in '..\..\Source\dxDetours_InjectSelect_MainForm.pas' {frmMain},
  dxLib_ProcessList in '..\..\..\..\Dependencies\dxLib\Source\dxLib_ProcessList.pas',
  dxLib_ProcessNameToId in '..\..\..\..\Dependencies\dxLib\Source\dxLib_ProcessNameToId.pas',
  dxLib_Strings in '..\..\..\..\Dependencies\dxLib\Source\dxLib_Strings.pas',
  dxLib_Types in '..\..\..\..\Dependencies\dxLib\Source\dxLib_Types.pas',
  dxLib_WinApi in '..\..\..\..\Dependencies\dxLib\Source\dxLib_WinApi.pas',
  dxLib_WinInjection in '..\..\..\..\Dependencies\dxLib\Source\dxLib_WinInjection.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
