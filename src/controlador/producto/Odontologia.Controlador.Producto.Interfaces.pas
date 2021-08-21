unit Odontologia.Controlador.Producto.Interfaces;

interface

uses
  Data.DB,
  Odontologia.Modelo.Entidades.Producto;

type
  iControllerProducto = interface
    ['{CF622183-1258-4B6E-B4A1-A3D28F5CC81E}']
    function DataSource (aDataSource : TDataSource) : iControllerProducto;
    function Buscar : iControllerProducto; overload;
    function Buscar (aId : Integer) : iControllerProducto; overload;
    function Buscar (aNombre : String) : iControllerProducto; overload;
    function Insertar : iControllerProducto;
    function Modificar : iControllerProducto;
    function Eliminar : iControllerProducto;
    function Entidad : TPRODUCTO;
  end;

implementation

end.
