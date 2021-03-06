unit Odontologia.Vistas.Direccion.Departamento;

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
  Odontologia.Controlador.Departamento.Interfaces,
  Odontologia.Controlador.Interfaces,
  Odontologia.Controlador.Pais.Interfaces,
  Odontologia.Vistas.Template;

type
  TPagDepartamento = class(TPagTemplate)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;

    [Bind('ID')]
    edtCodigo: TEdit;

    [Bind('NOMBRE')]
    edtNombre: TEdit;

    cmbPais: TDBLookupComboBox;

    DataSource2: TDataSource;

    procedure btnNuevoClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure btnCerrarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
  private
    { Private declarations }
    FController   : iController;
    FDepartamento : iControllerDepartamento;
    Fpais         : iControllerPais;
    procedure prc_estado_inicial;

  public
    { Public declarations }
  end;

var
  PagDepartamento : TPagDepartamento;
  Insercion       : Boolean;

implementation

{$R *.dfm}

procedure TPagDepartamento.btnActualizarClick(Sender: TObject);
begin
  inherited;
  FDepartamento.Buscar;
end;

procedure TPagDepartamento.btnBorrarClick(Sender: TObject);
var
  ShouldClose: Boolean;
begin
  inherited;
  if MessageDlg('Realmente desea eliminar este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FDepartamento.Entidad.DEP_CODIGO := StrToInt(edtCodigo.Text);
    FDepartamento.Eliminar;
    FDepartamento.Buscar;
    prc_estado_inicial;
  end else
  begin
    edtNombre.SetFocus;
  end;
end;

procedure TPagDepartamento.btnCerrarClick(Sender: TObject);
begin
  inherited;
  prc_estado_inicial;
end;

procedure TPagDepartamento.btnGuardarClick(Sender: TObject);
begin
  inherited;
  if Insercion then
  begin
    FDepartamento.Entidad.DEP_NOMBRE    := edtNombre.Text;
    FDepartamento.Entidad.DEP_COD_PAIS  := DataSource2.DataSet.FieldByName
      ('PAI_CODIGO').AsInteger;
    FDepartamento.Insertar;
  end
  else
  begin
    FDepartamento.Entidad.DEP_CODIGO    := StrToInt(edtCodigo.Text);
    FDepartamento.Entidad.DEP_NOMBRE    := edtNombre.Text;
    FDepartamento.Entidad.DEP_COD_PAIS  := DataSource2.DataSet.FieldByName
      ('PAI_CODIGO').AsInteger;
    FDepartamento.Modificar;
  end;
  prc_estado_inicial;
end;

procedure TPagDepartamento.btnNuevoClick(Sender: TObject);
begin
  inherited;
  CardPanel1.ActiveCard := Card2;
  lblTitulo2.Caption    := 'Agregar nuevo registro';
  edtCodigo.Enabled     := False;
  edtNombre.SetFocus;
end;

procedure TPagDepartamento.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  inherited;
  edtCodigo.Text := DataSource1.DataSet.FieldByName('DEP_CODIGO').AsString;
  edtNombre.Text := DataSource1.DataSet.FieldByName('DEP_NOMBRE').AsString;
end;

procedure TPagDepartamento.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  Insercion             := False;
  CardPanel1.ActiveCard := Card2;
  lblTitulo2.Caption    := 'Modificar registro';
  edtCodigo.Text        := DataSource1.DataSet.FieldByName('CODIGO').AsString;
  edtNombre.Text        := DataSource1.DataSet.FieldByName('NOMBRE').AsString;
  cmbPais.KeyValue      := DataSource1.DataSet.FieldByName('COD_PAIS').AsString;
end;

procedure TPagDepartamento.edtSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  FDepartamento.Buscar(edtSearch.Text);
end;

procedure TPagDepartamento.FormCreate(Sender: TObject);
begin
  inherited;
  lblTitulo.Caption := 'Registro de departamentos';
  edtCodigo.Enabled := False;
  FController       := TController.New;
  FDepartamento     := FController.Departamento.DataSource(DataSource1);
  Fpais             := FController.Pais.DataSource(DataSource2);
  prc_estado_inicial;
end;

procedure TPagDepartamento.prc_estado_inicial;
begin
  Insercion             := True;
  CardPanel1.ActiveCard := Card1;
  edtSearch.Text        := '';
  edtCodigo.Text        := '';
  edtNombre.Text        := '';
  FDepartamento.Buscar;
  Fpais.Buscar;
end;

end.
