unit Odontologia.Vistas.Agenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.WinXPanels, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Vcl.DBCtrls, Vcl.WinXCalendars;

type
  TPagAgenda = class(TForm)
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;

    ImageList1: TImageList;

    CardPanel1: TCardPanel;
    Card1: TCard;
    Card2: TCard;

    DBGrid1: TDBGrid;

    CalendarView1: TCalendarView;
    cmbEstadoCita: TDBLookupComboBox;

    PnlPrincipal: TPanel;
    PnlCabecera: TPanel;
    PnlCabeceraTitulo: TPanel;
    PnlCentralGrid: TPanel;
    PnlCentralGridLinea: TPanel;
    PnlCentralFiltro: TPanel;
    PnlCentralFormulario: TPanel;
    PnlPieBotonAccion: TPanel;
    PnlPieBotonPagina: TPanel;
    PnlPieBotonEdicion: TPanel;
    PnlSubTitulo: TPanel;

    btnActualizar: TSpeedButton;
    btnNuevo: TSpeedButton;
    btnGuardar: TSpeedButton;
    btnCancelar: TSpeedButton;
    btnCerrar: TSpeedButton;
    btnBorrar: TSpeedButton;
    btnPrior: TSpeedButton;
    btnNext: TSpeedButton;

    lblTitulo: TLabel;
    lblTitulo2: TLabel;
    LblMedico: TLabel;
    LblPaciente: TLabel;
    LblEstado: TLabel;
    lblPagina: TLabel;

    EdtMedico: TEdit;
    EdtPaciente: TEdit;

    procedure btnNuevoClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    procedure prc_estado_inicial;

  public
    { Public declarations }
  end;

var
  PagAgenda     : TPagAgenda;
  Insercion : Boolean;

implementation

uses
  Odontologia.Vistas.Main, Odontologia.Vista.Estilos;

{$R *.dfm}

procedure TPagAgenda.btnActualizarClick(Sender: TObject);
begin
  modoEdicion := False;
end;

procedure TPagAgenda.btnCancelarClick(Sender: TObject);
begin
  modoEdicion := False;
  prc_estado_inicial;
end;

procedure TPagAgenda.btnCerrarClick(Sender: TObject);
begin
  if MessageDlg('Est� seguro de cerrar la ventana?', mtConfirmation,
    [mbOk, mbCancel], 0) = mrOk then
    close;
end;

procedure TPagAgenda.btnGuardarClick(Sender: TObject);
begin
  modoEdicion := False;
end;

procedure TPagAgenda.btnNuevoClick(Sender: TObject);
begin
  modoEdicion           := True;
  CardPanel1.ActiveCard := Card2;
  lblTitulo2.Caption    := 'Agregar nuevo registro';

end;

procedure TPagAgenda.FormCreate(Sender: TObject);
begin
  Self.Font.Color             := FONT_COLOR;
  Self.Font.Size              := FONT_H7;
  lblTitulo.Caption           := 'Agendamiento de citas y consultas';
  CardPanel1.ActiveCard       := Card1;
  CardPanel1.Color            := COLOR_BACKGROUND;
  PnlPrincipal.Color          := COLOR_BACKGROUND;
  PnlCabecera.Color           := COLOR_BACKGROUND;
  PnlCabeceraTitulo.Color     := COLOR_BACKGROUND;
  PnlCentralGridLinea.Color   := COLOR_BACKGROUND_DESTAK;
  PnlCentralGrid.Color        := COLOR_BACKGROUND;
  PnlCentralFiltro.Color      := COLOR_BACKGROUND;
  PnlPieBotonAccion.Color     := COLOR_BACKGROUND;
  PnlPieBotonPagina.Color     := COLOR_BACKGROUND;
  PnlCentralFormulario.Color  := COLOR_BACKGROUND;
  PnlPieBotonEdicion.Color    := COLOR_BACKGROUND;
  PnlSubTitulo.Color          := COLOR_BACKGROUND;
  lblTitulo.Font.Color        := FONT_COLOR3;
  lblTitulo.Font.Size         := FONT_H5;
  lblTitulo2.Font.Color       := FONT_COLOR3;
  lblTitulo2.Font.Size        := FONT_H5;
end;

procedure TPagAgenda.prc_estado_inicial;
begin
  Insercion               := True;
  CardPanel1.ActiveCard   := Card1;
  EdtMedico.Text          := '';
  EdtPaciente.Text        := '';
  cmbEstadoCita.KeyValue  := 1;
end;

end.
