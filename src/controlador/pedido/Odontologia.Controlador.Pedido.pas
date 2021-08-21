unit Odontologia.Controlador.Pedido;

interface

uses
  Data.DB,
  System.SysUtils,
  System.Generics.Collections,
  Odontologia.Controlador.Pedido.Interfaces,
  Odontologia.Controlador.PedidoItem,
  Odontologia.Modelo.Entidades.Pedido,
  Odontologia.Modelo.Pedido.Interfaces,
  Odontologia.Modelo;

type
  TControllerPedido = class(TInterfacedObject, iControllerPedido)
  private
    FModel: iModelPedido;
    FDataSource: TDataSource;
    Flista: TObjectList<TPEDIDO>;
    FPedidoItem: iControllerPedidoItem;
    procedure DataChange (sender : tobject ; field : Tfield) ;

  public
    constructor Create;
    destructor Destroy; override;
    class function New : iControllerPedido;
    function DataSource(aDataSource: TDataSource): iControllerPedido;
    function Buscar: iControllerPedido;
    function Insertar: iControllerPedido;
    function Modificar: iControllerPedido;
    function Eliminar: iControllerPedido;
    function Entidad: TPEDIDO;
    function Item: iControllerPedidoItem;
  end;

implementation

{ TControllerPedido }

function TControllerPedido.Buscar: iControllerPedido;
begin
  Result := Self;
  Flista := TObjectList<TPEDIDO>.Create;
  FModel.DAO.Find(Flista);
end;

constructor TControllerPedido.Create;
begin
  FModel := TModel.New.Pedido;
  Fpedidoitem := TcontrollerpedidoItem.new;
end;

procedure TControllerPedido.DataChange(sender: tobject; field: Tfield);
begin
   Fpedidoitem.buscar(FDataSource.DataSet.FieldByName('ID').AsInteger);
end;

function TControllerPedido.DataSource(aDataSource: TDataSource)
  : iControllerPedido;
begin
  Result := Self;
  FDataSource := aDataSource;
  FModel.DataSource(FDataSource);
  FDataSource.OnDataChange := DataChange;
end;

destructor TControllerPedido.Destroy;
begin
  if Assigned(Flista) then
    Flista.Free;

  inherited;
end;

function TControllerPedido.Eliminar: iControllerPedido;
begin
  Result := Self;
  FModel.DAO.Delete(FModel.Entidad);
end;

function TControllerPedido.Entidad: TPEDIDO;
begin
  Result := FModel.Entidad;
end;

function TControllerPedido.Insertar: iControllerPedido;
begin
  Result := Self;
  FModel.DAO.Insert(FModel.Entidad);
end;

function TControllerPedido.Item: iControllerPedidoItem;
begin
  Result := FPedidoItem;
end;

function TControllerPedido.Modificar: iControllerPedido;
begin
  Result := Self;
  FModel.DAO.Update(FModel.Entidad);
end;

class function TControllerPedido.New: iControllerPedido;
begin
  Result := Self.Create;
end;

end.
