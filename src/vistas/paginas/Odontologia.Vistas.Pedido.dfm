object PagPedido: TPagPedido
  Left = 0
  Top = 0
  Caption = 'PagPedido'
  ClientHeight = 519
  ClientWidth = 763
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
  object btnBuscar: TSpeedButton
    Left = 8
    Top = 8
    Width = 100
    Height = 36
    Caption = 'Buscar'
    OnClick = btnBuscarClick
  end
  object btnInsertar: TSpeedButton
    Left = 8
    Top = 52
    Width = 100
    Height = 36
    Caption = 'Insertar'
    OnClick = btnInsertarClick
  end
  object btnModificar: TSpeedButton
    Left = 8
    Top = 94
    Width = 100
    Height = 36
    Caption = 'Modificar'
    OnClick = btnModificarClick
  end
  object btnEliminar: TSpeedButton
    Left = 8
    Top = 140
    Width = 100
    Height = 36
    Caption = 'Eliminar'
  end
  object SpeedButton1: TSpeedButton
    Left = 8
    Top = 240
    Width = 100
    Height = 36
    Caption = 'Buscar'
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 8
    Top = 284
    Width = 100
    Height = 36
    Caption = 'Insertar'
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 8
    Top = 326
    Width = 100
    Height = 36
    Caption = 'Modificar'
    OnClick = btnModificarClick
  end
  object SpeedButton4: TSpeedButton
    Left = 8
    Top = 368
    Width = 100
    Height = 36
    Caption = 'Eliminar'
  end
  object edtID: TEdit
    Left = 128
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtNOMBRE: TEdit
    Left = 128
    Top = 35
    Width = 273
    Height = 21
    TabOrder = 1
  end
  object edtPRECIO: TEdit
    Left = 407
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object DBGrid1: TDBGrid
    Left = 128
    Top = 62
    Width = 625
    Height = 114
    DataSource = DataSource1
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid2: TDBGrid
    Left = 128
    Top = 200
    Width = 625
    Height = 120
    DataSource = DataSource2
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBGrid3: TDBGrid
    Left = 128
    Top = 399
    Width = 625
    Height = 113
    DataSource = DataSource3
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 128
    Top = 341
    Width = 385
    Height = 21
    KeyField = 'ID'
    ListField = 'NOMBRE'
    ListSource = DataSource1
    TabOrder = 6
  end
  object Edit1: TEdit
    Left = 519
    Top = 341
    Width = 121
    Height = 21
    TabOrder = 7
    Text = '2'
  end
  object Button1: TButton
    Left = 656
    Top = 339
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 8
    OnClick = Button1Click
  end
  object DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
    Left = 696
    Top = 71
  end
  object DataSource2: TDataSource
    Left = 704
    Top = 207
  end
  object DataSource3: TDataSource
    Left = 696
    Top = 415
  end
end
