unit Odontologia.Modelo.Estado.Cita;

interface

uses
  Data.DB,
  SimpleDAO,
  SimpleInterface,
  SimpleQueryRestDW,
  Odontologia.Modelo.Estado.Cita.Interfaces,
  Odontologia.Modelo.Entidades.Estado.Cita,
  Odontologia.Modelo.Conexion.RestDW,
  System.SysUtils;

type
  TModelEstadoCita = class (TInterfacedOBject, iModelEstadoCita)

    private
    FEstadoCita : TFESTADO_CITA;
    FDAO        : iSimpleDao<TFESTADO_CITA>;
    FDataSource : TDataSource;

    public
      constructor Create;
      destructor Destroy; override;
      class function New  : iModelEstadoCita;
      function Entidad    : TFESTADO_CITA;
      function DAO        : iSimpleDAO<TFESTADO_CITA>;
      function DataSource (aDataSource : TDataSource) : iModelEstadoCita;
  end;

implementation


{ TModelEstadoCita }

constructor TModelEstadoCita.Create;
begin
  FEstadoCita := TFESTADO_CITA.Create;
  FDAO := TSimpleDAO<TFESTADO_CITA>
            .New(TSimpleQueryRestDW<TFESTADO_CITA>
                .New(ModelConexion.RESTDWDataBase1));
end;

function TModelEstadoCita.DAO: iSimpleDAO<TFESTADO_CITA>;
begin
  Result := FDAO;
end;

function TModelEstadoCita.DataSource(aDataSource: TDataSource): iModelEstadoCita;
begin
  Result := Self;
  FDataSource := aDataSource;
  FDAO.DataSource(FDataSource);
end;

destructor TModelEstadoCita.Destroy;
begin
  FreeAndNil(FEstadoCita);
  inherited;
end;

function TModelEstadoCita.Entidad: TFESTADO_CITA;
begin
  Result := FEstadoCita;
end;

class function TModelEstadoCita.New: iModelEstadoCita;
begin
  Result := Self.Create;
end;

end.
