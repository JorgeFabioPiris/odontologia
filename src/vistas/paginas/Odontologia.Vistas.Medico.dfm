inherited PagMedico: TPagMedico
  Caption = 'PagMedico'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PnlPrincipal: TPanel
    inherited CardPanel1: TCardPanel
      inherited Card1: TCard
        inherited PnlPieBotonAccion: TPanel
          inherited PnlPieBotonPagina: TPanel
            inherited lblPagina: TLabel
              Height = 73
            end
          end
        end
        inherited PnlCabecera: TPanel
          inherited PnlCabeceraBusqueda: TPanel
            inherited lblSearch: TLabel
              Width = 433
            end
          end
          inherited PnlCabeceraTitulo: TPanel
            inherited lblTitulo: TLabel
              Width = 645
              Height = 32
            end
          end
        end
      end
    end
  end
end
