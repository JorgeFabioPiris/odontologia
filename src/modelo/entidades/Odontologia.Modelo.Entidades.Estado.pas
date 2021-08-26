unit Odontologia.Modelo.Entidades.Estado;

interface

uses
  SimpleAttributes;

type
  [Tabela('FSITUACION')]
  TFSITUACION = class

  private
    FSIT_CODIGO: Integer;
    FSIT_SITUACION: String;
    procedure SetSIT_CODIGO(const Value: Integer);
    procedure SetSIT_SITUACION(const Value: String);

  published
    [Campo('SIT_CODIGO'), Pk, AutoInc]
    property SIT_CODIGO: Integer read FSIT_CODIGO write SetSIT_CODIGO;

    [Campo('SIT_SITUACION')]
    property SIT_SITUACION: String  read FSIT_SITUACION write SetSIT_SITUACION;
  end;

implementation

{ TFSITUACION }

procedure TFSITUACION.SetSIT_CODIGO(const Value: Integer);
begin
  FSIT_CODIGO := Value;
end;

procedure TFSITUACION.SetSIT_SITUACION(const Value: String);
begin
  FSIT_SITUACION := Value;
end;

end.
