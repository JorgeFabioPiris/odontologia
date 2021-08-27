unit Odontologia.Vistas.Direccion.Ciudad;

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
  Odontologia.Controlador.Ciudad.Interfaces,
  Odontologia.Controlador.Interfaces,
  Odontologia.Controlador.Departamento.Interfaces,
  Odontologia.Vistas.Template;

type
  TPagCiudad = class(TPagTemplate)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;

    [Bind('ID')]
    edtCodigo: TEdit;

    [Bind('NOMBRE')]
    edtNombre: TEdit;
    cmbDepartamento: TDBLookupComboBox;

    DataSource2: TDataSource;

    procedure btnNuevoClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);

  private
    { Private declarations }
    FController   : iController;
    FCiudad       : iControllerCiudad;
    FDepartamento : iControllerDepartamento;
    procedure prc_estado_inicial;

  public
    { Public declarations }
  end;

var
  PagCiudad : TPagCiudad;
  Insercion : Boolean;

implementation

{$R *.dfm}

procedure TPagCiudad.btnActualizarClick(Sender: TObject);
begin
  inherited;
  FCiudad.Buscar;
end;

procedure TPagCiudad.btnBorrarClick(Sender: TObject);
var
  ShouldClose: Boolean;
begin
  inherited;
  if MessageDlg('Realmente desea eliminar este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FCiudad.Ciudad.CIU_CODIGO := StrToInt(edtCodigo.Text);
    FCiudad.Eliminar;
    FCiudad.Buscar;
    prc_estado_inicial;
  end else
  begin
    edtNombre.SetFocus;
  end;
end;

procedure TPagCiudad.btnCancelarClick(Sender: TObject);
begin
  inherited;
  prc_estado_inicial;
end;

procedure TPagCiudad.btnCerrarClick(Sender: TObject);
begin
  inherited;
  prc_estado_inicial;
end;

procedure TPagCiudad.btnGuardarClick(Sender: TObject);
begin
  inherited;
  if Insercion then
  begin
    FCiudad.Ciudad.CIU_NOMBRE           := edtNombre.Text;
    FCiudad.Ciudad.CIU_COD_DEPARTAMENTO := DataSource2.DataSet.FieldByName
      ('CODIGO').AsInteger;
    FCiudad.Insertar;
  end
  else
  begin
    FCiudad.Ciudad.CIU_CODIGO           := StrToInt(edtCodigo.Text);
    FCiudad.Ciudad.CIU_NOMBRE           := edtNombre.Text;
    FCiudad.Ciudad.CIU_COD_DEPARTAMENTO := DataSource2.DataSet.FieldByName
      ('CODIGO').AsInteger;
    FCiudad.Modificar;
  end;
  prc_estado_inicial;
end;

procedure TPagCiudad.btnNuevoClick(Sender: TObject);
begin
  inherited;
  CardPanel1.ActiveCard     := Card2;
  lblTitulo2.Caption        := 'Agregar nuevo registro';
  cmbDepartamento.KeyValue  := 14;
  edtCodigo.Enabled         := False;
  edtNombre.SetFocus;
  end;

procedure TPagCiudad.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  inherited;
  edtCodigo.Text := DataSource1.DataSet.FieldByName('CIU_CODIGO').AsString;
  edtNombre.Text := DataSource1.DataSet.FieldByName('CIU_NOMBRE').AsString;
end;

procedure TPagCiudad.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  Insercion                 := False;
  CardPanel1.ActiveCard     := Card2;
  lblTitulo2.Caption        := 'Modificar registro';
  edtCodigo.Text            := DataSource1.DataSet.FieldByName('CODIGO').AsString;
  edtNombre.Text            := DataSource1.DataSet.FieldByName('NOMBRE').AsString;
  cmbDepartamento.KeyValue  := DataSource1.DataSet.FieldByName('COD_DPTO').AsString;
end;

procedure TPagCiudad.edtSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  FCiudad.Buscar(edtSearch.Text);
end;

procedure TPagCiudad.FormCreate(Sender: TObject);
begin
  inherited;
  lblTitulo.Caption := 'Registro de ciudades';
  edtCodigo.Enabled := False;
  FController       := TController.New;
  FCiudad           := FController.Ciudad.DataSource(DataSource1);
  FDepartamento     := FController.Departamento.DataSource(DataSource2);
  prc_estado_inicial;
end;

procedure TPagCiudad.prc_estado_inicial;
begin
  Insercion             := True;
  CardPanel1.ActiveCard := Card1;
  edtSearch.Text        := '';
  edtCodigo.Text        := '';
  edtNombre.Text        := '';
  FCiudad.Buscar;
  FDepartamento.Buscar;
end;

end.
