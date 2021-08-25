﻿unit Odontologia.Vistas.Template;

interface

uses
  Data.DB,
  Winapi.Windows,
  Winapi.Messages,
  System.ImageList,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.WinXPanels,
  Vcl.ExtCtrls,
  Vcl.ImgList,
  Odontologia.Vista.Estilos;

type
  TPagTemplate = class(TForm)
    DataSource1: TDataSource;
    ImageList1: TImageList;
    CardPanel1: TCardPanel;
    Card1: TCard;
    Card2: TCard;
    DBGrid1: TDBGrid;

    PnlPrincipal: TPanel;
    PnlCentralGrid: TPanel;
    PnlCentralGridLinea: TPanel;
    PnlPieBotonAccion: TPanel;
    PnlPieBotonPagina: TPanel;
    PnlSubTitulo: TPanel;
    PnlCabecera: TPanel;
    PnlCabeceraBusqueda: TPanel;
    PnlCentralFormulario: TPanel;
    PnlPieBotonEdicion: TPanel;
    PnlCabeceraBusquedaLinea: TPanel;
    PnlCabeceraTitulo: TPanel;

    btnActualizar: TSpeedButton;
    btnNuevo: TSpeedButton;
    btnPrior: TSpeedButton;
    btnNext: TSpeedButton;

    btnBorrar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnGuardar: TSpeedButton;

    lblTitulo: TLabel;
    lblTitulo2: TLabel;
    lblPagina: TLabel;
    lblSearch: TLabel;

    edtSearch: TEdit;
    btnCerrar: TSpeedButton;

    procedure FormCreate(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagTemplate: TPagTemplate;

implementation

{$R *.dfm}

procedure TPagTemplate.btnCerrarClick(Sender: TObject);
begin
  if MessageDlg('Está seguro de cerrar la ventana?', mtConfirmation, [mbOk, mbCancel], 0) = mrOk then
    close;
end;

procedure TPagTemplate.FormCreate(Sender: TObject);
begin
  CardPanel1.ActiveCard := Card1;

  PnlPrincipal.Color              := COLOR_BACKGROUND;
  PnlCabeceraBusqueda.color       := COLOR_BACKGROUND;
  PnlCabeceraTitulo.Color         := COLOR_BACKGROUND;
  PnlCabeceraBusquedaLinea.Color  := COLOR_BACKGROUND_DESTAK;
  PnlCentralGridLinea.Color       := COLOR_BACKGROUND_DESTAK;
  PnlCentralGrid.Color            := COLOR_BACKGROUND;
  PnlPieBotonAccion.color         := COLOR_BACKGROUND;
  PnlPieBotonPagina.color         := COLOR_BACKGROUND;
  PnlCentralFormulario.color      := COLOR_BACKGROUND;
  PnlPieBotonEdicion.color        := COLOR_BACKGROUND;
  PnlSubTitulo.Color              := COLOR_BACKGROUND;

  lblTitulo.Font.Color      := FONT_COLOR4;
  lblTitulo.Font.Size       := FONT_H5;
  lblTitulo2.font.Color     := FONT_COLOR2;
  lblTitulo2.Font.Size      := FONT_H5;

  Self.font.Color           := FONT_COLOR;
  Self.font.Size            := FONT_H7;

end;

end.
