﻿unit Odontologia.Vistas.Main;

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
  Odontologia.Vistas.Empresa,
  Odontologia.Vistas.Direccion.Pais,
  Odontologia.Vistas.Direccion,
  Odontologia.Vistas.Home,
  Odontologia.Vistas.Producto,
  Odontologia.Vistas.Pedido,
  Odontologia.Vistas.Usuarios;

type
  TPageMain = class(TForm)
    ImageList1: TImageList;
    imgLogo: TImage;
    UserLoginImg: TImage;
    LblNombre1: TLabel;
    LblNombre2: TLabel;
    LblUserLogin: TLabel;
    LblCerrarSesion: TLabel;
    pnlMain: TPanel;
    pnlCentral: TPanel;
    pnlCabecera: TPanel;
    pnlBotonera: TPanel;
    pnlSombraBotoneraCaja: TPanel;
    pnlSombraBotoneraServicio: TPanel;
    pnlSombraBotoneraAgenda: TPanel;
    pnlSombraBotoneraMedico: TPanel;
    pnlSombraBotoneraPaciente: TPanel;
    pnlSombraBotoneraSaldo: TPanel;
    pnlSombraBotoneraInicio: TPanel;
    pnlBotoneraResaltador: TPanel;
    pnlTitulo: TPanel;
    pnlMenuLateralMain: TPanel;
    pnlMenuLateralIco: TPanel;
    pnlIcoConfiguracion: TPanel;
    pnlIcoConfigDiv: TPanel;
    pnlIcoConfigBt01: TPanel;
    pnlIcoConfigBt02: TPanel;
    pnlIcoConfigBt03: TPanel;
    pnlIcoConfigBt04: TPanel;
    pnlIcoDiv03: TPanel;
    pnlIcoDiv02: TPanel;
    pnlIcoDiv05: TPanel;
    pnlIcoDiv04: TPanel;
    pnlIcoDiv01: TPanel;
    pnlIcoFinanciero: TPanel;
    pnlIcoFinanDiv: TPanel;
    pnlIcoFinanBt01: TPanel;
    pnlIcoFinanBt02: TPanel;
    pnlIcoFinanBt04: TPanel;
    pnlIcoFinanBt05: TPanel;
    pnlIcoFinanBt03: TPanel;
    pnlIcoRegistro: TPanel;
    pnlIcoRegisDiv: TPanel;
    pnlIcoRegisBt01: TPanel;
    pnlIcoRegisBt02: TPanel;
    pnlIcoRegisBt03: TPanel;
    pnlIcoRegisBt05: TPanel;
    pnlIcoRegisBt06: TPanel;
    pnlIcoRegisBt07: TPanel;
    pnlIcoRegisBt08: TPanel;
    pnlIcoRegisBt09: TPanel;
    pnlIcoRegisBt11: TPanel;
    pnlIcoRegisBt10: TPanel;
    pnlIcoRegisBt04: TPanel;
    pnlIcoConsulta: TPanel;
    pnlIcoConsDiv: TPanel;
    pnlIcoConsBt01: TPanel;
    pnlIcoConsBt02: TPanel;
    pnlIcoConsBt03: TPanel;
    pnlIcoConsBt04: TPanel;
    pnlIcoConsBt05: TPanel;
    pnlIcoConsBt06: TPanel;
    pnlIcoConsBt07: TPanel;
    pnlIcoSalir: TPanel;
    pnlIcoSalirBt01: TPanel;
    pnlMenuLateralBtn: TPanel;
    pnlMenuLateralConfiguracion: TPanel;
    pnlMenLatConfDiv01: TPanel;
    pnlMenLatConfBtn01: TPanel;
    pnlMenuLateralConsulta: TPanel;
    pnlMenLatConsDiv01: TPanel;
    pnlMenLatConsBtn01: TPanel;
    pnlMenuLateralDiv01: TPanel;
    pnlMenuLateralDiv02: TPanel;
    pnlMenuLateralDiv03: TPanel;
    pnlMenuLateralDiv04: TPanel;
    pnlMenuLateralDiv05: TPanel;
    pnlMenuLateralFinanciero: TPanel;
    pnlMenLatFinDiv01: TPanel;
    pnlMenLatFinBtn01: TPanel;
    pnlMenLatRegDiv01: TPanel;
    pnlMenLatRegBtn01: TPanel;
    pnlMenuLateralSalir: TPanel;
    pnlLogin: TPanel;
    pnlLoginUserDetalle: TPanel;
    pnlNombreEmpresa: TPanel;
    pnlMenuLateralRegistro: TPanel;
    btnOcultarPanelLateral: TSpeedButton;
    ptnPnlBotoneraCaja: TSpeedButton;
    btnPnlBotoneraServicio: TSpeedButton;
    btnPnlBotoneraAgenda: TSpeedButton;
    btnPnlBotoneraMedico: TSpeedButton;
    btnPnlBotoneraPaciente: TSpeedButton;
    btnPnlBotoneraCajaSaldo: TSpeedButton;
    btnMenLatInicio: TSpeedButton;
    btnPnelMenuConfImpresora: TSpeedButton;
    btnPnelMenuConfBKP: TSpeedButton;
    btnPnelMenuConfOpciones: TSpeedButton;
    btnPnelMenuConfExpandir: TSpeedButton;
    btnPnelMenuConsPaciente: TSpeedButton;
    btnPnelMenuConsConsSeguro: TSpeedButton;
    btnPnelMenuConsAgenda: TSpeedButton;
    btnPnelMenuConsEmpresa: TSpeedButton;
    btnPnelMenuConsMedico: TSpeedButton;
    btnPnelMenuConsProveedor: TSpeedButton;
    btnPnelMenuConsExpandir: TSpeedButton;
    btnPnelMenuFinanLanzamiento: TSpeedButton;
    btnPnelMenuFinanListadoCaja: TSpeedButton;
    btnPnelMenuFinanSaldoCaja: TSpeedButton;
    btnPnelMenuFinanHistorial: TSpeedButton;
    btnPnelMenuFinanExpandir: TSpeedButton;
    btnPnelMenuRegPaciente: TSpeedButton;
    btnPnelMenuRegSeguro: TSpeedButton;
    btnPnelMenuRegFuncionario: TSpeedButton;
    btnPnelMenuRegDireccion: TSpeedButton;
    btnPnelMenuRegProducto: TSpeedButton;
    btnPnelMenuRegUsuario: TSpeedButton;
    btnPnelMenuRegAgenda: TSpeedButton;
    btnPnelMenuRegEmpresa: TSpeedButton;
    btnPnelMenuRegMedico: TSpeedButton;
    btnPnelMenuRegProveedor: TSpeedButton;
    btnPnelMenuRegExpandir: TSpeedButton;
    btnMenLatSalir: TSpeedButton;
    btnIcoConfExpand: TSpeedButton;
    btnIcoConfBkp: TSpeedButton;
    btnIcoConfOpc: TSpeedButton;
    btnConfImp: TSpeedButton;
    btnIcoConsExp: TSpeedButton;
    btnIcoConsEmp: TSpeedButton;
    btnIcoConsMedico: TSpeedButton;
    btnIcoConsPac: TSpeedButton;
    btnIcoConsAgenda: TSpeedButton;
    btnIcoConsProv: TSpeedButton;
    btnIcoConsSeg: TSpeedButton;
    btnICoFinExpand: TSpeedButton;
    btnICoFinSaldo: TSpeedButton;
    btnICoFinHistorial: TSpeedButton;
    btnICoFinLanzamiento: TSpeedButton;
    btnICoFinListado: TSpeedButton;
    btnICoRegExpand: TSpeedButton;
    btnICoRegEmp: TSpeedButton;
    btnICoRegMed: TSpeedButton;
    btnICoRegPac: TSpeedButton;
    btnICoRegAgen: TSpeedButton;
    btnICoRegProv: TSpeedButton;
    btnICoRegSeg: TSpeedButton;
    btnICoRegFun: TSpeedButton;
    btnICoRegDir: TSpeedButton;
    btnICoRegProd: TSpeedButton;
    btnICoRegUsu: TSpeedButton;
    btnIcoSalir: TSpeedButton;

    procedure FormCreate(Sender: TObject);
    procedure btnPnelMenuRegDireccionClick(Sender: TObject);
    procedure btnMenLatInicioClick(Sender: TObject);
    procedure btnPnlBotoneraPacienteClick(Sender: TObject);
    procedure btnPnlBotoneraMedicoClick(Sender: TObject);
    procedure btnPnlBotoneraAgendaClick(Sender: TObject);
    procedure btnPnlBotoneraServicioClick(Sender: TObject);
    procedure ptnPnlBotoneraCajaClick(Sender: TObject);
    procedure btnPnlBotoneraCajaSaldoClick(Sender: TObject);
    procedure btnPnelMenuRegExpandirClick(Sender: TObject);
    procedure btnPnelMenuFinanExpandirClick(Sender: TObject);
    procedure btnPnelMenuConsExpandirClick(Sender: TObject);
    procedure btnPnelMenuConfExpandirClick(Sender: TObject);
    procedure btnPnelMenuRegProductoClick(Sender: TObject);
    procedure btnOcultarPanelLateralClick(Sender: TObject);
    procedure btnPnelMenuRegEmpresaClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnMenLatSalirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPnelMenuRegUsuarioClick(Sender: TObject);

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
  PagDireccion  : TPagDireccion;
  PagEmpresa    : TPagEmpresa;
  PagHome       : TPagHome;
  PageMain      : TPageMain;
  PagProducto   : TPagProducto;
  PagPedido     : TPagPedido;
  Pagusuario    : TPagUsuario;
  nombre_comp   : String;
  log           : Integer;

