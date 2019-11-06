program dxDetours_InjectSelect;

uses
  Forms,
  dxDetours_InjectSelect_MainForm in '..\..\Source\dxDetours_InjectSelect_MainForm.pas' {frmMain},
  dxLib_ProcessList in '..\..\..\..\Dependencies\dxLib\Source\dxLib_ProcessList.pas',
  dxLib_Types in '..\..\..\..\Dependencies\dxLib\Source\dxLib_Types.pas',
  dxLib_WinApi in '..\..\..\..\Dependencies\dxLib\Source\dxLib_WinApi.pas',
  dxLib_WinInjection in '..\..\..\..\Dependencies\dxLib\Source\dxLib_WinInjection.pas',
  dxLib_Strings in '..\..\..\..\Dependencies\dxLib\Source\dxLib_Strings.pas',
  dxLib_ProcessFileNameFromId in '..\..\..\..\Dependencies\dxLib\Source\dxLib_ProcessFileNameFromId.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
