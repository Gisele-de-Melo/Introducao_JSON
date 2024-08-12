object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Introdu'#231#227'o ao JSON'
  ClientHeight = 204
  ClientWidth = 279
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object Button1: TButton
    Left = 8
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Criar JSON'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 88
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Ler JSON'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 56
    Width = 255
    Height = 137
    TabOrder = 2
  end
  object Button3: TButton
    Left = 168
    Top = 16
    Width = 95
    Height = 25
    Caption = 'Manipular JSON'
    TabOrder = 3
    OnClick = Button3Click
  end
end
