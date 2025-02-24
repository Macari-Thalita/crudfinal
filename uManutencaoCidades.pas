unit uManutencaoCidades;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, FMTBcd, DB, SqlExpr;

type
  TfrmCidades = class(TForm)
    pnInformacoes: TPanel;
    pnBotoes: TPanel;
    frm: TButton;
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
    DBNavigator1: TDBNavigator;
    SQLQuery1: TSQLQuery;
    procedure btNovoClick(Sender: TObject);
    procedure frmClick(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FEstado: Integer;
  public
    { Public declarations }
  end;

var
  frmCidades: TfrmCidades;

implementation

uses dmConexao, uManutencaoClientes;

{$R *.dfm}

procedure TfrmCidades.btNovoClick(Sender: TObject);
begin
   frmClientes.HabilitarDesabilitarComponentes(True, [btSalvar, btCancelar, edNomeCidade, lbNomeCidade, lbUF, edUF]);
   //frmClientes.HabilitarDesabilitarComponentes(False, [btPesquisar, btRelatorio, btAlterar, btNovo]);

   FEstado := 1;

   edNomeCidade.SetFocus;
end;

procedure TfrmCidades.frmClick(Sender: TObject);
begin
   frmClientes.HabilitarDesabilitarComponentes(True, [btSalvar, btCancelar, lbNomeCidade, lbNomeCidade, lbUF, edNomeCidade, edUF]);
   //frmClientes.HabilitarDesabilitarComponentes(False, [btAlterar, btNovo, btPesquisar, btRelatorio]);

   FEstado := 2;

   edNomeCidade.SetFocus;
end;

procedure TfrmCidades.btCancelarClick(Sender: TObject);
begin
   frmClientes.HabilitarDesabilitarComponentes(False, [btSalvar, btCancelar, edCodigoCidade, lbNomeCidade, lbNomeCidade, lbUF, edUF]);
   //frmClientes.HabilitarDesabilitarComponentes(True, [btNovo, btPesquisar, btRelatorio, btAlterar]);

   btNovo.SetFocus;
end;

procedure TfrmCidades.btSalvarClick(Sender: TObject);
var
   LQuery: TSQLQuery;
   LProximo: Integer;
begin
   //frmClientes.HabilitarDesabilitarComponentes(True, [btPesquisar, btRelatorio, btNovo, btAlterar]);
   //frmClientes.HabilitarDesabilitarComponentes(False, [btSalvar, btCancelar, edCodigoCidade, lbNomeCidade, lbUF, edUF]);

   LQuery               := TSQLQuery.Create(Nil);
   LQuery.SQLConnection := dmConnection.sqlConexao;
   LQuery.NoMetadata    := True;

   try
      if (FEstado = 1) then
      begin
         LProximo  := 0; //Achar proximo id;

         //incluir
         LQuery.Close;
         LQuery.SQL.Clear;
         LQuery.SQL.Add('INSERT INTO CIDADES (CIDADE_ID, CIDADE_NOME, CIDADE_UF) VALUES (:pCIDADE_ID, :pCIDADE_NOME, :pCIDADE_UF)');
         LQuery.ParamByName('pCIDADE_ID').AsInteger   := LProximo;
         LQuery.ParamByName('pCIDADE_NOME').AsString  := edNomeCidade.Text;
         LQuery.ParamByName('pCIDADE_UF').AsString    := edUF.Text;
         LQuery.ExecSQL();

         LQuery.Close;
         LQuery.SQL.Clear;
         LQuery.SQL.Add('COMMIT');
         LQuery.ExecSQL();
      end
      else
      begin

      //update....

      end;



   finally
      FreeAndNil(LQuery);
   end;

   btNovo.SetFocus;
end;

procedure TfrmCidades.FormCreate(Sender: TObject);
begin
   FEstado := 0;
end;

end.
