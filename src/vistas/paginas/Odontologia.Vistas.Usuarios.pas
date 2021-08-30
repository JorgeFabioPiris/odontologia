unit Odontologia.Vistas.Usuarios;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.Variants,
  System.Classes,
  System.ImageList,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Data.DB,
  Vcl.ImgList,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.WinXPanels,
  Vcl.ExtCtrls,
  Vcl.DBCtrls,
  Vcl.ExtDlgs,
  Vcl.Imaging.jpeg,
  Odontologia.Controlador,
  Odontologia.Controlador.Interfaces,
  Odontologia.Controlador.Empresa.Interfaces,
  Odontologia.Controlador.Estado.Interfaces,
  Odontologia.Controlador.Usuario.Interfaces,
  Odontologia.Vistas.Template;

type
  TPagUsuario = class(TPagTemplate)
    DataSource2: TDataSource;
    cmbEmpresa: TDBLookupComboBox;
    edtCodigo: TEdit;
    edtClave: TEdit;
    edtNivel: TEdit;
    edtLogin: TEdit;
    Label1: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Image1: TImage;
    Panel1: TPanel;
    btnGuardarImagen: TSpeedButton;
    OpenPictureDialog1: TOpenPictureDialog;
    cmbEstado: TDBLookupComboBox;
    DataSource3: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure Image1DblClick(Sender: TObject);
    procedure btnGuardarImagenClick(Sender: TObject);
    procedure edtSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FController   : iController;
    FEmpresa      : iControllerEmpresa;
    FEstado       : iControllerEstado;
    FUsuario      : iControllerUsuario;
    procedure prc_estado_inicial;
    procedure prc_copiar_img_directorio(origen : String);

  public
    { Public declarations }
  end;

var
  PagUsuario  : TPagUsuario;
  Insercion   : Boolean;
  imagenURL     : String;
  imagenModif   : Boolean;
  path        : string;

implementation

uses
  System.SysUtils;

{$R *.dfm}

procedure TPagUsuario.btnActualizarClick(Sender: TObject);
begin
  inherited;
  FUsuario.Buscar;
  prc_estado_inicial;
end;

procedure TPagUsuario.btnBorrarClick(Sender: TObject);
var
  ShouldClose: Boolean;
