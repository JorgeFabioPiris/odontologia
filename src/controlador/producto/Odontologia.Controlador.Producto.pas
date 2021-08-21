unit Odontologia.Controlador.Producto;

interface

uses
  Data.DB,
  System.Generics.Collections,
  Odontologia.Modelo.Entidades.Producto,
  Odontologia.Modelo.Producto.Interfaces,
    System.SysUtils, Odontologia.Modelo,
  Odontologia.Controlador.Producto.Interfaces;

type
  TControllerProducto = class(TInterfacedObject, iControllerProducto)
  private
    FModel: iModelProducto;
    FDataSource: TDataSource;
    Flista: TObjectList<TPRODUCTO>;
    FEntidad: TPRODUCTO;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerProducto;
    function DataSource(aDataSource: TDataSource): iControllerProducto;
    function Buscar: iControllerProducto; overload;
    function Buscar(aId: Integer): iControllerProducto; overload;
    function Buscar(aNombre: String): iControllerProducto; overload;
    function Insertar: iControllerProducto;
    function Modificar: iControllerProducto;
    function Eliminar: iControllerProducto;
    function Entidad: TPRODUCTO;
  end;

implementation

{ TControllerProducto }

function TControllerProducto.Buscar: iControllerProducto;
begin
  Result := Self;
  Flista := TObjectList<TPRODUCTO>.Create;
  FModel.DAO.Find(Flista);
end;

function TControllerProducto.Buscar(aNombre: String): iControllerProducto;
begin
  Result := Self;
  FModel.DAO.SQL.Where('NOMBRE = ' + QuotedStr(aNombre)).&End.Find;
end;

function TControllerProducto.Buscar(aId: Integer): iControllerProducto;
begin
  Result := Self;

  if Assigned(FEntidad) then
    FEntidad.Free;
  FEntidad := FModel.DAO.Find(aId);
end;

constructor TControllerProducto.Create;
begin
  FModel := TModel.New.Producto;
end;

function TControllerProducto.DataSource(aDataSource: TDataSource)
  : iControllerProducto;
begin
  Result := Self;
  FDataSource := aDataSource;
  FModel.DataSource(FDataSource);
end;

destructor TControllerProducto.Destroy;
begin
  if Assigned(Flista) then
    Flista.Free;
  if Assigned(FEntidad) then
    FEntidad.Free;
  inherited;
end;

function TControllerProducto.Eliminar: iControllerProducto;
begin
  Result := Self;
  FModel.DAO.Delete(FModel.Entidad);
end;

function TControllerProducto.Entidad: TPRODUCTO;
begin
  Result := FModel.Entidad;
end;

function TControllerProducto.Insertar: iControllerProducto;
begin
  Result := Self;
  FModel.DAO.Insert(FModel.Entidad);
end;

function TControllerProducto.Modificar: iControllerProducto;
begin
  Result := Self;
  FModel.DAO.Update(FModel.Entidad);
end;

class function TControllerProducto.New: iControllerProducto;
begin
  Result := Self.Create;
end;

end.