implementation

{$R *.dfm}

uses Odontologia.Vistas.Login;

procedure TPageMain.btnMenLatInicioClick(Sender: TObject);
begin
  PagHome := TPagHome.Create(Self);
  prc_abrir_ventana(Sender , PagHome);
  prc_marcar_boton_activo(TComponent(Sender) as TSpeedButton, true);
  prc_mover_resaltador(PnlSombraBotoneraInicio);

end;

procedure TPageMain.btnPnelMenuConfExpandirClick(Sender: TObject);
begin
  prc_expandir_menu(180, TComponent(Sender) as TSpeedButton);
  prc_marcar_boton_activo(TComponent(Sender) as TSpeedButton, true);
end;

procedure TPageMain.btnPnelMenuConsExpandirClick(Sender: TObject);
begin
  prc_expandir_menu(315, TComponent(Sender) as TSpeedButton);
  prc_marcar_boton_activo(TComponent(Sender) as TSpeedButton, true);
end;

procedure TPageMain.btnPnelMenuFinanExpandirClick(Sender: TObject);
begin
  prc_expandir_menu(225, TComponent(Sender) as TSpeedButton);
  prc_marcar_boton_activo(TComponent(Sender) as TSpeedButton, true);
end;

procedure TPageMain.btnPnelMenuRegDireccionClick(Sender: TObject);
begin
  PagDireccion := TPagDireccion.Create(Self);
  prc_abrir_ventana(Sender , PagDireccion);
