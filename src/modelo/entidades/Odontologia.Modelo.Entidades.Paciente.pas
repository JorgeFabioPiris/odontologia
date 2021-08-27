unit Odontologia.Modelo.Entidades.Paciente;

interface

uses
  SimpleAttributes;

type
  [Tabela('DPACIENTE')]
  TDPACIENTE = class

  private
    FPAC_COD_ESTADO: Integer;
    FPAC_CODIGO: Integer;
    FPAC_DIRECCION: String;
    FPAC_DOCUMENTO: String;
    FPAC_TELEFONO: String;
    FPAC_NOMBRE: String;
    procedure SetPAC_COD_ESTADO(const Value: Integer);
    procedure SetPAC_CODIGO(const Value: Integer);
    procedure SetPAC_DIRECCION(const Value: String);
    procedure SetPAC_DOCUMENTO(const Value: String);
    procedure SetPAC_NOMBRE(const Value: String);
    procedure SetPAC_TELEFONO(const Value: String);

  published
    [Campo('PAC_CODIGO'), Pk, AutoInc]
    property PAC_CODIGO     : Integer read FPAC_CODIGO write SetPAC_CODIGO;

    [Campo('PAC_NOMBRE')]
    property PAC_NOMBRE     : String read FPAC_NOMBRE write SetPAC_NOMBRE;

    [Campo('PAC_DOCUMENTO')]
    property PAC_DOCUMENTO  : String read FPAC_DOCUMENTO write SetPAC_DOCUMENTO;

    [Campo('PAC_TELEFONO')]
    property PAC_TELEFONO   : String read FPAC_TELEFONO write SetPAC_TELEFONO;

    [Campo('PAC_DIRECCION')]
    property PAC_DIRECCION  : String read FPAC_DIRECCION write SetPAC_DIRECCION;

    [Campo('PAC_COD_ESTADO')]
    property PAC_COD_ESTADO : Integer read FPAC_COD_ESTADO write SetPAC_COD_ESTADO;
  end;

implementation

{ TDPACIENTE }

procedure TDPACIENTE.SetPAC_CODIGO(const Value: Integer);
begin
  FPAC_CODIGO := Value;
end;

procedure TDPACIENTE.SetPAC_COD_ESTADO(const Value: Integer);
begin
  FPAC_COD_ESTADO := Value;
end;

procedure TDPACIENTE.SetPAC_DIRECCION(const Value: String);
begin
  FPAC_DIRECCION := Value;
end;

procedure TDPACIENTE.SetPAC_DOCUMENTO(const Value: String);
begin
  FPAC_DOCUMENTO := Value;
end;

procedure TDPACIENTE.SetPAC_NOMBRE(const Value: String);
begin
  FPAC_NOMBRE := Value;
end;

procedure TDPACIENTE.SetPAC_TELEFONO(const Value: String);
begin
  FPAC_TELEFONO := Value;
end;

end.
