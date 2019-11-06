library dxDetours_InterceptAPI_MessageBox;
//Source: https://github.com/darianmiller/dxInjectionDetours
//For demonstration purposes only

uses
  WinApi.Windows,
  dxDetours_InterceptAPI_MessageBox_CustomImplementation in '..\..\Source\dxDetours_InterceptAPI_MessageBox_CustomImplementation.pas';

{$R *.RES}

procedure DllEntry(pReason:DWORD);
begin
   case pReason of
     DLL_PROCESS_ATTACH: CreateIntercepts();
     DLL_PROCESS_DETACH: RemoveIntercepts();
     DLL_THREAD_ATTACH:;
     DLL_THREAD_DETACH:;
   end;
end;

begin
  DllProc:= @DllEntry;
  DllEntry(DLL_PROCESS_ATTACH);

end.
