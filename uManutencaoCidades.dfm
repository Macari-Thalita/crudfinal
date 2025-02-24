object frmCidades: TfrmCidades
  Left = 631
  Top = 323
  Width = 500
  Height = 178
  Caption = 'frmCidades'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnInformacoes: TPanel
    Left = 0
    Top = 0
    Width = 492
    Height = 97
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
    object lbNomeCidade: TLabel
      Left = 57
      Top = 16
      Width = 31
      Height = 13
      Caption = 'Nome:'
      Enabled = False
    end
    object lbUF: TLabel
      Left = 449
      Top = 16
      Width = 17
      Height = 13
      Caption = 'UF:'
      Enabled = False
    end
    object edCodigoCidade: TEdit
      Left = 8
      Top = 32
      Width = 41
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object edNomeCidade: TEdit
      Left = 56
      Top = 32
      Width = 385
      Height = 21
      Enabled = False
      TabOrder = 1
    end
    object edUF: TEdit
      Left = 448
      Top = 32
      Width = 33
      Height = 21
      Enabled = False
      TabOrder = 2
    end
    object DBNavigator1: TDBNavigator
      Left = 248
      Top = 64
      Width = 240
      Height = 25
      DataSource = dmConnection.dtsClientes
      TabOrder = 3
    end
  end
  object pnBotoes: TPanel
    Left = 0
    Top = 98
    Width = 492
    Height = 49
    Align = alBottom
    Anchors = [akLeft, akBottom]
    BevelOuter = bvNone
    TabOrder = 1
    object frm: TButton
      Left = 88
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Alterar'
      TabOrder = 1
      OnClick = frmClick
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
    end
    object btRelatorio: TButton
      Left = 408
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Relat'#243'rios'
      TabOrder = 5
    end
  end
  object SQLQuery1: TSQLQuery
    NoMetadata = True
    MaxBlobSize = 0
    Params = <>
    Left = 64
    Top = 72
  end
end
