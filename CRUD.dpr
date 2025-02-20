program CRUD;

uses
  Forms,
  uManutencaoClientes in 'uManutencaoClientes.pas' {frmClientes},
  dmConexao in 'dmConexao.pas' {dmConnection: TDataModule},
  uPesquisa in 'uPesquisa.pas' {frmPesquisar},
  uRelatorioClientes in 'uRelatorioClientes.pas' {frmRelatorioClientes};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmClientes, frmClientes);
  Application.CreateForm(TdmConnection, dmConnection);
  Application.CreateForm(TfrmPesquisar, frmPesquisar);
  Application.CreateForm(TfrmRelatorioClientes, frmRelatorioClientes);
  Application.Run;
end.
