unit Odontologia.Controlador.Empresa;

interface

uses
  Data.DB,
  System.SysUtils,
  System.Generics.Collections,
  Odontologia.Controlador.Ciudad,
  Odontologia.Controlador.Ciudad.Interfaces,
  Odontologia.Controlador.Empresa.Interfaces,
  Odontologia.Controlador.EmpresaTipo,
  Odontologia.Controlador.EmpresaTipo.Interfaces,
  Odontologia.Modelo,
  Odontologia.Modelo.Entidades.Empresa,
  Odontologia.Modelo.Empresa.Interfaces,
  Odontologia.Modelo.EmpresaTipo.Interfaces;

type
  TControllerEmpresa = class(TInterfacedObject, iControllerEmpresa)
  private
    FModel        : iModelEmpresa;
    FDataSource   : TDataSource;
    FCiudad       : iControllerCiudad;
    FEmpresaTipo  : iControllerEmpresaTipo;
    procedure DataChange (sender : tobject ; field : Tfield) ;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerEmpresa;
    function DataSource (aDataSource : TDataSource) : iControllerEmpresa;
    function Buscar       : iControllerEmpresa; overload;
    function Buscar (aDepartamento : String)        : iControllerEmpresa; overload;
    function Insertar     : iControllerEmpresa;
    function Modificar    : iControllerEmpresa;
    function Eliminar     : iControllerEmpresa;
    function Entidad      : TDEMPRESA;
    function Ciudad       : iControllerCiudad;
    function EmpresaTipo  : iControllerEmpresaTipo;
  end;

implementation

{ TControllerEmpresa }

function TControllerEmpresa.Buscar: iControllerEmpresa;
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
    .Where('')
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

function TControllerEmpresa.Buscar(aDepartamento: String): iControllerEmpresa;
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

constructor TControllerEmpresa.Create;
begin
  FModel  := TModel.New.Empresa;
  FCiudad   := TControllerCiudad.New;
end;

procedure TControllerEmpresa.DataChange(sender: tobject; field: Tfield);
begin
end;

function TControllerEmpresa.DataSource(aDataSource: TDataSource) : iControllerEmpresa;
begin
  Result := Self;
  FDataSource := aDataSource;
  FModel.DataSource(FDataSource);
  FDataSource.OnDataChange := DataChange;
end;

destructor TControllerEmpresa.Destroy;
begin
  inherited;
end;

function TControllerEmpresa.Eliminar: iControllerEmpresa;
begin
  Result := Self;
  FModel.DAO.Delete(FModel.Entidad);
end;

function TControllerEmpresa.EmpresaTipo: iControllerEmpresaTipo;
begin
    Result := FEmpresaTipo;
end;

function TControllerEmpresa.Entidad: TDEMPRESA;
begin
  Result := FModel.Entidad;
end;

function TControllerEmpresa.Insertar: iControllerEmpresa;
begin
  Result := Self;
  FModel.DAO.Insert(FModel.Entidad);
end;

function TControllerEmpresa.Ciudad: iControllerCiudad;
begin
  Result := FCiudad;
end;

function TControllerEmpresa.Modificar: iControllerEmpresa;
begin
  Result := Self;
  FModel.DAO.Update(FModel.Entidad);
end;

class function TControllerEmpresa.New: iControllerEmpresa;
begin
  Result := Self.Create;
end;

end.
