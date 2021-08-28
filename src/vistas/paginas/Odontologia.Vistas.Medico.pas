unit Odontologia.Vistas.Medico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Odontologia.Vistas.Template, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXPanels, Vcl.ExtCtrls;

type
  TPagMedico = class(TPagTemplate)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagMedico: TPagMedico;

implementation

{$R *.dfm}

procedure TPagMedico.FormCreate(Sender: TObject);
begin
  inherited;
  lblTitulo.Caption := 'Registro de medicos';
end;

end.
