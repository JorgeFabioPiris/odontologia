unit Odontologia.Modelo.Usuario;

interface

uses
  Data.DB,
  SimpleDAO,
  SimpleInterface,
  SimpleQueryRestDW,
  System.SysUtils,
  Odontologia.Modelo.Conexion.RestDW,
  Odontologia.Modelo.Usuario.Interfaces,
  Odontologia.Modelo.Empresa,
  Odontologia.Modelo.Empresa.Interfaces,
  Odontologia.Modelo.Entidades.Usuario;


type
  TModelUsuario = class(TInterfacedOBject, iModelUsuario)

  private
    FEntidad      : TDUSUARIO;
    FDAO          : iSimpleDao<TDUSUARIO>;
    FDataSource   : TDataSource;
    FEmpresa      : iModelEmpresa;

  public
    constructor Create;
    destructor Destroy; override;
    class function New    : iModelUsuario;
    function Entidad      : TDUSUARIO; overload;
    function Entidad(aEntidad: TDUSUARIO)    : iModelUsuario; overload;
    function DAO          : iSimpleDAO<TDUSUARIO>;
    function DataSource(aDataSource: TDataSource) : iModelUsuario;
    function Empresa : iModelEmpresa;
  end;

implementation

{ TModelUsuario }

constructor TModelUsuario.Create;
begin
  FEntidad  := TDUSUARIO.Create;
  FDAO      := TSimpleDAO<TDUSUARIO>
                .New(TSimpleQueryRestDW<TDUSUARIO>
                .New(ModelConexion.RESTDWDataBase1));
  FEmpresa  := TModelEmpresa.New;
end;

function TModelUsuario.DAO: iSimpleDao<TDUSUARIO>;
begin
  Result := FDAO;
end;

function TModelUsuario.DataSource(aDataSource: TDataSource): iModelUsuario;
begin
  Result      := Self;
  FDataSource := aDataSource;
  FDAO.DataSource(FDataSource);
end;

destructor TModelUsuario.Destroy;
begin
  FreeAndNil(FEntidad);
  inherited;
end;

function TModelUsuario.Entidad(aEntidad: TDUSUARIO): iModelUsuario;
begin
  Result    := Self;
  FEntidad  := aEntidad;
end;

function TModelUsuario.Entidad: TDUSUARIO;
begin
  Result    := FEntidad;
end;

class function TModelUsuario.New: iModelUsuario;
begin
  Result    := Self.Create;
end;

function TModelUsuario.Empresa: iModelEmpresa;
begin
   Result    := FEmpresa;
end;

end.implementation

end.
