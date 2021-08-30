unit Odontologia.Modelo.Entidades.Medico;

interface

uses
  SimpleAttributes;

Type
  [Tabela('DMEDICO')]
  TDMEDICO = class

  private
    FMED_COD_ESTADO   : Integer;
    FMED_CODIGO       : Integer;
    FMED_ESPECIALIDAD : String;
    FMED_DOCUMENTO    : String;
    FMED_NOMBRE       : String;
    FMED_MATRICULA    : String;

    procedure SetMED_COD_ESTADO(const Value: Integer);
    procedure SetMED_CODIGO(const Value: Integer);
    procedure SetMED_DOCUMENTO(const Value: String);
    procedure SetMED_ESPECIALIDAD(const Value: String);
    procedure SetMED_MATRICULA(const Value: String);
    procedure SetMED_NOMBRE(const Value: String);

  published
    [Campo('MED_CODIGO'), Pk, AutoInc]
    property MED_CODIGO       : Integer read FMED_CODIGO write SetMED_CODIGO;

    [Campo('MED_NOMBRE')]
    property MED_NOMBRE       : String read FMED_NOMBRE write SetMED_NOMBRE;

    [Campo('MED_DOCUMENTO')]
    property MED_DOCUMENTO    : String read FMED_DOCUMENTO write SetMED_DOCUMENTO;

    [Campo('MED_MATRICULA')]
    property MED_MATRICULA    : String read FMED_MATRICULA write SetMED_MATRICULA;

    [Campo('MED_ESPECIALIDAD')]
    property MED_ESPECIALIDAD : String read FMED_ESPECIALIDAD write SetMED_ESPECIALIDAD;

    [Campo('MED_COD_ESTADO')]
    property MED_COD_ESTADO   : Integer read FMED_COD_ESTADO write SetMED_COD_ESTADO;
  end;

implementation

{ TDMEDICO }

procedure TDMEDICO.SetMED_CODIGO(const Value: Integer);
begin
  FMED_CODIGO := Value;
end;

procedure TDMEDICO.SetMED_COD_ESTADO(const Value: Integer);
begin
  FMED_COD_ESTADO := Value;
end;

procedure TDMEDICO.SetMED_DOCUMENTO(const Value: String);
begin
  FMED_DOCUMENTO := Value;
end;

procedure TDMEDICO.SetMED_ESPECIALIDAD(const Value: String);
begin
  FMED_ESPECIALIDAD := Value;
end;

procedure TDMEDICO.SetMED_MATRICULA(const Value: String);
begin
  FMED_MATRICULA := Value;
end;

procedure TDMEDICO.SetMED_NOMBRE(const Value: String);
begin
  FMED_NOMBRE := Value;
end;

end.
