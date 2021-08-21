unit Odontologia.Modelo.Empresa;

interface

uses
  Data.DB,
  SimpleDAO,
  SimpleInterface,
  SimpleQueryRestDW,
  System.SysUtils,
  Odontologia.Modelo.ciudad,
  Odontologia.Modelo.ciudad.Interfaces,
  Odontologia.Modelo.Conexion.RestDW,
  Odontologia.Modelo.Empresa.Interfaces,
  Odontologia.Modelo.EmpresaTipo,
  Odontologia.Modelo.EmpresaTipo.Interfaces,
  Odontologia.Modelo.Entidades.Empresa;


type
  TModelEmpresa = class(TInterfacedOBject, iModelempresa)

  private
    FEntidad      : TDEMPREsa;
    FDAO          : iSimpleDao<TDEMPREsa>;
    FDataSource   : TDataSource;
    FCiudad       : iModelCiudad;
    FEmpresaTipo  : iModelEmpresaTipo;

  public
    constructor Create;
    destructor Destroy; override;
    class function New  : iModelempresa;
    function Entidad      : TDEMPRESA; overload;
    function Entidad(aEntidad: TDEMPRESA)    : iModelEmpresa; overload;
    function DAO          : iSimpleDAO<TDEMPRESA>;
    function DataSource(aDataSource: TDataSource) : iModelEmpresa;
    function Ciudad       : iModelCiudad;
    function TimpoEmpresa : iModelEmpresatipo;
  end;

implementation

{ TModelEmpresa }

constructor TModelEmpresa.Create;
begin
  FEntidad    := TDEMPREsa.Create;
  FDAO        := TSimpleDAO<TDEMPREsa>
                .New(TSimpleQueryRestDW<TDEMPREsa>
                .New(ModelConexion.RESTDWDataBase1));
  FCiudad       := TModelCiudad.New;
  FEmpresaTipo  := TModelEmpresaTipo.New;
end;

function TModelEmpresa.DAO: iSimpleDao<TDEMPREsa>;
begin
  Result := FDAO;
end;

function TModelEmpresa.DataSource(aDataSource: TDataSource): iModelempresa;
begin
  Result      := Self;
  FDataSource := aDataSource;
  FDAO.DataSource(FDataSource);
end;

destructor TModelEmpresa.Destroy;
begin
  FreeAndNil(FEntidad);
  inherited;
end;

function TModelEmpresa.Entidad(aEntidad: TDEMPREsa): iModelempresa;
begin
  Result    := Self;
  FEntidad  := aEntidad;
end;

function TModelEmpresa.ciudad: iModelCiudad;
begin
  Result    := FCiudad;
end;

function TModelEmpresa.Entidad: TDEMPRESA;
begin
  Result    := FEntidad;
end;

class function TModelEmpresa.New: iModelEmpresa;
begin
  Result    := Self.Create;
end;

function TModelEmpresa.TimpoEmpresa: iModelEmpresatipo;
begin
   Result    := FEmpresaTipo;
end;

end.
