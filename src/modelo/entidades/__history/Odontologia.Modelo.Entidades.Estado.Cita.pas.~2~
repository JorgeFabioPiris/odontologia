unit Odontologia.Modelo.Entidades.Estado.Cita;

interface

uses
  SimpleAttributes;

type
  [Tabela('FESTADO_CITA')]
  TFESTADO_CITA = class

  private
    FCIT_CODIGO: Integer;
    FCIT_DESCRIPCION: String;
    procedure SetCIT_CODIGO(const Value: Integer);
    procedure SetCIT_DESCRIPCION(const Value: String);

  published
    [Campo('CIT_CODIGO'), Pk, AutoInc]
    property CIT_CODIGO : Integer read FCIT_CODIGO write SetCIT_CODIGO;

    [Campo('CIT_DESCRIPCION')]
    property CIT_DESCRIPCION : String  read FCIT_DESCRIPCION write SetCIT_DESCRIPCION;
  end;

implementation

{ TFESTADO_CITA }

procedure TFESTADO_CITA.SetCIT_CODIGO(const Value: Integer);
begin
  FCIT_CODIGO := Value;
end;

procedure TFESTADO_CITA.SetCIT_DESCRIPCION(const Value: String);
begin
  FCIT_DESCRIPCION := Value;
end;

end.
