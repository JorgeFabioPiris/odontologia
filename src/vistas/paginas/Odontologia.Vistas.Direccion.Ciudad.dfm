inherited PagCiudad: TPagCiudad
  Caption = 'PagCiudad'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlPrincipal: TPanel
    inherited CardPanel1: TCardPanel
      ActiveCard = Card2
      inherited Card1: TCard
        inherited PnlGrid: TPanel
          inherited DBGrid1: TDBGrid
            OnDblClick = DBGrid1DblClick
          end
        end
        inherited PnlBotonAccion: TPanel
          inherited btnActualizar: TSpeedButton
            OnClick = btnActualizarClick
            ExplicitLeft = 149
            ExplicitTop = 6
          end
          inherited btnNuevo: TSpeedButton
            OnClick = btnNuevoClick
          end
          inherited PnlPagina: TPanel
            inherited lblPagina: TLabel
              Height = 73
            end
          end
        end
        inherited PnlCabecera: TPanel
          inherited PnlBusqueda: TPanel
            inherited lblSearch: TLabel
              Width = 433
            end
            inherited edtSearch: TEdit
              OnKeyDown = edtSearchKeyDown
            end
          end
          inherited PnlTitulo: TPanel
            inherited lblTitulo: TLabel
              Width = 645
              Height = 43
            end
          end
        end
      end
      inherited Card2: TCard
        inherited PnlFormulario: TPanel
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
            Width = 42
            Height = 13
            Caption = 'NOMBRE'
          end
          object Label3: TLabel
            Left = 16
            Top = 152
            Width = 81
            Height = 13
            Caption = 'DEPARTAMENTO'
          end
          object cmbDepartamento: TDBLookupComboBox
            Left = 16
            Top = 171
            Width = 201
            Height = 21
            KeyField = 'CODIGO'
            ListField = 'NOMBRE'
            ListSource = DataSource2
            TabOrder = 0
          end
          object edtCodigo: TEdit
            Left = 15
            Top = 34
            Width = 76
            Height = 30
            AutoSize = False
            TabOrder = 1
          end
          object edtNombre: TEdit
            Left = 15
            Top = 104
            Width = 202
            Height = 30
            AutoSize = False
            CharCase = ecUpperCase
            TabOrder = 2
          end
        end
        inherited PnlBotonEdicion: TPanel
          inherited btnBorrar: TSpeedButton
            OnClick = btnBorrarClick
          end
          inherited btnCancelar: TSpeedButton
            OnClick = btnCancelarClick
          end
          inherited btnGuardar: TSpeedButton
            OnClick = btnGuardarClick
            ExplicitLeft = 808
            ExplicitTop = 6
          end
        end
        inherited PnlSubTitulo: TPanel
          inherited lblTitulo2: TLabel
            Width = 1088
            Height = 73
          end
        end
      end
    end
  end
  inherited DataSource1: TDataSource
    OnDataChange = DataSource1DataChange
  end
  object DataSource2: TDataSource
    Left = 1047
    Top = 153
  end
end
