unit Odontologia.Modelo.Paciente;

interface

uses
  Data.DB,
  SimpleDAO,
  SimpleInterface,
  SimpleQueryRestDW,
  System.SysUtils,
  Odontologia.Modelo.Conexion.RestDW,
  Odontologia.Modelo.Paciente.Interfaces,
  Odontologia.Modelo.Estado,
  Odontologia.Modelo.Estado.Interfaces,
  Odontologia.Modelo.Entidades.Paciente;


type
  TModelPaciente = class(TInterfacedOBject, iModelPaciente)

  private
    FEntidad      : TDPACIENTE;
    FDAO          : iSimpleDao<TDPACIENTE>;
    FDataSource   : TDataSource;
    FEmpresa      : iModelEstado;

  public
    constructor Create;
    destructor Destroy; override;
    class function New    : iModelPaciente;
    function Entidad      : TDPACIENTE; overload;
    function Entidad(aEntidad: TDPACIENTE)    : iModelPaciente; overload;
    function DAO          : iSimpleDAO<TDPACIENTE>;
    function DataSource(aDataSource: TDataSource) : iModelPaciente;
    function Estado : iModelEstado;
  end;

implementation

{ TModelPaciente }

constructor TModelPaciente.Create;
begin
  FEntidad  := TDPACIENTE.Create;
  FDAO      := TSimpleDAO<TDPACIENTE>
                .New(TSimpleQueryRestDW<TDPACIENTE>
                .New(ModelConexion.RESTDWDataBase1));
  FEmpresa  := TModelEstado.New;
end;

function TModelPaciente.DAO: iSimpleDao<TDPACIENTE>;
begin
  Result := FDAO;
end;

function TModelPaciente.DataSource(aDataSource: TDataSource): iModelPaciente;
begin
  Result      := Self;
  FDataSource := aDataSource;
  FDAO.DataSource(FDataSource);
end;

destructor TModelPaciente.Destroy;
begin
  FreeAndNil(FEntidad);
  inherited;
end;

function TModelPaciente.Entidad(aEntidad: TDPACIENTE): iModelPaciente;
begin
  Result    := Self;
  FEntidad  := aEntidad;
end;

function TModelPaciente.Entidad: TDPACIENTE;
begin
  Result    := FEntidad;
end;

class function TModelPaciente.New: iModelPaciente;
begin
  Result    := Self.Create;
end;

function TModelPaciente.Estado: iModelEstado;
begin
   Result    := FEmpresa;
end;

end.
