unit Odontologia.Controlador.Ciudad.Interfaces;

interface

uses
  Data.DB,
  Odontologia.Controlador.Departamento.Interfaces,
  Odontologia.Modelo.Entidades.Ciudad;

type
  iControllerCiudad = interface
    ['{611FB023-E3E7-42BE-9E32-DA94473B732F}']
    function DataSource (aDataSource : TDataSource) : iControllerCiudad;
    function Buscar       : iControllerCiudad; overload;
    function Buscar (aDepartamento : String)        : iControllerCiudad; overload;
    function Insertar     : iControllerCiudad;
    function Modificar    : iControllerCiudad;
    function Eliminar     : iControllerCiudad;
    function Ciudad       : TDCIUDAD;
    function Departamento : iControllerDepartamento;
  end;

implementation

end.
