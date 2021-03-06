unit Odontologia.Modelo.Conexion.RestDW;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client, FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, uDWAbout, uRESTDWPoolerDB;

type
  TModelConexion = class(TDataModule)
    RESTDWDataBase1: TRESTDWDataBase;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ModelConexion: TModelConexion;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
