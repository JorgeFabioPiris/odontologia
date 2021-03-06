unit Odontologia.Controlador.Pais.Interfaces;

interface

uses
  Data.DB,
  Odontologia.Modelo.Entidades.Pais;

type
  iControllerPais = interface
    ['{CF622183-1258-4B6E-B4A1-A3D28F5CC81E}']
    function DataSource (aDataSource : TDataSource) : iControllerPais;
    function Buscar : iControllerPais; overload;
    function Buscar (aId : Integer) : iControllerPais; overload;
    function Buscar (aNombre : String) : iControllerPais; overload;
    function Insertar : iControllerPais;
    function Modificar : iControllerPais;
    function Eliminar : iControllerPais;
    function Entidad : TDPAIS;
  end;

implementation

end.
