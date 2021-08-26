unit Odontologia.Modelo.Entidades.Usuario;

interface

uses
  SimpleAttributes;

type
  [Tabela('DUSUARIO')]
  TDUSUARIO = class

  private
    FUSU_CODIGO: Integer;
    FUSU_LOGIN: String;
    FUSU_NIVEL: Integer;
    FUSU_CLAVE: String;
    FUSU_FOTO: String;
    FUSU_COD_EMPRESA: Integer;
    FUSU_COD_ESTADO: Integer;
    procedure SetUSU_CLAVE(const Value: String);
    procedure SetUSU_COD_EMPRESA(const Value: Integer);
    procedure SetUSU_COD_ESTADO(const Value: Integer);
    procedure SetUSU_CODIGO(const Value: Integer);
    procedure SetUSU_FOTO(const Value: String);
    procedure SetUSU_LOGIN(const Value: String);
    procedure SetUSU_NIVEL(const Value: Integer);

  published
    [Campo('USU_CODIGO'), Pk, AutoInc]
    property USU_CODIGO: Integer read FUSU_CODIGO write SetUSU_CODIGO;

    [Campo('USU_LOGIN')]
    property USU_LOGIN: String  read FUSU_LOGIN write SetUSU_LOGIN;

    [Campo('USU_NIVEL')]
    property USU_NIVEL: Integer  read FUSU_NIVEL write SetUSU_NIVEL;

    [Campo('USU_CLAVE')]
    property USU_CLAVE: String  read FUSU_CLAVE write SetUSU_CLAVE;

    [Campo('USU_FOTO')]
    property USU_FOTO: String  read FUSU_FOTO write SetUSU_FOTO;

    [Campo('USU_COD_EMPRESA')]
    property USU_COD_EMPRESA: Integer read FUSU_COD_EMPRESA write SetUSU_COD_EMPRESA;

    [Campo('USU_COD_ESTADO')]
    property USU_COD_ESTADO: Integer read FUSU_COD_ESTADO write SetUSU_COD_ESTADO;
  end;

implementation

{ TDUSUARIO }

procedure TDUSUARIO.SetUSU_CLAVE(const Value: String);
begin
  FUSU_CLAVE := Value;
end;

procedure TDUSUARIO.SetUSU_CODIGO(const Value: Integer);
begin
  FUSU_CODIGO := Value;
end;

procedure TDUSUARIO.SetUSU_COD_EMPRESA(const Value: Integer);
begin
  FUSU_COD_EMPRESA := Value;
end;

procedure TDUSUARIO.SetUSU_COD_ESTADO(const Value: Integer);
begin
  FUSU_COD_ESTADO := Value;
end;

procedure TDUSUARIO.SetUSU_FOTO(const Value: String);
begin
  FUSU_FOTO := Value;
end;

procedure TDUSUARIO.SetUSU_LOGIN(const Value: String);
begin
  FUSU_LOGIN := Value;
end;

procedure TDUSUARIO.SetUSU_NIVEL(const Value: Integer);
begin
  FUSU_NIVEL := Value;
end;

end.

