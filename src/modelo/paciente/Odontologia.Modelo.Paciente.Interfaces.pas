unit Odontologia.Modelo.Paciente.Interfaces;

interface

uses
  Data.DB,
  SimpleInterface,
  Odontologia.Modelo.Estado.Interfaces,
  Odontologia.Modelo.Entidades.Paciente;

type
  iModelPaciente = interface
    ['{2DC8BA1C-DCD9-4D61-A1A5-E1C810C36875}']
    function Entidad      : TDPACIENTE; overload;
    function Entidad(aEntidad: TDPACIENTE)    : iModelPaciente; overload;
    function DAO          : iSimpleDAO<TDPACIENTE>;
    function DataSource(aDataSource: TDataSource) : iModelPaciente;
    function Estado       : iModelEstado;
  end;

implementation

end.
