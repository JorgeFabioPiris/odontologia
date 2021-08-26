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
  Odontologia.Controlador.Interfaces;

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
    procedure btnIngresarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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
  log                     := 1;
  vGlb_usuario_nombre     := 'ADMIN';
  vGlb_avatar_usuario_url := 'D:\SGOdontologia\fotos\avatar_ADMIN.jpg';
  close;
end;

procedure TPagLogin.btnSalirClick(Sender: TObject);
begin
  log := 0;
  close;
end;

procedure TPagLogin.FormCreate(Sender: TObject);
begin
  FController         := TController.New;
  FEmpresa            := FController.Empresa.DataSource(DataSource2);
  FUsuario            := FController.Usuario.DataSource(DataSource1);
  FEmpresa.buscar;
  cmbEmpresa.KeyValue := 1;
  Self.Font.Name      := FONT_NAME;
end;

end.
