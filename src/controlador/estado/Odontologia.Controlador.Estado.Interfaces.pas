unit Odontologia.Controlador.Estado.Interfaces;

interface

uses
  Data.DB,
  Odontologia.Modelo.Entidades.Estado;

type
  iControllerEstado = interface
    ['{775FA656-A5D6-45FB-B2D5-0131C15C0662}']
    function DataSource (aDataSource : TDataSource) : iControllerEstado;
    function Buscar : iControllerEstado; overload;
    function Buscar (aNombre : String) : iControllerEstado; overload;
    function Insertar : iControllerEstado;
    function Modificar : iControllerEstado;
    function Eliminar : iControllerEstado;
    function Entidad : TFSITUACION;
  end;

implementation

end.
