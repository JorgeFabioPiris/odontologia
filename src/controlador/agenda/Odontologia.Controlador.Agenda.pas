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
  FModel.DAO.SQL.Fields('DEMPRESA.EMP_CODIGO AS CODIGO,')
    .Fields('DEMPRESA.EMP_RAZSOCIAL AS RAZON,')
    .Fields('DEMPRESA.EMP_FANTASIA AS FANTASIA,')
    .Fields('DEMPRESA.EMP_RUC AS RUC,')
    .Fields('DEMPRESA.EMP_DIRECCION AS DIRECCION,')
    .Fields('DEMPRESA.EMP_NUMERO AS NUMERO,')
    .Fields('DEMPRESA.EMP_BARRIO AS BARRIO,')
    .Fields('DEMPRESA.EMP_TELEFONO AS TELEFONO,')
    .Fields('DEMPRESA.EMP_EMAIL AS EMAIL,')
    .Fields('DEMPRESA.EMP_COD_CIUDAD AS COD_CIU,')
    .Fields('DEMPRESA.EMP_COD_TIP_EMPRESA AS COD_EMP,')
    .Fields('DCIUDAD.CIU_NOMBRE AS CIUDAD')
    .Join('INNER JOIN DCIUDAD ON DCIUDAD.CIU_CODIGO = DEMPRESA.EMP_COD_CIUDAD ')
    .Where('')
  .OrderBy('RAZON')
  .&End.Find;
  FDataSource.dataset.EnableControls;
  FDataSource.dataset.FieldByName('CODIGO').Visible := false;
  FDataSource.dataset.FieldByName('RAZON').Visible := TRUE;
  FDataSource.dataset.FieldByName('FANTASIA').Visible := True;
  FDataSource.dataset.FieldByName('RUC').Visible := tRUE;
  FDataSource.dataset.FieldByName('DIRECCION').Visible := false;
  FDataSource.dataset.FieldByName('NUMERO').Visible := false;
  FDataSource.dataset.FieldByName('BARRIO').Visible := false;
  FDataSource.dataset.FieldByName('TELEFONO').Visible := True;
  FDataSource.dataset.FieldByName('EMAIL').Visible := True;
  FDataSource.dataset.FieldByName('COD_CIU').Visible := false;
  FDataSource.dataset.FieldByName('COD_EMP').Visible := FALSE;
  FDataSource.dataset.FieldByName('RAZON').DisplayWidth :=50;
end;

function TControllerAgenda.Buscar(aCita: String): iControllerAgenda;
begin
  Result := Self;
  FDataSource.dataset.DisableControls;
  FModel.DAO.SQL.Fields('DEMPRESA.EMP_CODIGO AS CODIGO,')
    .Fields('DEMPRESA.EMP_RAZSOCIAL AS RAZON,')
    .Fields('DEMPRESA.EMP_FANTASIA AS FANTASIA,')
    .Fields('DEMPRESA.EMP_RUC AS RUC,')
    .Fields('DEMPRESA.EMP_DIRECCION AS DIRECCION,')
    .Fields('DEMPRESA.EMP_NUMERO AS NUMERO,')
    .Fields('DEMPRESA.EMP_BARRIO AS BARRIO,')
    .Fields('DEMPRESA.EMP_TELEFONO AS TELEFONO,')
    .Fields('DEMPRESA.EMP_EMAIL AS EMAIL,')
    .Fields('DEMPRESA.EMP_COD_CIUDAD AS COD_CIU,')
    .Fields('DEMPRESA.EMP_COD_TIP_EMPRESA AS COD_EMP,')
    .Fields('DCIUDAD.CIU_NOMBRE AS CIUDAD')
    .Join('INNER JOIN DCIUDAD ON DCIUDAD.CIU_CODIGO = DEMPRESA.EMP_COD_CIUDAD ')
    .Where('DEMPRESA.EMP_RAZSOCIAL CONTAINING ' +QuotedStr(aCita) + '')
  .OrderBy('RAZON')
  .&End.Find;
  FDataSource.dataset.EnableControls;
  FDataSource.dataset.FieldByName('CODIGO').Visible := false;
  FDataSource.dataset.FieldByName('RAZON').Visible := TRUE;
  FDataSource.dataset.FieldByName('FANTASIA').Visible := True;
  FDataSource.dataset.FieldByName('RUC').Visible := tRUE;
  FDataSource.dataset.FieldByName('DIRECCION').Visible := false;
  FDataSource.dataset.FieldByName('NUMERO').Visible := false;
  FDataSource.dataset.FieldByName('BARRIO').Visible := false;
  FDataSource.dataset.FieldByName('TELEFONO').Visible := True;
  FDataSource.dataset.FieldByName('EMAIL').Visible := True;
  FDataSource.dataset.FieldByName('COD_CIU').Visible := false;
  FDataSource.dataset.FieldByName('COD_EMP').Visible := FALSE;
  FDataSource.dataset.FieldByName('RAZON').DisplayWidth :=50;
end;

constructor TControllerAgenda.Create;
begin
  FModel  := TModel.New.Agenda;
  FMedico   := TControllerMEDICO.New;
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
