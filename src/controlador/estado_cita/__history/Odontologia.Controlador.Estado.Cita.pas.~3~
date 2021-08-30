unit Odontologia.Controlador.Estado.Cita;

interface

uses
  Data.DB,
  System.Generics.Collections,
  System.SysUtils,
  Odontologia.Modelo,
  Odontologia.Modelo.Entidades.Estado.Cita,
  Odontologia.Modelo.Estado.Cita.Interfaces,
  Odontologia.Controlador.Estado.Cita.Interfaces;

type
  TControllerEstadoCita = class(TInterfacedObject, iControllerEstadoCita)
  private
    FModel: iModelEstadoCita;
    FDataSource: TDataSource;
    FEntidad: TFESTADO_CITA;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerEstadoCita;
    function DataSource(aDataSource: TDataSource): iControllerEstadoCita;
    function Buscar: iControllerEstadoCita; overload;
    function Buscar(aId: Integer): iControllerEstadoCita; overload;
    function Buscar(aNombre: String): iControllerEstadoCita; overload;
    function Insertar: iControllerEstadoCita;
    function Modificar: iControllerEstadoCita;
    function Eliminar: iControllerEstadoCita;
    function Entidad: TFESTADO_CITA;
  end;

implementation

{ TControllerEstadoCita }

function TControllerEstadoCita.Buscar: iControllerEstadoCita;
begin
  Result := Self;
  FModel.DAO
    .SQL
      .Where('')
    .&End
  .Find;
end;

function TControllerEstadoCita.Buscar(aNombre: String): iControllerEstadoCita;
begin
  Result := Self;
  FModel.DAO
    .SQL
      .Where('PAI_NOMBRE CONTAINING ' +QuotedStr(aNombre) + '')
    .&End
  .Find;
end;

function TControllerEstadoCita.Buscar(aId: Integer): iControllerEstadoCita;
begin
  Result := Self;

  if Assigned(FEntidad) then
    FEntidad.Free;
  FEntidad := FModel.DAO.Find(aId);
end;

constructor TControllerEstadoCita.Create;
begin
  FModel := TModel.New.EstadoCita;
end;

function TControllerEstadoCita.DataSource(aDataSource: TDataSource)
  : iControllerEstadoCita;
begin
  Result := Self;
  FDataSource := aDataSource;
  FModel.DataSource(FDataSource);
end;

destructor TControllerEstadoCita.Destroy;
begin
    FEntidad.Free;
  inherited;
end;

function TControllerEstadoCita.Eliminar: iControllerEstadoCita;
begin
  Result := Self;
  FModel.DAO.Delete(FModel.Entidad);
end;

function TControllerEstadoCita.Entidad: TFESTADO_CITA;
begin
  Result := FModel.Entidad;
end;

function TControllerEstadoCita.Insertar: iControllerEstadoCita;
begin
  Result := Self;
  FModel.DAO.Insert(FModel.Entidad);
end;

function TControllerEstadoCita.Modificar: iControllerEstadoCita;
begin
  Result := Self;
  FModel.DAO.Update(FModel.Entidad);
end;

class function TControllerEstadoCita.New: iControllerEstadoCita;
begin
  Result := Self.Create;
end;

end.
