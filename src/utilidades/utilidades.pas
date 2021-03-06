unit utilidades;

interface

uses
  Vcl.ComCtrls, ACBrCEP, SysUtils, Vcl.Forms, SWHDBEdit,
  SWHEdit, SWHComboBox, SWHDBComboBox, SWHDBLookupComboBox, SWHMaskEdit,
  Vcl.Grids, Vcl.DBGrids, Winapi.Windows, FireDAC.Comp.Client,  Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.Graphics, DateUtils, Vcl.DBCtrls, IdHashMessageDigest,
  System.Variants;

type
  //record ou registro do Endere�o
  TEndereco = record
    sBairro     : String ;
    sCEP        : String ;
    sCodigoIBGE : String ;
    sComplemento: String ;
    sLogradouro : String ;
    sMunicipio  : String ;
    sUF         : String ;
  end;

  function fnc_ValidaData( const Data: String ): String;
  procedure prcAjustarColunasGrid(const xDBGrid: TDBGrid);
  function fnc_retorna_idade ( DataNascimento : TDate ): String;
  function fnc_retorna_mascara_fone( NTelefone: String ): TTipoMascara;
  procedure prcAjustaTamanhoLinha (dbg: TDBGrid);
  function fnc_formata_valor( Valor:String ):Double;
  function fnc_remove_caracteres(AString: String): String;
  procedure prc_validar_campos_obrigatorios ( Form: TForm );
  Function fnc_cria_janela_mensagem ( Titulo, Mensagem, CaminhoIcone, TipoMensagem :String ): boolean;
  function fnc_retorna_endereco( Cep: String; out Erro:String ): TEndereco;
  procedure prc_ocultar_tabs ( PageControl : TPageControl );
  function fnc_somente_numeros( AString: String): String;
  procedure prc_ordena( QueryConsulta:TFDQuery; Coluna: TColumn);
  procedure prc_focar_botao( Painel: TPanel; Botao: TSpeedButton; Focar: Boolean );
  function fnc_selecionar_empresas: TFDQuery;
  function MD5(const Value: string): string;
  procedure prcLimpaCampos( Form: TForm );

TYPE
  TDBGridPadrao = class(TCustomGrid);

var
  //variaveis globais que serao utilizadas em todo sistema
  var_gbl_empresa: Integer;

  var_gbl_razao_empresa,
  var_gbl_Servidor,
  var_gbl_Porta,
  var_gbl_Base,
  var_gbl_Login,
  var_gbl_Senha,
  var_gbl_versao,
  var_gbl_usuario: String;



implementation

uses
  Utilidades.Mensajes;

//PERCORRE O FORMULARIO PASSADO NO PARAMETRO E
//LIMPA O CONTEUDO/TEXTO DE CADA COMPONENTE
procedure prcLimpaCampos( Form: TForm );
var
  i : Integer;

begin

  for i := 0 to Form.ComponentCount - 1 do
  begin
    //dbEdit
    if Form.Components[i] is TSWHDBEdit then
      TSWHDBEdit(Form.Components[i]).Clear
    else
    //Edit
    if Form.Components[i] is TSWHEdit then
      TSWHEdit(Form.Components[i]).Clear
    else
    //combobox
    If Form.Components[i] is TSWHComboBox then
      TSWHComboBox(Form.Components[i]).ItemIndex := -1
    else
    //dbcombobox
    If Form.Components[i] is TSWHDBComboBox then
      TSWHDBComboBox(Form.Components[i]).ItemIndex := -1
    else
    //SWHdblookupcombobox
    If Form.Components[i] is TSWHDBLookUpComboBox then
       TSWHDBLookUpComboBox(Form.Components[i]).KeyValue := null
    else
    //dblookupcombobox
    If Form.Components[i] is TDBLookUpComboBox then
       TDBLookUpComboBox(Form.Components[i]).KeyValue := null
    else
    //MaskEdit
    If Form.Components[i] is TSWHMaskEdit then
      TSWHMaskEdit( Form.Components[i]).Clear;
  end;

end;

//FUN��O QUE CRIPTOGRAFA A SENHA DO USUARIO PARA SER GUARDADA NO BANCO DE DADOS
function MD5(const Value: string): string;
var
  xMD5: TIdHashMessageDigest5;

begin

  xMD5 := TIdHashMessageDigest5.Create;

  try
    Result := LowerCase(xMD5.HashStringAsHex(Value));
  finally
    xMD5.Free;
  end;

