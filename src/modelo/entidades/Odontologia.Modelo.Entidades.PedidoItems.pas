unit Odontologia.Modelo.Entidades.PedidoItems;

interface

uses
  SimpleAttributes;

type

  [Tabela('PEDIDO_ITEM')]
  TPEDIDOITEM = class

  private
    FCANTIDAD: Currency;
    FVALOR_TOTAL: Currency;
    FID_PEDIDO: Integer;
    FID_PRODUCTO: Integer;
    FPRECIO: Currency;
    FID: Integer;
    procedure SetID(const Value: Integer);
    procedure SetID_PEDIDO(const Value: Integer);
    procedure SetID_PRODUCTO(const Value: Integer);
    procedure SetCANTIDAD(const Value: Currency);
    procedure SetPRECIO(const Value: Currency);
    procedure SetVALOR_TOTAL(const Value: Currency);

  published
    [Campo('ID'), Pk, AutoInc]
    property ID           : Integer read FID            write SetID;

    [Campo('ID_PEDIDO')]
    property ID_PEDIDO    : Integer read FID_PEDIDO     write SetID_PEDIDO;

    [Campo('ID_PRODUCTO')]
    property ID_PRODUCTO  : Integer read FID_PRODUCTO   write SetID_PRODUCTO;

    [Campo('CANTIDAD')]
    property CANTIDAD     : Currency read FCANTIDAD     write SetCANTIDAD;

    [Campo('PRECIO')]
    property PRECIO       : Currency read FPRECIO       write SetPRECIO;

    [Campo('VALOR_TOTAL')]
    property VALOR_TOTAL  : Currency read FVALOR_TOTAL  write SetVALOR_TOTAL;
  end;

implementation

{ TPEDIDOITEM }

procedure TPEDIDOITEM.SetCANTIDAD(const Value: Currency);
begin
  FCANTIDAD := VALUE;
end;

procedure TPEDIDOITEM.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TPEDIDOITEM.SetID_PEDIDO(const Value: Integer);
begin
  FID_PEDIDO := Value;
end;

procedure TPEDIDOITEM.SetID_PRODUCTO(const Value: Integer);
begin
  FID_PRODUCTO := Value;
end;

procedure TPEDIDOITEM.SetPRECIO(const Value: Currency);
begin
  FPRECIO := Value;
end;

procedure TPEDIDOITEM.SetVALOR_TOTAL(const Value: Currency);
begin
  FVALOR_TOTAL := Value;
end;

end.
