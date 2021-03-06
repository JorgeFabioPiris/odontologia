unit Odontologia.Modelo.Departamento.Interfaces;

interface

uses
  Data.DB,
  SimpleInterface,
  Odontologia.Modelo.Entidades.Departamento,
  Odontologia.Modelo.Pais.Interfaces;

type
  iModelDepartamento = interface
    ['{89B9EBC9-DD50-466E-B032-6C59B574BD5E}']
    function Entidad  : TDDEPARTAMENTO; overload;
    function Entidad(aEntidad: TDDEPARTAMENTO)    : iModelDepartamento; overload;
    function DAO      : iSimpleDAO<TDDEPARTAMENTO>;
    function DataSource(aDataSource: TDataSource) : iModelDepartamento;
    function Pais     : iModelPais;
  end;

implementation

end.
