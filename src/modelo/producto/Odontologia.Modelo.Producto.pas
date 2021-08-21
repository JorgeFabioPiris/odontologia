unit Odontologia.Modelo.Producto;

interface

uses
  Data.DB,
  SimpleDAO,
  SimpleInterface,
  SimpleQueryFiredac,
  SimpleQueryRestDW,
  Odontologia.Modelo.Producto.Interfaces,
  Odontologia.Modelo.Entidades.Producto,
  Odontologia.Modelo.Conexion.RestDW,
  System.SysUtils;

type
  TModelProducto = class (TInterfacedOBject, iModelProducto)

    private
    FEntidade : TPRODUCTO;
    FDAO : iSimpleDao<TPRODUCTO>;
    FDataSource : TDataSource;

    public
      constructor Create;
      destructor Destroy; override;
      class function New : iModelProducto;
      function Entidad : TPRODUCTO;
      function DAO : iSimpleDAO<TPRODUCTO>;
      function DataSource (aDataSource : TDataSource) : iModelProducto;
  end;

implementation


{ TModelProducto }

constructor TModelProducto.Create;
begin
  FEntidade := TPRODUCTO.Create;

  FDAO := TSimpleDAO<TPRODUCTO>
            .New(TSimpleQueryRestDW<TPRODUCTO>
                .New(ModelConexion.RESTDWDataBase1));

end;

function TModelProducto.DAO: iSimpleDAO<TPRODUCTO>;
begin
  Result := FDAO;
end;

function TModelProducto.DataSource(aDataSource: TDataSource): iModelProducto;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDAO.DataSource(FDataSource);
end;

destructor TModelProducto.Destroy;
begin
  FreeAndNil(FEntidade);
  inherited;
end;

function TModelProducto.Entidad: TPRODUCTO;
begin
  Result := FEntidade;
end;

class function TModelProducto.New: iModelProducto;
begin
  Result := Self.Create;
end;

end.
