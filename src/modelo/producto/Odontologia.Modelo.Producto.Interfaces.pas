unit Odontologia.Modelo.Producto.Interfaces;

interface

uses
  Odontologia.Modelo.Entidades.Producto,
  SimpleInterface,
  Data.DB;

type
  iModelProducto = interface
    ['{18F42EE3-AD99-44E3-888B-5B91130A91EA}']
    function Entidad : TPRODUCTO;
    function DAO : iSimpleDAO<TPRODUCTO>;
    function DataSource (aDataSource : TDataSource) : iModelProducto;
  end;

implementation

end.
