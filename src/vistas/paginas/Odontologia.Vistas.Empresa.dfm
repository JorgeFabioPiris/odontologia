inherited PagEmpresa: TPagEmpresa
  Caption = ''
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlPrincipal: TPanel
    inherited CardPanel1: TCardPanel
      ActiveCard = Card1
      inherited Card1: TCard
        inherited PnlCabecera: TPanel
          inherited PnlCabeceraBusqueda: TPanel
            inherited edtSearch: TEdit
              OnKeyDown = edtSearchKeyDown
            end
          end
        end
      end
      inherited Card2: TCard
        inherited PnlCentralFormulario: TPanel
          object Label1: TLabel
            Left = 16
            Top = 15
            Width = 41
            Height = 13
            Caption = 'CODIGO'
          end
          object Label2: TLabel
            Left = 15
            Top = 85
            Width = 75
            Height = 13
            Caption = 'RAZON SOCIAL'
          end
          object Label3: TLabel
            Left = 15
            Top = 288
            Width = 39
            Height = 13
            Caption = 'CIUDAD'
          end
          object Label4: TLabel
            Left = 269
            Top = 288
            Width = 73
            Height = 13
            Caption = 'TIPO EMPRESA'
          end
          object Label5: TLabel
            Left = 15
            Top = 149
            Width = 57
            Height = 13
            Caption = 'DIRECCION'
          end
          object Label6: TLabel
            Left = 696
            Top = 149
            Width = 39
            Height = 13
            Caption = 'BARRIO'
          end
          object Label7: TLabel
            Left = 16
            Top = 213
            Width = 30
            Height = 13
            Caption = 'EMAIL'
          end
          object Label8: TLabel
            Left = 128
            Top = 15
            Width = 21
            Height = 13
            Caption = 'RUC'
          end
          object Label9: TLabel
            Left = 424
            Top = 213
            Width = 46
            Height = 13
            Caption = 'TELFONO'
          end
          object Label10: TLabel
            Left = 498
            Top = 149
            Width = 89
            Height = 13
            Caption = 'NUMERO DE CASA'
          end
          object Label11: TLabel
            Left = 498
            Top = 85
            Width = 95
            Height = 13
            Caption = 'NOMBRE FANTASIA'
          end
          object cmbCiudad: TDBLookupComboBox
            Left = 15
            Top = 307
            Width = 201
            Height = 21
            KeyField = 'CODIGO'
            ListField = 'NOMBRE'
            ListSource = DataSource2
            TabOrder = 9
          end
          object edtCodigo: TEdit
            Left = 15
            Top = 34
            Width = 76
            Height = 30
            AutoSize = False
            TabOrder = 0
          end
          object edtRazSocial: TEdit
            Left = 15
            Top = 104
            Width = 450
            Height = 30
            AutoSize = False
            CharCase = ecUpperCase
            TabOrder = 2
          end
          object cmbEmpresaTipo: TDBLookupComboBox
            Left = 269
            Top = 307
            Width = 201
            Height = 21
            KeyField = 'CODIGO'
            ListField = 'NOMBRE'
            ListSource = DataSource3
            TabOrder = 10
          end
          object edtDireccion: TEdit
            Left = 15
            Top = 168
            Width = 450
            Height = 30
            AutoSize = False
            CharCase = ecUpperCase
            TabOrder = 4
          end
          object edtBarrio: TEdit
            Left = 696
            Top = 168
            Width = 252
            Height = 30
            AutoSize = False
            CharCase = ecUpperCase
            TabOrder = 6
          end
          object edtMail: TEdit
            Left = 16
            Top = 232
            Width = 369
            Height = 30
            AutoSize = False
            TabOrder = 7
          end
          object edtRuc: TEdit
            Left = 128
            Top = 34
            Width = 202
            Height = 30
            AutoSize = False
            CharCase = ecUpperCase
            TabOrder = 1
          end
          object edtTelefono: TEdit
            Left = 424
            Top = 232
            Width = 202
            Height = 30
            AutoSize = False
            CharCase = ecUpperCase
            TabOrder = 8
          end
          object edtNroCasa: TEdit
            Left = 498
            Top = 168
            Width = 167
            Height = 30
            AutoSize = False
            CharCase = ecUpperCase
            TabOrder = 5
          end
          object edtFantasia: TEdit
            Left = 498
            Top = 104
            Width = 450
            Height = 30
            AutoSize = False
            CharCase = ecUpperCase
            TabOrder = 3
          end
        end
        inherited PnlPieBotonEdicion: TPanel
          inherited btnBorrar: TSpeedButton
            OnClick = btnBorrarClick
          end
        end
        inherited PnlSubTitulo: TPanel
          inherited lblTitulo2: TLabel
            Width = 31
            Height = 13
          end
        end
      end
    end
  end
  inherited DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
  end
  object DataSource2: TDataSource
    Left = 1071
    Top = 113
  end
  object DataSource3: TDataSource
    Left = 1070
    Top = 185
  end
end
