unit Odontologia.Modelo.Agenda.Interfaces;

interface

uses
  Data.DB,
  SimpleInterface,
  Odontologia.Modelo.Estado.Cita.Interfaces,
  Odontologia.Modelo.Medico.Interfaces,
  Odontologia.Modelo.Paciente.Interfaces,
  Odontologia.Modelo.Entidades.Agenda;

type
  iModelAgenda = interface
    ['{A89CD856-0A9B-46E5-94E8-4D3FB4BC5CD7}']
    function Entidad      : TDAGENDA; overload;
    function Entidad(aEntidad: TDAGENDA)    : iModelAgenda; overload;
    function DAO          : iSimpleDAO<TDAGENDA>;
    function DataSource(aDataSource: TDataSource) : iModelAgenda;
    function Medico       : iModelMedico;
    function Paciente     : iModelPaciente;
    function EstadoCita   : iModelEstadoCita;
  end;

implementation

end.
