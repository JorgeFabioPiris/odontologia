unit Odontologia.Controlador.Usuario.Interfaces;

interface

uses
  Data.DB,
  SimpleInterface,
  Odontologia.Modelo.Empresa.Interfaces,
  Odontologia.Modelo.Entidades.Usuario,
  Odontologia.Controlador.Empresa.Interfaces;

type
  iControllerUsuario = interface
    ['{629DE02A-1733-4F78-9202-94F3AFABF159}']
    function DataSource (aDataSource : TDataSource) : iControllerUsuario;
    function Buscar       : iControllerUsuario; overload;
    function Buscar (aDepartamento : String)        : iControllerUsuario; overload;
    function Insertar     : iControllerUsuario;
    function Modificar    : iControllerUsuario;
    function Eliminar     : iControllerUsuario;
    function Entidad      : TDUSUARIO;
    function Empresa      : iControllerEmpresa;
  end;

implementation

end.
