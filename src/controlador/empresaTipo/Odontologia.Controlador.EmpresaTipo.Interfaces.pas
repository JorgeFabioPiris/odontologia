unit Odontologia.Controlador.EmpresaTipo.Interfaces;

interface

uses
  Data.DB,
  Odontologia.Modelo.Entidades.EmpresaTipo;

type
  iControllerEmpresaTipo = interface
    ['{CF622183-1258-4B6E-B4A1-A3D28F5CC81E}']
    function DataSource (aDataSource : TDataSource) : iControllerEmpresaTipo;
    function Buscar : iControllerEmpresaTipo; overload;
    function Buscar (aId : Integer) : iControllerEmpresaTipo; overload;
    function Buscar (aNombre : String) : iControllerEmpresaTipo; overload;
    function Insertar : iControllerEmpresaTipo;
    function Modificar : iControllerEmpresaTipo;
    function Eliminar : iControllerEmpresaTipo;
    function EmpresaTipo : TFTIPO_EMPRESA;
  end;

implementation

end.
