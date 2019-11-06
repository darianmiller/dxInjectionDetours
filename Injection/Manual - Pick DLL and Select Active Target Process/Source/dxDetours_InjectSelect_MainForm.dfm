object frmMain: TfrmMain
  Left = 223
  Top = 140
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 
    'dxDetours Example Project - Select DLL and Active Process to Tar' +
    'get'
  ClientHeight = 582
  ClientWidth = 608
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 20
    Width = 291
    Height = 13
    Caption = '1. Select source DLL to inject into another process'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 120
    Width = 191
    Height = 13
    Caption = '2. Select a target active process '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 457
    Width = 108
    Height = 13
    Caption = '3. Inject DLL into: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 16
    Top = 521
    Width = 101
    Height = 13
    Caption = '4. Review result: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object labSelectedProcess: TLabel
    Left = 140
    Top = 457
    Width = 100
    Height = 13
    Caption = 'SelectedProcess.exe'
  end
  object butSetSourceDLL: TButton
    Left = 16
    Top = 46
    Width = 129
    Height = 25
    Caption = 'Select DLL'
    TabOrder = 0
    OnClick = butSetSourceDLLClick
  end
  object edtSourceDLLPathName: TEdit
    Left = 16
    Top = 84
    Width = 557
    Height = 21
    TabOrder = 1
    OnChange = edtSourceDLLPathNameChange
  end
  object butRefreshProcesses: TButton
    Left = 244
    Top = 114
    Width = 129
    Height = 25
    Caption = 'Refresh Process List'
    TabOrder = 2
    OnClick = butRefreshProcessesClick
  end
  object butInject: TButton
    Left = 16
    Top = 483
    Width = 129
    Height = 25
    Caption = 'Inject DLL'
    TabOrder = 3
    OnClick = butInjectClick
  end
  object edtResult: TEdit
    Left = 16
    Top = 541
    Width = 553
    Height = 21
    TabOrder = 4
  end
  object sgProcesses: TStringGrid
    Left = 16
    Top = 148
    Width = 561
    Height = 297
    ColCount = 2
    FixedCols = 0
    RowCount = 2
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    TabOrder = 5
    OnSelectCell = sgProcessesSelectCell
  end
  object OpenDialog1: TOpenDialog
    Left = 168
    Top = 44
  end
end