end;

//FUNCAO QUE VALIDA DATA E CONVERTE O ANO EM 4 DIGITOS QUANDO O USUARIO DIGITA SO 2
function fnc_ValidaData( const Data: String ): String;
begin

  Result:= '';

  try

    if Data = '  /  /    ' then
       exit;

    Result := DateToStr( Strtodate(  Data ) );

  except

    fnc_cria_janela_mensagem( 'Data Inv�lida','Data Digitada Inv�lida',
                              ExtractFilePath( Application.ExeName) + '\Icones\mensagem\erro.png',
                              'ERRO' );
    Abort;

  end;
end;

//PERCORRE O GRID PASSADO POR PARAMETRO AUMENTANDO A LAGURA DE SUAS COLUNAS ATE PREENCHER TODA A TELA
procedure prcAjustarColunasGrid(const xDBGrid: TDBGrid);
var
  I, TotalWidht, VarWidth, QtdTotalColuna : Integer;
  xColumn : TColumn;
begin
  ShowScrollBar( xDBGrid.Handle,SB_Vert, True );


  For I := 0 to xDBGrid.FieldCount - 1 do
  begin
    //SO SERA REDIMENSIONADO QUEM TEM TAG = 30
    //NESSE IF SO OS CAMPOS QUE TEM NOME ABAIXO SERAO REDIMENSIONADOS
    //QUALQUER OUTRO CAMPO NAO TERA A LARGURA DA COLUNA ALTERADA
    if ( xDBGrid.Fields[I].FieldName = 'DS_NOME' ) or
       ( xDBGrid.Fields[I].FieldName = 'DS_DESCRICAO' ) OR
       ( xDBGrid.Fields[I].FieldName = 'DS_RECEBEDOR' )  then
      xDBGrid.Fields[I].Tag := 30
    else
      xDBGrid.Fields[I].Tag := 0;

  end;

  // Largura total de todas as colunas antes de redimensionar
  TotalWidht := 0;

  // Quantas colunas devem ser auto-redimensionamento
  QtdTotalColuna := 0;

  for I := 0 to -1 + xDBGrid.Columns.Count do
  begin
    TotalWidht := TotalWidht + xDBGrid.Columns[I].Width;

    if xDBGrid.Columns[I].Field.Tag <> 0 then
      Inc(QtdTotalColuna);
  end;

  // Adiciona 1px para a linha de separador de coluna
  if dgColLines in xDBGrid.Options then
    TotalWidht := TotalWidht + xDBGrid.Columns.Count;

  // width vale "Left"
  VarWidth :=  xDBGrid.ClientWidth - TotalWidht;

  // Da mesma forma distribuir VarWidth para todas as colunas auto-resizable
  if QtdTotalColuna > 0 then
    VarWidth := varWidth div QtdTotalColuna;

  for I := 0 to -1 + xDBGrid.Columns.Count do
  begin
    xColumn := xDBGrid.Columns[I];

    if xColumn.Field.Tag <> 0 then
    begin
      xColumn.Width := xColumn.Width + VarWidth;

      if xColumn.Width < xColumn.Field.Tag then
        xColumn.Width := xColumn.Field.Tag;
    end;
  end;

