unit Odontologia.Controlador.Agenda;

interface

uses
  Data.DB,
  System.SysUtils,
  System.Generics.Collections,
  Odontologia.Controlador.Estado.Cita,
  Odontologia.Controlador.Estado.Cita.Interfaces,
  Odontologia.Controlador.Medico,
  Odontologia.Controlador.Medico.Interfaces,
  Odontologia.Controlador.Agenda.Interfaces,
  Odontologia.Controlador.Paciente,
  Odontologia.Controlador.Paciente.Interfaces,
  Odontologia.Modelo,
  Odontologia.Modelo.Entidades.Agenda,
  Odontologia.Modelo.Agenda.Interfaces,
  Odontologia.Modelo.Paciente.Interfaces;

type
  TControllerAgenda = class(TInterfacedObject, iControllerAgenda)
  private
    FModel        : iModelAgenda;
    FDataSource   : TDataSource;
    FMedico       : iControllerMedico;
    FPaciente     : iControllerPaciente;
    FEstadoCita   : iControllerEstadoCita;
    procedure DataChange (sender : tobject ; field : Tfield) ;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerAgenda;
    function DataSource (aDataSource : TDataSource)                 : iControllerAgenda;
    function Buscar (aFecha : String)                               : iControllerAgenda; overload;
    function Buscar (aFecha, aMedico, aPaciente : String)           : iControllerAgenda; overload;
    function Buscar (aFecha, aMedico, aPaciente, aEstado : String)  : iControllerAgenda; overload;
    function Buscar       : iControllerAgenda; overload;
    function Insertar     : iControllerAgenda;
    function Modificar    : iControllerAgenda;
    function Eliminar     : iControllerAgenda;
    function Entidad      : TDAGENDA;
    function Medico       : iControllerMedico;
    function Paciente     : iControllerPaciente;
    function EstadoCita   : iControllerEstadoCita;
  end;

implementation

{ TControllerAgenda }

function TControllerAgenda.Buscar: iControllerAgenda;
begin
  Result := Self;
  FDataSource.dataset.DisableControls;
  FModel.DAO.SQL.Fields('DAGENDA.AGE_CODIGO AS CODIGO,')
    .Fields('DAGENDA.AGE_FECHA AS FECHA,')
    .Fields('DAGENDA.AGE_HORA AS HORA,')
    .Fields('DAGENDA.AGE_PACIENTE AS CODPAC,')
    .Fields('DAGENDA.AGE_MEDICO AS CODMED,')
    .Fields('DAGENDA.AGE_COD_ESTADO_CITA AS CODESTADO,')
    .Fields('DPACIENTE.PAC_NOMBRE AS PACIENTE,')
    .Fields('DMEDICO.MED_NOMBRE AS MEDICO,')
    .Fields('FESTADO_CITA.CIT_DESCRIPCION AS ESTADO')
    .Join('INNER JOIN DPACIENTE ON DPACIENTE.PAC_CODIGO = DAGENDA.AGE_PACIENTE')
    .Join('INNER JOIN DMEDICO ON DMEDICO.MED_CODIGO = DAGENDA.AGE_MEDICO')
    .Join('INNER JOIN FESTADO_CITA ON FESTADO_CITA.CIT_CODIGO = DAGENDA.AGE_COD_ESTADO_CITA')
    .Where('')
  .OrderBy('FECHA')
  .&End.Find;
  FDataSource.dataset.EnableControls;
  FDataSource.dataset.FieldByName('CODIGO').Visible := false;
  FDataSource.dataset.FieldByName('CODPAC').Visible := false;
  FDataSource.dataset.FieldByName('CODMED').Visible := false;
  FDataSource.dataset.FieldByName('CODESTADO').Visible := false;
  FDataSource.dataset.FieldByName('FECHA').DisplayWidth := 20;
  FDataSource.dataset.FieldByName('MEDICO').DisplayWidth := 30;
  FDataSource.dataset.FieldByName('PACIENTE').DisplayWidth := 30;
end;

function TControllerAgenda.Buscar(aFecha, aMedico, aPaciente, aEstado : String) : iControllerAgenda;
begin
  Result := Self;
  FDataSource.dataset.DisableControls;
  FModel.DAO.SQL.Fields('DAGENDA.AGE_CODIGO AS CODIGO,')
    .Fields('DAGENDA.AGE_FECHA AS FECHA,')
    .Fields('DAGENDA.AGE_HORA AS HORA,')
    .Fields('DAGENDA.AGE_PACIENTE AS CODPAC,')
    .Fields('DAGENDA.AGE_MEDICO AS CODMED,')
    .Fields('DAGENDA.AGE_COD_ESTADO_CITA AS CODESTADO,')
    .Fields('DPACIENTE.PAC_NOMBRE AS PACIENTE,')
    .Fields('DMEDICO.MED_NOMBRE AS MEDICO,')
    .Fields('FESTADO_CITA.CIT_DESCRIPCION AS ESTADO')
    .Join('INNER JOIN DPACIENTE ON DPACIENTE.PAC_CODIGO = DAGENDA.AGE_PACIENTE')
    .Join('INNER JOIN DMEDICO ON DMEDICO.MED_CODIGO = DAGENDA.AGE_MEDICO')
    .Join('INNER JOIN FESTADO_CITA ON FESTADO_CITA.CIT_CODIGO = DAGENDA.AGE_COD_ESTADO_CITA')
    .Where('DAGENDA.AGE_FECHA = ' + QuotedStr(aFecha) + ' AND DMEDICO.MED_NOMBRE LIKE ' + QuotedStr(aMedico) + ' AND DPACIENTE.PAC_NOMBRE LIKE ' + QuotedStr(aPaciente) + ' AND FESTADO_CITA.CIT_DESCRIPCION LIKE ' + QuotedStr(AESTADO) + '')
  .OrderBy('FECHA')
  .&End.Find;
  FDataSource.dataset.EnableControls;
  FDataSource.dataset.FieldByName('CODIGO').Visible := false;
  FDataSource.dataset.FieldByName('CODPAC').Visible := false;
  FDataSource.dataset.FieldByName('CODMED').Visible := false;
  FDataSource.dataset.FieldByName('CODESTADO').Visible := false;
  FDataSource.dataset.FieldByName('FECHA').DisplayWidth := 20;
  FDataSource.dataset.FieldByName('MEDICO').DisplayWidth := 30;
  FDataSource.dataset.FieldByName('PACIENTE').DisplayWidth := 30;
