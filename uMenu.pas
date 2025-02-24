unit uMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TfrmMenu = class(TForm)
    MainMenu1: TMainMenu;
    mnPrincipal: TMenuItem;
    Clientes1: TMenuItem;
    Cidades1: TMenuItem;
    N1: TMenuItem;
    Fechar1: TMenuItem;
    procedure Clientes1Click(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMenu: TfrmMenu;

implementation

uses
 uManutencaoClientes, uManutencaoCidades;

{$R *.dfm}

procedure TfrmMenu.Clientes1Click(Sender: TObject);
begin
   Application.CreateForm(TfrmClientes, frmClientes);
   frmClientes.ShowModal();
   frmClientes.Free;
end;

procedure TfrmMenu.Cidades1Click(Sender: TObject);
begin
   Application.CreateForm(TfrmCidades, frmCidades);
   frmCidades.ShowModal();
   frmCidades.Free;
end;

end.
