inherited PagPais: TPagPais
  Caption = 'PagPais'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlPrincipal: TPanel
    inherited CardPanel1: TCardPanel
      ActiveCard = Card2
      inherited Card1: TCard
        inherited PnlCentralGrid: TPanel
          ExplicitTop = 62
          ExplicitHeight = 533
        end
        inherited PnlPieBotonAccion: TPanel
          inherited PnlPieBotonPagina: TPanel
            inherited lblPagina: TLabel
              Height = 73
            end
          end
        end
        inherited PnlCabecera: TPanel
          inherited PnlCabeceraBusqueda: TPanel
            ExplicitHeight = 62
            inherited lblSearch: TLabel
              Width = 433
            end
            inherited edtSearch: TEdit
              OnKeyDown = edtSearchKeyDown
            end
            inherited PnlCabeceraBusquedaLinea: TPanel
              ExplicitTop = 61
            end
          end
          inherited PnlCabeceraTitulo: TPanel
            ExplicitHeight = 62
            inherited lblTitulo: TLabel
              Width = 645
              Height = 32
            end
          end
        end
      end
      inherited Card2: TCard
        inherited PnlCentralFormulario: TPanel
          object Label1: TLabel
            Left = 15
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
        end
        inherited PnlPieBotonEdicion: TPanel
          inherited btnBorrar: TSpeedButton
            OnClick = btnBorrarClick
          end
          inherited btnCancelar: TSpeedButton
            ExplicitLeft = 954
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
end
