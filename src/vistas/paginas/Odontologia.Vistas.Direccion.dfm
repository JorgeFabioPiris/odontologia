object PagDireccion: TPagDireccion
  Left = 0
  Top = 0
  Align = alClient
  BorderStyle = bsNone
  ClientHeight = 668
  ClientWidth = 1148
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object CardPanel1: TCardPanel
    Left = 0
    Top = 0
    Width = 1148
    Height = 668
    Align = alClient
    ActiveCard = Card1
    BevelOuter = bvNone
    Caption = 'CardPanel1'
    ParentBackground = False
    TabOrder = 0
    object Card1: TCard
      Left = 0
      Top = 0
      Width = 1148
      Height = 668
      Caption = 'Card1'
      CardIndex = 0
      TabOrder = 0
      object PnlCentral1: TPanel
        Left = 0
        Top = 0
        Width = 1148
        Height = 668
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        ExplicitTop = 48
        ExplicitWidth = 1073
        ExplicitHeight = 620
        object btnCiudad: TSpeedButton
          Left = 488
          Top = 24
          Width = 209
          Height = 201
          Caption = 'Registrar Ciudad'
          OnClick = btnCiudadClick
        end
        object btnDepartamento: TSpeedButton
          Left = 264
          Top = 24
          Width = 209
          Height = 201
          Caption = 'Registrar Departamento'
          OnClick = btnDepartamentoClick
        end
        object btnPais: TSpeedButton
          Left = 40
          Top = 24
          Width = 209
          Height = 201
          Caption = 'Registrar Pais'
          OnClick = btnPaisClick
        end
      end
    end
    object Card2: TCard
      Left = 0
      Top = 0
      Width = 1148
      Height = 668
      Caption = 'Card2'
      CardIndex = 1
      TabOrder = 1
      object PnlCentral2: TPanel
        Left = 0
        Top = 0
        Width = 1148
        Height = 668
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
      end
    end
  end
end
