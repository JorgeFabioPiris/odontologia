unit Odontologia.Vistas.Agenda;

interface

uses
  Data.DB,
  System.Variants,
  System.Classes,
  System.ImageList,
  Winapi.Windows,
  Winapi.Messages,
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
  Vcl.DBCtrls,
  Vcl.WinXCalendars,
  Vcl.ComCtrls,
  Odontologia.Controlador,
  Odontologia.Controlador.Agenda.Interfaces,
  Odontologia.Controlador.Estado.Cita.Interfaces,
  Odontologia.Controlador.Interfaces,
  Odontologia.Controlador.Medico.Interfaces,
  Odontologia.Controlador.Paciente.Interfaces,
  Odontologia.Vistas.Main,
  Odontologia.Vista.Estilos;

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
    btnBuscarPaciente: TSpeedButton;

    lblTitulo: TLabel;
    lblTitulo2: TLabel;
    LblMedico: TLabel;
    LblPaciente: TLabel;
    LblEstado: TLabel;
    lblPagina: TLabel;
    lblCodigoConsulta: TLabel;
    lblCodigoPaciente: TLabel;
    lblFecha: TLabel;
    lblMedicoRegistro: TLabel;
    lblEstadoConsulta: TLabel;
    lblNombrePaciente: TLabel;

    EdtMedico: TEdit;
    EdtPaciente: TEdit;
    edtCodigoConsulta: TEdit;
    edtCodigoPaciente: TEdit;
    edtNombrePaciente: TEdit;
    cmbRegMedico: TDBLookupComboBox;
    cmbRegEstado: TDBLookupComboBox;
    fechaReg: TDateTimePicker;
    DataSource4: TDataSource;
    horaReg: TDateTimePicker;
    lblHora: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;

    procedure btnNuevoClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure RadioButton4Click(Sender: TObject);
    procedure CalendarView1Change(Sender: TObject);
    procedure EdtMedicoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EdtPacienteKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
    FController : iController;
    FAgenda     : iControllerAgenda;
    FMedico     : iControllerMedico;
    FPaciente   : iControllerPaciente;
    FEstadoCita : iControllerEstadoCita;
    procedure prc_estado_inicial;
    procedure prc_buscar_por_parametros;

  public
    { Public declarations }
  end;

var
  PagAgenda : TPagAgenda;
  Insercion : Boolean;
  estado    : string;


implementation

uses
  System.SysUtils;

{$R *.dfm}

procedure TPagAgenda.btnActualizarClick(Sender: TObject);
begin
  FAgenda.Buscar;
  modoEdicion := False;
end;

procedure TPagAgenda.btnBorrarClick(Sender: TObject);
var
  ShouldClose: Boolean;
begin
  inherited;
  if MessageDlg('Realmente desea eliminar este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FAgenda.Entidad.AGe_CODIGO := StrToInt(edtCodigoConsulta.Text);
    FAgenda.Eliminar;
    FAgenda.Buscar;
    prc_estado_inicial;
  end else
  begin
    edtNombrePaciente.SetFocus;
  end;
end;

procedure TPagAgenda.btnCancelarClick(Sender: TObject);
begin
  modoEdicion := False;
  prc_estado_inicial;
end;

procedure TPagAgenda.btnCerrarClick(Sender: TObject);
begin
  if MessageDlg('Está seguro de cerrar la ventana?', mtConfirmation,
    [mbOk, mbCancel], 0) = mrOk then
    close;
end;

procedure TPagAgenda.btnGuardarClick(Sender: TObject);
begin
  inherited;
  modoEdicion := False;
  if Insercion then
    begin
      FAgenda.Entidad.AGE_FECHA           := FormatDateTime('yyyy/mm/dd', fechaReg.Date);
      FAgenda.Entidad.AGE_HORA            := horaReg.Time;
      FAgenda.Entidad.AGE_PACIENTE        := StrToInt(edtCodigoPaciente.Text);
      FAgenda.Entidad.AGE_MEDICO          := cmbRegMedico.KeyValue;
      FAgenda.Entidad.AGE_COD_ESTADO_CITA := cmbRegEstado.KeyValue;
      FAgenda.Insertar;
    end else
    begin
      FAgenda.Entidad.AGE_CODIGO          := StrToInt(edtCodigoConsulta.Text);
      FAgenda.Entidad.AGE_FECHA           := FormatDateTime('yyyy/mm/dd', fechaReg.Date);
      FAgenda.Entidad.AGE_HORA            := horaReg.DateTime;
      FAgenda.Entidad.AGE_PACIENTE        := StrToInt(edtCodigoPaciente.Text);
      FAgenda.Entidad.AGE_MEDICO          := cmbRegMedico.KeyValue;
      FAgenda.Entidad.AGE_COD_ESTADO_CITA := cmbRegEstado.KeyValue;
      FAgenda.Modificar;
    end;
  prc_estado_inicial;
end;

procedure TPagAgenda.btnNuevoClick(Sender: TObject);
begin
  Insercion             := True;
  modoEdicion           := True;
  CardPanel1.ActiveCard := Card2;
  lblTitulo2.Caption    := 'Agregar nuevo registro';
  cmbRegMedico.KeyValue := 1;
  cmbRegEstado.KeyValue := 1;
  edtCodigoPaciente.SetFocus;
end;

procedure TPagAgenda.CalendarView1Change(Sender: TObject);
begin
  prc_buscar_por_parametros;
end;

procedure TPagAgenda.EdtMedicoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  prc_buscar_por_parametros;
end;

procedure TPagAgenda.EdtPacienteKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  prc_buscar_por_parametros;
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

  FController                 := TController.New;
  FAgenda                     := FController.Agenda.DataSource(DataSource1);
  FMedico                     := FController.Medico.DataSource(DataSource2);
  FPaciente                   := FController.Paciente.DataSource(DataSource3);
  FEstadoCita                 := FController.EstadoCita.DataSource(DataSource4);
  prc_estado_inicial;
end;

procedure TPagAgenda.FormShow(Sender: TObject);
begin
  CalendarView1.Date    := now;
end;

procedure TPagAgenda.prc_buscar_por_parametros;
var
  fecha, medico, paciente : String;
begin
  fecha     := FormatDateTime('yyyy/mm/dd', CalendarView1.Date);
  medico    := EdtMedico.Text;
  paciente  := EdtPaciente.Text;
  Fagenda.Buscar(fecha, '%'+medico+'%', '%'+paciente+'%', '%'+estado+'%');
end;

procedure TPagAgenda.prc_estado_inicial;
begin
  CardPanel1.ActiveCard := Card1;
  RadioButton1.Checked;
  EdtMedico.Text        := '';
  EdtPaciente.Text      := '';

  prc_buscar_por_parametros;
  FMedico.Buscar;
  Fpaciente.buscar;
  FEstadoCita.Buscar;
  end;

procedure TPagAgenda.RadioButton1Click(Sender: TObject);
begin
  estado := '';
  prc_buscar_por_parametros;
end;

procedure TPagAgenda.RadioButton2Click(Sender: TObject);
begin
  estado := 'AGENDADA';
  prc_buscar_por_parametros;
end;

procedure TPagAgenda.RadioButton3Click(Sender: TObject);
begin
  estado := 'REALIZADA';
  prc_buscar_por_parametros;
end;

procedure TPagAgenda.RadioButton4Click(Sender: TObject);
begin
  estado := 'CANCELADA';
  prc_buscar_por_parametros;
end;

end.
