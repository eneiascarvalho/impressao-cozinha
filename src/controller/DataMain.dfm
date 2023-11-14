object dmMain: TdmMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 237
  Width = 199
  object Etiqueta: TFDMemTable
    FieldDefs = <
      item
        Name = 'nomeProduto'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'grupo'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'localArmazenamento'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'dataEntrada'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'dataValidade'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'responsavel'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'numEtiquetas'
        DataType = ftInteger
      end
      item
        Name = 'QR'
        DataType = ftMemo
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 32
    Top = 24
    object EtiquetanomeProduto: TStringField
      FieldName = 'nomeProduto'
      Size = 250
    end
    object Etiquetagrupo: TStringField
      FieldName = 'grupo'
      Size = 250
    end
    object EtiquetalocalArmazenamento: TStringField
      FieldName = 'localArmazenamento'
      Size = 250
    end
    object EtiquetadataEntrada: TStringField
      FieldName = 'dataEntrada'
      Size = 25
    end
    object EtiquetadataValidade: TStringField
      FieldName = 'dataValidade'
      Size = 25
    end
    object Etiquetaresponsavel: TStringField
      FieldName = 'responsavel'
      Size = 250
    end
    object EtiquetanumEtiquetas: TIntegerField
      FieldName = 'numEtiquetas'
    end
    object EtiquetaQR: TMemoField
      FieldName = 'QR'
      BlobType = ftMemo
    end
  end
  object Configuracao: TFDMemTable
    AfterPost = ConfiguracaoAfterPost
    FieldDefs = <
      item
        Name = 'PortaServidor'
        DataType = ftInteger
      end
      item
        Name = 'ImpressoraRede'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'InicioAutomatico'
        DataType = ftBoolean
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 32
    Top = 80
    object ConfiguracaoPortaServidor: TIntegerField
      FieldName = 'PortaServidor'
    end
    object ConfiguracaoImpressoraRede: TStringField
      FieldName = 'ImpressoraRede'
      Size = 250
    end
    object ConfiguracaoInicioAutomatico: TBooleanField
      FieldName = 'InicioAutomatico'
    end
  end
end
