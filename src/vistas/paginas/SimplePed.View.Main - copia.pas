unit SimplePed.View.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ImgList,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage,
  SimplePed.View.Home,
  SimplePed.View.Direccion;

type
  TPageMain = class(TForm)
    pnlMain: TPanel;
    PnlMenuLateral: TPanel;
    PnlMenuConfiguracionDiv01: TPanel;
    PnelSombraMenuConf: TPanel;
    PnlMenuLateralConsulta: TPanel;
    PnlMenuConsultaDiv01: TPanel;
    PnelSombraMenuCons: TPanel;
    PnlMenuLateralDiv01: TPanel;
    PnlMenuLateralDiv02: TPanel;
    PnlMenuLateralDiv03: TPanel;
    PnlMenuLateralDiv04: TPanel;
    PnlMenuLateralDiv05: TPanel;
    PnlMenuLateralFinanciero: TPanel;
    PnlMenuFinancieroDiv01: TPanel;
    PnelSombraMenuFinan: TPanel;
    PnlMenuLateralRegistro: TPanel;
    PnlMenuRegistroDiv01: TPanel;
    PnelSombraMenuReg: TPanel;
    pnlCentral: TPanel;
    pnlCabecera: TPanel;
    PnlBotonera: TPanel;
    PnlSombraBotoneraCaja: TPanel;
    PnlSombraBotoneraServicio: TPanel;
    PnlSombraBotoneraAgenda: TPanel;
    PnlSombraBotoneraMedico: TPanel;
    PnlSombraBotoneraPaciente: TPanel;
    PnlSombraBotoneraSaldo: TPanel;
    PnlSombraBotoneraInicio: TPanel;
    PnlBotoneraResaltador: TPanel;
    PnlTitulo: TPanel;
    PnlMenuLateralConfiguracion: TPanel;
    BtnMenLatSalir: TSpeedButton;
    BtnPnelMenuConfImpresora: TSpeedButton;
    BtnPnelMenuConfBKP: TSpeedButton;
    BtnPnelMenuConfOpciones: TSpeedButton;
    BtnPnelMenuConfExpandir: TSpeedButton;
    BtnPnelMenuConsPaciente: TSpeedButton;
    BtnPnelMenuConsConsSeguro: TSpeedButton;
    BtnPnelMenuConsAgenda: TSpeedButton;
    BtnPnelMenuConsEmpresa: TSpeedButton;
    BtnPnelMenuConsMedico: TSpeedButton;
    BtnPnelMenuConsProveedor: TSpeedButton;
    BtnPnelMenuConsExpandir: TSpeedButton;
    BtnPnelMenuFinanLanzamiento: TSpeedButton;
    BtnPnelMenuFinanListadoCaja: TSpeedButton;
    BtnPnelMenuFinanSaldoCaja: TSpeedButton;
    BtnPnelMenuFinanHistorial: TSpeedButton;
    BtnPnelMenuFinanExpandir: TSpeedButton;
    BtnPnelMenuRegPaciente: TSpeedButton;
    BtnPnelMenuRegSeguro: TSpeedButton;
    BtnPnelMenuRegFuncionario: TSpeedButton;
    BtnPnelMenuRegDireccion: TSpeedButton;
    BtnPnelMenuRegProducto: TSpeedButton;
    BtnPnelMenuRegUsuario: TSpeedButton;
    BtnPnelMenuRegAgenda: TSpeedButton;
    BtnPnelMenuRegEmpresa: TSpeedButton;
    BtnPnelMenuRegMedico: TSpeedButton;
    BtnPnelMenuRegProveedor: TSpeedButton;
    BtnPnelMenuRegExpandir: TSpeedButton;
    BtnPnlBotoneraCaja: TSpeedButton;
    BtnPnlBotoneraServicio: TSpeedButton;
    BtnPnlBotoneraAgenda: TSpeedButton;
    BtnPnlBotoneraMedico: TSpeedButton;
    BtnPnlBotoneraPaciente: TSpeedButton;
    BtnPnlBotoneraCajaSaldo: TSpeedButton;
    BtnMenLatInicio: TSpeedButton;

    lblTitulo: TLabel;

    Image1: TImage;
    ImageList1: TImageList;

    procedure FormCreate(Sender: TObject);
    procedure BtnPnelMenuRegDireccionClick(Sender: TObject);
    procedure BtnMenLatInicioClick(Sender: TObject);
    procedure BtnPnlBotoneraPacienteClick(Sender: TObject);
    procedure BtnPnlBotoneraMedicoClick(Sender: TObject);
    procedure BtnPnlBotoneraAgendaClick(Sender: TObject);
    procedure BtnPnlBotoneraServicioClick(Sender: TObject);
    procedure BtnPnlBotoneraCajaClick(Sender: TObject);
    procedure BtnPnlBotoneraCajaSaldoClick(Sender: TObject);
    procedure BtnPnelMenuRegExpandirClick(Sender: TObject);
    procedure BtnPnelMenuFinanExpandirClick(Sender: TObject);
    procedure BtnPnelMenuConsExpandirClick(Sender: TObject);
    procedure BtnPnelMenuConfExpandirClick(Sender: TObject);
  private
    { Private declarations }
    procedure prc_expandir_menu(largo_panel: Integer; boton: TSpeedButton);
    procedure prc_mover_resaltador(panel: TPanel);
    procedure prc_marcar_boton_activo(boton: TSpeedButton; marcar: Boolean);
    procedure prc_abrir_ventana(Sender: TObject ; Tpage : TForm);

  public
    { Public declarations }
  end;

