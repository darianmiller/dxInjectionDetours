//Source: https://github.com/darianmiller/dxInjectionDetours
//For demonstration purposes only

unit dxDetours_InjectSelect_MainForm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, StdCtrls,
  dxLib_ProcessList;

type
  TfrmMain = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    labSelectedProcess: TLabel;
    butSetSourceDLL: TButton;
    edtSourceDLLPathName: TEdit;
    butRefreshProcesses: TButton;
    butInject: TButton;
    edtResult: TEdit;
    sgProcesses: TStringGrid;
    OpenDialog1: TOpenDialog;
    procedure butSetSourceDLLClick(Sender: TObject);
    procedure butRefreshProcessesClick(Sender: TObject);
    procedure edtSourceDLLPathNameChange(Sender: TObject);
    procedure sgProcessesSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure butInjectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    fActiveProcesses:TaProcessEntryList;
    function GetSelectedProcess(const pRowToSelect:Integer=-1):TiaProcessEntryItem;
    procedure SetInjectionEnabled(const pRowToSelect:Integer=-1);
  public
    { Public declarations }
  end;


const
  COL_ProcessId = 0;
  COL_ExeName = 1;
  COL_FullPathName = 2;
  COL_COUNT = 3;
  COL_ObjectReference = COL_ProcessId;

var
  frmMain: TfrmMain;

implementation
uses
  Contnrs,
  dxLib_WinInjection;

{$R *.DFM}


procedure TfrmMain.FormCreate(Sender: TObject);
begin
  fActiveProcesses := TaProcessEntryList.Create();

  sgProcesses.ColCount := COL_COUNT;
  sgProcesses.ColWidths[COL_ProcessId] := 65;
  sgProcesses.ColWidths[COL_ExeName] := sgProcesses.ColWidths[COL_ProcessId]*3;
  sgProcesses.ColWidths[COL_FullPathName] := sgProcesses.Width*2;

  OpenDialog1.InitialDir := GetCurrentDir;
  OpenDialog1.DefaultExt := '.dll';
  OpenDialog1.Filter := 'DLL files|*.dll';
  butInject.Enabled := False;
  labSelectedProcess.Caption := '';
end;


procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  fActiveProcesses.Free();
end;


procedure TfrmMain.butSetSourceDLLClick(Sender: TObject);
begin
  if OpenDialog1.Execute() then
  begin
    edtSourceDLLPathName.Text := OpenDialog1.FileName;
  end;
end;


procedure TfrmMain.butRefreshProcessesClick(Sender: TObject);
var
  i:Integer;
  vProcess:TiaProcessEntryItem;
  vRow:Integer;
begin
  SetInjectionEnabled();
  vRow := 0;

  sgProcesses.RowCount := vRow;
  sgProcesses.Repaint();

  fActiveProcesses.SnapShotActiveProcesses(True);
  fActiveProcesses.Sort(SortProcessEntryByExeName);

  for i := 0 to fActiveProcesses.Count-1 do
  begin
    vProcess := TiaProcessEntryItem(fActiveProcesses[i]);
    sgProcesses.RowCount := vRow+1;
    sgProcesses.Cells[COL_ProcessId,vRow] := Format('%d', [vProcess.ProcessID]);
    sgProcesses.Cells[COL_ExeName,vRow] := vProcess.ExeFile;
    sgProcesses.Cells[COL_FullPathName,vRow] := ExtractFilePath(vProcess.OptionalFullPathName);
    sgProcesses.Objects[COL_ObjectReference,vRow] := vProcess;

    Inc(vRow);
  end;
end;


procedure TfrmMain.edtSourceDLLPathNameChange(Sender: TObject);
begin
  SetInjectionEnabled();
end;


procedure TfrmMain.sgProcessesSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
begin
  SetInjectionEnabled(aRow);
end;


procedure TfrmMain.butInjectClick(Sender: TObject);
Const
  SuppressOSError = True;
var
  vProcess:TiaProcessEntryItem;
  vLastError:DWORD;
begin
  edtResult.Text := '';

  vProcess := GetSelectedProcess();
  if Assigned(vProcess) then
  begin
    if InjectDLL(vProcess.ProcessID, edtSourceDLLPathName.Text, SuppressOSError) then
    begin
      edtResult.Text := 'Success reported';
    end
    else
    begin
      vLastError := GetLastError();
      if vLastError <> 0 then
      begin
        edtResult.Text := SysErrorMessage(vLastError);
      end
      else
      begin
        edtResult.Text := 'Failed, unknown error';
      end;
    end;
  end
  else
  begin
    edtResult.Text := 'Target process not selected';
  end;
end;


function TfrmMain.GetSelectedProcess(const pRowToSelect:Integer=-1):TiaProcessEntryItem;
var
  vRow:Integer;
begin
  Result := nil;
  vRow := pRowToSelect;
  if vRow < 0 then
  begin
    vRow := sgProcesses.Row;
  end;
  if sgProcesses.RowCount > 0 then
  begin
    if sgProcesses.Objects[COL_ObjectReference,vRow] is TiaProcessEntryItem then
    begin
      Result := TiaProcessEntryItem(sgProcesses.Objects[COL_ObjectReference,vRow]);
    end;
  end;
end;


procedure TfrmMain.SetInjectionEnabled(const pRowToSelect:Integer=-1);
var
  vProcess:TiaProcessEntryItem;
begin
  labSelectedProcess.Caption := '';
  vProcess := GetSelectedProcess(pRowToSelect);

  if Assigned(vProcess) then
  begin
    labSelectedProcess.Caption := vProcess.ExeFile;
  end;

  butInject.Enabled := Assigned(vProcess)
                       and (edtSourceDLLPathName.Text > '')
                       and FileExists(edtSourceDLLPathName.Text)
                       and (labSelectedProcess.Caption > '');
end;

end.
