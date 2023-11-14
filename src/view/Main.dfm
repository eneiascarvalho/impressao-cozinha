object frmMain: TfrmMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Servidor de impressao cozinha'
  ClientHeight = 273
  ClientWidth = 294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 288
    Height = 13
    Align = alTop
    Caption = 'Estado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 38
  end
  object lbEstado: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 22
    Width = 288
    Height = 25
    Margins.Bottom = 6
    Align = alTop
    Caption = 'AGUARDANDO ...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitWidth = 180
  end
  object Label2: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 56
    Width = 288
    Height = 13
    Align = alTop
    Caption = 'Configuracao'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    ExplicitTop = 51
    ExplicitWidth = 74
  end
  object lblPorta: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 72
    Width = 288
    Height = 13
    Margins.Top = 0
    Margins.Bottom = 0
    Align = alTop
    Caption = 'Porta do servidor'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitWidth = 83
  end
  object lblImpressora: TLabel
    AlignWithMargins = True
    Left = 3
    Top = 114
    Width = 288
    Height = 13
    Margins.Bottom = 0
    Align = alTop
    Caption = 'Impressora'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ExplicitTop = 113
    ExplicitWidth = 54
  end
  object chkIniciarAuto: TDBCheckBox
    AlignWithMargins = True
    Left = 3
    Top = 155
    Width = 288
    Height = 17
    Align = alTop
    Caption = 'Iniciar automaticamente'
    DataField = 'InicioAutomatico'
    DataSource = dsConfiguracao
    Enabled = False
    TabOrder = 2
    ExplicitLeft = 96
    ExplicitTop = 200
    ExplicitWidth = 97
  end
  object edtImpressora: TDBEdit
    AlignWithMargins = True
    Left = 3
    Top = 128
    Width = 288
    Height = 21
    Margins.Top = 1
    Align = alTop
    DataField = 'ImpressoraRede'
    DataSource = dsConfiguracao
    Enabled = False
    TabOrder = 1
  end
  object edtPorta: TDBEdit
    AlignWithMargins = True
    Left = 3
    Top = 86
    Width = 288
    Height = 22
    Margins.Top = 1
    Align = alTop
    DataField = 'PortaServidor'
    DataSource = dsConfiguracao
    Enabled = False
    TabOrder = 0
  end
  object btnConectar: TButton
    AlignWithMargins = True
    Left = 3
    Top = 178
    Width = 288
    Height = 25
    Align = alTop
    Caption = 'Conectar'
    TabOrder = 3
    OnClick = btnConectarClick
    ExplicitLeft = 40
    ExplicitWidth = 75
  end
  object btnDesconectar: TButton
    AlignWithMargins = True
    Left = 3
    Top = 209
    Width = 288
    Height = 25
    Align = alTop
    Caption = 'Desconectar'
    TabOrder = 4
    OnClick = btnDesconectarClick
    ExplicitLeft = 88
    ExplicitWidth = 75
  end
  object btnVerLog: TButton
    AlignWithMargins = True
    Left = 3
    Top = 240
    Width = 288
    Height = 25
    Align = alTop
    Caption = 'Ver log'
    TabOrder = 5
    OnClick = btnVerLogClick
    ExplicitLeft = 160
    ExplicitTop = 258
    ExplicitWidth = 75
  end
  object trayIcon: TJvTrayIcon
    Active = True
    IconIndex = 0
    Hint = 'Impressao Cozinha'
    Visibility = [tvVisibleTaskList, tvAutoHide, tvRestoreDbClick]
    Left = 24
    Top = 288
  end
  object tmrMiniminize: TTimer
    OnTimer = tmrMiniminizeTimer
    Left = 96
    Top = 288
  end
  object dsConfiguracao: TDataSource
    DataSet = dmMain.Configuracao
    Left = 168
    Top = 288
  end
end