end;

procedure TPageMain.btnPnelMenuRegEmpresaClick(Sender: TObject);
begin
  PagEmpresa := TPagEmpresa.Create(Self);
  prc_abrir_ventana(Sender , PagEmpresa);
end;

procedure TPageMain.btnPnelMenuRegExpandirClick(Sender: TObject);
var
  largo: Integer;
begin
  prc_expandir_menu(495, TComponent(Sender) as TSpeedButton);
  prc_marcar_boton_activo(TComponent(Sender) as TSpeedButton, true);
end;

procedure TPageMain.btnPnelMenuRegProductoClick(Sender: TObject);
begin
  Pagproducto := TPagProducto.Create(Self);
  prc_abrir_ventana(Sender , PagProducto);
end;

procedure TPageMain.btnPnelMenuRegUsuarioClick(Sender: TObject);
begin
  PagUsuario := TPagUsuario.Create(Self);
  prc_abrir_ventana(Sender , PagUsuario);
end;

procedure TPageMain.btnPnlBotoneraAgendaClick(Sender: TObject);
begin
  prc_marcar_boton_activo(TComponent(Sender) as TSpeedButton, true);
  prc_mover_resaltador(PnlSombraBotoneraAgenda);
end;

procedure TPageMain.ptnPnlBotoneraCajaClick(Sender: TObject);
begin
  prc_marcar_boton_activo(TComponent(Sender) as TSpeedButton, true);
  prc_mover_resaltador(PnlSombraBotoneraCaja);
