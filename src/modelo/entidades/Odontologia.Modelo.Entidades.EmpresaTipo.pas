unit Odontologia.Modelo.Entidades.EmpresaTipo;

interface

uses
  SimpleAttributes;

type
  [Tabela('FTIPO_EMPRESA')]
  TFTIPO_EMPRESA = Class

  private
    FTIP_EMP_CODIGO: Integer;
    FTIP_EMP_EMP: String;
    procedure SetTIP_EMP_CODIGO(const Value: Integer);
    procedure SetTIP_EMP_EMP(const Value: String);

  published
    [Campo('TIP_EMP_CODIGO'), Pk, AutoInc]
    property TIP_EMP_CODIGO : Integer read FTIP_EMP_CODIGO write SetTIP_EMP_CODIGO;

    [Campo('TIP_EMP_EMP')]
    property TIP_EMP_EMP : String read FTIP_EMP_EMP write SetTIP_EMP_EMP;

  End;

implementation

{ TPAIS }

procedure TFTIPO_EMPRESA.SetTIP_EMP_CODIGO(const Value: Integer);
begin
  FTIP_EMP_CODIGO := Value;
end;

procedure TFTIPO_EMPRESA.SetTIP_EMP_EMP(const Value: String);
begin
  FTIP_EMP_EMP := Value;
end;

end.
