unit Odontologia.Modelo.Empresa.Interfaces;

interface

uses
  Data.DB,
  SimpleInterface,
  Odontologia.Modelo.Ciudad.Interfaces,
  Odontologia.Modelo.EmpresaTipo.Interfaces,
  Odontologia.Modelo.Entidades.Empresa;

type
  iModelEmpresa = interface
['{F10B4FB4-166F-4CD6-8497-779C2A43D9EC}']
    function Entidad      : TDEMPRESA; overload;
    function Entidad(aEntidad: TDEMPRESA)    : iModelEmpresa; overload;
    function DAO          : iSimpleDAO<TDEMPRESA>;
    function DataSource(aDataSource: TDataSource) : iModelEmpresa;
    function Ciudad       : iModelCiudad;
    function TimpoEmpresa : iModelEmpresatipo;
  end;

implementation

end.