end;
{
//FUNCAO QUE RETORNA A QUERY COM TODAS AS EMPRESAS QUE ESTAO CADASTRADAS
//SERA USADA ESSA FUNCAO NO DBLOOKUPCOMBOX DO FORM SELECIONAR EMPRESA
function fnc_selecionar_empresas: TFDQuery;
var
  QueryConsulta: TFDQuery;

begin

  try
    //DESCONECTA E CONECTA NO BANCO
    //POIS SE FOR BANCO HOSPEDADO PARTIMOS DO PRINCIPIO QUE A CONEXAO NUNCA ESTA ATIVA
    form_dados.FDConnection.Connected := False;
    form_dados.FDConnection.Connected := TRUE;

    //CRIA A QUERY DE CONSULTA
    QueryConsulta := TFDQuery.Create( nil );
    QueryConsulta.Connection := form_dados.FDConnection;

    //ATRIBUI O SQL A ESSA QUERY CRIADA
    QueryConsulta.Close;
    QueryConsulta.SQL.Clear;
    QueryConsulta.SQL.Add('SELECT ID_EMPRESA,FG_STATUS,DT_ABERTURA,DT_FECHAMENTO,');
    QueryConsulta.SQL.Add('DS_RAZAOSOCIAL,DS_FANTASIA,NR_CNPJ,NR_IE,NR_CEP,DS_ENDERECO, ');
    QueryConsulta.SQL.Add('NR_NUMERO, DS_COMPLEMENTO, DS_BAIRRO, DS_MUNICIPIO,   ');
    QueryConsulta.SQL.Add('DS_ESTADO, NR_FONE1, NR_FONE2, NR_FONE3, DS_CONTATO,  ');
    QueryConsulta.SQL.Add('DS_EMAIL, DS_SITE FROM EMPRESAS ');
    QueryConsulta.Open;
  finally

    //RETORNA O RESULTADO PARA A FUNCAO
    Result := QueryConsulta;

  end;


end;
}
//FUNCAO QUE DA O EFEITO AO BOTAO DE FOCADO QUANDO PASSO O MOUSE
procedure prc_focar_botao( Painel: TPanel; Botao: TSpeedButton; Focar: Boolean );
begin
  // O PARAMTRO PAINEL � A BARRA QUE SERA MUDADA A COR AO LADO DO BOTAO
  if Focar then
  begin
    Botao.Font.Color := clBlack;

    Painel.Parent  := Botao.Parent;
    Painel.Left    := Botao.Left ;//+ ( Botao.Width - 2);
    Painel.Top     := Botao.Top ;//+ ( Botao.Height - 2);
    Painel.Height  := Botao.Height -1;

    Painel.Visible := True;
    Painel.BringToFront;

  end else
  begin
    Botao.Font.Color := $00626262;
    Botao.Font.Style := [];
    Painel.Visible   := False;
  end;

end;

//FUNCAO QUE PEGA UMA STRING PASSADA POR PARAMETRO E
//RETORNA SOMENTE OS NUMERO DESSA STRING
function fnc_somente_numeros(AString: String): String;
var
  I : Integer;
  Limpos : String;
begin
  Limpos := '';

  for I := 1 to Length(AString) do
  begin
    if Pos(Copy(AString, I, 1), '0123456789') <> 0 then
      Limpos := Limpos + Copy(AString, i, 1);
  end;

  Result := Limpos;
end;

//FUNCAO QUE PEGA A STRING DE TELEFONE E TESTA PRA VER SE � FIXO OU
//CELULAR ATRIBUINDO ASSIM SUA MASCARA CORRETA
function fnc_retorna_mascara_fone( NTelefone: String ): TTipoMascara;
begin
  Result := tmNone;

  if fnc_somente_numeros ( NTelefone ) <> '' then
  begin
    if Length( Ntelefone ) = 10 then
      Result := tmTelefone // mascara do TSWHMASKEDIT TTipoMascara = ( tmData, tmCPF, tmCNPJ, tmCEP, tmTelefone, tmCelular, tmNone );
    else
    if Length( Ntelefone ) = 11 then
      Result := tmCelular ; // mascara do TSWHMASKEDIT TTipoMascara = ( tmData, tmCPF, tmCNPJ, tmCEP, tmTelefone, tmCelular, tmNone );
  end ;
end;

//Define o tamanho de cada linha do dbgrid
  procedure prcAjustaTamanhoLinha (dbg: TDBGrid);
begin
  TDBGridPadrao(dbg).DefaultRowHeight := 32;
  TDBGridPadrao(dbg).ClientHeight     := ( 33  * TDBGridPadrao(dbg).RowCount ) + 33 ;

  TDBGridPadrao(dbg).RowHeights[0] := 30;
end;


//FUNCAO QUE PEGA UMA STRING PASSADA POR PARAMETRO E
//REMOVE O CARACTER '.' DO VALOR SE HOUVER

function fnc_formata_valor( Valor:String ):Double;
Var
  i: Integer;
  NovoValor : String;

begin
  NovoValor:='';

  if Valor = '' then
    Valor := '0,00';

  for i:=1 to Length( Valor ) do
  begin
    if Valor[i] <> '.' then NovoValor:= NovoValor + Valor[i];
  end;

  Result := StrToFloat ( NovoValor );
end;


//FUNCAO QUE PEGA UMA STRING PASSADA POR PARAMETRO E
//REMOVE OS CARACTERES DEIXANDO SOMENTE LETRAS E NUMEROS
function fnc_remove_caracteres( AString: String): String;
var
  I : Integer;
  Limpos : String;
