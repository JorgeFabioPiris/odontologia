unit Odontologia.Vistas.Empresa;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.ImgList,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.WinXPanels,
  Vcl.ExtCtrls,
  Vcl.DBCtrls,
  Odontologia.Controlador,
  Odontologia.Controlador.Interfaces,
  Odontologia.Controlador.Ciudad.Interfaces,
  Odontologia.Controlador.Empresa.Interfaces,
  Odontologia.Controlador.EmpresaTipo.Interfaces,
  Odontologia.Vistas.Template;

type
  TPagEmpresa = class(TPagTemplate)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;

    edtCodigo       : TEdit;
    edtRazSocial    : TEdit;
    edtDireccion    : TEdit;
    edtBarrio       : TEdit;
    edtMail         : TEdit;
    edtRuc          : TEdit;
    edtTelefono     : TEdit;
    edtNroCasa      : TEdit;
    edtFantasia     : TEdit;

    cmbCiudad       : TDBLookupComboBox;
    cmbEmpresaTipo  : TDBLookupComboBox;

    DataSource2: TDataSource;
    DataSource3: TDataSource;

    procedure btnBorrarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    FController   : iController;
    FCiudad       : iControllerCiudad;
    FEmpresa      : iControllerEmpresa;
    FEmpresaTipo  : iControllerEmpresaTipo;
    procedure prc_estado_inicial;

  public
    { Public declarations }
  end;

var
  PagEmpresa: TPagEmpresa;
  Insercion: Boolean;

implementation

{$R *.dfm}

procedure TPagEmpresa.btnActualizarClick(Sender: TObject);
begin
  inherited;
  FEmpresa.Buscar;
end;

procedure TPagEmpresa.btnBorrarClick(Sender: TObject);
var
  ShouldClose: Boolean;
