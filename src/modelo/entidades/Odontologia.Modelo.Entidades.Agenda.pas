unit Odontologia.Modelo.Entidades.Agenda;

interface

uses
  SimpleAttributes;

type
  [Tabela('DAGENDA')]
  TDAGENDA = class

  private
    FAGE_PACIENTE         : integer;
    FAGE_CODIGO           : integer;
    FAGE_FECHA            : String;
    FAGE_MEDICO           : integer;
    FAGE_COD_ESTADO_CITA  : integer;
    FAGE_HORA             : TTime;

    procedure SetAGE_COD_ESTADO_CITA(const Value: integer);
    procedure SetAGE_CODIGO(const Value: integer);
    procedure SetAGE_FECHA(const Value: String);
    procedure SetAGE_HORA(const Value: TTime);
    procedure SetAGE_MEDICO(const Value: integer);
    procedure SetAGE_PACIENTE(const Value: integer);

  published
    [Campo('AGE_CODIGO'), Pk, AutoInc]
    property AGE_CODIGO   : integer read FAGE_CODIGO write SetAGE_CODIGO;

    [Campo('AGE_FECHA')]
    property AGE_FECHA    : String read FAGE_FECHA write SetAGE_FECHA;

    [Campo('AGE_HORA')]
    property AGE_HORA     : TTime read FAGE_HORA write SetAGE_HORA;

    [Campo('AGE_PACIENTE')]
    property AGE_PACIENTE : integer read FAGE_PACIENTE write SetAGE_PACIENTE;

    [Campo('AGE_MEDICO')]
    property AGE_MEDICO   : integer read FAGE_MEDICO write SetAGE_MEDICO;

    [Campo('AGE_COD_ESTADO_CITA')]
    property AGE_COD_ESTADO_CITA  : integer read FAGE_COD_ESTADO_CITA write SetAGE_COD_ESTADO_CITA;
  end;
implementation

{ TDAGENDA }

procedure TDAGENDA.SetAGE_CODIGO(const Value: integer);
begin
  FAGE_CODIGO := Value;
end;

procedure TDAGENDA.SetAGE_COD_ESTADO_CITA(const Value: integer);
begin
  FAGE_COD_ESTADO_CITA := Value;
end;

procedure TDAGENDA.SetAGE_FECHA(const Value: String);
begin
  FAGE_FECHA := Value;
end;

procedure TDAGENDA.SetAGE_HORA(const Value: TTime);
begin
  FAGE_HORA := Value;
end;

procedure TDAGENDA.SetAGE_MEDICO(const Value: integer);
begin
  FAGE_MEDICO := Value;
end;

procedure TDAGENDA.SetAGE_PACIENTE(const Value: integer);
begin
  FAGE_PACIENTE := Value;
end;

end.
