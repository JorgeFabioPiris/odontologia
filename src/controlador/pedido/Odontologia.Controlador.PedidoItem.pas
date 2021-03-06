unit Odontologia.Controlador.PedidoItem;

interface

uses
  Data.DB,
  System.Generics.Collections,
  System.SysUtils,
  Odontologia.Modelo,
  Odontologia.Modelo.Entidades.PedidoItems,
  Odontologia.Modelo.Pedido.Interfaces,
  Odontologia.Controlador.Pedido.Interfaces;

type
  TControllerPedidoItem = class(TInterfacedObject, iControllerPedidoItem)

  private
    FModel: iModelPedidoItem;
    FDataSource: TDataSource;
    Flista: TObjectList<TPEDIDOITEM>;
    FEntidad: TPEDIDOITEM;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerPedidoItem;
    function DataSource(aDataSource: TDataSource): iControllerPedidoItem;
    function Buscar: iControllerPedidoItem; overload;
    function Buscar(aId: Integer): iControllerPedidoItem; overload;
    function Insertar: iControllerPedidoItem;
    function Modificar: iControllerPedidoItem;
    function Eliminar: iControllerPedidoItem;
    function Entidad: TPEDIDOITEM;
  end;

implementation

{ TControllerPedidoItem }

function TControllerPedidoItem.Buscar: iControllerPedidoItem;
begin
  Result := Self;
  Flista := TObjectList<TPEDIDOITEM>.Create;
  FDataSource.DataSet.DisableControls;
  FModel.DAO.Find(Flista);
  FDataSource.DataSet.EnableControls;
end;

function TControllerPedidoItem.Buscar(aId: Integer): iControllerPedidoItem;
begin
  Result := Self;
  FDataSource.dataset.DisableControls;
  FModel.DAO.SQL.Fields('PEDIDO_ITEM.ID AS CODIGO,')
    .Fields('PRODUCTO.NOMBRE AS PRODUCTO,')
    .Fields('PEDIDO_ITEM.CANTIDAD AS CANT,')
    .Fields('PEDIDO_ITEM.PRECIO AS PRECIO,')
    .Fields('PEDIDO_ITEM.VALOR_TOTAL AS TOTAL')
    .Join('INNER JOIN PRODUCTO ON PRODUCTO.ID = PEDIDO_ITEM.ID_PRODUCTO')
    .Where('ID_PEDIDO = ' + intToStr(aId)).&End.Find;
  FDataSource.dataset.EnableControls;
  FDataSource.dataset.FieldByName('CODIGO').Visible := false;
  FDataSource.dataset.FieldByName('PRODUCTO').DisplayWidth := 50;
end;

constructor TControllerPedidoItem.Create;
begin
  FModel := tmodel.New.PedidoItem;
end;

function TControllerPedidoItem.DataSource(aDataSource: TDataSource)
  : iControllerPedidoItem;
begin
  Result := Self;
  FDataSource := aDataSource;
  FModel.DataSource(FDataSource);
end;

destructor TControllerPedidoItem.Destroy;
begin
  if Assigned(Flista) then
    Flista.Free;
  inherited;
end;

function TControllerPedidoItem.Eliminar: iControllerPedidoItem;
begin
  Result := Self;
  FModel.DAO.Delete(FModel.Entidad);
end;

function TControllerPedidoItem.Entidad: TPEDIDOITEM;
begin
  Result := FModel.Entidad;
end;

function TControllerPedidoItem.Insertar: iControllerPedidoItem;
begin
  Result := Self;
  FModel.DAO.insert(FModel.Entidad);
end;

function TControllerPedidoItem.Modificar: iControllerPedidoItem;
begin
  Result := Self;
  FModel.DAO.update(FModel.Entidad);
end;

class function TControllerPedidoItem.New: iControllerPedidoItem;
begin
  Result := Self.Create;
end;

end.
