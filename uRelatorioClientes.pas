unit uRelatorioClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, dmConexao, FMTBcd, SqlExpr,
  StdCtrls, Mask, DBCtrls, DBClient, Provider;

type
  TfrmRelatorioClientes = class(TForm)
    qckRepClientes: TQuickRep;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageHeaderBand1: TQRBand;
    SummaryBand1: TQRBand;
    qrTitulo: TQRLabel;
    QRSysData1: TQRSysData;
    qrCodigo: TQRLabel;
    qrNome: TQRLabel;
    qrNascmimento: TQRLabel;
    qrCidade: TQRLabel;
    qrUF: TQRLabel;
    QRDBText1: TQRDBText;
    RadioButton1: TRadioButton;
    btVisualizar: TButton;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    edCodigoCidade: TDBEdit;
    btSelecionarCidade: TButton;
    edNomeCidade: TDBEdit;
    edUF: TDBEdit;
    lbCidade: TLabel;
    lbNomeCidade: TLabel;
    lbUF: TLabel;
    ckAgrupar: TCheckBox;
    QRGroup1: TQRGroup;
    qrNomeCidade: TQRLabel;
    dstRelatorio: TSQLDataSet;
    dspRelatorio: TDataSetProvider;
    cdsRelatorio: TClientDataSet;
    cdsRelatorioCLI_ID: TIntegerField;
    cdsRelatorioCLI_NOME: TStringField;
    cdsRelatorioCLI_NASCIDO: TDateField;
    cdsRelatorioCIDADE_ID: TIntegerField;
    cdsRelatorioCIDADE_ID_1: TIntegerField;
    cdsRelatorioCIDADE_NOME: TStringField;
    cdsRelatorioCIDADE_UF: TStringField;
    dstRelatorioCLI_ID: TIntegerField;
    dstRelatorioCLI_NOME: TStringField;
    dstRelatorioCLI_NASCIDO: TDateField;
    dstRelatorioCIDADE_ID: TIntegerField;
    dstRelatorioCIDADE_ID_1: TIntegerField;
    dstRelatorioCIDADE_NOME: TStringField;
    dstRelatorioCIDADE_UF: TStringField;
    procedure btVisualizarClick(Sender: TObject);
    procedure btSelecionarCidadeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure qrNomeCidadePrint(sender: TObject; var Value: String);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioClientes: TfrmRelatorioClientes;

implementation

uses uPesquisa;

{$R *.dfm}

procedure TfrmRelatorioClientes.btVisualizarClick(Sender: TObject);
begin
   dstRelatorio.Close;
   cdsRelatorio.Close;
   dstRelatorio.CommandText := 'SELECT CLIENTES.*, CIDADES.* ' +
                               'FROM CLIENTES ' +
                               'LEFT OUTER JOIN CIDADES ON CIDADES.CIDADE_ID = CLIENTES.CIDADE_ID';

   if (Trim(edCodigoCidade.Text) <> EmptyStr) then
   begin
      dstRelatorio.CommandText := dstRelatorio.CommandText + ' WHERE CLIENTES.CIDADE_ID = :pCIDADE';
   end;

   if (ckAgrupar.Checked) then
      dstRelatorio.CommandText := dstRelatorio.CommandText + ' ORDER BY CIDADES.CIDADE_NOME, CLIENTES.CLI_ID'
   else
      dstRelatorio.CommandText := dstRelatorio.CommandText + ' ORDER BY CLIENTES.CLI_ID';

   if (Trim(edCodigoCidade.Text) <> EmptyStr) then
   begin
      dstRelatorio.ParamByName('pCIDADE').AsString := edCodigoCidade.Text;
   end;

   cdsRelatorio.Open;

   if (cdsRelatorio.IsEmpty) then
   begin
      MessageDLG('Nenhum registro encontrado!', mtInformation, [mbOk],0);
   end
   else
   begin
      qckRepClientes.Preview;
   end;
end;

procedure TfrmRelatorioClientes.btSelecionarCidadeClick(Sender: TObject);
begin
   Application.CreateForm(TfrmPesquisar, frmPesquisar);
   frmPesquisar.Tag := 1; //cidades
   frmPesquisar.ShowModal();
   frmPesquisar.Free;
end;

procedure TfrmRelatorioClientes.FormShow(Sender: TObject);
begin
   edCodigoCidade.Text := EmptyStr;
   edNomeCidade.Text := EmptyStr;
   edUF.Text := EmptyStr;

end;

procedure TfrmRelatorioClientes.qrNomeCidadePrint(sender: TObject;
  var Value: String);
begin
   Value := cdsRelatorioCIDADE_NOME.AsString + '/' + cdsRelatorioCIDADE_UF.AsString;
end;

procedure TfrmRelatorioClientes.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
   PrintBand := ckAgrupar.Checked;
end;

end.
