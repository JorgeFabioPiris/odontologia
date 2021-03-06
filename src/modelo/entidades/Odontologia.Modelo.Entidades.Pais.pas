unit Odontologia.Modelo.Entidades.Pais;

interface

uses
  SimpleAttributes;

type
  [Tabela('DPAIS')]
  TDPAIS = Class

  private
    FID: Integer;
    FNOMBRE: String;
    procedure SetID(const Value: Integer);
    procedure SetNOMBRE(const Value: String);

  published
    [Campo('PAI_CODIGO'), Pk, AutoInc]
    property ID : Integer read FID write SetID;

    [Campo('PAI_NOMBRE')]
    property NOMBRE : String read FNOMBRE write SetNOMBRE;

  End;

implementation

{ TPAIS }

procedure TDPAIS.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TDPAIS.SetNOMBRE(const Value: String);
begin
  FNOMBRE := Value;
end;

end.
