unit Odontologia.Controlador.Usuario;

interface

uses
  Data.DB,
  System.SysUtils,
  System.Generics.Collections,
  Odontologia.Controlador.Usuario.Interfaces,
  Odontologia.Controlador.Empresa,
  Odontologia.Controlador.Empresa.Interfaces,
  Odontologia.Modelo,
  Odontologia.Modelo.Entidades.Usuario,
  Odontologia.Modelo.Usuario.Interfaces,
  Odontologia.Modelo.Empresa.Interfaces;

type
  TControllerUsuario = class(TInterfacedObject, iControllerUsuario)
  private
    FModel        : iModelUsuario;
    FDataSource   : TDataSource;
    FEmpresa      : iControllerEmpresa;
    procedure DataChange (sender : tobject ; field : Tfield) ;

  public
    constructor Create;
    destructor Destroy; override;
    class function New    : iControllerUsuario;
    function DataSource (aDataSource : TDataSource) : iControllerUsuario;
    function Buscar       : iControllerUsuario; overload;
    function Buscar (aDepartamento : String)        : iControllerUsuario; overload;
    function Insertar     : iControllerUsuario;
    function Modificar    : iControllerUsuario;
    function Eliminar     : iControllerUsuario;
    function Entidad      : TDUSUARIO;
    function Empresa      : iControllerEmpresa;
  end;

implementation

{ TControllerUsuario }

function TControllerUsuario.Buscar: iControllerUsuario;
begin
  Result := Self;
  FDataSource.dataset.DisableControls;
  FModel.DAO.SQL.Fields('DUSUARIO.USU_CODIGO AS CODIGO,')
    .Fields('DUSUARIO.USU_LOGIN AS LOGIN,')
    .Fields('DUSUARIO.USU_ESTADO AS ESTADO,')
    .Fields('DUSUARIO.USU_NIVEL AS NIVEL,')
//    .Fields('DUSUARIO.USU_FECHA_INC AS INCLUSION,')
//    .Fields('DUSUARIO.USU_FECHA_MOD AS MODIFICACION,')
    .Fields('DUSUARIO.USU_CLAVE AS CLAVE,')
    .Fields('DUSUARIO.USU_FOTO AS FOTO,')
    .Fields('DUSUARIO.USU_COD_EMPRESA AS CODEMPRESA,')
    .Fields('DEMPRESA.EMP_FANTASIA AS EMPRESA')
    .Join('INNER JOIN DEMPRESA ON DEMPRESA.EMP_CODIGO = DUSUARIO.USU_COD_EMPRESA')
    .Where('')
  .OrderBy('LOGIN')
  .&End.Find;
  FDataSource.dataset.EnableControls;
  FDataSource.dataset.FieldByName('CODIGO').Visible := False;
//  FDataSource.dataset.FieldByName('INCLUSION').Visible := False;
//  FDataSource.dataset.FieldByName('MODIFICACION').Visible := False;
  FDataSource.dataset.FieldByName('CLAVE').Visible := True;
  FDataSource.dataset.FieldByName('FOTO').Visible := false;
  FDataSource.dataset.FieldByName('LOGIN').DisplayWidth :=50;
end;

function TControllerUsuario.Buscar(aDepartamento: String): iControllerUsuario;
begin
  Result := Self;
  FDataSource.dataset.DisableControls;
  FModel.DAO.SQL.Fields('DEMPRESA.EMP_CODIGO AS CODIGO,')
    .Fields('DEMPRESA.EMP_RAZSOCIAL AS RAZON,')
    .Fields('DEMPRESA.EMP_FANTASIA AS FANTASIA,')
    .Fields('DEMPRESA.EMP_RUC AS RUC,')
    .Fields('DEMPRESA.EMP_DIRECCION AS DIRECCION,')
    .Fields('DEMPRESA.EMP_NUMERO AS NUMERO,')
    .Fields('DEMPRESA.EMP_BARRIO AS BARRIO,')
    .Fields('DEMPRESA.EMP_TELEFONO AS TELEFONO,')
    .Fields('DEMPRESA.EMP_EMAIL AS EMAIL,')
    .Fields('DEMPRESA.EMP_COD_CIUDAD AS COD_CIU,')
    .Fields('DEMPRESA.EMP_COD_TIP_EMPRESA AS COD_EMP,')
    .Fields('DCIUDAD.CIU_NOMBRE AS CIUDAD')
    .Join('INNER JOIN DCIUDAD ON DCIUDAD.CIU_CODIGO = DEMPRESA.EMP_COD_CIUDAD ')
    .Where('DEMPRESA.EMP_RAZSOCIAL CONTAINING ' +QuotedStr(aDepartamento) + '')
  .OrderBy('RAZON')
  .&End.Find;
  FDataSource.dataset.EnableControls;
  FDataSource.dataset.FieldByName('CODIGO').Visible := false;
  FDataSource.dataset.FieldByName('RAZON').Visible := TRUE;
  FDataSource.dataset.FieldByName('FANTASIA').Visible := True;
  FDataSource.dataset.FieldByName('RUC').Visible := tRUE;
  FDataSource.dataset.FieldByName('DIRECCION').Visible := false;
  FDataSource.dataset.FieldByName('NUMERO').Visible := false;
  FDataSource.dataset.FieldByName('BARRIO').Visible := false;
  FDataSource.dataset.FieldByName('TELEFONO').Visible := True;
  FDataSource.dataset.FieldByName('EMAIL').Visible := True;
  FDataSource.dataset.FieldByName('COD_CIU').Visible := false;
  FDataSource.dataset.FieldByName('COD_EMP').Visible := FALSE;
  FDataSource.dataset.FieldByName('RAZON').DisplayWidth :=50;
end;

constructor TControllerUsuario.Create;
begin
  FModel  := TModel.New.Usuario;
end;

procedure TControllerUsuario.DataChange(sender: tobject; field: Tfield);
begin
end;

function TControllerUsuario.DataSource(aDataSource: TDataSource) : iControllerUsuario;
begin
  Result := Self;
  FDataSource := aDataSource;
  FModel.DataSource(FDataSource);
  FDataSource.OnDataChange := DataChange;
end;

destructor TControllerUsuario.Destroy;
begin
  inherited;
end;

function TControllerUsuario.Eliminar: iControllerUsuario;
begin
  Result := Self;
  FModel.DAO.Delete(FModel.Entidad);
end;

function TControllerUsuario.Empresa: iControllerEmpresa;
begin
    Result := FEmpresa;
end;

function TControllerUsuario.Entidad: TDUSUARIO;
begin
  Result := FModel.Entidad;
end;

function TControllerUsuario.Insertar: iControllerUsuario;
begin
  Result := Self;
  FModel.DAO.Insert(FModel.Entidad);
end;

function TControllerUsuario.Modificar: iControllerUsuario;
begin
  Result := Self;
  FModel.DAO.Update(FModel.Entidad);
end;

class function TControllerUsuario.New: iControllerUsuario;
begin
  Result := Self.Create;
end;

end.
