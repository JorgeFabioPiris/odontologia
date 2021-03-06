unit Odontologia.Modelo.Pais;

interface

uses
  Data.DB,
  SimpleDAO,
  SimpleInterface,
  SimpleQueryRestDW,
  Odontologia.Modelo.Pais.Interfaces,
  Odontologia.Modelo.Entidades.Pais,
  Odontologia.Modelo.Conexion.RestDW,
  System.SysUtils;

type
  TModelPais = class (TInterfacedOBject, iModelPais)

    private
    FEntidade : TDPAIS;
    FDAO : iSimpleDao<TDPAIS>;
    FDataSource : TDataSource;

    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelPais;
      function Entidad : TDPAIS;
      function DAO : iSimpleDAO<TDPAIS>;
      function DataSource (aDataSource : TDataSource) : iModelPais;
  end;

implementation


{ TModelPais }

constructor TModelPais.Create;
begin
  FEntidade := TDPAIS.Create;
  FDAO := TSimpleDAO<TDPAIS>
            .New(TSimpleQueryRestDW<TDPAIS>
                .New(ModelConexion.RESTDWDataBase1));
end;

function TModelPais.DAO: iSimpleDAO<TDPAIS>;
begin
  Result := FDAO;
end;

function TModelPais.DataSource(aDataSource: TDataSource): iModelPais;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDAO.DataSource(FDataSource);
end;

destructor TModelPais.Destroy;
begin
  FreeAndNil(FEntidade);
  inherited;
end;

function TModelPais.Entidad: TDPAIS;
begin
  Result := FEntidade;
end;

class function TModelPais.New: iModelPais;
begin
  Result := Self.Create;
end;

end.
