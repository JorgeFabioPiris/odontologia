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
    function DataSource (aDataSource : TDataSource) : iControllerAgenda;
    function Buscar       : iControllerAgenda; overload;
    function Buscar (aCita : String)        : iControllerAgenda; overload;
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
    .Fields('DAGENDA.AGE_PACIENTE AS PAC_CODIGO,')
    .Fields('DAGENDA.AGE_MEDICO AS MED_CODIGO,')
    .Fields('DAGENDA.AGE_COD_ESTADO_CITA AS COD_CITA,')
    .Fields('DAGENDA.AGE_COD_TIP_EMPRESA AS COD_EMP,')
    .Fields('DMEDICO.MED_NOMBRE AS MEDICO,')
    .Fields('DPACIENTE.PAC_NOMBRE AS PACIENTE')
    .Join('INNER JOIN DMEDICO ON DMEDICO.MED_CODIGO = DAGENDA.AGE_MEDICO')
    .Join('INNER JOIN DPACIENTE ON DPACIENTE.PAC_CODIGO = DAGENDA.AGE_PACIENTE')
    .Where('')
  .OrderBy('FECHA')
  .&End.Find;
  FDataSource.dataset.EnableControls;
  FDataSource.dataset.FieldByName('CODIGO').Visible := false;
  FDataSource.dataset.FieldByName('FECHA').Visible := TRUE;
  FDataSource.dataset.FieldByName('HORA').Visible := True;
  FDataSource.dataset.FieldByName('PACIENTE').Visible := tRUE;
  FDataSource.dataset.FieldByName('MEDICO').Visible := false;
  FDataSource.dataset.FieldByName('NUMERO').Visible := false;
  FDataSource.dataset.FieldByName('BARRIO').Visible := false;
  FDataSource.dataset.FieldByName('TELEFONO').Visible := True;
  FDataSource.dataset.FieldByName('EMAIL').Visible := True;
  FDataSource.dataset.FieldByName('COD_CIU').Visible := false;
  FDataSource.dataset.FieldByName('COD_EMP').Visible := FALSE;
  FDataSource.dataset.FieldByName('FECHA').DisplayWidth :=50;
end;

function TControllerAgenda.Buscar(aCita: String): iControllerAgenda;
begin
  Result := Self;
  FDataSource.dataset.DisableControls;
  FModel.DAO.SQL.Fields('DAGENDA.AGE_CODIGO AS CODIGO,')
    .Fields('DAGENDA.AGE_FECHA AS FECHA,')
    .Fields('DAGENDA.AGE_HORA AS HORA,')
    .Fields('DAGENDA.AGE_PACIENTE AS PACIENTE,')
    .Fields('DAGENDA.AGE_MEDICO AS MEDICO,')
    .Fields('DAGENDA.AGE_NUMERO AS NUMERO,')
    .Fields('DAGENDA.AGE_BARRIO AS BARRIO,')
    .Fields('DAGENDA.AGE_TELEFONO AS TELEFONO,')
    .Fields('DAGENDA.AGE_EMAIL AS EMAIL,')
    .Fields('DAGENDA.AGE_COD_CIUDAD AS COD_CIU,')
    .Fields('DAGENDA.AGE_COD_TIP_EMPRESA AS COD_EMP,')
    .Fields('DCIUDAD.CIU_NOMBRE AS CIUDAD')
    .Join('INNER JOIN DCIUDAD ON DCIUDAD.CIU_CODIGO = DAGENDA.AGE_COD_CIUDAD ')
    .Where('DAGENDA.AGE_FECHA CONTAINING ' +QuotedStr(aCita) + '')
  .OrderBy('FECHA')
  .&End.Find;
  FDataSource.dataset.EnableControls;
  FDataSource.dataset.FieldByName('CODIGO').Visible := false;
  FDataSource.dataset.FieldByName('FECHA').Visible := TRUE;
  FDataSource.dataset.FieldByName('HORA').Visible := True;
  FDataSource.dataset.FieldByName('PACIENTE').Visible := tRUE;
  FDataSource.dataset.FieldByName('MEDICO').Visible := false;
  FDataSource.dataset.FieldByName('NUMERO').Visible := false;
  FDataSource.dataset.FieldByName('BARRIO').Visible := false;
  FDataSource.dataset.FieldByName('TELEFONO').Visible := True;
  FDataSource.dataset.FieldByName('EMAIL').Visible := True;
  FDataSource.dataset.FieldByName('COD_CIU').Visible := false;
  FDataSource.dataset.FieldByName('COD_EMP').Visible := FALSE;
  FDataSource.dataset.FieldByName('FECHA').DisplayWidth :=50;
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