begin

  Limpos := '';

  for I := 1 to Length(AString) do
  begin
    if Pos ( Copy( AString, I, 1 ), '"!%$#@&�*().,;:/<>[]{}=+-_\|') = 0 then
      Limpos := Limpos + Copy(AString, i, 1);
  end;

  Result := Limpos;
end;


//PERCORRE O FORMULARIO PASSADO NO PARAMETRO E
//VERIFICA SE A PROPRIEDADE TAG = 5 E O HINT ESTA PREENCHDIO POIS
//SE TIVER � CAMPO OBRIGATORIO E APOS ISSO TESTA SE ESTA VAZIO
//RETORNANDO MENSAGEM AO USUARIO CASO ESTEJA VAZIO
procedure prc_validar_campos_obrigatorios ( Form: TForm );
var
  i : Integer;

begin

  for i := 0 to Form.ComponentCount - 1 do
  begin
    //tag = 5 indica que o campo � obrigatorio
    if  ( Form.Components[i].Tag = 5 ) then
    begin

      //dbEdit
      if Form.Components[i] is TSWHDBEdit then
        if ( ( Form.Components[i] as TSWHDBEdit ).Hint <> '' ) and
           ( ( Form.Components[i] as TSWHDBEdit ).Visible  )   and
           ( Trim ( fnc_remove_caracteres ( ( Form.Components[i] as TSWHDBEdit ).Text ) ) = '' ) then
        begin
          // CAMPO ESTA VAZIO ENTAO RETORNA MSG AO USUARIO
          fnc_cria_janela_mensagem('Aviso de DADOS OBRIGAT�RIOS',
                                'O campo ' +  ( Form.Components[i] as TSWHDBEdit ).Hint + ' � Obrigat�rio',
                                ExtractFilePath( Application.ExeName) + '\Icones\mensagem\aviso.png',
                                'AVISO' );

         //IF TESTA PRA VER SE O COMPONENTE ESTA EM UM PAGECONTROL COLCOANDO ASSIM O FOCO NELE
         if ( Form.Components[i] as TSWHDBEdit ).Enabled and ( Form.Components[i] as TSWHDBEdit ).Visible then
         begin
           if TSWHDBEdit(Form.Components[I]).Parent.ClassType = TTabSheet then// o Parente n�o � o pageControl e sim o a p�gina proriamente dito
              TPageControl( TTabSheet( TSWHDBEdit(Form.Components[I]).Parent).Parent).ActivePage := ( Form.Components[i] as TSWHDBEdit ).Parent as TTabSheet;

           TSWHDBEdit(Form.Components[i]).SetFocus;

         end;



           Abort;
        end;

      //Edit
      if Form.Components[i] is TSWHEdit then
        if ( ( Form.Components[i] as TSWHEdit ).Hint <> '' ) and
           ( ( Form.Components[i] as TSWHEdit ).Visible  )   and
           ( Trim ( fnc_remove_caracteres ( ( Form.Components[i] as TSWHEdit ).Text ) ) = '' ) then
        begin

          // CAMPO ESTA VAZIO ENTAO RETORNA MSG AO USUARIO
          fnc_cria_janela_mensagem('Aviso de DADOS OBRIGAT�RIOS',
                                'O campo ' +  ( Form.Components[i] as TSWHEdit ).Hint + ' � Obrigat�rio',
                                ExtractFilePath( Application.ExeName) + '\Icones\mensagem\aviso.png',
                                'AVISO' );

           //IF TESTA PRA VER SE O COMPONENTE ESTA EM UM PAGECONTROL COLCOANDO ASSIM O FOCO NELE
           if ( Form.Components[i] as TSWHEdit ).Enabled and ( Form.Components[i] as TSWHEdit ).Visible then
           begin
             if TSWHEdit(Form.Components[I]).Parent.ClassType = TTabSheet then// o Parente n�o � o pageControl e sim o a p�gina proriamente dito
               TPageControl( TTabSheet( TSWHEdit(Form.Components[I]).Parent).Parent ).ActivePage := ( Form.Components[i] as TSWHEdit ).Parent as TTabSheet;

             TSWHEdit(Form.Components[i]).SetFocus;

           end;

           Abort;
        end;


      //combobox
      If Form.Components[i] is TSWHComboBox then
        if ( ( Form.Components[i] as TSWHComboBox ).Hint <> '' ) and
           ( ( Form.Components[i] as TSWHComboBox ).Visible )    and
           ( Trim( fnc_remove_caracteres ( ( Form.Components[i] as TSWHComboBox ).Text ) ) = '' ) then
        begin

           // CAMPO ESTA VAZIO ENTAO RETORNA MSG AO USUARIO
           fnc_cria_janela_mensagem('Aviso de DADOS OBRIGAT�RIOS',
                                  'O campo ' +  ( Form.Components[i] as TSWHComboBox ).Hint + ' � Obrigat�rio',
                                  ExtractFilePath( Application.ExeName) + '\Icones\mensagem\aviso.png',
                                  'AVISO' );

           //IF TESTA PRA VER SE O COMPONENTE ESTA EM UM PAGECONTROL COLCOANDO ASSIM O FOCO NELE
           if ( Form.Components[i] as TSWHComboBox ).Enabled and ( Form.Components[i] as TSWHComboBox ).Visible then
           begin
             if TSWHComboBox(Form.Components[I]).Parent.ClassType = TTabSheet then// o Parente n�o � o pageControl e sim o a p�gina proriamente dito
                TPageControl( TTabSheet( TSWHComboBox(Form.Components[I]).Parent).Parent).ActivePage := ( Form.Components[i] as TSWHComboBox ).Parent as TTabSheet;

             TSWHComboBox(Form.Components[i]).SetFocus;

           end;

           Abort;
        end;


      //dbcombobox
      If Form.Components[i] is TSWHDBComboBox then
        if ( ( Form.Components[i] as TSWHDBComboBox ).Hint <> '' ) and
           ( ( Form.Components[i] as TSWHDBComboBox ).Visible )    and
           ( Trim( fnc_remove_caracteres ( ( Form.Components[i] as TSWHDBComboBox ).Text ) ) = '' ) then
        begin

           // CAMPO ESTA VAZIO ENTAO RETORNA MSG AO USUARIO
           fnc_cria_janela_mensagem('Aviso de DADOS OBRIGAT�RIOS',
                                  'O campo ' +  ( Form.Components[i] as TSWHDBComboBox ).Hint + ' � Obrigat�rio',
                                  ExtractFilePath( Application.ExeName) + '\Icones\mensagem\aviso.png',
                                  'AVISO' );

           //IF TESTA PRA VER SE O COMPONENTE ESTA EM UM PAGECONTROL COLCOANDO ASSIM O FOCO NELE
           if ( Form.Components[i] as TSWHDBComboBox ).Enabled and ( Form.Components[i] as TSWHDBComboBox ).Visible then
           begin
             if TSWHDBComboBox(Form.Components[I]).Parent.ClassType = TTabSheet then// o Parente n�o � o pageControl e sim o a p�gina proriamente dito
                TPageControl( TTabSheet( TSWHDBComboBox(Form.Components[I]).Parent).Parent).ActivePage := ( Form.Components[i] as TSWHDBComboBox ).Parent as TTabSheet;

             TSWHDBComboBox(Form.Components[i]).SetFocus;

           end;

           Abort;
        end;

      //dblookupcombobox
      If Form.Components[i] is TSWHDBLookUpComboBox then
        if ( ( Form.Components[i] as TSWHDBLookUpComboBox ).Hint <> '' ) and
           ( ( Form.Components[i] as TSWHDBLookUpComboBox ).Visible )    and
           ( Trim( fnc_remove_caracteres ( ( Form.Components[i] as TSWHDBLookUpComboBox ).Text ) ) = '' ) then
        begin

           // CAMPO ESTA VAZIO ENTAO RETORNA MSG AO USUARIO
           fnc_cria_janela_mensagem('Aviso de DADOS OBRIGAT�RIOS',
                                  'O campo ' +  ( Form.Components[i] as TSWHDBLookUpComboBox ).Hint + ' � Obrigat�rio',
                                  ExtractFilePath( Application.ExeName) + '\Icones\mensagem\aviso.png',
                                  'AVISO' );

           //IF TESTA PRA VER SE O COMPONENTE ESTA EM UM PAGECONTROL COLCOANDO ASSIM O FOCO NELE
           if ( Form.Components[i] as TSWHDBLookUpComboBox ).Enabled and ( Form.Components[i] as TSWHDBLookUpComboBox ).Visible then
           begin
             if TSWHDBLookUpComboBox(Form.Components[I]).Parent.ClassType = TTabSheet then// o Parente n�o � o pageControl e sim o a p�gina proriamente dito
                TPageControl( TTabSheet( TSWHDBLookUpComboBox(Form.Components[I]).Parent).Parent).ActivePage := ( Form.Components[i] as TSWHDBLookUpComboBox ).Parent as TTabSheet;

             TSWHDBLookUpComboBox(Form.Components[i]).SetFocus;

           end;

           Abort;
        end;

       //dblookupcombobox
      If Form.Components[i] is TDBLookUpComboBox then
        if ( ( Form.Components[i] as TDBLookUpComboBox ).Hint <> '' ) and
           ( ( Form.Components[i] as TDBLookUpComboBox ).Visible )    and
           ( Trim( fnc_remove_caracteres ( ( Form.Components[i] as TDBLookUpComboBox ).Text ) ) = '' ) then
        begin

           // CAMPO ESTA VAZIO ENTAO RETORNA MSG AO USUARIO
           fnc_cria_janela_mensagem('Aviso de DADOS OBRIGAT�RIOS',
                                  'O campo ' +  ( Form.Components[i] as TDBLookUpComboBox ).Hint + ' � Obrigat�rio',
                                  ExtractFilePath( Application.ExeName) + '\Icones\mensagem\aviso.png',
                                  'AVISO' );

           //IF TESTA PRA VER SE O COMPONENTE ESTA EM UM PAGECONTROL COLCOANDO ASSIM O FOCO NELE
           if ( Form.Components[i] as TDBLookUpComboBox ).Enabled and ( Form.Components[i] as TDBLookUpComboBox ).Visible then
           begin
             if TDBLookUpComboBox(Form.Components[I]).Parent.ClassType = TTabSheet then// o Parente n�o � o pageControl e sim o a p�gina proriamente dito
                TPageControl( TTabSheet( TDBLookUpComboBox(Form.Components[I]).Parent).Parent).ActivePage := ( Form.Components[i] as TDBLookUpComboBox ).Parent as TTabSheet;

             TDBLookUpComboBox(Form.Components[i]).SetFocus;

           end;

           Abort;
        end;

      //MaskEdit
      If Form.Components[i] is TSWHMaskEdit then
        if ( ( Form.Components[i] as TSWHMaskEdit ).Hint <> '' ) and
           ( ( Form.Components[i] as TSWHMaskEdit ).Visible )    and
           ( Trim( fnc_remove_caracteres ( ( Form.Components[i] as TSWHMaskEdit ).Text ) ) = '' ) then
        begin

           // CAMPO ESTA VAZIO ENTAO RETORNA MSG AO USUARIO
           fnc_cria_janela_mensagem('Aviso de DADOS OBRIGAT�RIOS',
                                  'O campo ' +  ( Form.Components[i] as TSWHMaskEdit ).Hint + ' � Obrigat�rio',
                                  ExtractFilePath( Application.ExeName) + '\Icones\mensagem\aviso.png',
                                  'AVISO' );

           //IF TESTA PRA VER SE O COMPONENTE ESTA EM UM PAGECONTROL COLCOANDO ASSIM O FOCO NELE
           if ( Form.Components[i] as TSWHMaskEdit ).Enabled and ( Form.Components[i] as TSWHMaskEdit ).Visible then
           begin
             if TSWHMaskEdit( Form.Components[I]).Parent.ClassType = TTabSheet then// o Parente n�o � o pageControl e sim o a p�gina proriamente dito
               TPageControl( TTabSheet( TSWHMaskEdit(Form.Components[I]).Parent).Parent).ActivePage := ( Form.Components[i] as TSWHMaskEdit ).Parent as TTabSheet;

               TSWHMaskEdit( Form.Components[i]).SetFocus;

           end;

           Abort;
        end;
    end;
  end;

