unit Odontologia.Vistas.Home;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Odontologia.Vista.Estilos;

type
  TPagHome = class(TForm)
    pnlMain: TPanel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagHome: TPagHome;

implementation

{$R *.dfm}

procedure TPagHome.FormCreate(Sender: TObject);
begin
  pnlMain.color := COLOR_BACKGROUND;
end;

end.
