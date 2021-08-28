unit Odontologia.Modelo.Estado.Cita.Interfaces;

interface

uses
  Odontologia.Modelo.Entidades.Estado.Cita,
  SimpleInterface,
  Data.DB;

type
  iModelEstadoCita = interface
    ['{D8C58900-CE6E-449F-9D61-C63F85F79F6B}']
    function Entidad : TFESTADO_CITA;
    function DAO : iSimpleDAO<TFESTADO_CITA>;
    function DataSource (aDataSource : TDataSource) : iModelEstadoCita;
  end;

implementation

end.
