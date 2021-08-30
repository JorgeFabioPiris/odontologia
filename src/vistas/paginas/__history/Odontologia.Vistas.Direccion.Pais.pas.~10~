unit Odontologia.Vistas.Direccion.Pais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Odontologia.Vistas.Template, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXPanels, Vcl.ExtCtrls,
  Odontologia.Controlador.Interfaces, Odontologia.Controlador.Pais.Interfaces;

type
  TPagPais = class(TPagTemplate)
    Label1: TLabel;
    Label2: TLabel;

    [Bind('ID')]
    edtCodigo: TEdit;

    [Bind('NOMBRE')]
    edtNombre: TEdit;

    procedure btnNuevoClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FController: iController;
    FPais: iControllerPais;
    procedure prc_estado_inicial;

  public
    { Public declarations }
  end;

var
  PagPais: TPagPais;
  Insercion: Boolean;

implementation

uses
  Odontologia.Controlador;

{$R *.dfm}

procedure TPagPais.btnActualizarClick(Sender: TObject);
begin
  inherited;
  FPais.Buscar();
end;

procedure TPagPais.btnBorrarClick(Sender: TObject);
var
  ShouldClose: Boolean;
begin
  inherited;
  if MessageDlg('Realmente desea eliminar este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Fpais.Entidad.ID := StrToInt(edtCodigo.Text);
    FPais.Eliminar;
    FPais.Buscar;
    prc_estado_inicial;
  end else
  begin
    edtNombre.SetFocus;
  end;
end;

procedure TPagPais.btnCancelarClick(Sender: TObject);
begin
  inherited;
  prc_estado_inicial;
end;

procedure TPagPais.btnGuardarClick(Sender: TObject);
begin
  if Insercion then
  begin
    FPais.Entidad.NOMBRE := edtNombre.Text;
    FPais.Insertar;
  end
  else
  begin
    FPais.Entidad.ID := StrToInt(edtCodigo.Text);
    FPais.Entidad.NOMBRE := edtNombre.Text;
    FPais.Modificar;
  end;
  prc_estado_inicial;
end;

procedure TPagPais.btnNuevoClick(Sender: TObject);
begin
  inherited;
  CardPanel1.ActiveCard := Card2;
  lblTitulo2.Caption := 'Agregar nuevo registro';
  edtCodigo.Enabled := false;
  edtNombre.SetFocus;
end;

procedure TPagPais.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  Insercion := false;
  CardPanel1.ActiveCard := Card2;
  lblTitulo2.Caption := 'Modificar registro';
  edtCodigo.Text := DataSource1.DataSet.FieldByName('PAI_CODIGO').AsString;
  edtNombre.Text := DataSource1.DataSet.FieldByName('PAI_NOMBRE').AsString;
end;

procedure TPagPais.edtSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  FPais.Buscar(edtSearch.Text);
end;

procedure TPagPais.FormCreate(Sender: TObject);
begin
  inherited;
  lblTitulo.Caption := 'Registro de paises';
  edtCodigo.Enabled := false;
  FController := TController.New;
  FPais := FController.Pais.DataSource(DataSource1);
  prc_estado_inicial;
end;

procedure TPagPais.prc_estado_inicial;
begin
  Insercion := True;
  CardPanel1.ActiveCard := Card1;
  edtSearch.Text := '';
  edtCodigo.Text := '';
  edtNombre.Text := '';
  Fpais.Buscar;
end;

end.
