unit Odontologia.Vistas.Medico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Odontologia.Vistas.Template, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXPanels, Vcl.ExtCtrls, Vcl.DBCtrls,
  Odontologia.Controlador.Interfaces,
  Odontologia.Controlador.Estado.Interfaces,
  Odontologia.Controlador.Medico.Interfaces,
  Odontologia.Controlador, Vcl.Imaging.jpeg, Vcl.ExtDlgs;

type
  TPagMedico = class(TPagTemplate)
    lblCodigo: TLabel;
    lblNombre: TLabel;
    lblDocumento: TLabel;
    lblTelefono: TLabel;
    lblEspecialidad: TLabel;
    lblEstado: TLabel;
    edtCodigo: TEdit;
    edtNombre: TEdit;
    edtDocumento: TEdit;
    edtTelefono: TEdit;
    edtEspecialidad: TEdit;
    cmbEstado: TDBLookupComboBox;
    DataSource2: TDataSource;
    btnGuardarImagen: TSpeedButton;
    Panel1: TPanel;
    Image1: TImage;
    OpenPictureDialog1: TOpenPictureDialog;
    edtMatricula: TEdit;
    lblMatricula: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure edtSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure btnGuardarImagenClick(Sender: TObject);
  private
    { Private declarations }
    FController : iController;
    FMedico     : iControllerMedico;
    FEstado     : iControllerEstado;
    procedure prc_estado_inicial;
    procedure prc_copiar_img_directorio(origen : String);
  public
    { Public declarations }
  end;

var
  PagMedico   : TPagMedico;
  Insercion   : Boolean;
  imagenURL   : String;
  imagenModif : Boolean;
  path        : string;

implementation

{$R *.dfm}

procedure TPagMedico.btnActualizarClick(Sender: TObject);
begin
  inherited;
  FMedico.Buscar();
end;

procedure TPagMedico.btnBorrarClick(Sender: TObject);
var
  ShouldClose: Boolean;
