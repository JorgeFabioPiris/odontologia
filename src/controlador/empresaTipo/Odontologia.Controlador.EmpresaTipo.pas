unit Odontologia.Controlador.EmpresaTipo;

interface

uses
  Data.DB,
  System.Generics.Collections,
  System.SysUtils,
  Odontologia.Modelo,
  Odontologia.Modelo.Entidades.EmpresaTipo,
  Odontologia.Modelo.EmpresaTipo.Interfaces,
  Odontologia.Controlador.EmpresaTipo.Interfaces;

type
  TControllerEmpresaTipo = class(TInterfacedObject, iControllerEmpresaTipo)
  private
    FModel: iModelEmpresaTipo;
    FDataSource: TDataSource;
    FEntidad: TFTIPO_EMPRESA;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerEmpresaTipo;
    function DataSource (aDataSource : TDataSource) : iControllerEmpresaTipo;
    function Buscar : iControllerEmpresaTipo; overload;
    function Buscar (aId : Integer) : iControllerEmpresaTipo; overload;
    function Buscar (aNombre : String) : iControllerEmpresaTipo; overload;
    function Insertar : iControllerEmpresaTipo;
    function Modificar : iControllerEmpresaTipo;
    function Eliminar : iControllerEmpresaTipo;
    function EmpresaTipo : TFTIPO_EMPRESA;
  end;

implementation

{ TControllerEmpresaTipo }

function TControllerEmpresaTipo.Buscar: iControllerEmpresaTipo;
begin
  Result := Self;
  {FModel.DAO
    .SQL
      .Where('')
    .&End
  .Find; }
  FModel.DAO.SQL.Fields('TIP_EMP_CODIGO AS CODIGO,')
    .Fields('TIP_EMP_EMP AS NOMBRE')
    .Where('')
    .OrderBy('NOMBRE')
  .&End.Find;
  FDataSource.dataset.EnableControls;
  FDataSource.dataset.FieldByName('CODIGO').Visible := false;
  FDataSource.dataset.FieldByName('NOMBRE').DisplayWidth :=50;
end;

function TControllerEmpresaTipo.Buscar(aNombre: String): iControllerEmpresaTipo;
begin
  Result := Self;
  FModel.DAO
    .SQL
      .Where('PAI_NOMBRE CONTAINING ' +QuotedStr(aNombre) + '')
    .&End
  .Find;
end;

function TControllerEmpresaTipo.Buscar(aId: Integer): iControllerEmpresaTipo;
begin
  Result := Self;
  FEntidad := FModel.DAO.Find(aId);
end;

constructor TControllerEmpresaTipo.Create;
begin
  FModel := TModel.New.EmpresaTipo;
end;

function TControllerEmpresaTipo.DataSource(aDataSource: TDataSource)
  : iControllerEmpresaTipo;
begin
  Result := Self;
  FDataSource := aDataSource;
  FModel.DataSource(FDataSource);
end;

destructor TControllerEmpresaTipo.Destroy;
begin
  inherited;
end;

function TControllerEmpresaTipo.Eliminar: iControllerEmpresaTipo;
begin
  Result := Self;
  FModel.DAO.Delete(FModel.Entidad);
end;

function TControllerEmpresaTipo.EmpresaTipo: TFTIPO_EMPRESA;
begin
  Result := FModel.Entidad;
end;

function TControllerEmpresaTipo.Insertar: iControllerEmpresaTipo;
begin
  Result := Self;
  FModel.DAO.Insert(FModel.Entidad);
end;

function TControllerEmpresaTipo.Modificar: iControllerEmpresaTipo;
begin
  Result := Self;
  FModel.DAO.Update(FModel.Entidad);
end;

class function TControllerEmpresaTipo.New: iControllerEmpresaTipo;
begin
  Result := Self.Create;
end;

end.
