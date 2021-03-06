unit Odontologia.Vistas.Login;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Buttons,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.DBCtrls,
  Odontologia.Vistas.Main,
  Odontologia.Vista.Estilos, Data.DB,
  Odontologia.Controlador.Empresa.Interfaces,
  Odontologia.Controlador.Usuario.Interfaces,
  Odontologia.Controlador,
  Odontologia.Controlador.Interfaces, Vcl.WinXPanels, Vcl.Imaging.pngimage;

type
  TPagLogin = class(TForm)
    PagLogin: TPanel;
    edtLogin: TEdit;
    edtPassword: TEdit;
    btnIngresar: TSpeedButton;
    btnSalir: TSpeedButton;
    cmbEmpresa: TDBLookupComboBox;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    PnlLogo: TPanel;
    PnlFormulario: TPanel;
    PnlBotones: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    StackPanel1: TStackPanel;
    imgLogo: TImage;
    PnlLogoNombreEmpresa: TPanel;
    LblNombre1: TLabel;
    LblNombre2: TLabel;
    procedure btnIngresarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FController : iController;
    FEmpresa    : iControllerEmpresa;
    FUsuario    : iControllerUsuario;
  public
    { Public declarations }
    log: Integer;
    vGlb_usuario_nombre: String;
    vGlb_avatar_usuario_url: String;
  end;

var
  PagLogin: TPagLogin;

implementation

{$R *.dfm}

procedure TPagLogin.btnIngresarClick(Sender: TObject);
var
  PagMain: TPageMain;
begin

  if edtLogin.Text = '' then
  begin
    ShowMessage('Debe ingresar un usuario');
    edtLogin.SetFocus;
  end else
  if edtPassword.Text = '' then
  begin
    ShowMessage('Debe ingresar una clave');
    edtPassword.SetFocus;
  end else
  begin
    FUsuario.Buscar(edtLogin.Text, edtPassword.Text, DataSource2.DataSet.FieldByName('CODIGO').AsInteger);
    if DataSource1.DataSet.FieldByName('USU_LOGIN').AsString = '' then
    begin
       ShowMessage('No se encontro el usuario, verifique sus credenciales');
    end else
    begin
      if DataSource1.DataSet.FieldByName('USU_COD_ESTADO').AsInteger = 2 then
      begin
        ShowMessage('El usuario está inactivo');
        edtLogin.SetFocus;
      end else
      begin
        log                     := 1;
        vGlb_usuario_nombre     := DataSource1.DataSet.FieldByName('USU_LOGIN').AsString;
        vGlb_avatar_usuario_url := DataSource1.DataSet.FieldByName('USU_FOTO').AsString;
        close;
      end;
    end;

  end;
end;

procedure TPagLogin.btnSalirClick(Sender: TObject);
begin
  log := 0;
  close;
end;

procedure TPagLogin.FormCreate(Sender: TObject);
begin
  Self.Font.Name              := FONT_NAME;
  self.Font.Size              := FONT_H6;
  Self.Font.Color             := FONT_COLOR;
  FController                 := TController.New;
  FEmpresa                    := FController.Empresa.DataSource(DataSource2);
  FUsuario                    := FController.Usuario.DataSource(DataSource1);
  FEmpresa.buscar;
  cmbEmpresa.KeyValue         := 1;

  PnlLogo.Color               := COLOR_BACKGROUND_TOP;
  PnlLogoNombreEmpresa.Color  := COLOR_BACKGROUND_TOP;
  PnlFormulario.Color         := COLOR_BACKGROUND;
  StackPanel1.Color           := COLOR_BACKGROUND;
  PnlBotones.Color            := COLOR_BACKGROUND_DESTAK;

  edtLogin.Font.Size          := FONT_H5;
  edtPassword.Font.Size       := FONT_H5;
  cmbEmpresa.Font.Size        := FONT_H5;
end;

procedure TPagLogin.FormShow(Sender: TObject);
begin
  edtLogin.SetFocus;
end;

end.
