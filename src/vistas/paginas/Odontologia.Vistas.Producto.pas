unit Odontologia.Vistas.Producto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Odontologia.Vistas.Template, Data.DB,
  System.ImageList, Vcl.ImgList, Vcl.StdCtrls, Vcl.Buttons, Vcl.Grids,
  Vcl.DBGrids, Vcl.WinXPanels, Vcl.ExtCtrls;

type
  TPagProducto = class(TPagTemplate)
    Label1: TLabel;
    edtCodigo: TEdit;
    Label2: TLabel;
    edtNombre: TEdit;
    Label3: TLabel;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PagProducto: TPagProducto;

implementation

{$R *.dfm}

procedure TPagProducto.FormCreate(Sender: TObject);
begin
  inherited;
  lblTitulo.Caption := 'Registro de productos';

end;

end.
