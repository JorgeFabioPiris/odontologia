unit Odontologia.Controlador.Medico.Interfaces;

interface

uses
  Data.DB,
  SimpleInterface,
  Odontologia.Modelo.Estado.Interfaces,
  Odontologia.Modelo.Entidades.Medico,
  Odontologia.Controlador.Estado.Interfaces;

type
  iControllerMedico = interface
    ['{629DE02A-1733-4F78-9202-94F3AFABF159}']
    function DataSource (aDataSource : TDataSource): iControllerMedico;
    function Buscar (aNombre : String)              : iControllerMedico; overload;
    function Buscar       : iControllerMedico; overload;
    function Insertar     : iControllerMedico;
    function Modificar    : iControllerMedico;
    function Eliminar     : iControllerMedico;
    function Entidad      : TDMEDICO;
    function Estado       : iControllerEstado;
  end;

implementation

end.
