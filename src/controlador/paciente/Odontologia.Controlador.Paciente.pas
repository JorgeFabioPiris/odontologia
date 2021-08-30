unit Odontologia.Controlador.Paciente;

interface

uses
  Data.DB,
  System.SysUtils,
  System.Generics.Collections,
  Odontologia.Controlador.Paciente.Interfaces,
  Odontologia.Controlador.Estado,
  Odontologia.Controlador.Estado.Interfaces,
  Odontologia.Modelo,
  Odontologia.Modelo.Entidades.Paciente,
  Odontologia.Modelo.Paciente.Interfaces,
  Odontologia.Modelo.Estado.Interfaces;

type
  TControllerPaciente = class(TInterfacedObject, iControllerPaciente)
  private
    FModel        : iModelPaciente;
    FDataSource   : TDataSource;
    FEstado      : iControllerEstado;
    procedure DataChange (sender : tobject ; field : Tfield) ;

  public
    constructor Create;
    destructor Destroy; override;
    class function New    : iControllerPaciente;
    function DataSource (aDataSource : TDataSource) : iControllerPaciente;
    function Buscar (aPaciente : String)            : iControllerPaciente; overload;
    function Buscar       : iControllerPaciente; overload;
    function Insertar     : iControllerPaciente;
    function Modificar    : iControllerPaciente;
    function Eliminar     : iControllerPaciente;
    function Entidad      : TDPACIENTE;
    function Estado       : iControllerEstado;
  end;

implementation

{ TControllerPaciente }

function TControllerPaciente.Buscar: iControllerPaciente;
begin
  Result := Self;
  FDataSource.dataset.DisableControls;
  FModel.DAO.SQL.Fields('DPACIENTE.PAC_CODIGO AS CODIGO,')
    .Fields('DPACIENTE.PAC_NOMBRE AS NOMBRE,')
    .Fields('DPACIENTE.PAC_DOCUMENTO AS DOCUMENTO,')
    .Fields('DPACIENTE.PAC_TELEFONO AS TELEFONO,')
    .Fields('DPACIENTE.PAC_DIRECCION AS DIRECCION,')
    .Fields('DPACIENTE.PAC_FOTO AS FOTO,')
    .Fields('DPACIENTE.PAC_COD_ESTADO AS CODESTADO,')
    .Fields('FSITUACION.SIT_SITUACION AS ESTADO ')
    .Join('INNER JOIN FSITUACION ON FSITUACION.SIT_CODIGO = DPACIENTE.PAC_COD_ESTADO')
    .Where('')
  .OrderBy('NOMBRE')
  .&End.Find;

  FDataSource.dataset.EnableControls;
  FDataSource.dataset.FieldByName('CODIGO').Visible       := False;
  FDataSource.dataset.FieldByName('DIRECCION').Visible    := False;
  FDataSource.dataset.FieldByName('FOTO').Visible         := False;
  FDataSource.dataset.FieldByName('CODESTADO').Visible    := False;
  FDataSource.dataset.FieldByName('NOMBRE').DisplayWidth  := 50;
end;

function TControllerPaciente.Buscar(aPaciente: String): iControllerPaciente;
begin
  Result := Self;

  FDataSource.dataset.DisableControls;
  FModel.DAO.SQL.Fields('DPACIENTE.PAC_CODIGO AS CODIGO,')
    .Fields('DPACIENTE.PAC_NOMBRE AS NOMBRE,')
    .Fields('DPACIENTE.PAC_DOCUMENTO AS DOCUMENTO,')
    .Fields('DPACIENTE.PAC_TELEFONO AS TELEFONO,')
    .Fields('DPACIENTE.PAC_DIRECCION AS DIRECCION,')
    .Fields('DPACIENTE.PAC_ESPECIALIDAD AS ESPECIALIDAD,')
    .Fields('DPACIENTE.PAC_FOTO AS FOTO,')
    .Fields('DPACIENTE.PAC_COD_ESTADO AS CODESTADO,')
    .Fields('FSITUACION.SIT_SITUACION AS ESTADO ')
    .Join('INNER JOIN FSITUACION ON FSITUACION.SIT_CODIGO = DPACIENTE.PAC_COD_ESTADO')
    .Where('DPACIENTE.PAC_NOMBRE LIKE ' +QuotedStr(aPaciente) + '')
  .OrderBy('NOMBRE')
  .&End.Find;

  FDataSource.dataset.EnableControls;
  FDataSource.dataset.FieldByName('CODIGO').Visible       := False;
  FDataSource.dataset.FieldByName('DIRECCION').Visible    := False;
  FDataSource.dataset.FieldByName('FOTO').Visible         := False;
  FDataSource.dataset.FieldByName('CODESTADO').Visible    := False;
  FDataSource.dataset.FieldByName('NOMBRE').DisplayWidth  := 50;
end;

constructor TControllerPaciente.Create;
begin
  FModel  := TModel.New.Paciente;
end;

procedure TControllerPaciente.DataChange(sender: tobject; field: Tfield);
begin
end;

function TControllerPaciente.DataSource(aDataSource: TDataSource) : iControllerPaciente;
begin
  Result := Self;
  FDataSource := aDataSource;
  FModel.DataSource(FDataSource);
  FDataSource.OnDataChange := DataChange;
end;

destructor TControllerPaciente.Destroy;
begin
  inherited;
end;

function TControllerPaciente.Eliminar: iControllerPaciente;
begin
  Result := Self;
  FModel.DAO.Delete(FModel.Entidad);
end;

function TControllerPaciente.Estado: iControllerEstado;
begin
    Result := FEstado;
end;

function TControllerPaciente.Entidad: TDPACIENTE;
begin
  Result := FModel.Entidad;
end;

function TControllerPaciente.Insertar: iControllerPaciente;
begin
  Result := Self;
  FModel.DAO.Insert(FModel.Entidad);
end;

function TControllerPaciente.Modificar: iControllerPaciente;
begin
  Result := Self;
  FModel.DAO.Update(FModel.Entidad);
end;

class function TControllerPaciente.New: iControllerPaciente;
begin
  Result := Self.Create;
end;

end.
