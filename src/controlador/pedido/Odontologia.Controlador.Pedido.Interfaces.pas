unit Odontologia.Controlador.Pedido.Interfaces;

interface

uses
  Data.DB,
  Odontologia.Modelo.Entidades.Pedido,
  Odontologia.Modelo.Entidades.PedidoItems;

type
  iControllerPedidoItem = interface;

  iControllerPedido = interface
    ['{CF622183-1258-4B6E-B4A1-A3D28F5CC81E}']
    function DataSource (aDataSource : TDataSource) : iControllerPedido;
    function Buscar : iControllerPedido;
    function Insertar : iControllerPedido;
    function Modificar : iControllerPedido;
    function Eliminar : iControllerPedido;
    function Entidad : TPEDIDO;
    function Item : iControllerPedidoItem;
  end;

  iControllerPedidoItem = interface
    ['{4CA24832-0C41-40F1-B6D3-8A92BCDDAC55}']
    function DataSource (aDataSource : TDataSource) : iControllerPedidoItem;
    function Buscar : iControllerPedidoItem; overload;
    function Buscar (aId : Integer) : iControllerPedidoItem; overload;
    function Insertar : iControllerPedidoItem;
    function Modificar : iControllerPedidoItem;
    function Eliminar : iControllerPedidoItem;
    function Entidad : TPEDIDOITEM;
  end;

implementation

end.
