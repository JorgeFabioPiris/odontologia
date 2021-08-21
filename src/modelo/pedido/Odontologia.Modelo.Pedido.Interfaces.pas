unit Odontologia.Modelo.Pedido.Interfaces;

interface

uses
  Data.DB,
  SimpleInterface,
  Odontologia.Modelo.Entidades.Pedido,
  Odontologia.Modelo.Entidades.PedidoItems;

type
  iModelPedidoItem = interface;

  iModelPedido = interface
    ['{674CF92B-2BA0-4E98-922F-C41ABF1EA5A6}']
    function Entidad: TPEDIDO; overload;
    function Entidad(aEntidad: TPEDIDO): iModelPedido; overload;
    function DAO: iSimpleDAO<TPEDIDO>;
    function DataSource(aDataSource: TDataSource): iModelPedido;
    function Item: iModelPedidoItem;
  end;

  iModelPedidoItem = interface
    ['{674CF92B-2BA0-4E98-922F-C41ABF1EA5A6}']
    function Entidad: TPEDIDOITEM; overload;
    function Entidad(aEntidad: TPEDIDOITEM): iModelPedidoItem; overload;
    function DAO: iSimpleDAO<TPEDIDOITEM>;
    function DataSource(aDataSource: TDataSource): iModelPedidoItem;
  end;

implementation

end.
