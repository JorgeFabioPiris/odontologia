unit Odontologia.Controlador.Estado.Cita.Interfaces;

interface

uses
  Data.DB,
  Odontologia.Modelo.Entidades.Estado.Cita;

type
  iControllerEstadoCita = interface
    ['{775FA656-A5D6-45FB-B2D5-0131C15C0662}']
    function DataSource (aDataSource : TDataSource) : iControllerEstadoCita;
    function Buscar     : iControllerEstadoCita;
    function Insertar   : iControllerEstadoCita;
    function Modificar  : iControllerEstadoCita;
    function Eliminar   : iControllerEstadoCita;
    function Entidad    : TFESTADO_CITA;
  end;

implementation

end.
