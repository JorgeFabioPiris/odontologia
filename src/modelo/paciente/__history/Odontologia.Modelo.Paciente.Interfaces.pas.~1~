unit Odontologia.Modelo.Usuario.Interfaces;

interface

uses
  Data.DB,
  SimpleInterface,
  Odontologia.Modelo.Empresa.Interfaces,
  Odontologia.Modelo.Entidades.Usuario;

type
  iModelUsuario = interface
    ['{2DC8BA1C-DCD9-4D61-A1A5-E1C810C36875}']
    function Entidad      : TDUSUARIO; overload;
    function Entidad(aEntidad: TDUSUARIO)    : iModelUsuario; overload;
    function DAO          : iSimpleDAO<TDUSUARIO>;
    function DataSource(aDataSource: TDataSource) : iModelUsuario;
    function Empresa      : iModelEmpresa;
  end;

implementation

end.
