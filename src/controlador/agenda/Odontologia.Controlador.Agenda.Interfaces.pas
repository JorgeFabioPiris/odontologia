unit Odontologia.Controlador.Agenda.Interfaces;

interface

uses
  Data.DB,
  Odontologia.Controlador.Estado.Cita.Interfaces,
  Odontologia.Controlador.Medico.Interfaces,
  Odontologia.Controlador.Paciente.Interfaces,
  Odontologia.Modelo.Entidades.Agenda;

type
  iControllerAgenda = interface
    ['{CF622183-1258-4B6E-B4A1-A3D28F5CC81E}']
    function DataSource (aDataSource : TDataSource) : iControllerAgenda;
    function Buscar       : iControllerAgenda; overload;
    function Buscar (aCita: String)                 : iControllerAgenda; overload;
    function Insertar     : iControllerAgenda;
    function Modificar    : iControllerAgenda;
    function Eliminar     : iControllerAgenda;
    function Entidad      : TDAGENDA;
    function Medico       : iControllerMedico;
    function Paciente     : iControllerPaciente;
    function EstadoCita   : iControllerEstadoCita;
  end;

implementation

end.
