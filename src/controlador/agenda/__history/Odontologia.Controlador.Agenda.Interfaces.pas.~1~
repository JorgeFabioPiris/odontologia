unit Odontologia.Controlador.Empresa.Interfaces;

interface

uses
  Data.DB,
  Odontologia.Controlador.Ciudad.Interfaces,
  Odontologia.Controlador.EmpresaTipo.Interfaces,
  Odontologia.Modelo.Entidades.Empresa;

type
  iControllerEmpresa = interface
    ['{CF622183-1258-4B6E-B4A1-A3D28F5CC81E}']
    function DataSource (aDataSource : TDataSource) : iControllerEmpresa;
    function Buscar       : iControllerEmpresa; overload;
    function Buscar (aDepartamento : String)        : iControllerEmpresa; overload;
    function Insertar     : iControllerEmpresa;
    function Modificar    : iControllerEmpresa;
    function Eliminar     : iControllerEmpresa;
    function Entidad      : TDEMPRESA;
    function Ciudad       : iControllerCiudad;
    function EmpresaTipo  : iControllerEmpresaTipo;
  end;

implementation

end.
