object MainForm: TMainForm
  Left = 224
  Top = 128
  BorderStyle = bsDialog
  Caption = 'Spiral by Overdrive (Delphi + GDI + Brains)'
  ClientHeight = 410
  ClientWidth = 418
  Color = clBlack
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 17
  object Timer: TTimer
    Interval = 40
    OnTimer = TimerTimer
    Left = 176
    Top = 152
  end
end
