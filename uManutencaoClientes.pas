unit uManutencaoClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, uPesquisa;

type
  TfrmClientes = class(TForm)
    pnInformacoes: TPanel;
    pnBotoes: TPanel;
    lbCodigo: TLabel;
    lbNome: TLabel;
    lbNascimento: TLabel;
    lbCidade: TLabel;
    lbNomeCidade: TLabel;
    lbUF: TLabel;
    btAlterar: TButton;
    btSalvar: TButton;
    btNovo: TButton;
    btCancelar: TButton;
    btPesquisar: TButton;
    btRelatorio: TButton;
    btSelecionarCidade: TButton;
    edCodigoCliente: TDBEdit;
    edNomeCliente: TDBEdit;
    edCodigoCidade: TDBEdit;
    edNomeCidade: TDBEdit;
    edUF: TDBEdit;
    edNascimento: TDBEdit;
    DBNavigator1: TDBNavigator;
    procedure btNovoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure HabilitarDesabilitarComponentes(AEstado: Boolean; AComponentes: array of TComponent);
    procedure LimparCampos(AEstado: Boolean; AComponentes: array of TComponent);
    procedure DigitarSomenteNumeros(Sender: TObject;  var Key: Char);
    procedure TextoEmCaixaAlta(Sender: TObject;  var Key: Char);
    procedure edCodigoCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edNomeClienteKeyPress(Sender: TObject; var Key: Char);
    procedure edNomeCidadeKeyPress(Sender: TObject; var Key: Char);
    procedure edUFKeyPress(Sender: TObject; var Key: Char);
    procedure btAlterarClick(Sender: TObject);
    procedure edCodigoCidadeExit(Sender: TObject);
    procedure btPesquisarClick(Sender: TObject);
    procedure btSelecionarCidadeClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

uses
 dmConexao;
{$R *.dfm}

procedure TfrmClientes.HabilitarDesabilitarComponentes(AEstado: Boolean; AComponentes: array of TComponent);
var
   i: Integer;
begin
   For i := Low(AComponentes) to High(AComponentes) do
   begin
      TWinControl(AComponentes[i]).Enabled := AEstado;
   end;
end;

procedure TfrmClientes.LimparCampos(AEstado: Boolean; AComponentes: array of TComponent);
var
   i: Integer;
begin
   For i := Low(AComponentes) to High(AComponentes) do
   begin
      TEdit(AComponentes[i]).Clear;   
   end;
end;

procedure TfrmClientes.DigitarSomenteNumeros(Sender: TObject;
  var Key: Char);