end;


//FUNCAO QUE CRIA A TELA DE MENSAGEM DE ACORDO COM OS PARAMETROS PASSADOS
Function fnc_cria_janela_mensagem ( Titulo, Mensagem, CaminhoIcone, TipoMensagem :String ): boolean;
begin
  Result := False;

  try
    //CRIA FORMULARIO
    PagMensajes           := TPagMensajes.Create(nil);

    //ATRIBUI UM TITULO
    PagMensajes.sTitulo   := Titulo;

    //CONTEUDO DA MENSAGEM
    PagMensajes.sMensaje := Mensagem;

    //ICONE DA TELA NA MENSAGEM
    PagMensajes.sIcono    := CaminhoIcone;

    //TIPO DE MENSAGEM : ERRO, ALERTA, CONFIRMACAO, ETC...
    PagMensajes.sTipo     := TipoMensagem;
    PagMensajes.ShowModal;

  finally
    //RETORNA A RESPOSTA DO USUARIO, OK, CANCEL
    Result := PagMensajes.bRespuestaMensaje;
    PagMensajes.DisposeOf;

  end;

end;

//FUNCAO QUE CALCULA A IDADE DA PESSOA A PARTIR DA DATA NASCIMENTO
function fnc_retorna_idade ( DataNascimento : TDate ): String;
var
    nDiasTotal, nDias, nAnos, nMeses,
    nRestoDias : Integer;

