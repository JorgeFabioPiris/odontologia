unit Odontologia.Modelo.PedidoItem;

interface

uses
  Data.DB,
  SimpleDAO,
  SimpleInterface,
  SimpleQueryRestDW,
  Odontologia.Modelo.Pedido.Interfaces,
  Odontologia.Modelo.Entidades.PedidoItems,
  Odontologia.Modelo.Conexion.RestDW,
  System.SysUtils;

type
  TModelPedidoItem = class(TInterfacedOBject, iModelPedidoItem)

  private
    FEntidade: TPEDIDOITEM;
    FDAO: iSimpleDao<TPEDIDOITEM>;
    FDataSource: TDataSource;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelPedidoItem;
    function Entidad: TPEDIDOITEM; overload;
    function Entidad(aEntidad: TPEDIDOITEM): iModelPedidoItem; overload;
    function DAO: iSimpleDao<TPEDIDOITEM>;
    function DataSource(aDataSource: TDataSource): iModelPedidoItem;
  end;

implementation

{ TModelPedidoItem }

constructor TModelPedidoItem.Create;
begin
  FEntidade := TPEDIDOITEM.Create;
  FDAO := TSimpleDAO<TPEDIDOITEM>.New
    (TSimpleQueryRestDW<TPEDIDOITEM>.New(ModelConexion.RESTDWDataBase1));
end;

function TModelPedidoItem.DAO: iSimpleDao<TPEDIDOITEM>;
begin
  Result := FDAO;
end;

function TModelPedidoItem.DataSource(aDataSource: TDataSource): iModelPedidoItem;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDAO.DataSource(FDataSource);
end;

destructor TModelPedidoItem.Destroy;
begin
  FreeAndNil(FEntidade);
  inherited;
end;

function TModelPedidoItem.Entidad(aEntidad: TPEDIDOITEM): iModelPedidoItem;
begin
  Result := Self;
  FEntidade := aEntidad;
end;

function TModelPedidoItem.Entidad: TPEDIDOITEM;
begin
  Result := FEntidade;
end;

class function TModelPedidoItem.New: iModelPedidoItem;
begin
  Result := Self.Create;
end;

end.
