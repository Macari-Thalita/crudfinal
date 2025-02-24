program CRUD;

uses
  Forms,
  uManutencaoClientes in 'uManutencaoClientes.pas' {frmClientes},
  dmConexao in 'dmConexao.pas' {dmConnection: TDataModule},
  uPesquisa in 'uPesquisa.pas' {frmPesquisar},
  uRelatorioClientes in 'uRelatorioClientes.pas' {frmRelatorioClientes},
  uMenu in 'uMenu.pas' {frmMenu},
  uManutencaoCidades in 'uManutencaoCidades.pas' {frmCidades};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmConnection, dmConnection);
  Application.CreateForm(TfrmMenu, frmMenu);
  Application.Run;
end.
