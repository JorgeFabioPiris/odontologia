object PagLogin: TPagLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 469
  ClientWidth = 701
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PagLogin: TPanel
    Left = 0
    Top = 0
    Width = 701
    Height = 469
    Align = alClient
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    object btnIngresar: TSpeedButton
      Left = 104
      Top = 344
      Width = 150
      Height = 45
      Caption = 'Ingresar'
      Flat = True
      OnClick = btnIngresarClick
    end
    object btnSalir: TSpeedButton
      Left = 440
      Top = 344
      Width = 150
      Height = 45
      Caption = 'Salir'
      Flat = True
      OnClick = btnSalirClick
    end
    object edtLogin: TEdit
      Left = 96
      Top = 96
      Width = 200
      Height = 30
      AutoSize = False
      TabOrder = 0
    end
    object edtPassword: TEdit
      Left = 96
      Top = 152
      Width = 200
      Height = 30
      AutoSize = False
      TabOrder = 1
    end
    object edtEmpresa: TEdit
      Left = 96
      Top = 208
      Width = 200
      Height = 30
      AutoSize = False
      TabOrder = 2
    end
  end
end