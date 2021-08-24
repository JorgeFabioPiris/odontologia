program Odontologia;

{$R *.dres}

uses
  Vcl.Forms,
  Odontologia.Modelo.Interfaces in 'src\modelo\Odontologia.Modelo.Interfaces.pas',
  Odontologia.Modelo in 'src\modelo\Odontologia.Modelo.pas',
  Odontologia.Vista.Estilos in 'src\vistas\estilos\Odontologia.Vista.Estilos.pas',
  Odontologia.Vistas.Direccion in 'src\vistas\paginas\Odontologia.Vistas.Direccion.pas' {PagDireccion},
  Odontologia.Vistas.Home in 'src\vistas\paginas\Odontologia.Vistas.Home.pas' {PagHome},
  Odontologia.Vistas.Main in 'src\vistas\paginas\Odontologia.Vistas.Main.pas' {PageMain},
  Odontologia.Vistas.Producto in 'src\vistas\paginas\Odontologia.Vistas.Producto.pas',
  Odontologia.Vistas.Template in 'src\vistas\paginas\Odontologia.Vistas.Template.pas' {PagTemplate},
  Odontologia.Vistas.Pedido in 'src\vistas\paginas\Odontologia.Vistas.Pedido.pas' {PagPedido},
  Odontologia.Controlador.Interfaces in 'src\controlador\Odontologia.Controlador.Interfaces.pas',
  Odontologia.Controlador in 'src\controlador\Odontologia.Controlador.pas',
  Odontologia.Controlador.Pais.Interfaces in 'src\controlador\pais\Odontologia.Controlador.Pais.Interfaces.pas',
  Odontologia.Controlador.Pais in 'src\controlador\pais\Odontologia.Controlador.Pais.pas',
  Odontologia.Controlador.Producto.Interfaces in 'src\controlador\producto\Odontologia.Controlador.Producto.Interfaces.pas',
  Odontologia.Controlador.Producto in 'src\controlador\producto\Odontologia.Controlador.Producto.pas',
  Odontologia.Modelo.Pais.Interfaces in 'src\modelo\pais\Odontologia.Modelo.Pais.Interfaces.pas',
  Odontologia.Modelo.Pais in 'src\modelo\pais\Odontologia.Modelo.Pais.pas',
  Odontologia.Modelo.Pedido.Interfaces in 'src\modelo\pedido\Odontologia.Modelo.Pedido.Interfaces.pas',
  Odontologia.Modelo.Pedido in 'src\modelo\pedido\Odontologia.Modelo.Pedido.pas',
  Odontologia.Modelo.PedidoItem in 'src\modelo\pedido\Odontologia.Modelo.PedidoItem.pas',
  Odontologia.Modelo.Producto.Interfaces in 'src\modelo\producto\Odontologia.Modelo.Producto.Interfaces.pas',
  Odontologia.Modelo.Producto in 'src\modelo\producto\Odontologia.Modelo.Producto.pas',
  Odontologia.Modelo.Entidades.Pais in 'src\modelo\entidades\Odontologia.Modelo.Entidades.Pais.pas',
  Odontologia.Modelo.Entidades.Pedido in 'src\modelo\entidades\Odontologia.Modelo.Entidades.Pedido.pas',
  Odontologia.Modelo.Entidades.PedidoItems in 'src\modelo\entidades\Odontologia.Modelo.Entidades.PedidoItems.pas',
  Odontologia.Modelo.Entidades.Producto in 'src\modelo\entidades\Odontologia.Modelo.Entidades.Producto.pas',
  Odontologia.Modelo.Conexion.RestDW in 'src\modelo\conexion\Odontologia.Modelo.Conexion.RestDW.pas' {ModelConexion: TDataModule},
  Odontologia.Controlador.Pedido in 'src\controlador\pedido\Odontologia.Controlador.Pedido.pas',
  Odontologia.Controlador.Pedido.Interfaces in 'src\controlador\pedido\Odontologia.Controlador.Pedido.Interfaces.pas',
  Odontologia.Controlador.PedidoItem in 'src\controlador\pedido\Odontologia.Controlador.PedidoItem.pas',
  Odontologia.Modelo.Entidades.Departamento in 'src\modelo\entidades\Odontologia.Modelo.Entidades.Departamento.pas',
  Odontologia.Modelo.Departamento.Interfaces in 'src\modelo\departamento\Odontologia.Modelo.Departamento.Interfaces.pas',
  Odontologia.Modelo.Departamento in 'src\modelo\departamento\Odontologia.Modelo.Departamento.pas',
  Odontologia.Controlador.Departamento.Interfaces in 'src\controlador\departamento\Odontologia.Controlador.Departamento.Interfaces.pas',
  Odontologia.Controlador.Departamento in 'src\controlador\departamento\Odontologia.Controlador.Departamento.pas',
  Odontologia.Vistas.Direccion.Departamento in 'src\vistas\paginas\Odontologia.Vistas.Direccion.Departamento.pas' {PagDepartamento},
  Odontologia.Vistas.Direccion.Pais in 'src\vistas\paginas\Odontologia.Vistas.Direccion.Pais.pas' {PagPais},
  Odontologia.Vistas.Login in 'src\vistas\paginas\Odontologia.Vistas.Login.pas' {PagLogin},
  Odontologia.Modelo.Entidades.Ciudad in 'src\modelo\entidades\Odontologia.Modelo.Entidades.Ciudad.pas',
  Odontologia.Modelo.Entidades.Empresa in 'src\modelo\entidades\Odontologia.Modelo.Entidades.Empresa.pas',
  Odontologia.Modelo.Empresa.Interfaces in 'src\modelo\empresa\Odontologia.Modelo.Empresa.Interfaces.pas',
  Odontologia.Modelo.Empresa in 'src\modelo\empresa\Odontologia.Modelo.Empresa.pas',
  Odontologia.Modelo.Ciudad.Interfaces in 'src\modelo\ciudad\Odontologia.Modelo.Ciudad.Interfaces.pas',
  Odontologia.Modelo.Ciudad in 'src\modelo\ciudad\Odontologia.Modelo.Ciudad.pas',
  Odontologia.Controlador.Ciudad.Interfaces in 'src\controlador\ciudad\Odontologia.Controlador.Ciudad.Interfaces.pas',
  Odontologia.Controlador.Ciudad in 'src\controlador\ciudad\Odontologia.Controlador.Ciudad.pas',
  Odontologia.Vistas.Direccion.Ciudad in 'src\vistas\paginas\Odontologia.Vistas.Direccion.Ciudad.pas' {PagCiudad},
  Odontologia.Vistas.Empresa in 'src\vistas\paginas\Odontologia.Vistas.Empresa.pas' {PagEmpresa},
  Odontologia.Modelo.Entidades.EmpresaTipo in 'src\modelo\entidades\Odontologia.Modelo.Entidades.EmpresaTipo.pas',
  Odontologia.Modelo.EmpresaTipo.Interfaces in 'src\modelo\empresa_tipo\Odontologia.Modelo.EmpresaTipo.Interfaces.pas',
  Odontologia.Modelo.EmpresaTipo in 'src\modelo\empresa_tipo\Odontologia.Modelo.EmpresaTipo.pas',
  Odontologia.Controlador.EmpresaTipo.Interfaces in 'src\controlador\empresaTipo\Odontologia.Controlador.EmpresaTipo.Interfaces.pas',
  Odontologia.Controlador.EmpresaTipo in 'src\controlador\empresaTipo\Odontologia.Controlador.EmpresaTipo.pas',
  Odontologia.Controlador.Empresa.Interfaces in 'src\controlador\empresa\Odontologia.Controlador.Empresa.Interfaces.pas',
  Odontologia.Controlador.Empresa in 'src\controlador\empresa\Odontologia.Controlador.Empresa.pas',
  Odontologia.Modelo.Entidades.Usuario in 'src\modelo\entidades\Odontologia.Modelo.Entidades.Usuario.pas',
  Odontologia.Modelo.Usuario.Interfaces in 'src\modelo\usuario\Odontologia.Modelo.Usuario.Interfaces.pas',
  Odontologia.Modelo.Usuario in 'src\modelo\usuario\Odontologia.Modelo.Usuario.pas',
  Odontologia.Controlador.Usuario in 'src\controlador\usuario\Odontologia.Controlador.Usuario.pas',
  Odontologia.Controlador.Usuario.Interfaces in 'src\controlador\usuario\Odontologia.Controlador.Usuario.Interfaces.pas',
  Odontologia.Vistas.Usuarios in 'src\vistas\paginas\Odontologia.Vistas.Usuarios.pas' {PagUsuario};

{$R *.res}

begin
  Application.Initialize;
  ReportMemoryLeaksOnShutdown := True;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TModelConexion, ModelConexion);
  Application.CreateForm(TPageMain, PageMain);
  Application.Run;
end.
