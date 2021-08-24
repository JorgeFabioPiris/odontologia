unit Odontologia.Controlador;

interface

uses
  Odontologia.Controlador.Ciudad,
  Odontologia.Controlador.Ciudad.Interfaces,
  Odontologia.Controlador.Departamento,
  Odontologia.Controlador.Departamento.Interfaces,
  Odontologia.Controlador.Empresa,
  Odontologia.Controlador.Empresa.Interfaces,
  Odontologia.Controlador.EmpresaTipo,
  Odontologia.Controlador.EmpresaTipo.Interfaces,
  Odontologia.Controlador.Interfaces,
  Odontologia.Controlador.Pais,
  Odontologia.Controlador.Pais.Interfaces,
  Odontologia.Controlador.Pedido.Interfaces,
  Odontologia.Controlador.Pedido,
  Odontologia.Controlador.pedidoItem,
  Odontologia.Controlador.Producto,
  Odontologia.Controlador.Producto.Interfaces,
  Odontologia.Controlador.Usuario,
  Odontologia.Controlador.Usuario.Interfaces;

type
  TController = class(TInterfacedObject, iController)

  private

  public
    constructor Create;
    destructor Destroy; override;
    class function New      : iController;
     function Ciudad        : iControllerCiudad;
     function Departamento  : iControllerDepartamento;
     function Empresa       : iControllerEmpresa;
     function EmpresaTipo   : iControllerEmpresaTipo;
     function Pais          : iControllerPais;
     function pedido        : icontrollerpedido;
     function pedidoItem    : icontrollerpedidoitem;
     function Producto      : iControllerProducto;
     function Usuario       : iControllerUsuario;
  end;

implementation

{ TController }

function TController.Ciudad: iControllerCiudad;
begin
  Result := TControllerCiudad.new;
end;

constructor TController.Create;
begin

end;

function TController.Departamento: iControllerDepartamento;
begin
  Result := TControllerDepartamento.new;
end;

destructor TController.Destroy;
begin

  inherited;
end;

function TController.Empresa: iControllerEmpresa;
begin
  Result := TControllerEmpresa.new;
end;

function TController.EmpresaTipo: iControllerEmpresaTipo;
begin
   Result := TControllerEmpresaTipo.new;
end;

class function TController.New: iController;
begin
  Result := Self.Create;
end;

function TController.Pais: iControllerPais;
begin
  Result := TControllerPais.New;
end;

function TController.Pedido: icontrollerpedido;
begin
  Result := TControllerPedido.New;
end;

function TController.pedidoItem: icontrollerpedidoitem;
begin
  Result := TControllerPedidoItem.New;
end;

function TController.Producto: iControllerProducto;
begin
  Result := TControllerProducto.New;
end;

function TController.Usuario: iControllerUsuario;
begin
  Result := TControllerUsuario.New;
end;

end.