var
  PageMain      : TPageMain;
  PagHome       : TPagHome;
  PagDireccion  : TPagDireccion;
  nombre_comp   : String;

implementation

{$R *.dfm}

procedure TPageMain.BtnMenLatInicioClick(Sender: TObject);
begin
  prc_marcar_boton_activo(TComponent(Sender) as TSpeedButton, true);
  prc_mover_resaltador(PnlSombraBotoneraInicio);

end;

procedure TPageMain.BtnPnelMenuConfExpandirClick(Sender: TObject);
var
  largo: Integer;
begin
  prc_expandir_menu(180, TComponent(Sender) as TSpeedButton);
end;

procedure TPageMain.BtnPnelMenuConsExpandirClick(Sender: TObject);
var
  largo: Integer;
begin
  prc_expandir_menu(315, TComponent(Sender) as TSpeedButton);
end;

procedure TPageMain.BtnPnelMenuFinanExpandirClick(Sender: TObject);
var
  largo: Integer;
begin
  prc_expandir_menu(225, TComponent(Sender) as TSpeedButton);
end;

procedure TPageMain.BtnPnelMenuRegDireccionClick(Sender: TObject);
begin
  PagDireccion := TPagDireccion.Create(Self);
  prc_abrir_ventana(Sender , PagDireccion);
end;

procedure TPageMain.BtnPnelMenuRegExpandirClick(Sender: TObject);
var
  largo: Integer;
begin
  prc_expandir_menu(495, TComponent(Sender) as TSpeedButton);
end;

procedure TPageMain.BtnPnlBotoneraAgendaClick(Sender: TObject);
begin
  prc_marcar_boton_activo(TComponent(Sender) as TSpeedButton, true);
  prc_mover_resaltador(PnlSombraBotoneraAgenda);
end;

procedure TPageMain.BtnPnlBotoneraCajaClick(Sender: TObject);
begin
  prc_marcar_boton_activo(TComponent(Sender) as TSpeedButton, true);
  prc_mover_resaltador(PnlSombraBotoneraCaja);
end;

procedure TPageMain.BtnPnlBotoneraCajaSaldoClick(Sender: TObject);
begin
  prc_marcar_boton_activo(TComponent(Sender) as TSpeedButton, true);
  prc_mover_resaltador(PnlSombraBotoneraSaldo);
end;

procedure TPageMain.BtnPnlBotoneraMedicoClick(Sender: TObject);
begin
  prc_marcar_boton_activo(TComponent(Sender) as TSpeedButton, true);
  prc_mover_resaltador(PnlSombraBotoneraMedico);
end;

procedure TPageMain.BtnPnlBotoneraPacienteClick(Sender: TObject);
begin
  prc_marcar_boton_activo(TComponent(Sender) as TSpeedButton, true);
  prc_mover_resaltador(PnlSombraBotoneraPaciente);
end;

