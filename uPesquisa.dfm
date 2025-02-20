object frmPesquisar: TfrmPesquisar
  Left = 646
  Top = 329
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Pesquisar'
  ClientHeight = 354
  ClientWidth = 708
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnPesquisa: TPanel
    Left = 0
    Top = 0
    Width = 708
    Height = 97
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object lbDescricao: TLabel
      Left = 8
      Top = 16
      Width = 51
      Height = 13
      Caption = 'Descri'#231#227'o:'
    end
    object btFiltrar: TButton
      Left = 8
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Filtrar'
      TabOrder = 1
      OnClick = btFiltrarClick
    end
    object btSelecionar: TButton
      Left = 96
      Top = 64
      Width = 75
      Height = 25
      Caption = 'Selecionar'
      TabOrder = 2
      OnClick = btSelecionarClick
    end
    object edPesquisar: TEdit
      Left = 8
      Top = 32
      Width = 689
      Height = 21
      TabOrder = 0
      OnKeyPress = edPesquisarKeyPress
    end
    object btAtualiza: TButton
      Left = 632
      Top = 64
      Width = 59
      Height = 25
      Caption = 'Atualizar'
      TabOrder = 3
      OnClick = btAtualizaClick
    end
  end
  object pnGrid: TPanel
    Left = 0
    Top = 96
    Width = 708
    Height = 258
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object gdPesquisar: TDBGrid
      Left = 8
      Top = 8
      Width = 689
      Height = 241
      DataSource = dmConnection.dtsPesquisa
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
end
