unit Odontologia.Vistas.Main;
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
  Odontologia.Vistas.Medico,
  Odontologia.Vistas.PAciente,
  Odontologia.Vistas.Producto,
  Odontologia.Vistas.Pedido,
  Odontologia.Vistas.Usuarios,
  Odontologia.Vista.Estilos;
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
    pnlCabeceraBotonera: TPanel;
    pnlSombraBotoneraCaja: TPanel;
    pnlSombraBotoneraServicio: TPanel;
    pnlSombraBotoneraAgenda: TPanel;
    pnlSombraBotoneraMedico: TPanel;
    pnlSombraBotoneraPaciente: TPanel;
    pnlSombraBotoneraSaldo: TPanel;
    pnlSombraBotoneraInicio: TPanel;
    pnlBotoneraResaltador: TPanel;
    pnlCabeceraTitulo: TPanel;
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
    pnlCabeceraTituloLogin: TPanel;
    pnlLoginUserDetalle: TPanel;
    pnlCabeceraTituloNombreEmpresa: TPanel;
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
    Label1: TLabel;
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
    procedure btnPnelMenuRegAgendaClick(Sender: TObject);
    procedure LblCerrarSesionClick(Sender: TObject);
    procedure LblCerrarSesionMouseLeave(Sender: TObject);
    procedure LblCerrarSesionMouseEnter(Sender: TObject);
    procedure btnPnelMenuRegMedicoClick(Sender: TObject);
    procedure btnPnelMenuRegPacienteClick(Sender: TObject);

  private
    { Private declarations }
    procedure prc_expandir_menu(largo_panel: Integer; boton: TSpeedButton);
    procedure prc_mover_resaltador(panel: TPanel);
    procedure prc_marcar_boton_activo(boton: TSpeedButton; marcar: Boolean);
    procedure prc_abrir_ventana(Sender: TObject ; Tpage : TForm);
    procedure prc_mostrar_login;

  public
    { Public declarations }
   end;
var
  PageMain                : TPageMain;
  PagNueva                : TForm;
  PagActual               : TForm;
  log                     : Integer;
  nombre_comp             : String;
  vGlb_usuario_id         : integer;
  vGlb_usuario_login      : String;
  vGlb_usuario_avatar_url : String;
  vGlb_empresa_id         : Integer;
  vGlb_empresa_login      : String;
  modoEdicion             : Boolean;
implementation
{$R *.dfm}
uses Odontologia.Vistas.Login, Odontologia.Vistas.Agenda;
procedure TPageMain.btnMenLatInicioClick(Sender: TObject);
begin
  PagActual := TPagHome.Create(Self);
  prc_abrir_ventana(Sender , PagActual);
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
procedure TPageMain.btnPnelMenuRegAgendaClick(Sender: TObject);
begin
  PagNueva := TPagAgenda.Create(Self);
  prc_abrir_ventana(Sender , PagNueva);
end;

procedure TPageMain.btnPnelMenuRegDireccionClick(Sender: TObject);
begin
  PagNueva := TPagDireccion.Create(Self);
  prc_abrir_ventana(Sender , PagNueva);
end;
procedure TPageMain.btnPnelMenuRegEmpresaClick(Sender: TObject);
begin
  PagNueva := TPagEmpresa.Create(Self);
  prc_abrir_ventana(Sender , PagNueva);
end;
procedure TPageMain.btnPnelMenuRegExpandirClick(Sender: TObject);
var
  largo: Integer;
begin
  prc_expandir_menu(495, TComponent(Sender) as TSpeedButton);
  prc_marcar_boton_activo(TComponent(Sender) as TSpeedButton, true);
end;
procedure TPageMain.btnPnelMenuRegMedicoClick(Sender: TObject);
begin
  PagNueva := TPagMedico.Create(Self);
  prc_abrir_ventana(Sender , PagNueva);
end;