procedure TPageMain.BtnPnlBotoneraServicioClick(Sender: TObject);
begin
  prc_marcar_boton_activo(TComponent(Sender) as TSpeedButton, true);
  prc_mover_resaltador(PnlSombraBotoneraServicio);
end;

procedure TPageMain.FormCreate(Sender: TObject);
begin
  PagHome := TPagHome.Create(Self);
  PagHome.Parent := pnlCentral;
  PagHome.Show;
  nombre_comp := '';
  prc_expandir_menu(45, BtnPnlBotoneraPaciente);
  prc_marcar_boton_activo(BtnMenLatInicio, false);
  BtnMenLatInicio.Click;
end;

procedure TPageMain.prc_expandir_menu(largo_panel: Integer;
  boton: TSpeedButton);
var
  i: Integer;
  expandir: Boolean;
begin

  if nombre_comp <> (boton).GetNamePath then
  begin
    expandir := true;
  end
  else
  begin
    expandir := false;
  end;

  if expandir then
  begin
    // Recorrer los componentes del formulario
    for i := 0 to PageMain.ComponentCount - 1 do
    begin
      // Verifica si el componente es un panel
      if (PageMain.Components[i] is TPanel) and
        ((PageMain.Components[i] as TPanel).Tag <> 0) then
      begin
        // Verifica que el panel est? asociado al boton pasado como parametro
        if (PageMain.Components[i] as TPanel).Tag = boton.Tag then
        begin
          // Muestra el panel asociado al boton
          (PageMain.Components[i] as TPanel).Height := largo_panel;
        end
        else
          (PageMain.Components[i] as TPanel).Height := 45;
      end;

    end;
    nombre_comp := boton.GetNamePath
  end
  else // fin de expandir
  // Recorrer los componentes del formulario
  begin
    for i := 0 to PageMain.ComponentCount - 1 do
    begin
      // Verifica si el componente es un panel
      if (PageMain.Components[i] is TPanel) and
        ((PageMain.Components[i] as TPanel).Tag <> 0) then
      begin
        (PageMain.Components[i] as TPanel).Height := 45;
      end;
    end;
    nombre_comp := ''
  end;
end;

procedure TPageMain.prc_marcar_boton_activo(boton: TSpeedButton;
  marcar: Boolean);
var
  i: Integer;
begin
  PnlBotoneraResaltador.Visible := false;
  if marcar then // En caso de que el parametro sea verdadero
  begin
    // Recorrer los componentes del formulario
    for i := 0 to PageMain.ComponentCount - 1 do
    begin
      // Verifica si el componente es un Panel y si su Tag esta en el rango deseado
      if (PageMain.Components[i] is TPanel) and
        ((PageMain.Components[i] as TPanel).Tag > 100) then
      begin
        // Verifica que el panel est? asociado al boton pasado como parametro
        if (PageMain.Components[i] as TPanel).Tag = (boton.Tag + 100) then
        begin
          // Muestra el panel asociado al boton
          (PageMain.Components[i] as TPanel).Color := clGray;
        end
        else
          (PageMain.Components[i] as TPanel).Color := clWhite;
      end;

    end;

  end
  else // En caso del parametro ser falso
  // Recorrer los componentes del formulario
  begin
    for i := 0 to PageMain.ComponentCount - 1 do
    begin
      // Verifica si el componente es un Panel y si su Tag esta en el rango deseado
      if (PageMain.Components[i] is TPanel) and
        ((PageMain.Components[i] as TPanel).Tag > 100) then
      begin
        (PageMain.Components[i] as TPanel).Color := clWhite;
      end;
    end;
  end;
end;

procedure TPageMain.prc_abrir_ventana(Sender: TObject ; TPage : TForm);
begin
  TPage.Parent := pnlCentral;
  TPage.Show;
  prc_expandir_menu(45, TComponent(Sender) as TSpeedButton);
end;

procedure TPageMain.prc_mover_resaltador(panel: TPanel);
begin
  PnlBotoneraResaltador.Visible := true;
  nombre_comp := '';
  prc_expandir_menu(45, BtnPnlBotoneraPaciente);
  PnlBotoneraResaltador.Left := panel.Left;
  PnlBotoneraResaltador.Width := panel.Width;
end;

end.
