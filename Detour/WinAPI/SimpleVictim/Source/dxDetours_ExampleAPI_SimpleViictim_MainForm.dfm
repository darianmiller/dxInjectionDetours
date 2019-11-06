object frmMain: TfrmMain
  Left = 192
  Top = 125
  Width = 358
  Height = 199
  Caption = 'dxDetours API Victim Example'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 342
    Height = 89
    Align = alTop
    Lines.Strings = (
      'Hello World!')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 80
    Top = 112
    Width = 177
    Height = 25
    Caption = 'Show memo text in MessageBox'
    TabOrder = 1
    OnClick = Button1Click
  end
end
