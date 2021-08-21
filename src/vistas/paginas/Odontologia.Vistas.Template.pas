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
  Vcl.ImgList;

type
  TPagTemplate = class(TForm)
    DataSource1: TDataSource;
    ImageList1: TImageList;
    CardPanel1: TCardPanel;
    Card1: TCard;
    Card2: TCard;
    DBGrid1: TDBGrid;

    PnlPrincipal: TPanel;
    PnlGrid: TPanel;
    PnlGridLinea: TPanel;
    PnlBotonAccion: TPanel;
    PnlPagina: TPanel;
    PnlSubTitulo: TPanel;
    PnlCabecera: TPanel;
    PnlBusqueda: TPanel;
    PnlFormulario: TPanel;
    PnlBotonEdicion: TPanel;
    PnlBusquedaLinea: TPanel;
    PnlTitulo: TPanel;

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
  if MessageDlg('Est� seguro de cerrar la ventana?', mtConfirmation, [mbOk, mbCancel], 0) = mrOk then
    close;
end;

procedure TPagTemplate.FormCreate(Sender: TObject);
begin
  CardPanel1.ActiveCard := Card1;
end;

end.
