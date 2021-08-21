unit Odontologia.Modelo.Entidades.Empresa;

interface

uses
  simpleattributes;

type
  [Tabela('DEMPRESA')]
  TDEMPRESA = class
  private
    FEMP_FANTASIA: String;
    FEMP_EMAIL: String;
    FEMP_BARRIO: String;
    FEMP_RAZSOCIAL: String;
    FEMP_CODIGO: Integer;
    FEMP_COD_TIP_EMPRESA: Integer;
    FEMP_DIRECCION: String;
    FEMP_NUMERO: String;
    FEMP_TELEFONO: String;
    FEMP_COD_CIUDAD: Integer;
    FEMP_RUC: String;
    procedure SetEMP_BARRIO(const Value: String);
    procedure SetEMP_COD_CIUDAD(const Value: Integer);
    procedure SetEMP_COD_TIP_EMPRESA(const Value: Integer);
    procedure SetEMP_CODIGO(const Value: Integer);
    procedure SetEMP_DIRECCION(const Value: String);
    procedure SetEMP_EMAIL(const Value: String);
    procedure SetEMP_FANTASIA(const Value: String);
    procedure SetEMP_NUMERO(const Value: String);
    procedure SetEMP_RAZSOCIAL(const Value: String);
    procedure SetEMP_RUC(const Value: String);
    procedure SetEMP_TELEFONO(const Value: String);
  published

    [Campo('EMP_CODIGO'), Pk, AutoInc]
    property EMP_CODIGO : Integer read FEMP_CODIGO write SetEMP_CODIGO;

    [Campo('EMP_RAZSOCIAL')]
    property EMP_RAZSOCIAL : String read FEMP_RAZSOCIAL write SetEMP_RAZSOCIAL;

    [Campo('EMP_FANTASIA')]
    property EMP_FANTASIA : String read FEMP_FANTASIA write SetEMP_FANTASIA;

    [Campo('EMP_DIRECCION')]
    property EMP_DIRECCION : String read FEMP_DIRECCION write SetEMP_DIRECCION;

    [Campo('EMP_NUMERO')]
    property EMP_NUMERO : String read FEMP_NUMERO write SetEMP_NUMERO;

    [Campo('EMP_BARRIO')]
    property EMP_BARRIO : String read FEMP_BARRIO write SetEMP_BARRIO;

    [Campo('EMP_TELEFONO')]
    property EMP_TELEFONO : String read FEMP_TELEFONO write SetEMP_TELEFONO;

    [Campo('EMP_EMAIL')]
    property EMP_EMAIL : String read FEMP_EMAIL write SetEMP_EMAIL;

    [Campo('EMP_RUC')]
    property EMP_RUC : String read FEMP_RUC write SetEMP_RUC;

    [Campo('EMP_COD_CIUDAD')]
    property EMP_COD_CIUDAD : Integer read FEMP_COD_CIUDAD write SetEMP_COD_CIUDAD;

    [Campo('EMP_COD_TIP_EMPRESA')]
    property EMP_COD_TIP_EMPRESA : Integer read FEMP_COD_TIP_EMPRESA write SetEMP_COD_TIP_EMPRESA;

  end;

implementation

{ TDEMPRESA }

procedure TDEMPRESA.SetEMP_BARRIO(const Value: String);
begin
  FEMP_BARRIO := Value;
end;

procedure TDEMPRESA.SetEMP_CODIGO(const Value: Integer);
begin
  FEMP_CODIGO := Value;
end;

procedure TDEMPRESA.SetEMP_COD_CIUDAD(const Value: Integer);
begin
  FEMP_COD_CIUDAD := Value;
end;

procedure TDEMPRESA.SetEMP_COD_TIP_EMPRESA(const Value: Integer);
begin
  FEMP_COD_TIP_EMPRESA := Value;
end;

procedure TDEMPRESA.SetEMP_DIRECCION(const Value: String);
begin
  FEMP_DIRECCION := Value;
end;

procedure TDEMPRESA.SetEMP_EMAIL(const Value: String);
begin
  FEMP_EMAIL := Value;
end;

procedure TDEMPRESA.SetEMP_FANTASIA(const Value: String);
begin
  FEMP_FANTASIA := Value;
end;

procedure TDEMPRESA.SetEMP_NUMERO(const Value: String);
begin
  FEMP_NUMERO := Value;
end;

procedure TDEMPRESA.SetEMP_RAZSOCIAL(const Value: String);
begin
  FEMP_RAZSOCIAL := Value;
end;

procedure TDEMPRESA.SetEMP_RUC(const Value: String);
begin
  FEMP_RUC := Value;
end;

procedure TDEMPRESA.SetEMP_TELEFONO(const Value: String);
begin
  FEMP_TELEFONO := Value;
end;

end.
