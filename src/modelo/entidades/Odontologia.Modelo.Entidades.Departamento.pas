unit Odontologia.Modelo.Entidades.Departamento;

interface

uses
  SimpleAttributes;

type
  [Tabela('DDEPARTAMENTO')]
  TDDEPARTAMENTO = class

  private
    FDEP_NOMBRE   : String;
    FDEP_COD_PAIS : Integer;
    FDEP_CODIGO   : Integer;

    procedure SetDEP_COD_PAIS (const Value: Integer);
    procedure SetDEP_CODIGO   (const Value: Integer);
    procedure SetDEP_NOMBRE   (const Value: String);

  published
    [Campo('DEP_CODIGO'), Pk, AutoInc]
    property DEP_CODIGO   : Integer read  FDEP_CODIGO     write SetDEP_CODIGO;

    [Campo('DEP_NOMBRE')]
    property DEP_NOMBRE   : String read   FDEP_NOMBRE     write SetDEP_NOMBRE;

    [Campo('DEP_COD_PAIS')]
    property DEP_COD_PAIS : Integer read  FDEP_COD_PAIS   write SetDEP_COD_PAIS;

  end;

implementation

{ TDDEPARTAMENTO }

procedure TDDEPARTAMENTO.SetDEP_CODIGO(const Value: Integer);
begin
  FDEP_CODIGO := Value;
end;

procedure TDDEPARTAMENTO.SetDEP_COD_PAIS(const Value: Integer);
begin
  FDEP_COD_PAIS := Value;
end;

procedure TDDEPARTAMENTO.SetDEP_NOMBRE(const Value: String);
begin
  FDEP_NOMBRE := Value;
end;

end.
