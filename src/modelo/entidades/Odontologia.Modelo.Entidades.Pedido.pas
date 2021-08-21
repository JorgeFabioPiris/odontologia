unit Odontologia.Modelo.Entidades.Pedido;

interface

uses
  SimpleAttributes;

type
  [Tabela('PEDIDO')]
  TPEDIDO = class
  private
    FFECHA: TDateTime;
    FID: Integer;
    procedure SetFECHA(const Value: TDateTime);
    procedure SetID(const Value: Integer);

  published
    [Campo('ID'), Pk, AutoInc]
    property ID : Integer read FID write SetID;

    [Campo('FECHA')]
    property FECHA : TDateTime read FFECHA write SetFECHA;

  end;

implementation

{ TPEDIDO }

procedure TPEDIDO.SetFECHA(const Value: TDateTime);
begin
  FFECHA := Value;
end;

procedure TPEDIDO.SetID(const Value: Integer);
begin
  FID := Value;
end;

end.
