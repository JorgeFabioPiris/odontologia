unit Odontologia.Modelo;

interface

uses
  Odontologia.Modelo.Agenda,
  Odontologia.Modelo.Agenda.Interfaces,
  Odontologia.Modelo.Ciudad,
  Odontologia.Modelo.Ciudad.Interfaces,
  Odontologia.Modelo.Departamento,
  Odontologia.Modelo.Departamento.Interfaces,
  Odontologia.Modelo.Empresa,
  Odontologia.Modelo.Empresa.Interfaces,
  Odontologia.Modelo.EmpresaTipo,
  Odontologia.Modelo.EmpresaTipo.Interfaces,
  Odontologia.Modelo.Estado,
  Odontologia.Modelo.Estado.Interfaces,
  Odontologia.Modelo.Estado.Cita,
  Odontologia.Modelo.Estado.Cita.Interfaces,
  Odontologia.Modelo.Entidades.Empresa,
  Odontologia.Modelo.Entidades.EmpresaTipo,
  Odontologia.Modelo.Interfaces,
  Odontologia.Modelo.Medico,
  Odontologia.Modelo.Medico.interfaces,
  Odontologia.Modelo.Paciente,
  Odontologia.Modelo.Paciente.Interfaces,
  Odontologia.Modelo.Pais,
  Odontologia.Modelo.Pais.Interfaces,
  Odontologia.Modelo.Producto,
  Odontologia.Modelo.Producto.Interfaces,
  Odontologia.Modelo.Pedido,
  Odontologia.Modelo.Pedido.Interfaces,
  Odontologia.Modelo.PedidoItem,
  Odontologia.Modelo.Usuario,
  Odontologia.Modelo.Usuario.Interfaces;

type
  TModel = Class(TInterfacedObject, iModel)

  private

  public
    constructor Create;
    destructor Destroy; override;
    class function New    : iModel;
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
  End;

implementation

{ TModel }

function TModel.Agenda: iModelAgenda;
begin
  Result := TModelAgenda.New;
end;

function TModel.Ciudad: iModelCiudad;
begin
  Result := TModelCiudad.New;
end;

constructor TModel.Create;
begin

end;

function TModel.Departamento: imodeldepartamento;
begin
  Result := TModelDepartamento.New;
end;

destructor TModel.Destroy;
begin

  inherited;
end;

function TModel.Empresa: iModelEmpresa;
begin
  Result := TModelEmpresa.New;
end;

function TModel.EmpresaTipo: iModelEmpresaTipo;
begin
  Result := TModelEmpresaTipo.New;
end;

function TModel.Estado: iModelEstado;
begin
  Result := TModelEstado.New;
end;

function TModel.EstadoCita: iModelEstadoCita;
begin
  Result := TModelEstadoCita.New;
end;

function TModel.Medico: iModelMedico;
begin
  Result := TModelMedico.New;
end;

class function TModel.New: iModel;
begin
  Result := Self.Create;
end;

function TModel.Paciente: iModelPaciente;
begin
  Result := TModelPaciente.New;
end;

function TModel.Pais: iModelPais;
begin
  Result := TModelPais.New;
end;

function TModel.Pedido: iModelPedido;
begin
  Result := TModelPedido.New;
end;

function TModel.PedidoItem: iModelPedidoItem;
begin
  Result := TModelPedidoItem.New;
end;

function TModel.Producto: iModelProducto;
begin
  Result := TModelProducto.New;
end;

function TModel.Usuario: iModelUsuario;
begin
   Result := TModelUsuario.New;
end;

end.
