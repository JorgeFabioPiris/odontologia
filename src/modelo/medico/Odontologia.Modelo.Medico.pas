unit Odontologia.Modelo.Medico;

interface

uses
  Data.DB,
  SimpleDAO,
  SimpleInterface,
  SimpleQueryRestDW,
  System.SysUtils,
  Odontologia.Modelo.Conexion.RestDW,
  Odontologia.Modelo.Medico.Interfaces,
  Odontologia.Modelo.Estado,
  Odontologia.Modelo.Estado.Interfaces,
  Odontologia.Modelo.Entidades.Medico;


type
  TModelMedico = class(TInterfacedOBject, iModelMedico)

  private
    FEntidad      : TDMEDICO;
    FDAO          : iSimpleDao<TDMEDICO>;
    FDataSource   : TDataSource;
    FESTADO       : iModelEstado;

  public
    constructor Create;
    destructor Destroy; override;
    class function New    : iModelMedico;
    function Entidad      : TDMEDICO; overload;
    function Entidad(aEntidad: TDMEDICO)    : iModelMedico; overload;
    function DAO          : iSimpleDAO<TDMEDICO>;
    function DataSource(aDataSource: TDataSource) : iModelMedico;
    function Estado       : iModelEstado;
  end;

implementation

{ TModelMedico }

constructor TModelMedico.Create;
begin
  FEntidad  := TDMEDICO.Create;
  FDAO      := TSimpleDAO<TDMEDICO>
                .New(TSimpleQueryRestDW<TDMEDICO>
                .New(ModelConexion.RESTDWDataBase1));
  FESTADO  := TModelEstado.New;
end;

function TModelMedico.DAO: iSimpleDao<TDMEDICO>;
begin
  Result := FDAO;
end;

function TModelMedico.DataSource(aDataSource: TDataSource): iModelMedico;
begin
  Result      := Self;
  FDataSource := aDataSource;
  FDAO.DataSource(FDataSource);
end;

destructor TModelMedico.Destroy;
begin
  FreeAndNil(FEntidad);
  inherited;
end;

function TModelMedico.Entidad(aEntidad: TDMEDICO): iModelMedico;
begin
  Result    := Self;
  FEntidad  := aEntidad;
end;

function TModelMedico.Entidad: TDMEDICO;
begin
  Result    := FEntidad;
end;

class function TModelMedico.New: iModelMedico;
begin
  Result    := Self.Create;
end;

function TModelMedico.Estado: iModelEstado;
begin
   Result    := FESTADO;
end;

end.
