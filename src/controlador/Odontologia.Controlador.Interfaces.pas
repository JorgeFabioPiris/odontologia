unit Odontologia.Controlador.Interfaces;

interface

uses
  Odontologia.Controlador.Ciudad.Interfaces,
  Odontologia.Controlador.Departamento.Interfaces,
  Odontologia.Controlador.Empresa.Interfaces,
  Odontologia.Controlador.EmpresaTipo.Interfaces,
  Odontologia.Controlador.Estado.Interfaces,
  Odontologia.Controlador.Pais.Interfaces,
  Odontologia.Controlador.Pedido.Interfaces,
  Odontologia.Controlador.Producto.Interfaces,
  Odontologia.Controlador.Usuario.Interfaces;

type
   iController = interface
     ['{2ED23A69-9FB5-4B6A-936D-075F0A044F80}']
     function Ciudad        : iControllerCiudad;
     function Departamento  : iControllerDepartamento;
     function Empresa       : iControllerEmpresa;
     function EmpresaTipo   : iControllerEmpresaTipo;
     function Estado        : iControllerEstado;
     function Pais          : iControllerPais;
     function pedido        : icontrollerpedido;
     function pedidoItem    : icontrollerpedidoitem;
     function Producto      : iControllerProducto;
     function Usuario       : iControllerUsuario;
   end;

implementation

end.
