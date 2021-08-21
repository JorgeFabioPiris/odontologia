unit Odontologia.Modelo.EmpresaTipo.Interfaces;

interface

uses
  Odontologia.Modelo.Entidades.EmpresaTipo,
  SimpleInterface,
  Data.DB;

type
  iModelEmpresaTipo = interface
    ['{18F42EE3-AD99-44E3-888B-5B91130A91EA}']
    function Entidad : TFTIPO_EMPRESA;
    function DAO : iSimpleDAO<TFTIPO_EMPRESA>;
    function DataSource (aDataSource : TDataSource) : iModelEmpresaTipo;
  end;

implementation

end.