end;

function TControllerAgenda.Buscar(aFecha, aMedico,
  aPaciente: String): iControllerAgenda;
begin

end;

function TControllerAgenda.Buscar(aFecha: String): iControllerAgenda;
begin
  Result := Self;
  FDataSource.dataset.DisableControls;
  FModel.DAO.SQL.Fields('DAGENDA.AGE_CODIGO AS CODIGO,')
    .Fields('DAGENDA.AGE_FECHA AS FECHA,')
    .Fields('DAGENDA.AGE_HORA AS HORA,')
    .Fields('DAGENDA.AGE_PACIENTE AS CODPAC,')
    .Fields('DAGENDA.AGE_MEDICO AS CODMED,')
    .Fields('DAGENDA.AGE_COD_ESTADO_CITA AS CODESTADO,')
    .Fields('DPACIENTE.PAC_NOMBRE AS PACIENTE,')
    .Fields('DMEDICO.MED_NOMBRE AS MEDICO,')
    .Fields('FESTADO_CITA.CIT_DESCRIPCION AS ESTADO')
    .Join('INNER JOIN DPACIENTE ON DPACIENTE.PAC_CODIGO = DAGENDA.AGE_PACIENTE')
    .Join('INNER JOIN DMEDICO ON DMEDICO.MED_CODIGO = DAGENDA.AGE_MEDICO')
    .Join('INNER JOIN FESTADO_CITA ON FESTADO_CITA.CIT_CODIGO = DAGENDA.AGE_COD_ESTADO_CITA')
    .Where('DAGENDA.AGE_FECHA = ' + QuotedStr(aFecha))
  .OrderBy('FECHA')
  .&End.Find;
  FDataSource.dataset.EnableControls;
  FDataSource.dataset.FieldByName('CODIGO').Visible := false;
  FDataSource.dataset.FieldByName('CODPAC').Visible := false;
  FDataSource.dataset.FieldByName('CODMED').Visible := false;
  FDataSource.dataset.FieldByName('CODESTADO').Visible := false;
  FDataSource.dataset.FieldByName('FECHA').DisplayWidth := 20;
  FDataSource.dataset.FieldByName('MEDICO').DisplayWidth := 30;
  FDataSource.dataset.FieldByName('PACIENTE').DisplayWidth := 30;
end;

constructor TControllerAgenda.Create;
begin
  FModel      := TModel.New.Agenda;
  FMedico     := TControllerMEDICO.New;
  FPaciente   := TControllerPaciente.New;
  FEstadoCita := TControllerEstadoCita.New;
end;

procedure TControllerAgenda.DataChange(sender: tobject; field: Tfield);
begin
end;

function TControllerAgenda.DataSource(aDataSource: TDataSource) : iControllerAgenda;
begin
  Result := Self;
  FDataSource := aDataSource;
  FModel.DataSource(FDataSource);
  FDataSource.OnDataChange := DataChange;
end;

destructor TControllerAgenda.Destroy;
begin
  inherited;
end;

function TControllerAgenda.Eliminar: iControllerAgenda;
begin
  Result := Self;
  FModel.DAO.Delete(FModel.Entidad);
end;

function TControllerAgenda.Paciente: iControllerPaciente;
begin
    Result := FPaciente;
end;

function TControllerAgenda.Entidad: TDAGENDA;
begin
  Result := FModel.Entidad;
end;

function TControllerAgenda.EstadoCita: iControllerEstadoCita;
begin
  Result := FEstadoCita;
end;

function TControllerAgenda.Insertar: iControllerAgenda;
begin
  Result := Self;
  FModel.DAO.Insert(FModel.Entidad);
end;

function TControllerAgenda.Medico: iControllerMedico;
begin
  Result := FMedico;
end;

function TControllerAgenda.Modificar: iControllerAgenda;
begin
  Result := Self;
  FModel.DAO.Update(FModel.Entidad);
end;

class function TControllerAgenda.New: iControllerAgenda;
begin
  Result := Self.Create;
end;

end.
