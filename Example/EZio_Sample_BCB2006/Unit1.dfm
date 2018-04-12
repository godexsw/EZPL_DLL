object Form1: TForm1
  Left = 351
  Top = 203
  Caption = 'EZio Demo BCB6'
  ClientHeight = 534
  ClientWidth = 741
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object Grp_Communication: TGroupBox
    Left = 20
    Top = 10
    Width = 877
    Height = 188
    Caption = ' Communication '
    TabOrder = 0
    DesignSize = (
      877
      188)
    object Lbl_Baud: TLabel
      Left = 683
      Top = 62
      Width = 64
      Height = 16
      Anchors = [akTop, akRight]
      Caption = 'Baud Rate'
    end
    object Lbl_NetPort: TLabel
      Left = 683
      Top = 148
      Width = 24
      Height = 16
      Anchors = [akTop, akRight]
      Caption = 'Port'
    end
    object RBtn_USB: TRadioButton
      Left = 20
      Top = 30
      Width = 88
      Height = 20
      Caption = 'USB'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RBtn_COM: TRadioButton
      Left = 20
      Top = 59
      Width = 88
      Height = 21
      Caption = 'COM'
      TabOrder = 1
    end
    object RBtn_LPT: TRadioButton
      Left = 20
      Top = 89
      Width = 88
      Height = 21
      Caption = 'LPT'
      TabOrder = 2
    end
    object RBtn_Driver: TRadioButton
      Left = 20
      Top = 118
      Width = 88
      Height = 21
      Caption = 'Driver'
      TabOrder = 3
    end
    object RBtn_NET: TRadioButton
      Left = 20
      Top = 148
      Width = 88
      Height = 21
      Caption = 'Network'
      TabOrder = 4
    end
    object Cbo_COM: TComboBox
      Left = 128
      Top = 57
      Width = 513
      Height = 24
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 16
      TabOrder = 5
      Items.Strings = (
        'COM1'
        'COM2'
        'COM3'
        'COM4')
    end
    object Cbo_LPT: TComboBox
      Left = 128
      Top = 86
      Width = 513
      Height = 24
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 16
      TabOrder = 6
      Items.Strings = (
        'LPT1'
        'LPT2')
    end
    object Cbo_Driver: TComboBox
      Left = 128
      Top = 116
      Width = 513
      Height = 24
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 16
      TabOrder = 7
    end
    object Ed_IP: TEdit
      Left = 128
      Top = 145
      Width = 513
      Height = 24
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 8
      Text = '192.168.102.101'
    end
    object Ed_Baud: TEdit
      Left = 757
      Top = 57
      Width = 100
      Height = 24
      Anchors = [akTop, akRight]
      TabOrder = 9
      Text = '9600'
    end
    object Ed_NetPort: TEdit
      Left = 757
      Top = 145
      Width = 100
      Height = 24
      Anchors = [akTop, akRight]
      TabOrder = 10
      Text = '9100'
    end
  end
  object Grp_Label: TGroupBox
    Left = 20
    Top = 207
    Width = 464
    Height = 159
    Caption = ' Label Setup '
    TabOrder = 1
    object Lbl_PaperType: TLabel
      Left = 25
      Top = 32
      Width = 72
      Height = 16
      Caption = 'Paper Type'
    end
    object Lbl_Speed: TLabel
      Left = 279
      Top = 32
      Width = 41
      Height = 16
      Caption = 'Speed'
    end
    object Lbl_GapFeed: TLabel
      Left = 23
      Top = 62
      Width = 102
      Height = 16
      Caption = 'Gap Length (mm)'
    end
    object Lbl_Label_W: TLabel
      Left = 23
      Top = 91
      Width = 104
      Height = 16
      Caption = 'Label Width (mm)'
    end
    object Lbl_Label_H: TLabel
      Left = 23
      Top = 121
      Width = 109
      Height = 16
      Caption = 'Label Height (mm)'
    end
    object Lbl_Dark: TLabel
      Left = 279
      Top = 62
      Width = 29
      Height = 16
      Caption = 'Dark'
    end
    object Lbl_CopyNo: TLabel
      Left = 279
      Top = 91
      Width = 56
      Height = 16
      Caption = 'Copy No.'
    end
    object Lbl_PageNo: TLabel
      Left = 279
      Top = 121
      Width = 57
      Height = 16
      Caption = 'Page No.'
    end
    object Cbo_PaperType: TComboBox
      Left = 158
      Top = 30
      Width = 99
      Height = 24
      Style = csDropDownList
      ItemHeight = 16
      TabOrder = 0
      OnChange = Cbo_PaperTypeChange
      Items.Strings = (
        'Gap'
        'Continue')
    end
    object Ed_GapFeed: TEdit
      Left = 156
      Top = 55
      Width = 101
      Height = 24
      TabOrder = 1
      Text = '3'
    end
    object Ed_Label_W: TEdit
      Left = 156
      Top = 85
      Width = 101
      Height = 24
      TabOrder = 2
      Text = '54'
    end
    object Ed_Label_H: TEdit
      Left = 156
      Top = 114
      Width = 101
      Height = 24
      TabOrder = 3
      Text = '40'
    end
    object Ed_Speed: TEdit
      Left = 363
      Top = 26
      Width = 81
      Height = 24
      TabOrder = 4
      Text = '3'
    end
    object Ed_Dark: TEdit
      Left = 363
      Top = 55
      Width = 81
      Height = 24
      TabOrder = 5
      Text = '10'
    end
    object Ed_CopyNo: TEdit
      Left = 363
      Top = 85
      Width = 81
      Height = 24
      TabOrder = 6
      Text = '1'
    end
    object Ed_PageNo: TEdit
      Left = 363
      Top = 114
      Width = 81
      Height = 24
      TabOrder = 7
      Text = '1'
    end
  end
  object Grp_Demo: TGroupBox
    Left = 20
    Top = 374
    Width = 523
    Height = 277
    Caption = ' Print Demo '
    TabOrder = 2
    object Btn_PrintText: TButton
      Left = 20
      Top = 30
      Width = 149
      Height = 30
      Caption = 'Print Text'
      TabOrder = 0
      OnClick = Btn_PrintTextClick
    end
    object Btn_PrintImage: TButton
      Left = 20
      Top = 69
      Width = 149
      Height = 31
      Caption = 'Print Image'
      TabOrder = 1
      OnClick = Btn_PrintImageClick
    end
    object Btn_AutoSensing: TButton
      Left = 20
      Top = 108
      Width = 149
      Height = 31
      Caption = 'Auto Sensing'
      TabOrder = 2
      OnClick = Btn_AutoSensingClick
    end
    object Btn_GetVersion: TButton
      Left = 20
      Top = 148
      Width = 149
      Height = 30
      Caption = 'Get Dll Version'
      TabOrder = 3
      OnClick = Btn_GetVersionClick
    end
    object Btn_SendByte: TButton
      Left = 20
      Top = 187
      Width = 149
      Height = 31
      Caption = 'Send Byte Array'
      TabOrder = 4
      OnClick = Btn_SendByteClick
    end
    object Btn_UploadTextImage: TButton
      Left = 20
      Top = 226
      Width = 149
      Height = 31
      Caption = 'Upload Text Image'
      TabOrder = 5
      OnClick = Btn_UploadTextImageClick
    end
    object Btn_PrintCode39: TButton
      Left = 187
      Top = 30
      Width = 149
      Height = 30
      Caption = 'Print 1D Barcode'
      TabOrder = 6
      OnClick = Btn_PrintCode39Click
    end
    object Btn_QRCode: TButton
      Left = 187
      Top = 69
      Width = 149
      Height = 31
      Caption = 'Print QRCode'
      TabOrder = 7
      OnClick = Btn_QRCodeClick
    end
    object Btn_PDF417: TButton
      Left = 187
      Top = 108
      Width = 149
      Height = 31
      Caption = 'Print PDF417'
      TabOrder = 8
      OnClick = Btn_PDF417Click
    end
    object Btn_Aztec: TButton
      Left = 187
      Top = 148
      Width = 149
      Height = 30
      Caption = 'Print Aztec'
      TabOrder = 9
      OnClick = Btn_AztecClick
    end
    object Btn_Maxicode: TButton
      Left = 187
      Top = 187
      Width = 149
      Height = 31
      Caption = 'Print Maxicode'
      TabOrder = 10
      OnClick = Btn_MaxicodeClick
    end
    object Btn_DataMatrix: TButton
      Left = 187
      Top = 226
      Width = 149
      Height = 31
      Caption = 'Print DataMatrix Code'
      TabOrder = 11
      OnClick = Btn_DataMatrixClick
    end
    object Btn_PrintShape: TButton
      Left = 354
      Top = 30
      Width = 149
      Height = 30
      Caption = 'Print Shape'
      TabOrder = 12
      OnClick = Btn_PrintShapeClick
    end
    object Btn_InternalFont: TButton
      Left = 354
      Top = 69
      Width = 149
      Height = 31
      Caption = 'Internal Font Print'
      TabOrder = 13
      OnClick = Btn_InternalFontClick
    end
    object Btn_AsiaFont: TButton
      Left = 354
      Top = 108
      Width = 149
      Height = 31
      Caption = 'Asia Font Print'
      TabOrder = 14
      OnClick = Btn_AsiaFontClick
    end
    object Btn_BitmappedFont: TButton
      Left = 354
      Top = 148
      Width = 149
      Height = 30
      Caption = 'Download Font Print'
      TabOrder = 15
      OnClick = Btn_BitmappedFontClick
    end
    object Btn_TrueTypeFont: TButton
      Left = 354
      Top = 187
      Width = 149
      Height = 31
      Caption = 'True Type Font Print'
      TabOrder = 16
      OnClick = Btn_TrueTypeFontClick
    end
    object Btn_PrintHalftoneImg: TButton
      Left = 354
      Top = 226
      Width = 149
      Height = 31
      Caption = 'Print Halftone Image'
      TabOrder = 17
      OnClick = Btn_PrintHalftoneImgClick
    end
  end
  object Grp_Command: TGroupBox
    Left = 561
    Top = 374
    Width = 336
    Height = 277
    Caption = ' Terminal (Send And Receive) '
    TabOrder = 3
    DesignSize = (
      336
      277)
    object Cbo_Cmd: TComboBox
      Left = 20
      Top = 27
      Width = 296
      Height = 24
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      ItemHeight = 16
      TabOrder = 0
      OnChange = Cbo_CmdChange
      Items.Strings = (
        '~B'
        '~V'
        '~S,CHECK')
    end
    object Btn_Execute: TButton
      Left = 20
      Top = 234
      Width = 296
      Height = 31
      Anchors = [akLeft, akRight, akBottom]
      Caption = 'Execute'
      TabOrder = 1
      OnClick = Btn_ExecuteClick
    end
    object Rich_Reply: TRichEdit
      Left = 20
      Top = 113
      Width = 296
      Height = 95
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssBoth
      TabOrder = 2
    end
    object Rich_Cmd: TRichEdit
      Left = 20
      Top = 53
      Width = 296
      Height = 60
      Anchors = [akLeft, akTop, akRight]
      Font.Charset = CHINESEBIG5_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
  end
  object GroupBox1: TGroupBox
    Left = 502
    Top = 207
    Width = 395
    Height = 159
    Caption = ' Upload Image '
    TabOrder = 4
    DesignSize = (
      395
      159)
    object Btn_Upload_Ext: TButton
      Left = 20
      Top = 30
      Width = 355
      Height = 30
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Upload Image To External Memory'
      TabOrder = 0
      OnClick = Btn_Upload_ExtClick
    end
    object Btn_Upload_Int: TButton
      Left = 20
      Top = 69
      Width = 355
      Height = 31
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Upload Image To Internal Memory'
      TabOrder = 1
      OnClick = Btn_Upload_IntClick
    end
    object Btn_HalfToneImage: TButton
      Left = 20
      Top = 108
      Width = 355
      Height = 31
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Upload Image And Do Halftoning'
      TabOrder = 2
      OnClick = Btn_HalfToneImageClick
    end
  end
  object MyOpenDialog: TOpenDialog
    Left = 104
    Top = 16
  end
end
