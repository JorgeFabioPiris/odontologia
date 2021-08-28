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
    function Buscar (aLogin : String)               : iControllerMedico; overload;
    function Buscar (aLogin, aPassword : String ; aEmpresa : Integer)  : iControllerMedico; overload;
    function Buscar       : iControllerMedico; overload;
    function Insertar     : iControllerMedico;
    function Modificar    : iControllerMedico;
    function Eliminar     : iControllerMedico;
    function Entidad      : TDMEDICO;
    function Estado      : iControllerEstado;
  end;

implementation

{ TControllerMedico }

function TControllerMedico.Buscar: iControllerMedico;
begin
  Result := Self;
  FDataSource.dataset.DisableControls;
  FModel.DAO.SQL.Fields('DUSUARIO.USU_CODIGO AS CODIGO,')
    .Fields('DUSUARIO.USU_LOGIN AS LOGIN,')
    .Fields('DUSUARIO.USU_NIVEL AS NIVEL,')
    .Fields('DUSUARIO.USU_CLAVE AS CLAVE,')
    .Fields('DUSUARIO.USU_FOTO AS FOTO,')
    .Fields('DUSUARIO.USU_COD_EMPRESA AS CODEMPRESA,')
    .Fields('DUSUARIO.USU_COD_ESTADO AS CODESTADO,')
    .Fields('FSITUACION.SIT_SITUACION AS ESTADO,')
    .Fields('DEMPRESA.EMP_FANTASIA AS EMPRESA')
    .Join('INNER JOIN DEMPRESA ON DEMPRESA.EMP_CODIGO = DUSUARIO.USU_COD_EMPRESA')
    .Join('INNER JOIN FSITUACION ON FSITUACION.SIT_CODIGO = DUSUARIO.USU_COD_ESTADO')
    .Where('')
  .OrderBy('LOGIN')
  .&End.Find;
  FDataSource.dataset.EnableControls;
  FDataSource.dataset.FieldByName('CODIGO').Visible := False;
  FDataSource.dataset.FieldByName('CLAVE').Visible := False;
  FDataSource.dataset.FieldByName('NIVEL').Visible := False;
  FDataSource.dataset.FieldByName('CODEMPRESA').Visible := False;
  FDataSource.dataset.FieldByName('CODESTADO').Visible := False;
  FDataSource.dataset.FieldByName('FOTO').Visible := False;
  FDataSource.dataset.FieldByName('LOGIN').DisplayWidth :=50;
end;

function TControllerMedico.Buscar(aLogin: String): iControllerMedico;
begin
  Result := Self;
  FDataSource.dataset.DisableControls;
  FModel.DAO.SQL.Fields('DUSUARIO.USU_CODIGO AS CODIGO,')
    .Fields('DUSUARIO.USU_LOGIN AS LOGIN,')
    .Fields('DUSUARIO.USU_NIVEL AS NIVEL,')
    .Fields('DUSUARIO.USU_CLAVE AS CLAVE,')
    .Fields('DUSUARIO.USU_FOTO AS FOTO,')
    .Fields('DUSUARIO.USU_COD_EMPRESA AS CODEMPRESA,')
    .Fields('DUSUARIO.USU_COD_ESTADO AS CODESTADO,')
    .Fields('FSITUACION.SIT_SITUACION AS ESTADO,')
    .Fields('DEMPRESA.EMP_FANTASIA AS EMPRESA')
    .Join('INNER JOIN DEMPRESA ON DEMPRESA.EMP_CODIGO = DUSUARIO.USU_COD_EMPRESA')
    .Join('INNER JOIN FSITUACION ON FSITUACION.SIT_CODIGO = DUSUARIO.USU_COD_ESTADO')
    .Where('DUSUARIO.USU_LOGIN LIKE ' +QuotedStr(aLogin) + '')
  .OrderBy('LOGIN')
  .&End.Find;
  FDataSource.dataset.EnableControls;
  FDataSource.dataset.FieldByName('CODIGO').Visible := False;
  FDataSource.dataset.FieldByName('CLAVE').Visible := False;
  FDataSource.dataset.FieldByName('NIVEL').Visible := False;
  FDataSource.dataset.FieldByName('CODEMPRESA').Visible := False;
  FDataSource.dataset.FieldByName('CODESTADO').Visible := False;
  FDataSource.dataset.FieldByName('FOTO').Visible := False;
  FDataSource.dataset.FieldByName('LOGIN').DisplayWidth :=50;
end;

function TControllerMedico.Buscar(aLogin, aPassword: String; aEmpresa: Integer): iControllerMedico;
begin
  Result := Self;
  FModel.DAO
    .SQL
      .Where('USU_LOGIN = ' +QuotedStr(aLogin) + ' AND USU_CLAVE = ' + QuotedStr(aPassword) + ' AND USU_COD_EMPRESA = ' + intToStr(aEmpresa))
    .&End
  .Find;
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
