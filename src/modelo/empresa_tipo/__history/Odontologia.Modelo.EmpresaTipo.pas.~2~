unit Odontologia.Modelo.EmpresaTipo;

interface

uses
  Data.DB,
  SimpleDAO,
  SimpleInterface,
  SimpleQueryRestDW,
  Odontologia.Modelo.EmpresaTipo.Interfaces,
  Odontologia.Modelo.Entidades.EmpresaTipo,
  Odontologia.Modelo.Conexion.RestDW,
  System.SysUtils;

type
  TModelEmpresaTipo = class (TInterfacedOBject, iModelEmpresaTipo)

    private
    FEntidade : TFTIPO_EMPRESA;
    FDAO : iSimpleDao<TFTIPO_EMPRESA>;
    FDataSource : TDataSource;

    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelEmpresaTipo;
      function Entidad : TFTIPO_EMPRESA;
      function DAO : iSimpleDAO<TFTIPO_EMPRESA>;
      function DataSource (aDataSource : TDataSource) : iModelEmpresaTipo;
  end;

implementation


{ TModelEmpresaTipo }

constructor TModelEmpresaTipo.Create;
begin
  FEntidade := TFTIPO_EMPRESA.Create;
  FDAO := TSimpleDAO<TFTIPO_EMPRESA>
            .New(TSimpleQueryRestDW<TFTIPO_EMPRESA>
                .New(ModelConexion.RESTDWDataBase1));
end;

function TModelEmpresaTipo.DAO: iSimpleDAO<TFTIPO_EMPRESA>;
begin
  Result := FDAO;
end;

function TModelEmpresaTipo.DataSource(aDataSource: TDataSource): iModelEmpresaTipo;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDAO.DataSource(FDataSource);
end;

destructor TModelEmpresaTipo.Destroy;
begin
  FreeAndNil(FEntidade);
  inherited;
end;

function TModelEmpresaTipo.Entidad: TFTIPO_EMPRESA;
begin
  Result := FEntidade;
end;

class function TModelEmpresaTipo.New: iModelEmpresaTipo;
begin
  Result := Self.Create;
end;

end.
