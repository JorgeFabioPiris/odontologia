unit Odontologia.Controlador.Medico;

interface

uses
  Data.DB,
  System.SysUtils,
  System.Generics.Collections,
  Odontologia.Controlador.Medico.Interfaces,
  Odontologia.Controlador.Estado,
  Odontologia.Controlador.Estado.Interfaces,
  Odontologia.Modelo,
  Odontologia.Modelo.Entidades.Medico,
  Odontologia.Modelo.Medico.Interfaces,
  Odontologia.Modelo.Estado.Interfaces;

type
  TControllerMedico = class(TInterfacedObject, iControllerMedico)
  private
    FModel        : iModelMedico;
    FDataSource   : TDataSource;
    FEstado       : iControllerEstado;
    procedure DataChange (sender : tobject ; field : Tfield) ;

  public
    constructor Create;
    destructor Destroy; override;
    class function New    : iControllerMedico;
    function DataSource (aDataSource : TDataSource) : iControllerMedico;
    function Buscar (aNombre : String)              : iControllerMedico; overload;
    function Buscar       : iControllerMedico; overload;
    function Insertar     : iControllerMedico;
    function Modificar    : iControllerMedico;
    function Eliminar     : iControllerMedico;
    function Entidad      : TDMEDICO;
    function Estado       : iControllerEstado;
  end;

implementation

{ TControllerMedico }

function TControllerMedico.Buscar: iControllerMedico;
begin
  Result := Self;
  FDataSource.dataset.DisableControls;
  FModel.DAO.SQL.Fields('DMEDICO.MED_CODIGO AS CODIGO,')
    .Fields('DMEDICO.MED_NOMBRE AS NOMBRE,')
    .Fields('DMEDICO.MED_DOCUMENTO AS DOCUMENTO,')
    .Fields('DMEDICO.MED_TELEFONO AS TELEFONO,')
    .Fields('DMEDICO.MED_MATRICULA AS MATRICULA,')
    .Fields('DMEDICO.MED_ESPECIALIDAD AS ESPECIALIDAD,')
    .Fields('DMEDICO.MED_FOTO AS FOTO,')
    .Fields('DMEDICO.MED_COD_ESTADO AS CODESTADO,')
    .Fields('FSITUACION.SIT_SITUACION AS ESTADO ')
    .Join('INNER JOIN FSITUACION ON FSITUACION.SIT_CODIGO = DMEDICO.MED_COD_ESTADO')
    .Where('')
  .OrderBy('NOMBRE')
  .&End.Find;

  FDataSource.dataset.EnableControls;
  FDataSource.dataset.FieldByName('CODIGO').Visible       := False;
  FDataSource.dataset.FieldByName('MATRICULA').Visible    := False;
  FDataSource.dataset.FieldByName('DOCUMENTO').Visible    := False;
  FDataSource.dataset.FieldByName('FOTO').Visible         := False;
  FDataSource.dataset.FieldByName('CODESTADO').Visible    := False;
  FDataSource.dataset.FieldByName('NOMBRE').DisplayWidth  := 50;
end;

function TControllerMedico.Buscar(aNombre: String): iControllerMedico;
begin
  Result := Self;

  FDataSource.dataset.DisableControls;
  FModel.DAO.SQL.Fields('DMEDICO.MED_CODIGO AS CODIGO,')
    .Fields('DMEDICO.MED_NOMBRE AS NOMBRE,')
    .Fields('DMEDICO.MED_DOCUMENTO AS DOCUMENTO,')
    .Fields('DMEDICO.MED_TELEFONO AS TELEFONO,')
    .Fields('DMEDICO.MED_MATRICULA AS MATRICULA,')
    .Fields('DMEDICO.MED_ESPECIALIDAD AS ESPECIALIDAD,')
    .Fields('DMEDICO.MED_FOTO AS FOTO,')
    .Fields('DMEDICO.MED_COD_ESTADO AS CODESTADO,')
    .Fields('FSITUACION.SIT_SITUACION AS ESTADO ')
    .Join('INNER JOIN FSITUACION ON FSITUACION.SIT_CODIGO = DMEDICO.MED_COD_ESTADO')
    .Where('DMEDICO.MED_NOMBRE LIKE ' +QuotedStr(aNombre) + '')
  .OrderBy('NOMBRE')
  .&End.Find;

  FDataSource.dataset.EnableControls;
  FDataSource.dataset.FieldByName('CODIGO').Visible       := False;
  FDataSource.dataset.FieldByName('MATRICULA').Visible    := False;
  FDataSource.dataset.FieldByName('DOCUMENTO').Visible    := False;
  FDataSource.dataset.FieldByName('FOTO').Visible         := False;
  FDataSource.dataset.FieldByName('CODESTADO').Visible    := False;
  FDataSource.dataset.FieldByName('NOMBRE').DisplayWidth  := 50;
end;

constructor TControllerMedico.Create;
begin
  FModel  := TModel.New.Medico;
end;

procedure TControllerMedico.DataChange(sender: tobject; field: Tfield);
begin
end;

function TControllerMedico.DataSource(aDataSource: TDataSource) : iControllerMedico;
begin
  Result := Self;
  FDataSource := aDataSource;
  FModel.DataSource(FDataSource);
  FDataSource.OnDataChange := DataChange;
end;

destructor TControllerMedico.Destroy;
begin
  inherited;
end;

function TControllerMedico.Eliminar: iControllerMedico;
begin
  Result := Self;
  FModel.DAO.Delete(FModel.Entidad);
end;

function TControllerMedico.Estado: iControllerEstado;
begin
    Result := FEstado;
end;

function TControllerMedico.Entidad: TDMEDICO;
begin
  Result := FModel.Entidad;
end;

function TControllerMedico.Insertar: iControllerMedico;
begin
  Result := Self;
  FModel.DAO.Insert(FModel.Entidad);
end;

function TControllerMedico.Modificar: iControllerMedico;
begin
  Result := Self;
  FModel.DAO.Update(FModel.Entidad);
end;

class function TControllerMedico.New: iControllerMedico;
begin
  Result := Self.Create;
end;

end.
