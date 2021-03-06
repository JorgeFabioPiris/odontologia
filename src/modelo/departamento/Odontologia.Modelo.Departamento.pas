unit Odontologia.Modelo.Departamento;

interface

uses
  Data.DB,
  SimpleDAO,
  SimpleInterface,
  SimpleQueryRestDW,
  System.SysUtils,
  Odontologia.Modelo.Departamento.Interfaces,
  Odontologia.Modelo.Entidades.Departamento,
  Odontologia.Modelo.Conexion.RestDW,
  Odontologia.Modelo.Pais,
  Odontologia.Modelo.Pais.Interfaces;


type
  TModelDepartamento = class(TInterfacedOBject, iModelDepartamento)

  private
    FEntidad    : TDDEPARTAMENTO;
    FDAO        : iSimpleDao<TDDEPARTAMENTO>;
    FDataSource : TDataSource;
    FPais       : iModelPais;

  public
    constructor Create;
    destructor Destroy; override;
    class function New  : iModelDepartamento;
    function Entidad    : TDDEPARTAMENTO; overload;
    function Entidad(aEntidad: TDDEPARTAMENTO)    : iModelDepartamento; overload;
    function DAO        : iSimpleDao<TDDEPARTAMENTO>;
    function DataSource(aDataSource: TDataSource) : iModelDepartamento;
    function Pais       : iModelPais;
  end;

implementation

{ TModelDepartamento }

constructor TModelDepartamento.Create;
begin
  FEntidad    := TDDEPARTAMENTO.Create;
  FDAO        := TSimpleDAO<TDDEPARTAMENTO>
                .New(TSimpleQueryRestDW<TDDEPARTAMENTO>
                .New(ModelConexion.RESTDWDataBase1));
  FPais       := TModelPais.New;
end;

function TModelDepartamento.DAO: iSimpleDao<TDDEPARTAMENTO>;
begin
  Result := FDAO;
end;

function TModelDepartamento.DataSource(aDataSource: TDataSource): iModelDepartamento;
begin
  Result      := Self;
  FDataSource := aDataSource;
  FDAO.DataSource(FDataSource);
end;

destructor TModelDepartamento.Destroy;
begin
  FreeAndNil(FEntidad);
  inherited;
end;

function TModelDepartamento.Entidad(aEntidad: TDDEPARTAMENTO): iModelDepartamento;
begin
  Result    := Self;
  FEntidad  := aEntidad;
end;

function TModelDepartamento.Pais: iModelPais;
begin
  Result    := FPais;
end;

function TModelDepartamento.Entidad: TDDEPARTAMENTO;
begin
  Result    := FEntidad;
end;

class function TModelDepartamento.New: iModelDepartamento;
begin
  Result    := Self.Create;
end;

end.
