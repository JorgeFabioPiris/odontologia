unit Odontologia.Vistas.Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TPagLogin = class(TForm)
    PagLogin: TPanel;
    edtLogin: TEdit;
    edtPassword: TEdit;
    edtEmpresa: TEdit;
    btnIngresar: TSpeedButton;
    btnSalir: TSpeedButton;
    procedure btnIngresarClick(Sender: TObject);
    procedure btnSalirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    log                     : Integer;
    vGlb_nombre_usuario     : String;
    vGlb_avatar_usuario_url : String;
  end;

var
  PagLogin                : TPagLogin;

implementation

{$R *.dfm}

uses Odontologia.Vistas.Main;

procedure TPagLogin.btnIngresarClick(Sender: TObject);
var
  PagMain: TPageMain;

begin
  log := 1;
  vGlb_nombre_usuario     := 'ADMIN';
  vGlb_avatar_usuario_url := 'D:\SGOdontologia\fotos\avatar_ADMIN.jpg';
  close;
end;

procedure TPagLogin.btnSalirClick(Sender: TObject);
begin
  log := 0;
  close;
end;

end.
