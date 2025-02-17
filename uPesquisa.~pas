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
    edPesquisar: TDBEdit;
    btFiltrar: TButton;
    btSelecionar: TButton;
    gdPesquisar: TDBGrid;
    procedure btFiltrarClick(Sender: TObject);
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
      MessageDLG('Informe um nome para busca!', mtInformation, [mbOk],0);
      edPesquisar.SetFocus;
   end
   else
   begin
   //      dmConnection.
   end;

end;

end.
