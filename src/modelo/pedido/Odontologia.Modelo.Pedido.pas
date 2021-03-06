unit Odontologia.Modelo.Pedido;

interface

uses
  Data.DB,
  SimpleDAO,
  SimpleInterface,
  SimpleQueryRestDW,
  System.SysUtils,
  Odontologia.Modelo.Pedido.Interfaces,
  Odontologia.Modelo.Entidades.Pedido,
  Odontologia.Modelo.Conexion.RestDW;

type
  TModelPedido = class(TInterfacedOBject, iModelPedido)

  private
    FEntidade: TPEDIDO;
    FDAO: iSimpleDao<TPEDIDO>;
    FDataSource: TDataSource;
    FPedidoItem : iModelPedidoItem;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iModelPedido;
    function Entidad: TPEDIDO; overload;
    function Entidad(aEntidad: TPEDIDO): iModelPedido; overload;
    function DAO: iSimpleDao<TPEDIDO>;
    function DataSource(aDataSource: TDataSource): iModelPedido;
    function Item : iModelPedidoItem;
  end;

implementation

uses
  Odontologia.Modelo.PedidoItem;

{ TModelPedido }

constructor TModelPedido.Create;
begin
  FEntidade := TPEDIDO.Create;
  FDAO := TSimpleDAO<TPEDIDO>.New
    (TSimpleQueryRestDW<TPEDIDO>.New(ModelConexion.RESTDWDataBase1));
  FPedidoItem := TModelPedidoItem.New;
end;

function TModelPedido.DAO: iSimpleDao<TPEDIDO>;
begin
  Result := FDAO;
end;

function TModelPedido.DataSource(aDataSource: TDataSource): iModelPedido;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDAO.DataSource(FDataSource);
end;

destructor TModelPedido.Destroy;
begin
  FreeAndNil(FEntidade);
  inherited;
end;

function TModelPedido.Entidad(aEntidad: TPEDIDO): iModelPedido;
begin
  Result := Self;
  FEntidade := aEntidad;
end;

function TModelPedido.Item: iModelPedidoItem;
begin
  Result := FPedidoItem;
end;

function TModelPedido.Entidad: TPEDIDO;
begin
  Result := FEntidade;
end;

class function TModelPedido.New: iModelPedido;
begin
  Result := Self.Create;
end;

end.