begin
  inherited;
  if MessageDlg('Realmente desea eliminar este registro?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    FMedico.Entidad.MED_CODIGO := StrToInt(edtCodigo.Text);
    FMedico.Eliminar;
    FMedico.Buscar;
    prc_estado_inicial;
  end else
  begin
    edtNombre.SetFocus;
  end;
end;

procedure TPagMedico.btnCancelarClick(Sender: TObject);
begin
  inherited;
  prc_estado_inicial;
end;

procedure TPagMedico.btnGuardarClick(Sender: TObject);
begin
  inherited;
    if Insercion then
  begin
    FMedico.Entidad.MED_NOMBRE        := edtNombre.Text;
    FMedico.Entidad.MED_DOCUMENTO     := edtDocumento.Text;
    FMedico.Entidad.MED_TELEFONO      := edtTelefono.Text;
    FMedico.Entidad.MED_MATRICULA     := edtMatricula.Text;
    FMedico.Entidad.MED_ESPECIALIDAD  := edtEspecialidad.Text;
    Fmedico.entidad.MED_COD_ESTADO    := cmbEstado.KeyValue;
    if imagenModif then
      begin
        FMedico.Entidad.MED_FOTO      := imagenURL;
      end else
      begin
        FMedico.Entidad.MED_FOTO      := '';
      end;
    FMedico.Insertar;
  end
  else
  begin
    FMedico.Entidad.MED_CODIGO        := StrToInt(edtCodigo.Text);
    FMedico.Entidad.MED_NOMBRE        := edtNombre.Text;
    FMedico.Entidad.MED_DOCUMENTO     := edtDocumento.Text;
    FMedico.Entidad.MED_TELEFONO      := edtTelefono.Text;
    FMedico.Entidad.MED_MATRICULA     := edtMatricula.Text;
    FMedico.Entidad.MED_ESPECIALIDAD  := edtEspecialidad.Text;
    Fmedico.entidad.MED_COD_ESTADO    := cmbEstado.KeyValue;
    FMedico.Entidad.MED_FOTO          := imagenURL;

    FMedico.Modificar;
  end;
  prc_estado_inicial;
end;

procedure TPagMedico.btnGuardarImagenClick(Sender: TObject);
begin
  inherited;
  if edtNombre.Text = '' then
    begin
      ShowMessage('Primero debe ingresar un dato');
      edtNombre.SetFocus;
    end else
    begin
      prc_copiar_img_directorio(OpenPictureDialog1.FileName);
      imagenModif              := true;
      btnGuardarImagen.Enabled := false;
    end;
  ShowMessage('La imagen ha sido guardada');
end;

procedure TPagMedico.btnNuevoClick(Sender: TObject);
begin
  inherited;
  CardPanel1.ActiveCard   := Card2;
  lblTitulo2.Caption      := 'Agregar nuevo registro';
  edtCodigo.Enabled       := false;
  cmbEstado.KeyValue      := 1;
  imagenURL               := path + 'fotos\noimage.jpg';
  Image1.Picture.LoadFromFile(imagenURL);
  edtNombre.SetFocus;
end;

procedure TPagMedico.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  Insercion := False;
  CardPanel1.ActiveCard   := Card2;
  lblTitulo2.Caption      := 'Modificar registro';
  edtCodigo.Text          := DataSource1.DataSet.FieldByName('CODIGO').AsString;
  edtNombre.Text          := DataSource1.DataSet.FieldByName('NOMBRE').AsString;
  edtDocumento.Text       := DataSource1.DataSet.FieldByName('DOCUMENTO').AsString;
  edtMatricula.Text       := DataSource1.DataSet.FieldByName('MATRICULA').AsString;
  edtEspecialidad.Text    := DataSource1.DataSet.FieldByName('ESPECIALIDAD').AsString;
  edtTelefono.Text        := DataSource1.DataSet.FieldByName('TELEFONO').AsString;
  cmbEstado.KeyValue      := DataSource1.DataSet.FieldByName('CODESTADO').AsInteger;
  imagenURL               := DataSource1.DataSet.FieldByName('FOTO').AsString;
  if not (VarIsNull(imagenURL) or imagenurl.IsEmpty) then
  begin
    Image1.Picture.LoadFromFile(imagenURL);
  end;
end;

procedure TPagMedico.edtSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  FMedico.Buscar('%' + edtSearch.Text + '%');
end;

procedure TPagMedico.FormCreate(Sender: TObject);
begin
  inherited;
  path              := ExtractFilePath(ParamStr(0));
  lblTitulo.Caption := 'Registro de medicos';
  edtCodigo.Enabled := False;
  FController       := TController.New;
  FMedico           := FController.Medico.DataSource(DataSource1);
  FEstado           := FController.Estado.DataSource(DataSource2);
  prc_estado_inicial;
end;

procedure TPagMedico.Image1DblClick(Sender: TObject);
begin
  inherited;
  if OpenPictureDialog1.Execute then
    if FileExists(OpenPictureDialog1.FileName) then
    begin
      Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
      btnGuardarImagen.Enabled := true;
    end else
    begin
      raise Exception.Create('Imagen no existe.');
    end;
end;

procedure TPagMedico.prc_copiar_img_directorio(origen: String);
begin
  imagenURL := path + 'fotos\medico_' + edtNombre.text + '.jpg';
  CopyFile(PChar(origen),PChar(imagenURL),False);
end;

procedure TPagMedico.prc_estado_inicial;
begin
  Insercion             := True;
  CardPanel1.ActiveCard := Card1;
  edtSearch.Text        := '';
  edtCodigo.Text        := '';
  edtNombre.Text        := '';
  edtDocumento.Text     := '';
  edtTelefono.Text      := '';
  edtMatricula.Text     := '';
  edtEspecialidad.Text  := '';
  FMedico.Buscar;
  FEstado.Buscar;
end;

end.
