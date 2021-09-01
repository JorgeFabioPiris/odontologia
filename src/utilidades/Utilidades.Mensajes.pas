unit Utilidades.Mensajes;

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
  Vcl.Imaging.pngimage,
  Vcl.StdCtrls, utilidades;

type
  TPagMensajes = class(TForm)
    pnlFondo: TPanel;
    lblDescripcion: TLabel;
    pnlBotonConfirmacion: TPanel;
    btnSi: TSpeedButton;
    lblTitulo: TLabel;
    pnlCabecera: TPanel;
    pnlBotonCancelar: TPanel;
    btnNo: TSpeedButton;
    Shape1: TShape;
    imgIcono: TImage;
    lblTituloVentana: TLabel;
    procedure btn_naoClick(Sender: TObject);
    procedure btn_simClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    sTitulo, sMensaje, sIcono, sTipo : String;
    bRespuestaMensaje :boolean;{ Public declarations }
  end;

var
  PagMensajes: TPagMensajes;


implementation

{$R *.dfm}

procedure TPagMensajes.btn_simClick(Sender: TObject);
begin
  //ATRIBUI SIM A VARIAVEL DE RESPOSTA
  bRespuestaMensaje := True;

  //FECHA O FORMULARIO
  Close;
end;

procedure TPagMensajes.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //SE A TECLA DIGITADA ENTER
  if key = VK_RETURN then
    btn_simClick( Self )
  else
  //SE A TECLA DIGITADA ESC
  if key = VK_ESCAPE then
    btn_naoClick( Self );

end;

procedure TPagMensajes.FormShow(Sender: TObject);
begin
  //MONTA A JANELA DE ACORDO COM OS PARAMTROS PASSADOS PARA AS VARIAVEIS
  bRespuestaMensaje       := False;
  lblTitulo.Caption       := sTitulo;
  lblDescripcion.Caption  := sMensaje;
  imgIcono.Picture.LoadFromFile( sIcono );

  if sTipo = 'CONFIRMA' then
  begin
    pnlBotonCancelar.Visible    := true;
    pnlBotonConfirmacion.Color  := $00F48542;
    btnSi.Caption               := 'SIM (Enter)';
  end else
  //sTipo = 'AVISO' // sTipo = 'ERRO' // sTipo = 'SUCESSO'
  begin
    pnlBotonCancelar.Visible := False;

    pnlBotonConfirmacion.Color   := $0053A834;

    btnSi.Caption := 'OK (Enter)';
  end;

end;

procedure TPagMensajes.btn_naoClick(Sender: TObject);
begin
  //ATRIBUI NAO (CANCELA) A VARIAVEL DE RESPOSTA
  bRespuestaMensaje := False;
  //FECHA O FORMULARIO
  Close;
end;

end.