end;

procedure TPageMain.btnPnlBotoneraCajaSaldoClick(Sender: TObject);
begin
  prc_marcar_boton_activo(TComponent(Sender) as TSpeedButton, true);
  prc_mover_resaltador(PnlSombraBotoneraSaldo);
end;

procedure TPageMain.btnPnlBotoneraMedicoClick(Sender: TObject);
begin
  prc_marcar_boton_activo(TComponent(Sender) as TSpeedButton, true);
  prc_mover_resaltador(PnlSombraBotoneraMedico);
end;

procedure TPageMain.btnPnlBotoneraPacienteClick(Sender: TObject);
begin
  prc_marcar_boton_activo(TComponent(Sender) as TSpeedButton, true);
  prc_mover_resaltador(PnlSombraBotoneraPaciente);
end;

procedure TPageMain.btnPnlBotoneraServicioClick(Sender: TObject);
begin
  prc_marcar_boton_activo(TComponent(Sender) as TSpeedButton, true);
  prc_mover_resaltador(PnlSombraBotoneraServicio);
end;

procedure TPageMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if MessageDlg('Está seguro de cerrar la aplicación?', mtConfirmation, [mbOk, mbCancel], 0) = mrOk then
    begin
    CanClose := True;
    end else
    begin
    CanClose := False;
    end;
end;

procedure TPageMain.FormCreate(Sender: TObject);
begin
  PagHome         := TPagHome.Create(Self);
  PagHome.Parent  := pnlCentral;
  PagHome.Show;
  nombre_comp     := '';
  prc_expandir_menu(45, BtnPnlBotoneraPaciente);
  prc_marcar_boton_activo(BtnMenLatInicio, false);
  BtnMenLatInicio.Click;
end;

procedure TPageMain.FormShow(Sender: TObject);
begin
  PagLogin := TpagLogin.Create(Self);
  paglogin.ShowModal;
  log := paglogin.log;
  if log=0 then
    begin
      Application.Terminate;
    end;
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
        // Verifica que el panel est� asociado al boton pasado como parametro
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
        // Verifica que el panel est� asociado al boton pasado como parametro
        if (PageMain.Components[i] as TPanel).Tag = (boton.Tag + 100) then
        begin
          // Muestra el panel asociado al boton
          (PageMain.Components[i] as TPanel).Color := clGray;
        end
        else
          (PageMain.Components[i] as TPanel).Color := clSilver;
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
        (PageMain.Components[i] as TPanel).Color := clSilver;
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

procedure TPageMain.btnMenLatSalirClick(Sender: TObject);
begin
  if MessageDlg('Está seguro de cerrar la aplicación?', mtConfirmation, [mbOk, mbCancel], 0) = mrOk then
    Application.Terminate;
end;

procedure TPageMain.btnOcultarPanelLateralClick(Sender: TObject);
var
  i: Integer;
begin
{    if PnlMenuLateralMain.Width = 50 then
    begin
    for i := 50 to 200 do
    PnlMenuLateralMain.Width := i;
    end
    else
    begin
    for i := 200 downto 50 do
    PnlMenuLateralMain.Width := i;
    end;
}
  if PnlMenuLateralMain.Width = 50 then
  begin
    PnlMenuLateralMain.Width := 200;
  end
  else
  begin
    PnlMenuLateralMain.Width := 50;
  end;

end;


end.