object frmClientes: TfrmClientes
  Left = 767
  Top = 394
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de Clientes'
  ClientHeight = 210
  ClientWidth = 486
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object pnInformacoes: TPanel
    Left = 0
    Top = 0
    Width = 486
    Height = 161
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lbCodigo: TLabel
      Left = 9
      Top = 16
      Width = 36
      Height = 13
      Caption = 'C'#243'digo:'
      Enabled = False
    end
    object lbNome: TLabel
      Left = 65
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Nome:'
      Enabled = False
    end
    object lbNascimento: TLabel
      Left = 9
      Top = 64
      Width = 59
      Height = 13
      Caption = 'Nascimento:'
      Enabled = False
    end
    object lbCidade: TLabel
      Left = 9
      Top = 112
      Width = 36
      Height = 13
      Caption = 'Cidade:'
      Enabled = False
    end
    object lbNomeCidade: TLabel
      Left = 97
      Top = 112
      Width = 67
      Height = 13
      Caption = 'Nome Cidade:'
      Enabled = False
    end
    object lbUF: TLabel
      Left = 457
      Top = 112
      Width = 17
      Height = 13
      Caption = 'UF:'
      Enabled = False
    end
    object btSelecionarCidade: TButton
      Left = 62
      Top = 130
      Width = 25
      Height = 17
      Caption = '...'
      Enabled = False
      TabOrder = 0
      OnClick = btSelecionarCidadeClick
    end
    object edCodigoCliente: TDBEdit
      Left = 8
      Top = 32
      Width = 49
      Height = 21
      DataField = 'CLI_ID'
      DataSource = dmConnection.dtsClientes
      Enabled = False
      TabOrder = 1
    end
    object edNomeCliente: TDBEdit
      Left = 64
      Top = 32
      Width = 417
      Height = 21
      DataField = 'CLI_NOME'
      DataSource = dmConnection.dtsClientes
      Enabled = False
      TabOrder = 2
      OnKeyPress = edNomeClienteKeyPress
    end
    object edCodigoCidade: TDBEdit
      Left = 8
      Top = 128
      Width = 49
      Height = 21
      DataField = 'CIDADE_ID'
      DataSource = dmConnection.dtsClientes
      Enabled = False
      TabOrder = 4
      OnExit = edCodigoCidadeExit
      OnKeyPress = edCodigoCidadeKeyPress
    end
    object edNomeCidade: TDBEdit
      Left = 96
      Top = 128
      Width = 353
      Height = 21
      DataField = 'CIDADE_NOME'
      DataSource = dmConnection.dtsClientes
      Enabled = False
      TabOrder = 5
      OnKeyPress = edNomeCidadeKeyPress
    end
    object edUF: TDBEdit
      Left = 456
      Top = 128
      Width = 25
      Height = 21
      DataField = 'CIDADE_UF'
      DataSource = dmConnection.dtsClientes
      Enabled = False
      TabOrder = 6
      OnKeyPress = edUFKeyPress
    end
    object edNascimento: TDBEdit
      Left = 8
      Top = 80
      Width = 73
      Height = 21
      DataField = 'CLI_NASCIDO'
      DataSource = dmConnection.dtsClientes
      Enabled = False
      MaxLength = 10
      TabOrder = 3
    end
    object DBNavigator1: TDBNavigator
      Left = 240
      Top = 56
      Width = 240
      Height = 25
      DataSource = dmConnection.dtsClientes
      TabOrder = 7
    end
  end
  object pnBotoes: TPanel
    Left = 0
    Top = 161
    Width = 486
    Height = 49
    Align = alBottom
    Anchors = [akLeft, akBottom]
    BevelOuter = bvNone
    TabOrder = 1
    object btAlterar: TButton
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = btAlterarClick
    end
    object btSalvar: TButton
      Left = 168
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Salvar'
      Enabled = False
      TabOrder = 2
      OnClick = btSalvarClick
    end
    object btNovo: TButton
      Left = 8
      Top = 8
      Width = 71
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
      OnClick = btNovoClick
    end
    object btCancelar: TButton
      Left = 248
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      Enabled = False
      TabOrder = 3
      OnClick = btCancelarClick
    end
    object btPesquisar: TButton
      Left = 328
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 4
      OnClick = btPesquisarClick
    end
    object btRelatorio: TButton
      Left = 408
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Relat'#243'rios'
      TabOrder = 5
      OnClick = btRelatorioClick
    end
  end
end
