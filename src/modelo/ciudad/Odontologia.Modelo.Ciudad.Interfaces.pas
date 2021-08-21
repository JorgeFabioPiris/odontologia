unit Odontologia.Modelo.Ciudad.Interfaces;

interface

uses
  Data.DB,
  SimpleInterface,
  Odontologia.Modelo.Entidades.Ciudad,
  Odontologia.Modelo.Departamento.Interfaces;

type
  iModelCiudad = interface
    ['{89B9EBC9-DD50-466E-B032-6C59B574BD5E}']
    function Entidad      : TDCIUDAD; overload;
    function Entidad(aEntidad: TDCIUDAD)    : iModelCiudad; overload;
    function DAO          : iSimpleDAO<TDCIUDAD>;
    function DataSource(aDataSource: TDataSource) : iModelCiudad;
    function Departamento : iModelDepartamento;
  end;

implementation

end.
