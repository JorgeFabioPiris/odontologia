unit Odontologia.Modelo.Entidades.Producto;

interface

uses
  SimpleAttributes;

type
  [Tabela('PRODUCTO')]
  TPRODUCTO = Class

  private
    FPRECIO: Currency;
    FID: Integer;
    FNOMBRE: String;
    procedure SetID(const Value: Integer);
    procedure SetNOMBRE(const Value: String);
    procedure SePRECIO(const Value: Currency);

  published
    [Campo('ID'), Pk, AutoInc]
    property ID : Integer read FID write SetID;

    [Campo('NOMBRE')]
    property NOMBRE : String read FNOMBRE write SetNOMBRE;

    [Campo('PRECIO')]
    property PRECIO : Currency read FPRECIO write SePRECIO;

  End;

implementation

{ TPRODUCTO }

procedure TPRODUCTO.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TPRODUCTO.SetNOMBRE(const Value: String);
begin
  FNOMBRE := Value;
end;

procedure TPRODUCTO.SePRECIO(const Value: Currency);
begin
  FPRECIO := Value;
end;

end.
