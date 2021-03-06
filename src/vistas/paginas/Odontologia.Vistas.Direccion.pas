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
    PnlCentral2: TPanel;
    PnlCentral1: TPanel;
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
  PagDireccion: TPagDireccion;
  PagDepartamento : TPagDepartamento;
  PagPais : TPagPais;

implementation

uses
  Odontologia.Vistas.Direccion.Ciudad, Odontologia.Vista.Estilos;

{$R *.dfm}

procedure TPagDireccion.btnPaisClick(Sender: TObject);
begin
  PagPais := TPagPais.Create(Self);
  pcr_abrir_sub_ventana(PagPais);
end;

procedure TPagDireccion.btnCiudadClick(Sender: TObject);
begin
  PagCiudad := TPagCiudad.Create(Self);
  pcr_abrir_sub_ventana(PagCiudad);
end;

procedure TPagDireccion.btnDepartamentoClick(Sender: TObject);
begin
  PagDepartamento := TPagDepartamento.Create(Self);
  pcr_abrir_sub_ventana(PagDepartamento);
end;

procedure TPagDireccion.FormCreate(Sender: TObject);
begin
  CardPanel1.ActiveCard := Card1;
  PnlCentral1.Color     := COLOR_BACKGROUND;
  Self.Font.Name        := FONT_NAME;
  self.Font.Size        := FONT_H7;
  self.Font.Color       := FONT_COLOR;
end;

procedure TPagDireccion.pcr_abrir_sub_ventana(TPage : TForm);
begin
  CardPanel1.ActiveCard := Card2;
  Tpage.Parent          := PnlCentral2;
  Tpage.Show;
end;

end.
