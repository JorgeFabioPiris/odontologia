unit Odontologia.Controlador.Pais;

interface

uses
  Data.DB,
  System.Generics.Collections,
  System.SysUtils,
  Odontologia.Modelo,
  Odontologia.Modelo.Entidades.Pais,
  Odontologia.Modelo.Pais.Interfaces,
  Odontologia.Controlador.Pais.Interfaces;

type
  TControllerPais = class(TInterfacedObject, iControllerPais)
  private
    FModel: iModelPais;
    FDataSource: TDataSource;
    //Flista: TObjectList<TDPAIS>;
    FEntidad: TDPAIS;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerPais;
    function DataSource(aDataSource: TDataSource): iControllerPais;
    function Buscar: iControllerPais; overload;
    function Buscar(aId: Integer): iControllerPais; overload;
    function Buscar(aNombre: String): iControllerPais; overload;
    function Insertar: iControllerPais;
    function Modificar: iControllerPais;
    function Eliminar: iControllerPais;
    function Entidad: TDPAIS;
  end;

implementation

{ TControllerPais }

function TControllerPais.Buscar: iControllerPais;
begin
  Result := Self;
  FModel.DAO
    .SQL
      .Where('')
    .&End
  .Find;
end;

function TControllerPais.Buscar(aNombre: String): iControllerPais;
begin
  Result := Self;
  FModel.DAO
    .SQL
      .Where('PAI_NOMBRE CONTAINING ' +QuotedStr(aNombre) + '')
    .&End
  .Find;
end;

function TControllerPais.Buscar(aId: Integer): iControllerPais;
begin
  Result := Self;

  if Assigned(FEntidad) then
    FEntidad.Free;
  FEntidad := FModel.DAO.Find(aId);
end;

constructor TControllerPais.Create;
begin
  FModel := TModel.New.Pais;
end;

function TControllerPais.DataSource(aDataSource: TDataSource)
  : iControllerPais;
begin
  Result := Self;
  FDataSource := aDataSource;
  FModel.DataSource(FDataSource);
end;

destructor TControllerPais.Destroy;
begin
    //Flista.Free;
    FEntidad.Free;
  inherited;
end;

function TControllerPais.Eliminar: iControllerPais;
begin
  Result := Self;
  FModel.DAO.Delete(FModel.Entidad);
end;

function TControllerPais.Entidad: TDPAIS;
begin
  Result := FModel.Entidad;
end;

function TControllerPais.Insertar: iControllerPais;
begin
  Result := Self;
  FModel.DAO.Insert(FModel.Entidad);
end;

function TControllerPais.Modificar: iControllerPais;
begin
  Result := Self;
  FModel.DAO.Update(FModel.Entidad);
end;

class function TControllerPais.New: iControllerPais;
begin
  Result := Self.Create;
end;

end.