begin
  inherited;
  if MessageDlg('Realmente desea eliminar este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FEmpresa.Entidad.EMP_CODIGO := StrToInt(edtCodigo.Text);
    FEmpresa.Eliminar;
    FEmpresa.Buscar;
    prc_estado_inicial;
  end else
  begin
    edtRuc.SetFocus;
  end;
end;

procedure TPagEmpresa.btnCancelarClick(Sender: TObject);
begin
  inherited;
  prc_estado_inicial;
end;

procedure TPagEmpresa.btnCerrarClick(Sender: TObject);
begin
  inherited;
  prc_estado_inicial;
end;

procedure TPagEmpresa.btnGuardarClick(Sender: TObject);
begin
  inherited;
  if Insercion then
  begin
    FEmpresa.Entidad.EMP_RAZSOCIAL        := edtRazSocial.Text;
    FEmpresa.Entidad.EMP_FANTASIA         := edtFantasia.Text;
    FEmpresa.Entidad.EMP_DIRECCION        := edtDireccion.Text;
    FEmpresa.Entidad.EMP_NUMERO           := edtNroCasa.Text;
    FEmpresa.Entidad.EMP_BARRIO           := edtBarrio.Text;
    FEmpresa.Entidad.EMP_TELEFONO         := edtTelefono.Text;
    FEmpresa.Entidad.EMP_EMAIL            := edtMail.Text;
    FEmpresa.Entidad.EMP_RUC              := edtRUC.Text;
    FEmpresa.Entidad.EMP_COD_CIUDAD       := DataSource2.DataSet.FieldByName('CODIGO').AsInteger;
    FEmpresa.Entidad.EMP_COD_TIP_EMPRESA  := DataSource3.DataSet.FieldByName('CODIGO').AsInteger;
    FEmpresa.Insertar;
  end
  else
  begin
    FEmpresa.Entidad.EMP_CODIGO           := StrToInt(edtCodigo.Text);
    FEmpresa.Entidad.EMP_RAZSOCIAL        := edtRazSocial.Text;
    FEmpresa.Entidad.EMP_FANTASIA         := edtFantasia.Text;
    FEmpresa.Entidad.EMP_DIRECCION        := edtDireccion.Text;
    FEmpresa.Entidad.EMP_NUMERO           := edtNroCasa.Text;
    FEmpresa.Entidad.EMP_BARRIO           := edtBarrio.Text;
    FEmpresa.Entidad.EMP_TELEFONO         := edtTelefono.Text;
    FEmpresa.Entidad.EMP_EMAIL            := edtMail.Text;
    FEmpresa.Entidad.EMP_RUC              := edtRUC.Text;
    FEmpresa.Entidad.EMP_COD_CIUDAD       := DataSource2.DataSet.FieldByName('CODIGO').AsInteger;
    FEmpresa.Entidad.EMP_COD_TIP_EMPRESA  := DataSource3.DataSet.FieldByName('CODIGO').AsInteger;
    FEmpresa.Modificar;
  end;
  prc_estado_inicial;
end;

procedure TPagEmpresa.btnNuevoClick(Sender: TObject);
begin
  inherited;
  CardPanel1.ActiveCard   := Card2;
  lblTitulo2.Caption      := 'Agregar nuevo registro';
  edtCodigo.Enabled       := False;
  edtRUC.SetFocus;
  cmbCiudad.KeyValue      := 223;
  cmbEmpresaTipo.KeyValue := 1;
end;

procedure TPagEmpresa.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  inherited;
  edtCodigo.Text          := DataSource1.DataSet.FieldByName('EMP_CODIGO').AsString;
  edtRazSocial.Text       := DataSource1.DataSet.FieldByName('EMP_NOMBRE').AsString;
end;

procedure TPagEmpresa.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  Insercion := False;
  CardPanel1.ActiveCard   := Card2;
  lblTitulo2.Caption      := 'Modificar registro';
  edtCodigo.Text          := DataSource1.DataSet.FieldByName('CODIGO').AsString;
  edtRuc.Text             := DataSource1.DataSet.FieldByName('RUC').AsString;
  edtRazSocial.Text       := DataSource1.DataSet.FieldByName('RAZON').AsString;
  edtFantasia.Text        := DataSource1.DataSet.FieldByName('FANTASIA').AsString;
  edtDireccion.Text       := DataSource1.DataSet.FieldByName('DIRECCION').AsString;
  edtNroCasa.Text         := DataSource1.DataSet.FieldByName('NUMERO').AsString;
  edtBarrio.Text          := DataSource1.DataSet.FieldByName('BARRIO').AsString;
  edtMail.Text            := DataSource1.DataSet.FieldByName('EMAIL').AsString;
  edtTelefono.Text        := DataSource1.DataSet.FieldByName('TELEFONO').AsString;
  cmbCiudad.KeyValue      := DataSource1.DataSet.FieldByName('COD_CIU').AsString;
  cmbEmpresaTipo.KeyValue := DataSource1.DataSet.FieldByName('COD_EMP').AsString;
end;

procedure TPagEmpresa.edtSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  FEmpresa.Buscar(edtSearch.Text);
end;

procedure TPagEmpresa.FormCreate(Sender: TObject);
begin
  inherited;
  lblTitulo.Caption := 'Registro de empresas';
  edtCodigo.Enabled := False;
  FController       := TController.New;
  FCiudad           := Fcontroller.Ciudad.DataSource(DataSource2);
  FEmpresa          := FController.Empresa.DataSource(DataSource1);
  FEmpresaTipo      := FController.EmpresaTipo.DataSource(DataSource3);
  prc_estado_inicial;
end;

procedure TPagEmpresa.prc_estado_inicial;
begin
  Insercion             := True;
  CardPanel1.ActiveCard := Card1;
  edtSearch.Text        := '';
  edtCodigo.Text        := '';
  edtRuc.Text           := '';
  edtRazSocial.Text     := '';
  edtFantasia.Text      := '';
  edtDireccion.Text     := '';
  edtNroCasa.Text       := '';
  edtBarrio.Text        := '';
  edtMail.Text          := '';
  edtTelefono.Text      := '';
  FCiudad.Buscar;
  FEmpresa.Buscar;
  FEmpresaTipo.Buscar;
end;

end.