begin
  inherited;
  if MessageDlg('Realmente desea eliminar este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FUsuario.Entidad.USU_CODIGO := StrToInt(edtCodigo.Text);
    FUsuario.Eliminar;
    FUsuario.Buscar;
    prc_estado_inicial;
  end else
  begin
    edtLogin.SetFocus;
  end;
end;

procedure TPagUsuario.btnCancelarClick(Sender: TObject);
begin
  inherited;
  prc_estado_inicial;
end;

procedure TPagUsuario.btnGuardarClick(Sender: TObject);
begin
  inherited;
  if Insercion then
  begin
    FUsuario.Entidad.USU_LOGIN         := edtLogin.Text;
    FUsuario.Entidad.USU_COD_ESTADO    := DataSource3.DataSet.FieldByName('SIT_CODIGO').AsInteger;
    FUsuario.Entidad.USU_NIVEL         := StrToInt(edtNivel.Text);
    FUsuario.Entidad.USU_CLAVE         := edtClave.Text;
    FUsuario.Entidad.USU_COD_EMPRESA   := DataSource2.DataSet.FieldByName('CODIGO').AsInteger;
    if imagenModif then
      begin
        FUsuario.Entidad.USU_FOTO      := imagenURL;
      end else
      begin
        FUsuario.Entidad.USU_FOTO      := '';
      end;
    FUsuario.Insertar;
  end
  else
  begin
    FUsuario.Entidad.USU_CODIGO        := StrToInt(edtCodigo.Text);
    FUsuario.Entidad.USU_LOGIN         := edtLogin.Text;
    FUsuario.Entidad.USU_COD_ESTADO    := DataSource3.DataSet.FieldByName('SIT_CODIGO').AsInteger;
    FUsuario.Entidad.USU_NIVEL         := StrToInt(edtNivel.Text);
    FUsuario.Entidad.USU_CLAVE         := edtClave.Text;
    FUsuario.Entidad.USU_COD_EMPRESA   := DataSource2.DataSet.FieldByName('CODIGO').AsInteger;
    FUsuario.Entidad.USU_FOTO          := imagenURL;
    FUsuario.Modificar;
  end;
  prc_estado_inicial;
end;

procedure TPagUsuario.btnGuardarImagenClick(Sender: TObject);
begin
  inherited;
  if edtLogin.Text = '' then
    begin
      ShowMessage('Primero debe ingresar un dato');
      edtlogin.SetFocus;
    end else
    begin
      prc_copiar_img_directorio(OpenPictureDialog1.FileName);
      imagenModif               := true;
      btnGuardarImagen.Enabled  := false;
    end;
  ShowMessage('La imagen ha sido guardada');
end;

procedure TPagUsuario.btnNuevoClick(Sender: TObject);
begin
  inherited;
  CardPanel1.ActiveCard := Card2;
  lblTitulo2.Caption    := 'Agregar nuevo registro';
  edtCodigo.Enabled     := False;
  cmbEstado.KeyValue    := 1;
  cmbEmpresa.KeyValue   := 1;
  edtLogin.SetFocus;
end;

procedure TPagUsuario.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  inherited;
  edtCodigo.Text        := DataSource1.DataSet.FieldByName('EMP_CODIGO').AsString;
  edtLogin.Text         := DataSource1.DataSet.FieldByName('EMP_NOMBRE').AsString;
end;

procedure TPagUsuario.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  Insercion               := False;
  CardPanel1.ActiveCard   := Card2;
  lblTitulo2.Caption      := 'Modificar registro';
  edtCodigo.Text          := DataSource1.DataSet.FieldByName('CODIGO').AsString;
  edtLogin.Text           := DataSource1.DataSet.FieldByName('LOGIN').AsString;
  cmbEstado.KeyValue      := DataSource1.DataSet.FieldByName('CODESTADO').AsInteger;
  edtnivel.Text           := DataSource1.DataSet.FieldByName('NIVEL').AsString;
  edtClave.Text           := DataSource1.DataSet.FieldByName('CLAVE').AsString;
  edtClave.Enabled        := false;
  cmbEmpresa.KeyValue     := DataSource1.DataSet.FieldByName('CODEMPRESA').AsString;
  imagenURL               := DataSource1.DataSet.FieldByName('FOTO').AsString;
  if not (VarIsNull(imagenURL) or imagenurl.IsEmpty) then
  begin
    Image1.Picture.LoadFromFile(imagenURL);
  end;
end;

procedure TPagUsuario.edtSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  FUsuario.Buscar('%' + edtSearch.Text + '%');
end;

procedure TPagUsuario.FormCreate(Sender: TObject);
begin
  inherited;
  path := ExtractFilePath(ParamStr(0));
  lblTitulo.Caption := 'Registro de usuarios';
  edtCodigo.Enabled := False;
  FController       := TController.New;
  FUsuario          := FController.Usuario.DataSource(DataSource1);
  FEmpresa          := FController.Empresa.DataSource(DataSource2);
  FEstado           := FController.Estado.DataSource(DataSource3);
  prc_estado_inicial;
end;

procedure TPagUsuario.Image1DblClick(Sender: TObject);
begin
  inherited;
  if OpenPictureDialog1.Execute then
    if FileExists(OpenPictureDialog1.FileName) then
    begin
      Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
      btnGuardarImagen.Enabled := true;
    end else
    begin
      raise Exception.Create('File does not exist.');
    end;
end;

procedure TPagUsuario.prc_copiar_img_directorio(origen : String);
begin
  imagenURL := path + 'fotos\usuario_' + edtLogin.text + '.jpg';
  CopyFile(PChar(origen),PChar(imagenURL),False);
end;

procedure TPagUsuario.prc_estado_inicial;
begin
  imagenModif            := false;
  imagenURL := path + 'fotos\noimage.jpg';
  if FileExists(imagenURL) then
    begin
      Image1.Picture.LoadFromFile(imagenURL);
    end else
    begin
      Image1.Picture.Assign(nil);
    end;
  Insercion             := True;
  CardPanel1.ActiveCard := Card1;
  edtSearch.Text        := '';
  edtCodigo.Text        := '';
  edtlogin.Text         := '';
  cmbEstado.KeyValue    := 1;
  edtNivel.Text         := '';
  edtClave.Text         := '';
  cmbEmpresa.KeyValue   := 1;
  FEmpresa.Buscar;
  FEstado.Buscar;
  FUsuario.Buscar;
end;

end.
