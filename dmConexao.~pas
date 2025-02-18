unit dmConexao;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, FMTBcd, Provider, DBClient;

type
  TdmConnection = class(TDataModule)
    sqlConexao: TSQLConnection;
    dsClientes: TSQLDataSet;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    dtsClientes: TDataSource;
    dsClientesCLI_ID: TIntegerField;
    dsClientesCLI_NOME: TStringField;
    dsClientesCLI_NASCIDO: TDateField;
    dsClientesCIDADE_ID: TIntegerField;
    cdsClientesCLI_ID: TIntegerField;
    cdsClientesCLI_NOME: TStringField;
    cdsClientesCLI_NASCIDO: TDateField;
    cdsClientesCIDADE_ID: TIntegerField;
    dsClientesCIDADE_NOME: TStringField;
    cdsClientesCIDADE_NOME: TStringField;
    dsClientesCIDADE_UF: TStringField;
    cdsClientesCIDADE_UF: TStringField;
    qrConsulta: TSQLQuery;
    dsPesquisa: TSQLDataSet;
    dspPesquisa: TDataSetProvider;
    cdsPesquisa: TClientDataSet;
    dtsPesquisa: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConnection: TdmConnection;

implementation

{$R *.dfm}

end.