procedure TPageMain.btnPnelMenuRegPacienteClick(Sender: TObject);
begin
  PagNueva := TPagPaciente.Create(Self);
  prc_abrir_ventana(Sender , PagNueva);
end;

procedure TPageMain.btnPnelMenuRegProductoClick(Sender: TObject);
begin
  PagNueva := TPagProducto.Create(Self);
  prc_abrir_ventana(Sender , PagNueva);
end;
procedure TPageMain.btnPnelMenuRegUsuarioClick(Sender: TObject);
begin
  PagNueva := TPagUsuario.Create(Self);
  prc_abrir_ventana(Sender , PagNueva);
end;
procedure TPageMain.btnPnlBotoneraAgendaClick(Sender: TObject);
begin
  PagNueva := TPagAgenda.Create(Self);
  prc_abrir_ventana(Sender , PagNueva);
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
  PagNueva := TPagMedico.Create(Self);
  prc_abrir_ventana(Sender , PagNueva);
  prc_marcar_boton_activo(TComponent(Sender) as TSpeedButton, true);
  prc_mover_resaltador(PnlSombraBotoneraMedico);
end;
procedure TPageMain.btnPnlBotoneraPacienteClick(Sender: TObject);
begin
  PagNueva := TPagPaciente.Create(Self);
  prc_abrir_ventana(Sender , PagNueva);prc_marcar_boton_activo(TComponent(Sender) as TSpeedButton, true);
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
  pnlCentral.Color                      := COLOR_BACKGROUND;
  pnlCabecera.Color                     := COLOR_BACKGROUND_TOP;
  pnlCabeceraTitulo.Color               := COLOR_BACKGROUND_TOP;
  pnlCabeceraTituloLogin.Color          := COLOR_BACKGROUND_TOP;
  pnlCabeceraTituloNombreEmpresa.Color  := COLOR_BACKGROUND_TOP;
  Self.font.Color                       := FONT_COLOR;
  Self.font.Size                        := FONT_H7;
  nombre_comp                           := '';
  modoEdicion                           := False;
  prc_expandir_menu(45, BtnPnlBotoneraPaciente);
  prc_marcar_boton_activo(BtnMenLatInicio, false);
  BtnMenLatInicio.Click;
end;
procedure TPageMain.FormShow(Sender: TObject);
begin
  prc_mostrar_login;
end;
procedure TPageMain.LblCerrarSesionClick(Sender: TObject);
begin
  prc_mostrar_login;
end;

procedure TPageMain.LblCerrarSesionMouseEnter(Sender: TObject);
begin
  LblCerrarSesion.font.Color := FONT_COLOR2;
end;

procedure TPageMain.LblCerrarSesionMouseLeave(Sender: TObject);
begin
  LblCerrarSesion.font.Color := FONT_COLOR;
end;

procedure TPageMain.prc_expandir_menu(largo_panel: Integer; boton: TSpeedButton);
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
procedure TPageMain.prc_marcar_boton_activo(boton: TSpeedButton; marcar: Boolean);
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
  if modoEdicion then
  begin
    ShowMessage('Antes de cerrar esta ventana debe guardar o descartar los cambios');
  end else
  begin
    PagActual.Close;
    PagActual := TPage;
    PagActual.Parent := pnlCentral;
    PagActual.Show;
    prc_expandir_menu(45, TComponent(Sender) as TSpeedButton);
  end;
end;

procedure TPageMain.prc_mostrar_login;
begin
  PagLogin := TpagLogin.Create(Self);
  paglogin.ShowModal;
  log := paglogin.log;
  if log = 0 then
  begin
    Application.Terminate;
  end;
  vGlb_usuario_login := PagLogin.vGlb_usuario_nombre;
  vGlb_usuario_avatar_url := Paglogin.vGlb_avatar_usuario_url;
  LblUserLogin.Caption := vGlb_usuario_login;
  UserLoginImg.Picture.LoadFromFile(vGlb_usuario_avatar_url);
  PageMain.Caption                      := 'SGCLINICA' + vGlb_empresa_login;
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
