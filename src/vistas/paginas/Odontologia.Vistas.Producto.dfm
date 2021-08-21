inherited PagProducto: TPagProducto
  Caption = 'PagProducto'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlPrincipal: TPanel
    ExplicitLeft = 0
    ExplicitTop = 0
    inherited CardPanel1: TCardPanel
      inherited Card1: TCard
        inherited PnlBotonAccion: TPanel
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
        inherited PnlSubTitulo: TPanel
          inherited lblTitulo2: TLabel
            Width = 1088
            Height = 73
          end
        end
      end
    end
  end
end
