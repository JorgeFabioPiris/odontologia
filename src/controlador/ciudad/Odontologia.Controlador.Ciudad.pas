unit Odontologia.Controlador.Ciudad;

interface

uses
  Data.DB,
  System.SysUtils,
  System.Generics.Collections,
  Odontologia.Controlador.Ciudad.Interfaces,
  Odontologia.Controlador.Departamento,
  Odontologia.Controlador.Departamento.Interfaces,
  Odontologia.Modelo,
  Odontologia.Modelo.Entidades.Ciudad,
  Odontologia.Modelo.Ciudad.Interfaces;

type
  TControllerCiudad = class(TInterfacedObject, iControllerCiudad)
  private
    FModel: iModelCiudad;
    FDataSource: TDataSource;
    FDepartamento: iControllerDepartamento;
    procedure DataChange (sender : tobject ; field : Tfield) ;

  public
    constructor Create;
    destructor Destroy; override;
    class function New    : iControllerCiudad;
    function DataSource(aDataSource: TDataSource): iControllerCiudad;
    function Buscar       : iControllerCiudad; overload;
    function Buscar (aDepartamento : String) : iControllerCiudad; overload;
    function Insertar     : iControllerCiudad;
    function Modificar    : iControllerCiudad;
    function Eliminar     : iControllerCiudad;
    function Ciudad       : TDCIUDAD;
    function Departamento : iControllerDepartamento;
  end;

implementation

{ TControllerCiudad }

function TControllerCiudad.Buscar: iControllerCiudad;
begin
  Result := Self;
  FDataSource.dataset.DisableControls;
  FModel.DAO.SQL.Fields('DCIUDAD.CIU_CODIGO AS CODIGO,')
    .Fields('DCIUDAD.CIU_NOMBRE AS NOMBRE,')
    .Fields('DCIUDAD.CIU_COD_DEPARTAMENTO AS COD_DPTO,')
    .Fields('DDEPARTAMENTO.DEP_NOMBRE AS DEPARTAMENTO')
    .Join('INNER JOIN DDEPARTAMENTO ON DDEPARTAMENTO.DEP_CODIGO = DCIUDAD.CIU_COD_DEPARTAMENTO ')
    .Where('')
    .OrderBy('NOMBRE')
  .&End.Find;
  FDataSource.dataset.EnableControls;
  FDataSource.dataset.FieldByName('COD_DPTO').Visible := false;
  FDataSource.dataset.FieldByName('NOMBRE').DisplayWidth :=50;
end;

function TControllerCiudad.Buscar(aDepartamento: String): iControllerCiudad;
begin
  Result := Self;
  FDataSource.dataset.DisableControls;
  FModel.DAO.SQL.Fields('DCIUDAD.CIU_CODIGO AS CODIGO,')
    .Fields('DCIUDAD.CIU_NOMBRE AS NOMBRE,')
    .Fields('DCIUDAD.CIU_COD_DEPARTAMENTO AS COD_DPTO,')
    .Fields('DDEPARTAMENTO.DEP_NOMBRE AS DEPARTAMENTO')
    .Join('INNER JOIN DDEPARTAMENTO ON DDEPARTAMENTO.DEP_CODIGO = DCIUDAD.CIU_COD_DEPARTAMENTO ')
    .Where('CIU_NOMBRE CONTAINING ' +QuotedStr(aDepartamento) + '')
    .OrderBy('NOMBRE')
    .&End.Find;
  FDataSource.dataset.EnableControls;
  FDataSource.dataset.FieldByName('COD_DPTO').Visible := false;
  FDataSource.dataset.FieldByName('NOMBRE').DisplayWidth :=50;
end;

constructor TControllerCiudad.Create;
begin
  FModel  := TModel.New.Ciudad;
  FDepartamento   := TControllerDepartamento.New;
end;

procedure TControllerCiudad.DataChange(sender: tobject; field: Tfield);
begin

end;

function TControllerCiudad.DataSource(aDataSource: TDataSource) : iControllerCiudad;
begin
  Result := Self;
  FDataSource := aDataSource;
  FModel.DataSource(FDataSource);
  FDataSource.OnDataChange := DataChange;
end;

destructor TControllerCiudad.Destroy;
begin

  inherited;
end;

function TControllerCiudad.Eliminar: iControllerCiudad;
begin
  Result := Self;
  FModel.DAO.Delete(FModel.Entidad);
end;

function TControllerCiudad.Ciudad: TDCIUDAD;
begin
  Result := FModel.Entidad;
end;

function TControllerCiudad.Insertar: iControllerCiudad;
begin
  Result := Self;
  FModel.DAO.Insert(FModel.Entidad);
end;

function TControllerCiudad.Departamento: iControllerDepartamento;
begin
  Result := FDepartamento;
end;

function TControllerCiudad.Modificar: iControllerCiudad;
begin
  Result := Self;
  FModel.DAO.Update(FModel.Entidad);
end;

class function TControllerCiudad.New: iControllerCiudad;
begin
  Result := Self.Create;
end;

end.
