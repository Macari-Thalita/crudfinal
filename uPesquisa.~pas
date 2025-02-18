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
    procedure btFiltrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPesquisar: TfrmPesquisar;

implementation

{$R *.dfm}

procedure TfrmPesquisar.btFiltrarClick(Sender: TObject);
begin
   If (edPesquisar.Text = EmptyStr) then
   begin
      MessageDLG('Informe um nome para busca!', mtInformation, [mbOk], 0);
      edPesquisar.SetFocus;
      Exit;
   end
   else
   begin
      dmConnection.qrConsulta.Close;
      dmConnection.qrConsulta.SQL.Clear;
      dmConnection.qrConsulta.SQL.Add('SELECT * FROM CLIENTES WHERE CLI_NOME LIKE :CLI_NOME');
      dmConnection.qrConsulta.ParamByName('CLI_NOME').AsString := '%' + edPesquisar.Text + '%';
      dmConnection.qrConsulta.Open;
   end;

   If (dmConnection.qrConsulta.IsEmpty) then
   begin
      MessageDLG('Nenhum cliente encontrado. Verifique!', mtInformation, [mbOk], 0);
      edPesquisar.SetFocus;
   end
   else
   begin
    //  gdPesquisar.DataSource
   end;
end;

procedure TfrmPesquisar.FormCreate(Sender: TObject);
begin
   if (frmPesquisar.Tag = 0) then
   begin
      //cidade
      dmConnection.dsPesquisa.Close;
      dmConnection.cdsPesquisa.Close;
      dmConnection.dsPesquisa.CommandText := 'SELECT * FROM CIDADES';
      dmConnection.cdsPesquisa.Open;
   end
   else begin
      //clientes


   end;
end;

end.

