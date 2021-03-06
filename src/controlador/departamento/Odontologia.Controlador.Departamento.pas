unit Odontologia.Controlador.Departamento;

interface

uses
  Data.DB,
  System.SysUtils,
  System.Generics.Collections,
  Odontologia.Controlador.Departamento.Interfaces,
  Odontologia.Controlador.Pais,
  Odontologia.Controlador.Pais.Interfaces,
  Odontologia.Modelo,
  Odontologia.Modelo.Entidades.Departamento,
  Odontologia.Modelo.Departamento.Interfaces;

type
  TControllerDepartamento = class(TInterfacedObject, iControllerDepartamento)
  private
    FModel: iModelDepartamento;
    FDataSource: TDataSource;
    //Flista: TObjectList<TDDEPARTAMENTO>;
    FPais: iControllerPais;
    procedure DataChange (sender : tobject ; field : Tfield) ;

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iControllerDepartamento;
    function DataSource(aDataSource: TDataSource): iControllerDepartamento;
    function Buscar   : iControllerDepartamento; overload;
    function Buscar (aDepartamento : String) : iControllerDepartamento; overload;
    function Insertar : iControllerDepartamento;
    function Modificar: iControllerDepartamento;
    function Eliminar : iControllerDepartamento;
    function Entidad  : TDDEPARTAMENTO;
    function Pais     : iControllerPais;
  end;

implementation

{ TControllerDepartamento }

function TControllerDepartamento.Buscar: iControllerDepartamento;
begin
  Result := Self;
  //Flista := TObjectList<TDDEPARTAMENTO>.Create;
  //FModel.DAO.Find(Flista);
  FDataSource.dataset.DisableControls;
  FModel.DAO.SQL.Fields('DDEPARTAMENTO.DEP_CODIGO AS CODIGO,')
    .Fields('DDEPARTAMENTO.DEP_NOMBRE AS NOMBRE,')
    .Fields('DDEPARTAMENTO.DEP_COD_PAIS AS COD_PAIS,')
    .Fields('DPAIS.PAI_NOMBRE AS PAIS')
    .Join('INNER JOIN DPAIS ON DPAIS.PAI_CODIGO = DDEPARTAMENTO.DEP_COD_PAIS ')
    //.Where('ID_PEDIDO = ' + intToStr(aId))
    .Where('')
  .OrderBy('NOMBRE')
  .&End.Find;
  FDataSource.dataset.EnableControls;
  FDataSource.dataset.FieldByName('CODIGO').Visible := false;
  FDataSource.dataset.FieldByName('COD_PAIS').Visible := false;
  FDataSource.dataset.FieldByName('NOMBRE').DisplayWidth :=50;
end;

function TControllerDepartamento.Buscar(aDepartamento: String): iControllerDepartamento;
begin
  Result := Self;
  //Flista := TObjectList<TDDEPARTAMENTO>.Create;

  FDataSource.dataset.DisableControls;
  FModel.DAO.SQL.Fields('DDEPARTAMENTO.DEP_CODIGO AS CODIGO,')
    .Fields('DDEPARTAMENTO.DEP_NOMBRE AS NOMBRE,')
    .Fields('DDEPARTAMENTO.DEP_COD_PAIS AS COD_PAIS,')
    .Fields('DPAIS.PAI_NOMBRE AS PAIS')
    .Join('INNER JOIN DPAIS ON DPAIS.PAI_CODIGO = DDEPARTAMENTO.DEP_COD_PAIS ')
    .Where('DEP_NOMBRE CONTAINING ' +QuotedStr(aDepartamento) + '')
    .OrderBy('NOMBRE')
    .&End.Find;
  FDataSource.dataset.EnableControls;
  FDataSource.dataset.FieldByName('CODIGO').Visible := false;
  FDataSource.dataset.FieldByName('COD_PAIS').Visible := false;
  FDataSource.dataset.FieldByName('NOMBRE').DisplayWidth :=50;
end;

constructor TControllerDepartamento.Create;
begin
  FModel  := TModel.New.Departamento;
  FPais   := TcontrollerPais.New;
end;

procedure TControllerDepartamento.DataChange(sender: tobject; field: Tfield);
begin
//   FPais.buscar(FDataSource.DataSet.FieldByName('PAIS').AsString);
end;

function TControllerDepartamento.DataSource(aDataSource: TDataSource) : iControllerDepartamento;
begin
  Result := Self;
  FDataSource := aDataSource;
  FModel.DataSource(FDataSource);
  FDataSource.OnDataChange := DataChange;
end;

destructor TControllerDepartamento.Destroy;
begin
  //Flista.Free;
  inherited;
end;

function TControllerDepartamento.Eliminar: iControllerDepartamento;
begin
  Result := Self;
  FModel.DAO.Delete(FModel.Entidad);
end;

function TControllerDepartamento.Entidad: TDDEPARTAMENTO;
begin
  Result := FModel.Entidad;
end;

function TControllerDepartamento.Insertar: iControllerDepartamento;
begin
  Result := Self;
  FModel.DAO.Insert(FModel.Entidad);
end;

function TControllerDepartamento.Pais: iControllerPais;
begin
  Result := FPais;
end;

function TControllerDepartamento.Modificar: iControllerDepartamento;
begin
  Result := Self;
  FModel.DAO.Update(FModel.Entidad);
end;

class function TControllerDepartamento.New: iControllerDepartamento;
begin
  Result := Self.Create;
end;

end.
