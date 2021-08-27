unit Odontologia.Modelo.Entidades.Agenda;

interface

uses
  SimpleAttributes;

type
  TDAGENDA = class
  private
    FAGE_PACIENTE: integer;
    FAGE_CODIGO: integer;
    FAGE_FECHA: TDateTime;
    FAGE_MEDICO: integer;
    FAGE_COD_ESTADO_CITA: integer;
    FAGE_HORA: TDateTime;
    procedure SetAGE_COD_ESTADO_CITA(const Value: integer);
    procedure SetAGE_CODIGO(const Value: integer);
    procedure SetAGE_FECHA(const Value: TDateTime);
    procedure SetAGE_HORA(const Value: TDateTime);
    procedure SetAGE_MEDICO(const Value: integer);
    procedure SetAGE_PACIENTE(const Value: integer);
  published
    property AGE_CODIGO : integer read FAGE_CODIGO write SetAGE_CODIGO;
    property AGE_FECHA  : TDateTime read FAGE_FECHA write SetAGE_FECHA;
    property AGE_HORA   : TDateTime read FAGE_HORA write SetAGE_HORA;
    property AGE_PACIENTE : integer read FAGE_PACIENTE write SetAGE_PACIENTE;
    property AGE_MEDICO   : integer read FAGE_MEDICO write SetAGE_MEDICO;
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

procedure TDAGENDA.SetAGE_FECHA(const Value: TDateTime);
begin
  FAGE_FECHA := Value;
end;

procedure TDAGENDA.SetAGE_HORA(const Value: TDateTime);
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