begin
   If not( key in['0'..'9',#08] ) then
   key:=#0;
end;

procedure TfrmClientes.TextoEmCaixaAlta(Sender: TObject;  var Key: Char);
begin
   Key := UpCase(Key);
end;

procedure TfrmClientes.btNovoClick(Sender: TObject);
begin
   HabilitarDesabilitarComponentes(True, [btSalvar, btCancelar, btSelecionarCidade, edNomeCliente, edNascimento, edCodigoCidade, lbNome, lbNascimento, lbCidade, lbCodigo, lbNomeCidade, lbUF]);
   HabilitarDesabilitarComponentes(False, [btPesquisar, btRelatorio, btAlterar, btNovo]);

   dmConnection.cdsClientes.Insert;
   edNomeCliente.SetFocus;
end;

procedure TfrmClientes.FormActivate(Sender: TObject);
begin
   btNovo.SetFocus;
end;

procedure TfrmClientes.btCancelarClick(Sender: TObject);
begin
   HabilitarDesabilitarComponentes(False, [btSalvar, btCancelar, btSelecionarCidade, edNomeCliente, edNascimento, edCodigoCidade, lbNome, lbNascimento, lbCidade, lbCodigo, lbNomeCidade, lbUF]);
   HabilitarDesabilitarComponentes(True, [btNovo, btPesquisar, btRelatorio]);

   dmConnection.cdsClientes.Cancel;
   dmConnection.cdsClientes.ApplyUpdates(0);

   btNovo.SetFocus;

end;

procedure TfrmClientes.btSalvarClick(Sender: TObject);
var
   LAtual: Integer;
begin
   HabilitarDesabilitarComponentes(True, [btPesquisar, btRelatorio, btNovo]);
   HabilitarDesabilitarComponentes(False, [btSalvar, btCancelar, btSelecionarCidade, edNomeCliente, edNascimento, edCodigoCidade, lbNome, lbNascimento, lbCidade, lbCodigo, lbNomeCidade, lbUF]);

   If (dmConnection.cdsClientesCLI_ID.IsNull) then
   begin
      dmConnection.qrConsulta.Close;
      dmConnection.qrConsulta.SQL.Clear;
      dmConnection.qrConsulta.SQL.Add('SELECT MAX(CLI_ID) AS CONTADOR FROM CLIENTES');
      dmConnection.qrConsulta.Open;

      If (dmConnection.qrConsulta.IsEmpty) then
         LAtual := 0
      else
         LAtual := dmConnection.qrConsulta.FieldByName('CONTADOR').AsInteger;

      Inc(LAtual);

      dmConnection.cdsClientesCLI_ID.AsInteger := LAtual;

      dmConnection.qrConsulta.Close;
   end;

   dmConnection.cdsClientes.Post;
   dmConnection.cdsClientes.ApplyUpdates(0);


   btNovo.SetFocus;
end;

procedure TfrmClientes.edCodigoCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
   DigitarSomenteNumeros(Sender, Key);
end;

procedure TfrmClientes.edNomeClienteKeyPress(Sender: TObject;
  var Key: Char);
begin
   TextoEmCaixaAlta(Sender, Key);
end;

procedure TfrmClientes.edNomeCidadeKeyPress(Sender: TObject;
  var Key: Char);
begin
   TextoEmCaixaAlta(Sender, Key);
end;

procedure TfrmClientes.edUFKeyPress(Sender: TObject; var Key: Char);
begin
   TextoEmCaixaAlta(Sender, Key);
end;

procedure TfrmClientes.btAlterarClick(Sender: TObject);
begin
   dmConnection.cdsClientes.Edit;
   
   HabilitarDesabilitarComponentes(True, [btSalvar, btCancelar, btSelecionarCidade, edNomeCliente, edNascimento, edCodigoCidade, lbNome, lbNascimento, lbCidade, lbCodigo, lbNomeCidade, lbUF]);
   edNomeCliente.SetFocus;
end;

procedure TfrmClientes.edCodigoCidadeExit(Sender: TObject);
begin
   dmConnection.qrConsulta.Close;
   dmConnection.qrConsulta.SQL.Clear;
   dmConnection.qrConsulta.SQL.Add('SELECT CIDADE_ID, CIDADE_NOME, CIDADE_UF FROM CIDADES WHERE CIDADE_ID = :pCIDADE');
   dmConnection.qrConsulta.ParamByName('pCIDADE').AsString := edCodigoCidade.Text;
   dmConnection.qrConsulta.Open;

   If (dmConnection.qrConsulta.IsEmpty) then
   begin
      MessageDLG('Cidade não encontrada. Verifique!', mtInformation, [mbOk],0);
      edCodigoCidade.Setfocus;
   end
   else
   begin
      edNomeCidade.Text := dmConnection.qrConsulta.FieldByName('CIDADE_NOME').AsString;
      edUF.Text         := dmConnection.qrConsulta.FieldByName('CIDADE_UF').AsString;
   end;
end;

procedure TfrmClientes.btPesquisarClick(Sender: TObject);
begin
   frmPesquisar.gdPesquisar.DataSource := dmConnection.dtsClientes;
   frmPesquisar.ShowModal;


end;

procedure TfrmClientes.btSelecionarCidadeClick(Sender: TObject);
begin

   frmPesquisar.ShowModal;
end;

end.

