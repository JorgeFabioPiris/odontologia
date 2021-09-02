unit Odontologia.Vistas.Paciente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Odontologia.Vistas.Template, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXPanels, Vcl.ExtCtrls, Vcl.ExtDlgs, Vcl.Imaging.jpeg,
  Vcl.DBCtrls,
  Odontologia.Controlador.Interfaces,
  Odontologia.Controlador.Estado.Interfaces,
  Odontologia.Controlador.Paciente.Interfaces,
  Odontologia.Controlador;

type
  TPagPaciente = class(TPagTemplate)
    btnGuardarImagen: TSpeedButton;
    cmbEstado: TDBLookupComboBox;
    edtCodigo: TEdit;
    edtDocumento: TEdit;
    edtDireccion: TEdit;
    edtNombre: TEdit;
    edtTelefono: TEdit;
    lblCodigo: TLabel;
    lblDocumento: TLabel;
    lblEstado: TLabel;
    lblDireccion: TLabel;
    lblNombre: TLabel;
    lblTelefono: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    DataSource2: TDataSource;
    OpenPictureDialog1: TOpenPictureDialog;
    procedure FormCreate(Sender: TObject);
    procedure btnBorrarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNuevoClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtSearchKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Image1DblClick(Sender: TObject);
    procedure btnGuardarImagenClick(Sender: TObject);
  private
    { Private declarations }
    FController : iController;
    FPaciente   : iControllerPaciente;
    FEstado     : iControllerEstado;
    procedure prc_estado_inicial;
    procedure prc_copiar_img_directorio(origen: String);
  public
    { Public declarations }
  end;

var
  PagPaciente : TPagPaciente;
  Insercion   : Boolean;
  imagenURL   : String;
  imagenModif : Boolean;
  path: string;

implementation

{$R *.dfm}

procedure TPagPaciente.btnActualizarClick(Sender: TObject);
begin
  inherited;
  FPaciente.Buscar();
end;

procedure TPagPaciente.btnBorrarClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Realmente desea eliminar este registro?', mtConfirmation,
    [mbYes, mbNo], 0) = mrYes then
  begin
    FPaciente.Entidad.pac_CODIGO := StrToInt(edtCodigo.Text);
    FPaciente.Eliminar;
    FPaciente.Buscar;
    prc_estado_inicial;
  end
  else
  begin
    edtNombre.SetFocus;
  end;
end;

procedure TPagPaciente.btnCancelarClick(Sender: TObject);
begin
  inherited;
  prc_estado_inicial;
end;

procedure TPagPaciente.btnGuardarClick(Sender: TObject);
begin
  inherited;
  if Insercion then
  begin
    FPaciente.Entidad.pac_NOMBRE        := edtNombre.Text;
    FPaciente.Entidad.pac_DOCUMENTO     := edtDocumento.Text;
    FPaciente.Entidad.pac_TELEFONO      := edtTelefono.Text;
    FPaciente.Entidad.PAC_DIRECCION     := edtDireccion.Text;
    FPaciente.Entidad.pac_COD_ESTADO    := cmbEstado.KeyValue;
    if imagenModif then
    begin
      FPaciente.Entidad.pac_FOTO        := imagenURL;
    end
    else
    begin
      FPaciente.Entidad.pac_FOTO        := '';
    end;
    FPaciente.Insertar;
  end
  else
  begin
    FPaciente.Entidad.pac_CODIGO      := StrToInt(edtCodigo.Text);
    FPaciente.Entidad.pac_NOMBRE      := edtNombre.Text;
    FPaciente.Entidad.pac_DOCUMENTO   := edtDocumento.Text;
    FPaciente.Entidad.pac_TELEFONO    := edtTelefono.Text;
    FPaciente.Entidad.PAC_DIRECCION   := edtDireccion.Text;
    FPaciente.Entidad.pac_COD_ESTADO  := cmbEstado.KeyValue;
    FPaciente.Entidad.pac_FOTO        := imagenURL;
    FPaciente.Modificar;
  end;
  prc_estado_inicial;
end;

procedure TPagPaciente.btnGuardarImagenClick(Sender: TObject);
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

procedure TPagPaciente.btnNuevoClick(Sender: TObject);
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

procedure TPagPaciente.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  insercion             := false;
  CardPanel1.ActiveCard := Card2;
  lblTitulo2.Caption    := 'Modificar registro';
  edtCodigo.Text        := DataSource1.DataSet.FieldByName('CODIGO').AsString;
  edtNombre.Text        := DataSource1.DataSet.FieldByName('NOMBRE').AsString;
  edtDocumento.Text     := DataSource1.DataSet.FieldByName('DOCUMENTO').AsString;
  edtDireccion.Text     := DataSource1.DataSet.FieldByName('DIRECCION').AsString;
  edtTelefono.Text      := DataSource1.DataSet.FieldByName('TELEFONO').AsString;
  cmbEstado.KeyValue    := DataSource1.DataSet.FieldByName('CODESTADO').AsInteger;
  imagenURL             := DataSource1.DataSet.FieldByName('FOTO').AsString;
  if not(VarIsNull(imagenURL) or imagenURL.IsEmpty) then
  begin
    Image1.Picture.LoadFromFile(imagenURL);
  end;
end;

procedure TPagPaciente.edtSearchKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  FPaciente.Buscar('%' + edtSearch.Text + '%');
end;

procedure TPagPaciente.FormCreate(Sender: TObject);
begin
  inherited;
  lblTitulo.Caption := 'Registro de pacientes';
  path              := ExtractFilePath(ParamStr(0));
  edtCodigo.Enabled := false;
  FController       := TController.New;
  FPaciente         := FController.Paciente.DataSource(DataSource1);
  FEstado           := FController.Estado.DataSource(DataSource2);
  prc_estado_inicial;
end;

procedure TPagPaciente.Image1DblClick(Sender: TObject);
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

procedure TPagPaciente.prc_copiar_img_directorio(origen: String);
begin
  imagenURL := path + 'fotos\medico_' + edtNombre.Text + '.jpg';
  CopyFile(PChar(origen), PChar(imagenURL), false);
end;

procedure TPagPaciente.prc_estado_inicial;
begin
  Insercion := True;
  CardPanel1.ActiveCard := Card1;
  edtSearch.Text := '';
  edtCodigo.Text := '';
  edtNombre.Text := '';
  edtDocumento.Text := '';
  edtTelefono.Text := '';
  edtDireccion.Text := '';
  FPaciente.Buscar;
  FEstado.Buscar;
end;

end.
