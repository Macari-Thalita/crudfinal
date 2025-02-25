unit uManutencaoCidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, FMTBcd, DB, SqlExpr;

type
  TfrmCidades = class(TForm)
    pnInformacoes: TPanel;
    pnBotoes: TPanel;
    btAlterar: TButton;
    btSalvar: TButton;
    btNovo: TButton;
    btCancelar: TButton;
    btPesquisar: TButton;
    btRelatorio: TButton;
    lbCodigo: TLabel;
    lbNomeCidade: TLabel;
    lbUF: TLabel;
    edCodigoCidade: TEdit;
    edNomeCidade: TEdit;
    edUF: TEdit;
    SQLQuery1: TSQLQuery;
    procedure btNovoClick(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure btRelatorioClick(Sender: TObject);
    procedure edNomeCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edUFKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    FEstado: Integer;
  public
    { Public declarations }
  end;

var
  frmCidades: TfrmCidades;

implementation

uses dmConexao, uManutencaoClientes, uPesquisa, uRelatorioClientes;

{$R *.dfm}

procedure TfrmCidades.btNovoClick(Sender: TObject);
begin
   if (edNomeCidade.Text <> EmptyStr) then
   begin
      frmClientes.LimparCampos([edCodigoCidade, edNomeCidade, edUF]);
   end;

   frmClientes.HabilitarDesabilitarComponentes(True, [btSalvar, btCancelar, edNomeCidade, lbNomeCidade, lbUF, edUF]);
   frmClientes.HabilitarDesabilitarComponentes(False, [btPesquisar, btRelatorio, btAlterar, btNovo]);

   FEstado := 1;

   edNomeCidade.SetFocus;
end;

procedure TfrmCidades.btAlterarClick(Sender: TObject);
begin
   if (edNomeCidade.Text = EmptyStr) then
   begin
      MessageDLG('Selecione um registro para alteração!', mtInformation, [mbOk],0);
      btPesquisar.SetFocus;
      Exit;
   end;

   frmClientes.HabilitarDesabilitarComponentes(True, [btSalvar, btCancelar, lbNomeCidade, lbNomeCidade, lbUF, edNomeCidade, edUF]);
   frmClientes.HabilitarDesabilitarComponentes(False, [btAlterar, btNovo, btPesquisar, btRelatorio]);

   FEstado := 2;

   edNomeCidade.SetFocus;
end;

procedure TfrmCidades.btCancelarClick(Sender: TObject);
begin
   frmClientes.HabilitarDesabilitarComponentes(False, [btSalvar, btCancelar, edCodigoCidade, lbNomeCidade, lbNomeCidade, lbUF, edUF]);
   frmClientes.HabilitarDesabilitarComponentes(True, [btNovo, btPesquisar, btRelatorio, btAlterar]);

   if (edNomeCidade.Text <> EmptyStr) then
   begin
      frmClientes.LimparCampos([edCodigoCidade, edNomeCidade, edUF]);
   end;

   btNovo.SetFocus;
end;

procedure TfrmCidades.btSalvarClick(Sender: TObject);
var
   LQuery: TSQLQuery;
   LProximo: Integer;
begin
   if ((edNomeCidade.Text = EmptyStr) or (edUF.Text = EmptyStr)) then
   begin
      MessageDLG('Preencha todos os campos corretamente!', mtInformation, [mbOk],0);
      edNomeCidade.SetFocus;
      Exit;
   end;
   
   frmClientes.HabilitarDesabilitarComponentes(True, [btPesquisar, btRelatorio, btNovo, btAlterar]);
   frmClientes.HabilitarDesabilitarComponentes(False, [btSalvar, btCancelar, edCodigoCidade, lbNomeCidade, lbUF, lbCodigo, edUF, edNomeCidade]);

   LQuery               := TSQLQuery.Create(Nil);
   LQuery.SQLConnection := dmConnection.sqlConexao;
   LQuery.NoMetadata    := True;

   try
      if (FEstado = 1) then
      begin
         LQuery.Close;
         LQuery.SQL.Clear;
         LQuery.SQL.Add('SELECT MAX(CIDADE_ID) AS CONTADOR FROM CIDADES');
         LQuery.Open;

         LProximo := LQuery.FieldByName('CONTADOR').AsInteger;
         Inc(LProximo);

         edCodigoCidade.Text := IntToStr(LProximo);

         LQuery.Close;
         LQuery.SQL.Clear;         
         LQuery.SQL.Add('INSERT INTO CIDADES (CIDADE_ID, CIDADE_NOME, CIDADE_UF) VALUES (:pCIDADE_ID, :pCIDADE_NOME, :pCIDADE_UF)');
         LQuery.ParamByName('pCIDADE_ID').AsInteger  := LProximo;
         LQuery.ParamByName('pCIDADE_NOME').AsString := edNomeCidade.Text;
         LQuery.ParamByName('pCIDADE_UF').AsString   := edUF.Text;
         LQuery.ExecSQL;
      end
      else
      begin
         LQuery.Close;
         LQuery.SQL.Clear;
         LQuery.SQL.Add('UPDATE CIDADES SET CIDADE_NOME = :pCIDADE_NOME, CIDADE_UF = :pCIDADE_UF WHERE CIDADE_ID = :pCIDADE_ID');
         LQuery.ParamByName('pCIDADE_ID').AsInteger  := StrToInt(edCodigoCidade.Text);
         LQuery.ParamByName('pCIDADE_NOME').AsString := edNomeCidade.Text;
         LQuery.ParamByName('pCIDADE_UF').AsString   := edUF.Text;
         LQuery.ExecSQL;
      end;

      LQuery.Close;
      LQuery.SQL.Clear;
      LQuery.SQL.Add('COMMIT');
      LQuery.ExecSQL;
   finally
      FreeAndNil(LQuery);
   end;
end;


procedure TfrmCidades.FormCreate(Sender: TObject);
begin
   FEstado := 0;
end;

procedure TfrmCidades.btPesquisarClick(Sender: TObject);
begin
   frmClientes.HabilitarDesabilitarComponentes(True, [btSalvar, btCancelar, lbNomeCidade, lbCodigo, lbUF, edUF, edNomeCidade]);
   frmClientes.HabilitarDesabilitarComponentes(False, [btAlterar, btNovo, btPesquisar, btRelatorio, edCodigoCidade]);

   Application.CreateForm(TfrmPesquisar, frmPesquisar);
   frmPesquisar.Tag := 2; //cadastro cidades
   frmPesquisar.ShowModal();
   frmPesquisar.Free;
   
   edNomeCidade.SetFocus;
end;

procedure TfrmCidades.btRelatorioClick(Sender: TObject);
begin
   Application.CreateForm(TfrmRelatorioClientes, frmRelatorioClientes);
   frmRelatorioClientes.ShowModal();
   frmRelatorioClientes.Free;
end;

procedure TfrmCidades.edNomeCidadeKeyPress(Sender: TObject; var Key: Char);
begin
   frmClientes.TextoEmCaixaAlta(Sender, Key);
end;

procedure TfrmCidades.edUFKeyPress(Sender: TObject; var Key: Char);
begin
   frmClientes.TextoEmCaixaAlta(Sender, Key);
end;

end.
