unit Odontologia.Modelo.Entidades.Ciudad;

interface

uses
  SimpleAttributes;

type
  [Tabela('DCIUDAD')]
  TDCIUDAD = class

  private
    FCIU_NOMBRE   : String;
    FCIU_COD_DEPARTAMENTO : Integer;
    FCIU_CODIGO   : Integer;

    procedure SetCIU_COD_DEPARTAMENTO (const Value: Integer);
    procedure SetCIU_CODIGO   (const Value: Integer);
    procedure SetCIU_NOMBRE   (const Value: String);

  published
    [Campo('CIU_CODIGO'), Pk, AutoInc]
    property CIU_CODIGO   : Integer read  FCIU_CODIGO     write SetCIU_CODIGO;

    [Campo('CIU_NOMBRE')]
    property CIU_NOMBRE   : String read   FCIU_NOMBRE     write SetCIU_NOMBRE;

    [Campo('CIU_COD_DEPARTAMENTO')]
    property CIU_COD_DEPARTAMENTO : Integer read  FCIU_COD_DEPARTAMENTO   write SetCIU_COD_DEPARTAMENTO;

  end;

implementation

{ TDCIUDAD }

procedure TDCIUDAD.SetCIU_CODIGO(const Value: Integer);
begin
  FCIU_CODIGO := Value;
end;

procedure TDCIUDAD.SetCIU_COD_DEPARTAMENTO(const Value: Integer);
begin
  FCIU_COD_DEPARTAMENTO := Value;
end;

procedure TDCIUDAD.SetCIU_NOMBRE(const Value: String);
begin
  FCIU_NOMBRE := Value;
end;

end.
