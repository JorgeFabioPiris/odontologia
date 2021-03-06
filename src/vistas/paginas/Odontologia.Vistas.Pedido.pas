unit Odontologia.Vistas.Pedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, Vcl.StdCtrls, Odontologia.Controlador.Interfaces,
  Odontologia.Controlador.Producto.Interfaces, Vcl.DBCtrls,
  Odontologia.Controlador.Pedido.Interfaces;

type
  TPagPedido = class(TForm)
    btnBuscar: TSpeedButton;
    [Bind('ID')]

    [Bind('NOMBRE')]

    [Bind('PRECIO')]
    btnInsertar: TSpeedButton;
    btnModificar: TSpeedButton;
    btnEliminar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    edtID: TEdit;
    edtNOMBRE: TEdit;
    edtPRECIO: TEdit;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
    Edit1: TEdit;
    Button1: TButton;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;

    procedure FormCreate(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure btnInsertarClick(Sender: TObject);
    procedure btnModificarClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure btnEliminarClic(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
    FController: iController;
    FProducto: iControllerProducto;
    FPedido: iControllerPedido;

  public
    { Public declarations }
  end;

var
  PagPedido: TPagPedido;

implementation

uses
  Odontologia.Controlador;

{$R *.dfm}

procedure TPagPedido.btnBuscarClick(Sender: TObject);
begin
  FProducto.Buscar;
end;

procedure TPagPedido.btnEliminarClic(Sender: TObject);
begin
  FProducto.Entidad.ID := StrToInt(edtID.Text);
  FProducto.Eliminar;
  FProducto.Buscar;
end;

procedure TPagPedido.btnInsertarClick(Sender: TObject);
begin
  FProducto.Entidad.NOMBRE := edtNOMBRE.Text;
  FProducto.Entidad.PRECIO := StrToCurr(edtPRECIO.Text);
  FProducto.Insertar;
  FProducto.Buscar;
end;

procedure TPagPedido.btnModificarClick(Sender: TObject);
begin
  FProducto.Entidad.ID := StrToInt(edtID.Text);
  FProducto.Entidad.NOMBRE := edtNOMBRE.Text;
  FProducto.Entidad.PRECIO := StrToCurr(edtPRECIO.Text);
  FProducto.Modificar;
  FProducto.Buscar;
end;

procedure TPagPedido.Button1Click(Sender: TObject);
begin

  FPedido.Item.Entidad.ID_PEDIDO := DataSource2.DataSet.FieldByName('ID').AsInteger;
  FPedido.Item.Entidad.ID_PRODUCTO := DataSource1.DataSet.FieldByName('ID').AsInteger;
  FPedido.Item.Entidad.PRECIO := DataSource1.DataSet.FieldByName('PRECIO').AsCurrency;
  FPedido.Item.Entidad.CANTIDAD := StrToCurr(Edit1.Text);
//  FPedido.Item.Entidad.VALOR_TOTAL := (fpedido.item.Entidad.PRECIO * StrToCurr(Edit1.Text));
  FPedido.Item.Insertar;
  FPedido.Item.Buscar(DataSource2.DataSet.FieldByName('ID').AsInteger);
end;

procedure TPagPedido.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  edtID.Text := DataSource1.DataSet.FieldByName('ID').AsString;
  edtNOMBRE.Text := DataSource1.DataSet.FieldByName('NOMBRE').AsString;
  edtPRECIO.Text := DataSource1.DataSet.FieldByName('PRECIO').AsString;
end;

procedure TPagPedido.FormCreate(Sender: TObject);
begin
  FController := TController.New;
  FProducto := FController.Producto.DataSource(DataSource1);
  FPedido := FController.Pedido.DataSource(DataSource2);
  FPedido.Item.DataSource(DataSource3);
end;

procedure TPagPedido.SpeedButton1Click(Sender: TObject);
begin
  FPedido.Buscar;
end;

procedure TPagPedido.SpeedButton2Click(Sender: TObject);
begin
  FPedido.Entidad.FECHA := now;
  FPedido.Insertar;
  FPedido.Buscar;
end;

end.
