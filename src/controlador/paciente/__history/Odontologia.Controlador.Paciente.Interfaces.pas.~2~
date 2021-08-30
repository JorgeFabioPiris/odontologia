unit Odontologia.Controlador.Paciente.Interfaces;

interface

uses
  Data.DB,
  SimpleInterface,
  Odontologia.Modelo.Estado.Interfaces,
  Odontologia.Modelo.Entidades.Paciente,
  Odontologia.Controlador.Estado.Interfaces;

type
  iControllerPaciente = interface
    ['{629DE02A-1733-4F78-9202-94F3AFABF159}']
    function DataSource (aDataSource : TDataSource)         : iControllerPaciente;
    function Buscar (aLogin : String)                       : iControllerPaciente; overload;
    function Buscar (aLogin, aPassword : String ; aEmpresa : Integer)  : iControllerPaciente; overload;
    function Buscar       : iControllerPaciente; overload;
    function Insertar     : iControllerPaciente;
    function Modificar    : iControllerPaciente;
    function Eliminar     : iControllerPaciente;
    function Entidad      : TDPACIENTE;
    function Estado      : iControllerEstado;
  end;

implementation

end.
