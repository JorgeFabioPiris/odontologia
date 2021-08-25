unit Odontologia.Vistas.Direccion;

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
  Vcl.ExtCtrls,
  Vcl.Buttons,
  Vcl.WinXPanels,
  Odontologia.Vistas.Direccion.Pais,
  Odontologia.Vistas.Direccion.Departamento;

type
  TPagDireccion = class(TForm)
    CardPanel1: TCardPanel;
    Card1: TCard;
    btnPais: TSpeedButton;
    btnDepartamento: TSpeedButton;
    btnCiudad: TSpeedButton;
    Card2: TCard;
    PnlCentral: TPanel;
    procedure btnPaisClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnDepartamentoClick(Sender: TObject);
    procedure btnCiudadClick(Sender: TObject);
  private
    procedure pcr_abrir_sub_ventana(TPage : TForm);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagDireccion  : TPagDireccion;
  PagActiva     : TForm;

implementation

uses
  Odontologia.Vistas.Direccion.Ciudad, Odontologia.Vista.Estilos;

{$R *.dfm}

procedure TPagDireccion.btnPaisClick(Sender: TObject);
begin
  PagActiva := TPagPais.Create(Self);
  pcr_abrir_sub_ventana(PagActiva);
end;

procedure TPagDireccion.btnCiudadClick(Sender: TObject);
begin
  PagActiva := TPagCiudad.Create(Self);
  pcr_abrir_sub_ventana(PagActiva);
end;

procedure TPagDireccion.btnDepartamentoClick(Sender: TObject);
begin
  PagActiva := TPagDepartamento.Create(Self);
  pcr_abrir_sub_ventana(PagActiva);
end;

procedure TPagDireccion.FormCreate(Sender: TObject);
begin
  CardPanel1.ActiveCard := Card1;
  Self.Font.Name := FONT_NAME;
  self.Font.Size := FONT_H7;
  self.Font.Color := FONT_COLOR;
end;

procedure TPagDireccion.pcr_abrir_sub_ventana(TPage : TForm);
begin
  CardPanel1.ActiveCard := Card2;
  Tpage.Parent := PnlCentral;
  Tpage.Show;
end;

end.
