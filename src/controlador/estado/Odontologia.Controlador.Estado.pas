unit Odontologia.Controlador.Estado;

interface

uses
  Data.DB,
  System.Generics.Collections,
  System.SysUtils,
  Odontologia.Modelo,
  Odontologia.Modelo.Entidades.Estado,
  Odontologia.Modelo.Estado.Interfaces,
  Odontologia.Controlador.Estado.Interfaces;

type
  TControllerEstado = class(TInterfacedObject, iControllerEstado)
  private
    FModel: iModelEstado;
    FDataSource: TDataSource;
    FEntidad: TFSITUACION;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerEstado;
    function DataSource(aDataSource: TDataSource): iControllerEstado;
    function Buscar: iControllerEstado; overload;
    function Buscar(aId: Integer): iControllerEstado; overload;
    function Buscar(aNombre: String): iControllerEstado; overload;
    function Insertar: iControllerEstado;
    function Modificar: iControllerEstado;
    function Eliminar: iControllerEstado;
    function Entidad: TFSITUACION;
  end;

implementation

{ TControllerEstado }

function TControllerEstado.Buscar: iControllerEstado;
begin
  Result := Self;
  FModel.DAO
    .SQL
      .Where('')
    .&End
  .Find;
end;

function TControllerEstado.Buscar(aNombre: String): iControllerEstado;
begin
  Result := Self;
  FModel.DAO
    .SQL
      .Where('PAI_NOMBRE CONTAINING ' +QuotedStr(aNombre) + '')
    .&End
  .Find;
end;

function TControllerEstado.Buscar(aId: Integer): iControllerEstado;
begin
  Result := Self;

  if Assigned(FEntidad) then
    FEntidad.Free;
  FEntidad := FModel.DAO.Find(aId);
end;

constructor TControllerEstado.Create;
begin
  FModel := TModel.New.Estado;
end;

function TControllerEstado.DataSource(aDataSource: TDataSource)
  : iControllerEstado;
begin
  Result := Self;
  FDataSource := aDataSource;
  FModel.DataSource(FDataSource);
end;

destructor TControllerEstado.Destroy;
begin
    FEntidad.Free;
  inherited;
end;

function TControllerEstado.Eliminar: iControllerEstado;
begin
  Result := Self;
  FModel.DAO.Delete(FModel.Entidad);
end;

function TControllerEstado.Entidad: TFSITUACION;
begin
  Result := FModel.Entidad;
end;

function TControllerEstado.Insertar: iControllerEstado;
begin
  Result := Self;
  FModel.DAO.Insert(FModel.Entidad);
end;

function TControllerEstado.Modificar: iControllerEstado;
begin
  Result := Self;
  FModel.DAO.Update(FModel.Entidad);
end;

class function TControllerEstado.New: iControllerEstado;
begin
  Result := Self.Create;
end;

end.
