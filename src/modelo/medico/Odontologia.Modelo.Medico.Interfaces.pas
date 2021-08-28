unit Odontologia.Modelo.Medico.Interfaces;

interface

uses
  Data.DB,
  SimpleInterface,
  Odontologia.Modelo.Estado.Interfaces,
  Odontologia.Modelo.Entidades.Medico;

type
  iModelMedico = interface
    ['{02DBAB3A-EA52-414E-8513-5E54173BD859}']
    function Entidad      : TDMEDICO; overload;
    function Entidad(aEntidad: TDMEDICO)    : iModelMedico; overload;
    function DAO          : iSimpleDAO<TDMEDICO>;
    function DataSource(aDataSource: TDataSource) : iModelMedico;
    function Estado       : iModelEstado;
  end;

implementation

end.
