unit Odontologia.Vistas.Template;

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
    procedure btnNuevoClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagTemplate: TPagTemplate;

implementation

uses
  Odontologia.Vistas.Main;
{$R *.dfm}

procedure TPagTemplate.btnActualizarClick(Sender: TObject);
begin
  modoEdicion := False;
end;

procedure TPagTemplate.btnCancelarClick(Sender: TObject);
begin
  modoEdicion := False;
end;

procedure TPagTemplate.btnCerrarClick(Sender: TObject);
begin
  if MessageDlg('Está seguro de cerrar la ventana?', mtConfirmation,
    [mbOk, mbCancel], 0) = mrOk then
    close;
end;

procedure TPagTemplate.btnGuardarClick(Sender: TObject);
begin
  modoEdicion := False;
end;

procedure TPagTemplate.btnNuevoClick(Sender: TObject);
begin
  modoEdicion := True;
end;

procedure TPagTemplate.DBGrid1DblClick(Sender: TObject);
begin
  modoEdicion := True;
end;

procedure TPagTemplate.FormCreate(Sender: TObject);
begin
  Self.Font.Color                 := FONT_COLOR;
  Self.Font.Size                  := FONT_H7;
  CardPanel1.ActiveCard           := Card1;
  CardPanel1.Color                := COLOR_BACKGROUND;
  PnlPrincipal.Color              := COLOR_BACKGROUND;
  PnlCabeceraBusqueda.Color       := COLOR_BACKGROUND;
  PnlCabeceraTitulo.Color         := COLOR_BACKGROUND;
  PnlCabeceraBusquedaLinea.Color  := COLOR_BACKGROUND_DESTAK;
  PnlCentralGridLinea.Color       := COLOR_BACKGROUND_DESTAK;
  PnlCentralGrid.Color            := COLOR_BACKGROUND;
  PnlPieBotonAccion.Color         := COLOR_BACKGROUND;
  PnlPieBotonPagina.Color         := COLOR_BACKGROUND;
  PnlCentralFormulario.Color      := COLOR_BACKGROUND;
  PnlPieBotonEdicion.Color        := COLOR_BACKGROUND;
  PnlSubTitulo.Color              := COLOR_BACKGROUND;
  lblTitulo.Font.Color            := FONT_COLOR3;
  lblTitulo.Font.Size             := FONT_H5;
  lblTitulo2.Font.Color           := FONT_COLOR3;
  lblTitulo2.Font.Size            := FONT_H5;
end;

end.
