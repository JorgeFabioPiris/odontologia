inherited PagProducto: TPagProducto
  Caption = 'PagProducto'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlPrincipal: TPanel
    inherited CardPanel1: TCardPanel
      inherited Card1: TCard
        inherited PnlPieBotonAccion: TPanel
          inherited PnlPieBotonPagina: TPanel
            inherited lblPagina: TLabel
              Height = 13
            end
          end
        end
        inherited PnlCabecera: TPanel
          inherited PnlCabeceraBusqueda: TPanel
            inherited lblSearch: TLabel
              Width = 32
            end
          end
          inherited PnlCabeceraTitulo: TPanel
            inherited lblTitulo: TLabel
              Width = 74
              Height = 25
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
            Width = 42
            Height = 13
            Caption = 'NOMBRE'
          end
          object Label3: TLabel
            Left = 15
            Top = 156
            Width = 38
            Height = 13
            Caption = 'PRECIO'
          end
          object edtCodigo: TEdit
            Left = 15
            Top = 34
            Width = 76
            Height = 30
            AutoSize = False
            TabOrder = 0
          end
          object edtNombre: TEdit
            Left = 15
            Top = 104
            Width = 202
            Height = 30
            AutoSize = False
            CharCase = ecUpperCase
            TabOrder = 1
          end
          object Edit1: TEdit
            Left = 15
            Top = 175
            Width = 202
            Height = 30
            AutoSize = False
            CharCase = ecUpperCase
            TabOrder = 2
          end
        end
      end
    end
  end
end
