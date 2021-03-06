unit Odontologia.Modelo.Interfaces;

interface

uses
  Odontologia.Modelo.Agenda.Interfaces,
  Odontologia.Modelo.Ciudad.Interfaces,
  Odontologia.Modelo.Departamento.Interfaces,
  Odontologia.Modelo.Empresa.Interfaces,
  Odontologia.Modelo.EmpresaTipo.Interfaces,
  Odontologia.Modelo.Estado.Interfaces,
  Odontologia.Modelo.Estado.Cita.Interfaces,
  Odontologia.Modelo.Medico.Interfaces,
  Odontologia.Modelo.Paciente.Interfaces,
  Odontologia.Modelo.Pais.Interfaces,
  Odontologia.Modelo.Pedido.Interfaces,
  Odontologia.Modelo.Producto.Interfaces,
  Odontologia.Modelo.Usuario.Interfaces;

type
  iModel = interface
    ['{0F7A1B03-B62A-4EBE-A93C-FAD6EC966E64}']
    function Agenda       : iModelAgenda;
    function Ciudad       : iModelCiudad;
    function Departamento : iModelDepartamento;
    function Empresa      : iModelEmpresa;
    function EmpresaTipo  : iModelEmpresaTipo;
    function Estado       : iModelEstado;
    function EstadoCita   : iModelEstadoCita;
    function Medico       : iModelMedico;
    function Paciente     : iModelPaciente;
    function Pais         : iModelPais;
    function Pedido       : iModelPedido;
    function PedidoItem   : iModelPedidoItem;
    function Producto     : iModelProducto;
    function Usuario      : iModelUsuario;
  end;

implementation

end.
