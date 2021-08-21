unit Odontologia.Controlador.Departamento.Interfaces;

interface

uses
  Data.DB,
  Odontologia.Controlador.Pais.Interfaces,
  Odontologia.Modelo.Entidades.Departamento;

type
  iControllerDepartamento = interface
    ['{CF622183-1258-4B6E-B4A1-A3D28F5CC81E}']
    function DataSource (aDataSource : TDataSource) : iControllerDepartamento;
    function Buscar     : iControllerDepartamento; overload;
    function Buscar (aDepartamento : String)        : iControllerDepartamento; overload;
    function Insertar   : iControllerDepartamento;
    function Modificar  : iControllerDepartamento;
    function Eliminar   : iControllerDepartamento;
    function Entidad    : TDDEPARTAMENTO;
    function Pais       : iControllerPais;
  end;

implementation

end.
