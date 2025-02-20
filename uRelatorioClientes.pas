unit uRelatorioClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, QRCtrls, ExtCtrls, DB, dmConexao, FMTBcd, SqlExpr,
  StdCtrls;

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
    qrConsultaRel: TSQLQuery;
    RadioButton1: TRadioButton;
    btVisualizar: TButton;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    procedure btVisualizarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioClientes: TfrmRelatorioClientes;

implementation

{$R *.dfm}

procedure TfrmRelatorioClientes.btVisualizarClick(Sender: TObject);
begin
   qrConsultaRel.Close;
   qrConsultaRel.SQL.Clear;
   qrConsultaRel.SQL.Add('SELECT * FROM CLIENTES LEFT OUTER JOIN CIDADES ON CIDADES.CIDADE_ID = CLIENTES.CIDADE_ID ORDER BY CLI_ID');
   qrConsultaRel.Open;


   qckRepClientes.Preview;
end;

end.
