unit uPesquisa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, Grids, DBGrids, dmConexao;

type
  TfrmPesquisar = class(TForm)
    pnPesquisa: TPanel;
    pnGrid: TPanel;
    lbDescricao: TLabel;
    btFiltrar: TButton;
    btSelecionar: TButton;
    gdPesquisar: TDBGrid;
    edPesquisar: TEdit;
    btAtualiza: TButton;
    procedure btFiltrarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edPesquisarKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btAtualizaClick(Sender: TObject);
    procedure SelecionaClienteOuCidade();
    procedure btSelecionarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisar: TfrmPesquisar;

implementation

uses uManutencaoClientes;

{$R *.dfm}

procedure TfrmPesquisar.SelecionaClienteOuCidade();
begin
   if (frmPesquisar.Tag = 1) then
   begin
      dmConnection.dsPesquisa.Close;
      dmConnection.cdsPesquisa.Close;
      dmConnection.dsPesquisa.CommandText := 'SELECT * FROM CIDADES';
      dmConnection.cdsPesquisa.Open;
   end
   else begin
      dmConnection.dsPesquisa.Close;
      dmConnection.cdsPesquisa.Close;
      dmConnection.dsPesquisa.CommandText := 'SELECT * FROM CLIENTES';
      dmConnection.cdsPesquisa.Open;
   end;
end;


procedure TfrmPesquisar.btFiltrarClick(Sender: TObject);
begin
   If (edPesquisar.Text = EmptyStr) then
   begin
      MessageDLG('Informe um registro para busca!', mtInformation, [mbOk], 0);
      edPesquisar.SetFocus;
      Exit;
   end
   else
   begin
      if (frmPesquisar.Tag = 0) then
      begin
         dmConnection.cdsPesquisa.Close;
         dmConnection.dsPesquisa.Close;
         dmConnection.dsPesquisa.CommandText := ('SELECT * FROM CLIENTES WHERE CLI_NOME LIKE :CLI_NOME');
         dmConnection.dsPesquisa.ParamByName('CLI_NOME').AsString := '%' + edPesquisar.Text + '%';
         dmConnection.cdsPesquisa.Open;
      end
      else
      begin
         dmConnection.cdsPesquisa.Close;
         dmConnection.dsPesquisa.Close;
         dmConnection.dsPesquisa.CommandText := ('SELECT * FROM CIDADES WHERE CIDADE_NOME LIKE :CIDADE_NOME');
         dmConnection.dsPesquisa.ParamByName('CIDADE_NOME').AsString := '%' + edPesquisar.Text + '%';
         dmConnection.cdsPesquisa.Open;
      end;

   end;

   If (dmConnection.cdsPesquisa.IsEmpty) then
   begin
      MessageDLG('Nenhum registro encontrado. Verifique!', mtInformation, [mbOk], 0);
      edPesquisar.SetFocus;
   end;
end;

procedure TfrmPesquisar.FormShow(Sender: TObject);
begin
   SelecionaClienteOuCidade();
end;


procedure TfrmPesquisar.edPesquisarKeyPress(Sender: TObject;
  var Key: Char);
begin
   frmClientes.TextoEmCaixaAlta(Sender, Key);
end;

procedure TfrmPesquisar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   edPesquisar.Text := EmptyStr;
end;

procedure TfrmPesquisar.btAtualizaClick(Sender: TObject);
begin
   SelecionaClienteOuCidade();
end;

procedure TfrmPesquisar.btSelecionarClick(Sender: TObject);
begin
//   dmConnection.cdsClientes.Edit;
//
//      dmConnection.cdsClientesCIDADE_ID.AsInteger  := dmConnection.cdsPesquisa.FieldByName('CIDADE_ID').AsInteger;
//      dmConnection.cdsClientesCIDADE_NOME.AsString := dmConnection.cdsPesquisa.FieldByName('CIDADE_NOME').AsString;
//      dmConnection.cdsClientesCIDADE_UF.AsString   := dmConnection.cdsPesquisa.FieldByName('CIDADE_UF').AsString;
//      
//      dmConnection.cdsClientesCLI_ID.AsInteger       := dmConnection.cdsPesquisa.FieldByName('CLI_ID').AsInteger;
//      dmConnection.cdsClientesCLI_NOME.AsString      := dmConnection.cdsPesquisa.FieldByName('CLI_NOME').AsString;
//      dmConnection.cdsClientesCLI_NASCIDO.AsDateTime := dmConnection.cdsPesquisa.FieldByName('CLI_NASCIDO').AsDateTime;
//      Close;

end;

end.

