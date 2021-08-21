unit Odontologia.Modelo.Ciudad;

interface

uses
  Data.DB,
  SimpleDAO,
  SimpleInterface,
  SimpleQueryRestDW,
  System.SysUtils,
  Odontologia.Modelo.Ciudad.Interfaces,
  Odontologia.Modelo.Entidades.Ciudad,
  Odontologia.Modelo.Conexion.RestDW,
  Odontologia.Modelo.Departamento,
  Odontologia.Modelo.Departamento.Interfaces;


type
  TModelCiudad = class(TInterfacedOBject, iModelCiudad)

  private
    FEntidad      : TDciudad;
    FDAO          : iSimpleDao<TDciudad>;
    FDataSource   : TDataSource;
    FDepartamento : iModelDepartamento;

  public
    constructor Create;
    destructor Destroy; override;
    class function New    : iModelCiudad;
    function Entidad      : TDciudad; overload;
    function Entidad(aEntidad: TDciudad)    : iModelCiudad; overload;
    function DAO          : iSimpleDao<TDciudad>;
    function DataSource(aDataSource: TDataSource) : iModelCiudad;
    function Departamento : iModelDepartamento;
  end;

implementation

{ TModelCiudad }

constructor TModelCiudad.Create;
begin
  FEntidad      := TDciudad.Create;
  FDAO          := TSimpleDAO<TDciudad>
                    .New(TSimpleQueryRestDW<TDciudad>
                    .New(ModelConexion.RESTDWDataBase1));
  FDepartamento := TModelDepartamento.New;
end;

function TModelCiudad.DAO: iSimpleDao<TDciudad>;
begin
  Result := FDAO;
end;

function TModelCiudad.DataSource(aDataSource: TDataSource): iModelCiudad;
begin
  Result      := Self;
  FDataSource := aDataSource;
  FDAO.DataSource(FDataSource);
end;

destructor TModelCiudad.Destroy;
begin
  FreeAndNil(FEntidad);
  inherited;
end;

function TModelCiudad.Entidad(aEntidad: TDciudad): iModelCiudad;
begin
  Result    := Self;
  FEntidad  := aEntidad;
end;

function TModelCiudad.Departamento: iModelDepartamento;
begin
  Result    := FDepartamento;
end;

function TModelCiudad.Entidad: TDciudad;
begin
  Result    := FEntidad;
end;

class function TModelCiudad.New: iModelCiudad;
begin
  Result    := Self.Create;
end;

end.
