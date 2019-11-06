//Source: https://github.com/darianmiller/dxInjectionDetours
//For demonstration purposes only
unit dxDetours_InterceptAPI_MessageBox_CustomImplementation;

interface
uses
  Windows,
  DDetours;

  procedure CreateIntercepts();
  procedure RemoveIntercepts();

var
  //definitions of methods to be replaced - ensure exact match to target methods
  InterceptMessageBoxA: function(hWnd: hWnd; lpText, lpCaption: LPCSTR; uType: UINT): Integer; stdcall = nil;
  InterceptMessageBoxW: function(hWnd: hWnd; lpText, lpCaption: LPCWSTR; uType: UINT): Integer; stdcall = nil;

implementation


function MyCustomMessageBoxA(hWnd: hWnd; lpText, lpCaption: LPCWSTR; uType: UINT): Integer; stdcall;
begin
  Result := InterceptMessageBoxA(hWnd, 'My custom message', 'ANSI Version Hooked', MB_OK or MB_ICONEXCLAMATION);
end;


function MyCustomMessageBoxW(hWnd: hWnd; lpText, lpCaption: LPCWSTR; uType: UINT): Integer; stdcall;
begin
  Result := InterceptMessageBoxW(hWnd, 'My custom message', 'UNICODE Version Hooked', MB_OK or MB_ICONEXCLAMATION);
end;


procedure CreateIntercepts();
begin
  BeginHooks;
    @InterceptMessageBoxA := InterceptCreate(@MessageBoxA, @MyCustomMessageBoxA);
    @InterceptMessageBoxW := InterceptCreate(@MessageBoxW, @MyCustomMessageBoxW);
  EndHooks;
end;


procedure RemoveIntercepts();
begin
  if Assigned(InterceptMessageBoxA) then
  begin
    BeginUnHooks;
    InterceptRemove(@InterceptMessageBoxA);
    InterceptRemove(@InterceptMessageBoxW);
    InterceptMessageBoxA := nil;
    InterceptMessageBoxW := nil;
    EndUnHooks;
  end;
end;

end.
