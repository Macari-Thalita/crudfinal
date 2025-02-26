object dmConnection: TdmConnection
  OldCreateOrder = False
  Left = 800
  Top = 307
  Height = 336
  Width = 476
  object sqlConexao: TSQLConnection
    Connected = True
    ConnectionName = 'CRUD'
    DriverName = 'Interbase'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpint.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Interbase'
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=localhost:C:\Thalita\DB\PROJETO.FDB'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet='
      'SQLDialect=3'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=sysdba'
      'WaitOnLocks=True')
    VendorLib = 'gds32.dll'
    Left = 32
    Top = 112
  end
  object dsClientes: TSQLDataSet
    NoMetadata = True
    SQLConnection = sqlConexao
    CommandText = 
      'select CLIENTES.*, CIDADES.CIDADE_NOME, CIDADES.CIDADE_UF from C' +
      'LIENTES'#13#10'left outer join CIDADES on CIDADES.CIDADE_ID = CLIENTES' +
      '.CIDADE_ID'
    Params = <>
    Left = 320
    Top = 32
    object dsClientesCLI_ID: TIntegerField
      FieldName = 'CLI_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dsClientesCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object dsClientesCLI_NASCIDO: TDateField
      FieldName = 'CLI_NASCIDO'
      ProviderFlags = [pfInUpdate]
    end
    object dsClientesCIDADE_ID: TIntegerField
      FieldName = 'CIDADE_ID'
      ProviderFlags = [pfInUpdate]
    end
    object dsClientesCIDADE_NOME: TStringField
      FieldName = 'CIDADE_NOME'
      ProviderFlags = []
      Size = 50
    end
    object dsClientesCIDADE_UF: TStringField
      FieldName = 'CIDADE_UF'
      ProviderFlags = []
      Size = 2
    end
  end
  object dspClientes: TDataSetProvider
    DataSet = dsClientes
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 320
    Top = 96
  end
  object cdsClientes: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspClientes'
    Left = 320
    Top = 168
    object cdsClientesCLI_ID: TIntegerField
      FieldName = 'CLI_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsClientesCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      ProviderFlags = [pfInUpdate]
      Required = True
      Size = 50
    end
    object cdsClientesCLI_NASCIDO: TDateField
      FieldName = 'CLI_NASCIDO'
      ProviderFlags = [pfInUpdate]
      EditMask = '!99/99/0000;1;_'
    end
    object cdsClientesCIDADE_ID: TIntegerField
      FieldName = 'CIDADE_ID'
      ProviderFlags = [pfInUpdate]
    end
    object cdsClientesCIDADE_NOME: TStringField
      FieldName = 'CIDADE_NOME'
      ProviderFlags = []
      Size = 50
    end
    object cdsClientesCIDADE_UF: TStringField
      FieldName = 'CIDADE_UF'
      ProviderFlags = []
      Size = 2
    end
  end
  object dtsClientes: TDataSource
    DataSet = cdsClientes
    Left = 320
    Top = 232
  end
  object qrConsulta: TSQLQuery
    NoMetadata = True
    SQLConnection = sqlConexao
    Params = <>
    Left = 96
    Top = 112
  end
  object dsPesquisa: TSQLDataSet
    NoMetadata = True
    SQLConnection = sqlConexao
    CommandText = 'select * from CLIENTES'
    Params = <>
    Left = 392
    Top = 32
  end
  object dspPesquisa: TDataSetProvider
    DataSet = dsPesquisa
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 392
    Top = 96
  end
  object cdsPesquisa: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesquisa'
    Left = 392
    Top = 168
  end
  object dtsPesquisa: TDataSource
    DataSet = cdsPesquisa
    Left = 392
    Top = 232
  end
end
