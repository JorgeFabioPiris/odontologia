unit Odontologia.Modelo.Estado;

interface

uses
  Data.DB,
  SimpleDAO,
  SimpleInterface,
  SimpleQueryRestDW,
  Odontologia.Modelo.Estado.Interfaces,
  Odontologia.Modelo.Entidades.Estado,
  Odontologia.Modelo.Conexion.RestDW,
  System.SysUtils;

type
  TModelEstado = class (TInterfacedOBject, iModelEstado)

    private
    FEstado : TFSITUACION;
    FDAO : iSimpleDao<TFSITUACION>;
    FDataSource : TDataSource;

    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelEstado;
      function Entidad : TFSITUACION;
      function DAO : iSimpleDAO<TFSITUACION>;
      function DataSource (aDataSource : TDataSource) : iModelEstado;
  end;

implementation


{ TModelEstado }

constructor TModelEstado.Create;
begin
  FEstado := TFSITUACION.Create;
  FDAO := TSimpleDAO<TFSITUACION>
            .New(TSimpleQueryRestDW<TFSITUACION>
                .New(ModelConexion.RESTDWDataBase1));
end;

function TModelEstado.DAO: iSimpleDAO<TFSITUACION>;
begin
  Result := FDAO;
end;

function TModelEstado.DataSource(aDataSource: TDataSource): iModelEstado;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDAO.DataSource(FDataSource);
end;

destructor TModelEstado.Destroy;
begin
  FreeAndNil(FEstado);
  inherited;
end;

function TModelEstado.Entidad: TFSITUACION;
begin
  Result := FEstado;
end;

class function TModelEstado.New: iModelEstado;
begin
  Result := Self.Create;
end;

end.
