object FrmSample: TFrmSample
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'EZio Sample Delphi'
  ClientHeight = 701
  ClientWidth = 932
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    932
    701)
  PixelsPerInch = 120
  TextHeight = 17
  object Grp_Communication: TGroupBox
    Left = 18
    Top = 12
    Width = 895
    Height = 200
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akLeft, akTop, akRight]
    Caption = ' Communication '
    TabOrder = 0
    DesignSize = (
      895
      200)
    object Lbl_Baud: TLabel
      Left = 688
      Top = 65
      Width = 63
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akTop, akRight]
      Caption = 'Baud Rate'
    end
    object Lbl_NetPort: TLabel
      Left = 688
      Top = 157
      Width = 26
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akTop, akRight]
      Caption = 'Port'
    end
    object RBtn_USB: TRadioButton
      Left = 21
      Top = 31
      Width = 94
      Height = 23
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'USB'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object RBtn_COM: TRadioButton
      Left = 21
      Top = 63
      Width = 94
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'COM'
      TabOrder = 1
    end
    object RBtn_LPT: TRadioButton
      Left = 21
      Top = 94
      Width = 94
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'LPT'
      TabOrder = 2
    end
    object RBtn_Driver: TRadioButton
      Left = 21
      Top = 126
      Width = 94
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Driver'
      TabOrder = 3
    end
    object RBtn_NET: TRadioButton
      Left = 21
      Top = 157
      Width = 94
      Height = 22
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Network'
      TabOrder = 4
    end
    object Cbo_COM: TComboBox
      Left = 136
      Top = 60
      Width = 507
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 5
      Items.Strings = (
        'COM1'
        'COM2'
        'COM3'
        'COM4')
    end
    object Cbo_LPT: TComboBox
      Left = 136
      Top = 92
      Width = 507
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 6
      Items.Strings = (
        'LPT1'
        'LPT2')
    end
    object Cbo_Driver: TComboBox
      Left = 136
      Top = 123
      Width = 507
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 7
    end
    object Ed_IP: TEdit
      Left = 136
      Top = 154
      Width = 507
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 8
      Text = '192.168.102.101'
    end
    object Ed_Baud: TEdit
      Left = 766
      Top = 60
      Width = 106
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akTop, akRight]
      TabOrder = 9
      Text = '9600'
    end
    object Ed_NetPort: TEdit
      Left = 766
      Top = 154
      Width = 106
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akTop, akRight]
      TabOrder = 10
      Text = '9100'
    end
  end
  object Grp_Label: TGroupBox
    Left = 18
    Top = 220
    Width = 485
    Height = 168
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = ' Label Setup '
    TabOrder = 1
    object Lbl_PaperType: TLabel
      Left = 26
      Top = 34
      Width = 70
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Paper Type'
    end
    object Lbl_Speed: TLabel
      Left = 284
      Top = 34
      Width = 38
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Speed'
    end
    object Lbl_GapFeed: TLabel
      Left = 25
      Top = 65
      Width = 109
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Gap Length (mm)'
    end
    object Lbl_Label_W: TLabel
      Left = 25
      Top = 97
      Width = 110
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Label Width (mm)'
    end
    object Lbl_Label_H: TLabel
      Left = 25
      Top = 128
      Width = 112
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Label Height (mm)'
    end
    object Lbl_Dark: TLabel
      Left = 284
      Top = 65
      Width = 29
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Dark'
    end
    object Lbl_CopyNo: TLabel
      Left = 284
      Top = 97
      Width = 58
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Copy No.'
    end
    object Lbl_PageNo: TLabel
      Left = 284
      Top = 128
      Width = 55
      Height = 17
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Page No.'
    end
    object Cbo_PaperType: TComboBox
      Left = 167
      Top = 31
      Width = 96
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        'Gap'
        'Continue')
    end
    object Ed_GapFeed: TEdit
      Left = 166
      Top = 59
      Width = 97
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 1
      Text = '3'
    end
    object Ed_Label_W: TEdit
      Left = 166
      Top = 90
      Width = 97
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 2
      Text = '54'
    end
    object Ed_Label_H: TEdit
      Left = 166
      Top = 122
      Width = 97
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 3
      Text = '40'
    end
    object Ed_Speed: TEdit
      Left = 373
      Top = 27
      Width = 89
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 4
      Text = '3'
    end
    object Ed_Dark: TEdit
      Left = 373
      Top = 63
      Width = 89
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 5
      Text = '10'
    end
    object Ed_CopyNo: TEdit
      Left = 373
      Top = 92
      Width = 89
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 6
      Text = '1'
    end
    object Ed_PageNo: TEdit
      Left = 373
      Top = 122
      Width = 89
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 7
      Text = '1'
    end
  end
  object Grp_Demo: TGroupBox
    Left = 22
    Top = 396
    Width = 556
    Height = 288
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akLeft, akTop, akBottom]
    Caption = ' Print Demo '
    TabOrder = 2
    object Btn_PrintText: TButton
      Left = 21
      Top = 32
      Width = 158
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Print Text'
      TabOrder = 0
      OnClick = Btn_PrintTextClick
    end
    object Btn_PrintImage: TButton
      Left = 21
      Top = 73
      Width = 158
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Print Image'
      TabOrder = 1
      OnClick = Btn_PrintImageClick
    end
    object Btn_AutoSensing: TButton
      Left = 21
      Top = 115
      Width = 158
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Auto Sensing'
      TabOrder = 2
      OnClick = Btn_AutoSensingClick
    end
    object Btn_GetVersion: TButton
      Left = 21
      Top = 157
      Width = 158
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Get Dll Version'
      TabOrder = 3
      OnClick = Btn_GetVersionClick
    end
    object Btn_SendByte: TButton
      Left = 21
      Top = 197
      Width = 158
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Send Byte Array'
      TabOrder = 4
      OnClick = Btn_SendByteClick
    end
    object Btn_UploadTextImage: TButton
      Left = 21
      Top = 239
      Width = 158
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Upload Text Image'
      TabOrder = 5
      OnClick = Btn_UploadTextImageClick
    end
    object Btn_PrintCode39: TButton
      Left = 199
      Top = 31
      Width = 158
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Print 1D Barcode'
      TabOrder = 6
      OnClick = Btn_PrintCode39Click
    end
    object Btn_QRCode: TButton
      Left = 199
      Top = 73
      Width = 158
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Print QRCode'
      TabOrder = 7
      OnClick = Btn_QRCodeClick
    end
    object Btn_PDF417: TButton
      Left = 199
      Top = 115
      Width = 158
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Print PDF417'
      TabOrder = 8
      OnClick = Btn_PDF417Click
    end
    object Btn_Aztec: TButton
      Left = 199
      Top = 157
      Width = 158
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Print Aztec'
      TabOrder = 9
      OnClick = Btn_AztecClick
    end
    object Btn_Maxicode: TButton
      Left = 199
      Top = 197
      Width = 158
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Print Maxicode'
      TabOrder = 10
      OnClick = Btn_MaxicodeClick
    end
    object Btn_DataMatrix: TButton
      Left = 199
      Top = 239
      Width = 158
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Print DataMatrix Code'
      TabOrder = 11
      OnClick = Btn_DataMatrixClick
    end
    object Btn_PrintShape: TButton
      Left = 377
      Top = 31
      Width = 158
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Print Shape'
      TabOrder = 12
      OnClick = Btn_PrintShapeClick
    end
    object Btn_InternalFont: TButton
      Left = 377
      Top = 72
      Width = 158
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Internal Font Print'
      TabOrder = 13
      OnClick = Btn_InternalFontClick
    end
    object Btn_AsiaFont: TButton
      Left = 377
      Top = 112
      Width = 158
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Asia Font Print'
      TabOrder = 14
      OnClick = Btn_AsiaFontClick
    end
    object Btn_BitmappedFont: TButton
      Left = 377
      Top = 153
      Width = 158
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Download Font Print'
      TabOrder = 15
      OnClick = Btn_BitmappedFontClick
    end
    object Btn_TrueTypeFont: TButton
      Left = 377
      Top = 194
      Width = 158
      Height = 32
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'True Type Font Print'
      TabOrder = 16
      OnClick = Btn_TrueTypeFontClick
    end
    object Btn_PrintHalftoneImg: TButton
      Left = 377
      Top = 234
      Width = 158
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Print Halftone Image'
      TabOrder = 17
      OnClick = Btn_PrintHalftoneImgClick
    end
  end
  object Grp_Command: TGroupBox
    Left = 586
    Top = 396
    Width = 325
    Height = 288
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = ' Terminal (Send And Receive) '
    TabOrder = 3
    DesignSize = (
      325
      288)
    object Cbo_Cmd: TComboBox
      Left = 21
      Top = 29
      Width = 284
      Height = 25
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      OnChange = Cbo_CmdChange
      Items.Strings = (
        '~B'
        '~V'
        '~S,CHECK')
    end
    object Btn_Execute: TButton
      Left = 21
      Top = 246
      Width = 284
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akLeft, akRight, akBottom]
      Caption = 'Execute'
      TabOrder = 1
      OnClick = Btn_ExecuteClick
    end
    object Rich_Reply: TRichEdit
      Left = 21
      Top = 141
      Width = 284
      Height = 102
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akLeft, akTop, akRight, akBottom]
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
      Left = 21
      Top = 63
      Width = 284
      Height = 74
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
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
    Left = 511
    Top = 220
    Width = 400
    Height = 168
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Anchors = [akLeft, akTop, akRight]
    Caption = 'Upload Image '
    TabOrder = 4
    DesignSize = (
      400
      168)
    object Btn_Upload_Ext: TButton
      Left = 21
      Top = 34
      Width = 357
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Upload Image To External Memory'
      TabOrder = 0
      OnClick = Btn_Upload_ExtClick
    end
    object Btn_Upload_Int: TButton
      Left = 21
      Top = 75
      Width = 357
      Height = 32
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Upload Image To Internal Memory'
      TabOrder = 1
      OnClick = Btn_Upload_IntClick
    end
    object Btn_HalfToneImage: TButton
      Left = 21
      Top = 115
      Width = 357
      Height = 33
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Upload Image And Do Halftoning'
      TabOrder = 2
      OnClick = Btn_HalfToneImageClick
    end
  end
  object MyOpenDialog: TOpenDialog
    Left = 488
    Top = 16
  end
end
