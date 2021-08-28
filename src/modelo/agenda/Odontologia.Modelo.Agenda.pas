unit Odontologia.Modelo.Agenda;

interface

uses
  Data.DB,
  SimpleDAO,
  SimpleInterface,
  SimpleQueryRestDW,
  System.SysUtils,
  Odontologia.Modelo.Estado.Cita,
  Odontologia.Modelo.Estado.Cita.Interfaces,
  Odontologia.Modelo.Medico,
  Odontologia.Modelo.Medico.Interfaces,
  Odontologia.Modelo.Conexion.RestDW,
  Odontologia.Modelo.Agenda.Interfaces,
  Odontologia.Modelo.Paciente,
  Odontologia.Modelo.Paciente.Interfaces,
  Odontologia.Modelo.Entidades.Agenda;


type
  TModelAgenda = class(TInterfacedOBject, iModelAgenda)

  private
    FEntidad      : TDAGENDA;
    FDAO          : iSimpleDao<TDAGENDA>;
    FDataSource   : TDataSource;
    FMedico       : iModelMedico;
    FPaciente     : iModelPaciente;
    FEstadoCita   : iModelEstadoCita;

  public
    constructor Create;
    destructor Destroy; override;
    class function New    : iModelAgenda;
    function Entidad      : TDAGENDA; overload;
    function Entidad(aEntidad: TDAGENDA) : iModelAgenda; overload;
    function DAO          : iSimpleDAO<TDAGENDA>;
    function DataSource(aDataSource: TDataSource) : iModelAgenda;
    function Medico       : iModelMedico;
    function Paciente     : iModelPaciente;
    function EstadoCita   : iModelEstadoCita;
  end;

implementation

{ TModelAgenda }

constructor TModelAgenda.Create;
begin
  FEntidad      := TDAGENDA.Create;
  FDAO          := TSimpleDAO<TDAGENDA>.New(TSimpleQueryRestDW<TDAGENDA>
                .New(ModelConexion.RESTDWDataBase1));
  FMedico       := TModelMedico.New;
  FPaciente     := TModelPaciente.New;
  FEstadoCita   := TModelEstadoCita.New
end;

function TModelAgenda.DAO: iSimpleDao<TDAGENDA>;
begin
  Result := FDAO;
end;

function TModelAgenda.DataSource(aDataSource: TDataSource): iModelAgenda;
begin
  Result      := Self;
  FDataSource := aDataSource;
  FDAO.DataSource(FDataSource);
end;

destructor TModelAgenda.Destroy;
begin
  FreeAndNil(FEntidad);
  inherited;
end;

function TModelAgenda.Entidad(aEntidad: TDAGENDA): iModelAgenda;
begin
  Result    := Self;
  FEntidad  := aEntidad;
end;

function TModelAgenda.EstadoCita: iModelEstadoCita;
begin
  Result    := FEstadoCita;
end;

function TModelAgenda.Medico: iModelMedico;
begin
  Result    := FMedico;
end;

function TModelAgenda.Entidad: TDAGENDA;
begin
  Result    := FEntidad;
end;

class function TModelAgenda.New: iModelAgenda;
begin
  Result    := Self.Create;
end;

function TModelAgenda.Paciente: iModelPaciente;
begin
   Result    := FPaciente   ;
end;

end.