begin
    nDiasTotal := DaysBetween ( Date, DataNascimento );
    nAnos      := nDiasTotal div 365; //pega o resultado inteiro
    nRestoDias := nDiasTotal mod 365; //pega o resto

    if nRestoDias > 30 then //PASSOU DE 30 DIAS DA MAIS DE 1 MES
    begin
      nMeses     := nRestoDias div 30; // DIAS/30 DA O NUMERO DE MESES
    end else
      nMeses     := 0;


    result := IntToStr( nAnos ) + ' Anos e '+
              IntToStr( nMeses )+' Meses';

end;

//FUNCAO QUE RETORNA O ENDERE�O ATRAVES DO CEP UTILIZANDO O ACBRCEP
//SE DER ALGUM ERRO NA CONSULTA ARMAZENA O ERRO NA VARIAVEL DE SAIDA :OUT ERRO
function fnc_retorna_endereco( Cep: String; out Erro:String ): TEndereco;
var
  ACBrCEP : TACBrCEP;

begin
  Erro  := '';

  if Length ( Cep ) <> 8 then
  begin
    Erro  := 'CEP INCOMPLETO!';
    Exit;
  end;

  //cria o componente
  ACBrCEP             := TACBrCEP.Create( Nil );
  ACBrCEP.WebService  := wsViaCep; //escolhi esse webservice para consulta, pode ser outro

  ACBrCEP.Enderecos.Clear;

  //REALIZA A BUSCA
  ACBrCEP.BuscarPorCEP( Cep );

  if ACBrCEP.Enderecos.Count = 0 then
     Erro  := 'CEP N�O ENCONTRADO!'
  else
  begin
    //ARMAZENA NO REGISTRO OS DADOS DO ENDERE�O ENCONTRADO
    Result.sBairro     := UpperCase ( ACBrCEP.Enderecos[0].Bairro );
    Result.sCEP        := UpperCase ( ACBrCEP.Enderecos[0].Cep );
    Result.sCodigoIBGE := UpperCase ( ACBrCEP.Enderecos[0].IBGE_Municipio );
    Result.sComplemento:= UpperCase ( ACBrCEP.Enderecos[0].Complemento );
    Result.sLogradouro := UpperCase ( ACBrCEP.Enderecos[0].Logradouro );
    Result.sMunicipio  := UpperCase ( ACBrCEP.Enderecos[0].Municipio );
    Result.sUF         := UpperCase ( ACBrCEP.Enderecos[0].UF );
  end;

  //DESTROY O COMPONENTE POIS NAO USAREMOS MAIS
  ACBrCEP.Destroy;
end;

// funcao percorre o pagecontrol passado por parametro escondendo todas as abas
procedure prc_ocultar_tabs ( PageControl : TPageControl );
var
  page :Integer;

begin
  for page := 0 to PageControl.PageCount - 1 do
    PageControl.Pages[page].tabvisible := False;

  PageControl.ActivePageIndex := 0;

end;

//FUNCAO QUE ORDENA A CONSULTA NO DBGRID ATRAVES DA COLUNA PASSADA POR PARAMETRO
procedure prc_ordena( QueryConsulta:TFDQuery; Coluna: TColumn);
begin

  if QueryConsulta.IndexFieldNames = Coluna.FieldName then
    QueryConsulta.IndexFieldNames := Coluna.FieldName + ':D' //DESCENDENTE
  else
    QueryConsulta.IndexFieldNames := Coluna.FieldName;

  QueryConsulta.First;
end;

end.
