VERSION 5.00
Begin VB.Form MainForm 
   BorderStyle     =   1  '單線固定
   Caption         =   "EZio DLL Sample - VB6"
   ClientHeight    =   8250
   ClientLeft      =   45
   ClientTop       =   375
   ClientWidth     =   11310
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   8250
   ScaleWidth      =   11310
   StartUpPosition =   3  '系統預設值
   Begin VB.Frame Frame4 
      Caption         =   " Terminal "
      Height          =   3495
      Left            =   7560
      TabIndex        =   49
      Top             =   4560
      Width           =   3495
      Begin VB.CommandButton Btn_Execute 
         Caption         =   "Execute"
         Height          =   375
         Left            =   240
         TabIndex        =   53
         Top             =   2880
         Width           =   3015
      End
      Begin VB.TextBox Txt_Reply 
         Height          =   1575
         Left            =   240
         MultiLine       =   -1  'True
         TabIndex        =   52
         Top             =   1320
         Width           =   3015
      End
      Begin VB.TextBox Txt_Cmd 
         Height          =   615
         Left            =   240
         MultiLine       =   -1  'True
         TabIndex        =   51
         Top             =   720
         Width           =   3015
      End
      Begin VB.ComboBox Cbo_Cmd 
         Height          =   300
         ItemData        =   "FrmMain.frx":0000
         Left            =   240
         List            =   "FrmMain.frx":0010
         Style           =   2  '單純下拉式
         TabIndex        =   50
         Top             =   360
         Width           =   3015
      End
   End
   Begin VB.Frame Frame3 
      Caption         =   " Print Demo "
      Height          =   3495
      Left            =   240
      TabIndex        =   30
      Top             =   4560
      Width           =   7215
      Begin VB.CommandButton Btn_PrintHalftoneImg 
         Caption         =   "Print Halftone Image"
         Height          =   495
         Left            =   4800
         TabIndex        =   48
         Top             =   2760
         Width           =   2175
      End
      Begin VB.CommandButton Btn_TrueTypeFont 
         Caption         =   "True Type Font Print"
         Height          =   495
         Left            =   4800
         TabIndex        =   47
         Top             =   2280
         Width           =   2175
      End
      Begin VB.CommandButton Btn_BitmappedFont 
         Caption         =   "Download Font Print"
         Height          =   495
         Left            =   4800
         TabIndex        =   46
         Top             =   1800
         Width           =   2175
      End
      Begin VB.CommandButton Btn_AsiaFont 
         Caption         =   "Asia Font Print"
         Height          =   495
         Left            =   4800
         TabIndex        =   45
         Top             =   1320
         Width           =   2175
      End
      Begin VB.CommandButton Btn_InternalFont 
         Caption         =   "Internal Font Print"
         Height          =   495
         Left            =   4800
         TabIndex        =   44
         Top             =   840
         Width           =   2175
      End
      Begin VB.CommandButton Btn_PrintShape 
         Caption         =   "Print Shape"
         Height          =   495
         Left            =   4800
         TabIndex        =   43
         Top             =   360
         Width           =   2175
      End
      Begin VB.CommandButton Btn_DataMatrix 
         Caption         =   "Print DataMatrix Code"
         Height          =   495
         Left            =   2520
         TabIndex        =   42
         Top             =   2760
         Width           =   2175
      End
      Begin VB.CommandButton Btn_Maxicode 
         Caption         =   "Print Maxicode"
         Height          =   495
         Left            =   2520
         TabIndex        =   41
         Top             =   2280
         Width           =   2175
      End
      Begin VB.CommandButton Btn_Aztec 
         Caption         =   "Print Aztec"
         Height          =   495
         Left            =   2520
         TabIndex        =   40
         Top             =   1800
         Width           =   2175
      End
      Begin VB.CommandButton Btn_PDF417 
         Caption         =   "Print PDF417"
         Height          =   495
         Left            =   2520
         TabIndex        =   39
         Top             =   1320
         Width           =   2175
      End
      Begin VB.CommandButton Btn_PrintCode39 
         Caption         =   "Print 1D Barcode"
         Height          =   495
         Left            =   2520
         TabIndex        =   38
         Top             =   840
         Width           =   2175
      End
      Begin VB.CommandButton Btn_QRCode 
         Caption         =   "Print QRCode"
         Height          =   495
         Left            =   2520
         TabIndex        =   37
         Top             =   360
         Width           =   2175
      End
      Begin VB.CommandButton Btn_UploadTextImage 
         Caption         =   "Upload Text Image"
         Height          =   495
         Left            =   240
         TabIndex        =   36
         Top             =   2760
         Width           =   2175
      End
      Begin VB.CommandButton Btn_SendByte 
         Caption         =   "Send Byte Array"
         Height          =   495
         Left            =   240
         TabIndex        =   35
         Top             =   2280
         Width           =   2175
      End
      Begin VB.CommandButton Btn_GetVersion 
         Caption         =   "Get Dll Version"
         Height          =   495
         Left            =   240
         TabIndex        =   34
         Top             =   1800
         Width           =   2175
      End
      Begin VB.CommandButton Btn_AutoSensing 
         Caption         =   "Auto Sensing"
         Height          =   495
         Left            =   240
         TabIndex        =   33
         Top             =   1320
         Width           =   2175
      End
      Begin VB.CommandButton Btn_PrintImage 
         Caption         =   "Print Image"
         Height          =   495
         Left            =   240
         TabIndex        =   32
         Top             =   840
         Width           =   2175
      End
      Begin VB.CommandButton Btn_PrintText 
         Caption         =   "Print Text"
         Height          =   495
         Left            =   240
         TabIndex        =   31
         Top             =   360
         Width           =   2175
      End
   End
   Begin VB.Frame Frame2 
      Caption         =   " Label Setup "
      Height          =   1935
      Left            =   240
      TabIndex        =   13
      Top             =   2520
      Width           =   10815
      Begin VB.TextBox Num_Page 
         Height          =   270
         Left            =   4920
         TabIndex        =   29
         Text            =   "1"
         Top             =   1440
         Width           =   1575
      End
      Begin VB.TextBox Num_Copy 
         Height          =   270
         Left            =   4920
         TabIndex        =   28
         Text            =   "1"
         Top             =   1080
         Width           =   1575
      End
      Begin VB.TextBox Num_Dark 
         Height          =   270
         Left            =   4920
         TabIndex        =   27
         Text            =   "10"
         Top             =   720
         Width           =   1575
      End
      Begin VB.TextBox Num_Speed 
         Height          =   270
         Left            =   4920
         TabIndex        =   26
         Text            =   "3"
         Top             =   360
         Width           =   1575
      End
      Begin VB.TextBox Num_Label_H 
         Height          =   270
         Left            =   1920
         TabIndex        =   25
         Text            =   "40"
         Top             =   1440
         Width           =   1575
      End
      Begin VB.TextBox Num_Label_W 
         Height          =   270
         Left            =   1920
         TabIndex        =   24
         Text            =   "54"
         Top             =   1080
         Width           =   1575
      End
      Begin VB.TextBox Num_GapFeed 
         Height          =   270
         Left            =   1920
         TabIndex        =   23
         Text            =   "3"
         Top             =   720
         Width           =   1575
      End
      Begin VB.ComboBox Cbo_PaperType 
         Height          =   300
         ItemData        =   "FrmMain.frx":0034
         Left            =   1920
         List            =   "FrmMain.frx":003E
         TabIndex        =   22
         Text            =   "Combo4"
         Top             =   360
         Width           =   1575
      End
      Begin VB.Label Label10 
         AutoSize        =   -1  'True
         Caption         =   "Page No"
         Height          =   180
         Left            =   3960
         TabIndex        =   21
         Top             =   1440
         Width           =   585
      End
      Begin VB.Label Label9 
         AutoSize        =   -1  'True
         Caption         =   "Copy No"
         Height          =   180
         Left            =   3960
         TabIndex        =   20
         Top             =   1080
         Width           =   645
      End
      Begin VB.Label Label8 
         AutoSize        =   -1  'True
         Caption         =   "Dark"
         Height          =   180
         Left            =   3960
         TabIndex        =   19
         Top             =   720
         Width           =   345
      End
      Begin VB.Label Label7 
         AutoSize        =   -1  'True
         Caption         =   "Speed (ips)"
         Height          =   180
         Left            =   3960
         TabIndex        =   18
         Top             =   360
         Width           =   780
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         Caption         =   "Label Height (mm)"
         Height          =   180
         Left            =   360
         TabIndex        =   17
         Top             =   1440
         Width           =   1335
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         Caption         =   "Label Width (mm)"
         Height          =   180
         Left            =   360
         TabIndex        =   16
         Top             =   1080
         Width           =   1305
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         Caption         =   "Gap Length (mm)"
         Height          =   180
         Left            =   360
         TabIndex        =   15
         Top             =   720
         Width           =   1260
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         Caption         =   "Paper Type"
         Height          =   180
         Left            =   360
         TabIndex        =   14
         Top             =   360
         Width           =   795
      End
   End
   Begin VB.Frame Frame1 
      Caption         =   " Communication "
      Height          =   2295
      Left            =   240
      TabIndex        =   0
      Top             =   120
      Width           =   10815
      Begin VB.TextBox Txt_Driver 
         Height          =   270
         Left            =   1680
         TabIndex        =   54
         Text            =   "RT200i"
         Top             =   1440
         Width           =   6375
      End
      Begin VB.TextBox Txt_NetPort 
         Height          =   270
         Left            =   9480
         TabIndex        =   10
         Text            =   "9100"
         Top             =   1800
         Width           =   1095
      End
      Begin VB.TextBox Txt_Baud 
         Height          =   270
         Left            =   9480
         TabIndex        =   9
         Text            =   "9600"
         Top             =   720
         Width           =   1095
      End
      Begin VB.TextBox Txt_IP 
         Height          =   270
         Left            =   1680
         TabIndex        =   8
         Text            =   "192.168.102.101"
         Top             =   1800
         Width           =   6375
      End
      Begin VB.ComboBox Cbo_LPT 
         Height          =   300
         ItemData        =   "FrmMain.frx":0051
         Left            =   1680
         List            =   "FrmMain.frx":005B
         TabIndex        =   7
         Text            =   "LPT1"
         Top             =   1080
         Width           =   6375
      End
      Begin VB.ComboBox Cbo_COM 
         Height          =   300
         ItemData        =   "FrmMain.frx":006B
         Left            =   1680
         List            =   "FrmMain.frx":0075
         TabIndex        =   6
         Text            =   "COM1"
         Top             =   720
         Width           =   6375
      End
      Begin VB.OptionButton RBtn_NET 
         Caption         =   "Network"
         Height          =   255
         Left            =   240
         TabIndex        =   5
         Top             =   1800
         Width           =   1215
      End
      Begin VB.OptionButton RBtn_Driver 
         Caption         =   "Driver"
         Height          =   255
         Left            =   240
         TabIndex        =   4
         Top             =   1440
         Width           =   1215
      End
      Begin VB.OptionButton RBtn_LPT 
         Caption         =   "LPT"
         Height          =   255
         Left            =   240
         TabIndex        =   3
         Top             =   1080
         Width           =   1215
      End
      Begin VB.OptionButton RBtn_COM 
         Caption         =   "COM"
         Height          =   255
         Left            =   240
         TabIndex        =   2
         Top             =   720
         Width           =   1215
      End
      Begin VB.OptionButton RBtn_USB 
         Caption         =   "USB"
         Height          =   255
         Left            =   240
         TabIndex        =   1
         Top             =   360
         Value           =   -1  'True
         Width           =   1215
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         Caption         =   "Port"
         Height          =   180
         Left            =   8280
         TabIndex        =   12
         Top             =   1845
         Width           =   285
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         Caption         =   "Baud Rate"
         Height          =   180
         Left            =   8280
         TabIndex        =   11
         Top             =   760
         Width           =   735
      End
   End
End
Attribute VB_Name = "MainForm"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False


'------------------------------------------------------------------------
' Form Load
'------------------------------------------------------------------------
Private Sub Form_Load()

    Cbo_PaperType.ListIndex = 1

End Sub

'------------------------------------------------------------------------
' Click Event of Cbo_Cmd
'------------------------------------------------------------------------
Private Sub Cbo_Cmd_Click()

    Txt_Cmd.Text = Cbo_Cmd.Text

End Sub

'------------------------------------------------------------------------
' Connect Printer
'------------------------------------------------------------------------
Private Sub ConnectPrinter()

    If RBtn_USB.Value = True Then
        Call openport("6")
    ElseIf RBtn_COM.Value Then
        Call OpenUSB(Cbo_COM.Text)
        Call setbaudrate(CInt(Txt_Baud.Text))
    ElseIf RBtn_LPT.Value Then
        If Cbo_LPT.Text = "LPT1" Then
            Call openport("0")
        Else
            Call openport("5")
        End If
    ElseIf RBtn_Driver.Value Then
        Call OpenDriver(Cbo_Driver.SelectedItem.ToString())
    ElseIf RBtn_NET.Value Then
        Call OpenNet(Txt_IP.Text, Txt_NetPort.Text)
    End If

End Sub

'------------------------------------------------------------------------
' Disconnect Printer
'------------------------------------------------------------------------
Private Sub DisconnectPrinter()

    Call closeport

End Sub

'------------------------------------------------------------------------
' Label Setup
'------------------------------------------------------------------------
Private Sub LabelSetup()

    'Label Height & Gap
    If Cbo_PaperType.ListIndex = 0 Then
        Call sendcommand("^Q" + Num_Label_H.Text + "," + Num_GapFeed.Text)
    Else
        Call sendcommand("^Q" + Num_Label_H.Text + ",0," + Num_GapFeed.Text)
    End If
        
    'Label Width
    Call sendcommand("^W" + Num_Label_W.Text)
    
    'Dark
    Call sendcommand("^H" + Num_Dark.Text)
    
    'Speed
    Call sendcommand("^S" + Num_Speed.Text)
    
    'Page No.
    Call sendcommand("^P" + Num_Page.Text)
    
    'Copy No.
    Call sendcommand("^C" + Num_Copy.Text)

End Sub

'------------------------------------------------------------------------
' Print Job Start
'------------------------------------------------------------------------
Private Sub JobStart()

    Call sendcommand("^L")

End Sub

'------------------------------------------------------------------------
' Print Job End
'------------------------------------------------------------------------
Private Sub JobEnd()

    Call sendcommand("E")

End Sub

'------------------------------------------------------------------------
' Click [Print Text] Button
'------------------------------------------------------------------------
Private Sub Btn_PrintText_Click()
        
    Dim FontName As String
    Dim data As String

    FontName = "Arial"
    data = "GoDEX EZio DLL Test"
    'data = "GoDEX EZio DLL 測試"
       
    Call ConnectPrinter
    Call LabelSetup
    Call JobStart
    Call ecTextOut(10, 140, 34, FontName, data)
    Call ecTextOutR(10, 190, 34, FontName, data, 0, 900, 180)
    Call ecTextOutFine(10, 240, 34, FontName, data, 0, 700, 0, 0, 0, 0, 1)
    Call JobEnd
    Call DisconnectPrinter

End Sub

'------------------------------------------------------------------------
' Click [Print Image] Button
'------------------------------------------------------------------------
Private Sub Btn_PrintImage_Click()

   Call ConnectPrinter
   Call LabelSetup
   Call JobStart
   Call putimage(10, 10, "BEAR.BMP", 0)
   Call JobEnd
   Call DisconnectPrinter

End Sub

'------------------------------------------------------------------------
' Click [Print Image] Button
'------------------------------------------------------------------------
Private Sub Btn_AutoSensing_Click()
    
    Call ConnectPrinter
    Call LabelSetup
    Call sendcommand("~S,SENSOR,0")
    Call DisconnectPrinter

End Sub

'------------------------------------------------------------------------
' Click [Get Dll Version] Button
'------------------------------------------------------------------------
Private Sub Btn_GetVersion_Click()

    Dim ByteData(100) As Byte
    Dim VersionData As String
    
    Call GetDllVersion(ByteData(0))
    VersionData = StrConv(ByteData, vbUnicode)
    Call MsgBox(VersionData)
        
End Sub

'------------------------------------------------------------------------
' Click [Send Byte Array] Button
'------------------------------------------------------------------------
Private Sub Btn_SendByte_Click()
    
    Dim ByteData() As Byte
    Dim StringData As String
    
    ' ~V ==> Print Self-Test Page Command
    StringData = "~V" + vbCrLf
    
    ByteData = StrConv(StringData, vbFromUnicode)
    Call ConnectPrinter
    Call sendbuf(ByteData(0), UBound(ByteData))
    Call DisconnectPrinter
        
End Sub

'------------------------------------------------------------------------
' Click [Upload Text Image] Button
'------------------------------------------------------------------------
Private Sub Btn_UploadTextImage_Click()

    Dim ImageName As String
    Dim FontName As String
    Dim data As String
    Dim PosX As Integer
    Dim PosY As Integer

    FontName = "Arial"
    PosX = 10
    PosY = 10
    ImageName = "MyText"
    data = "EZio DLL - Download Text"

    Call ConnectPrinter
    Call LabelSetup

    ' Delete Old [Text Image]
    Call sendcommand("~MDELG," + ImageName)

    ' Upload New [Text Image]
    Call ecTextDownLoad(34, FontName, data, 20, 400, 0, ImageName)

    ' Print [Text Image]
    Call JobStart
    Call sendcommand("Y" & CStr(PosX) & "," & CStr(PosY) & "," & ImageName)
    Call JobEnd

    Call DisconnectPrinter

End Sub

'------------------------------------------------------------------------
' Click [Print QRCode] Button
'------------------------------------------------------------------------
Private Sub Btn_QRCode_Click()

    Dim ByteData() As Byte
    Dim StringData As String
    
    StringData = "ABCDEFG"
    
    ' Default Encoding (Not Unicode)
    ByteData = StrConv(StringData, vbUnicode)

    Call ConnectPrinter
    Call LabelSetup
    Call JobStart

    ' Print QR Code by Dll Function
    Call Bar_QRcode_S(10, 10, UBound(ByteData) + 1, ByteData(0))

    ' Print QR Code by Send() & SendByte()
    Call sendcommand("W240,10,5,2,M,8,5," & (UBound(ByteData) + 1) & ",0")
    Call sendbuf(ByteData(0), (UBound(ByteData) + 1))

    Call JobEnd
    Call DisconnectPrinter

End Sub

'------------------------------------------------------------------------
' Click [Print 1D Barcode] Button
'------------------------------------------------------------------------
Private Sub Btn_PrintCode39_Click()

    Call ConnectPrinter
    Call LabelSetup
    Call JobStart

    Call ecTextOut(10, 10, 34, "Arial", "Code 39")
    Call Bar_S("A3", 10, 50, "1234")    'BA3

    Call ecTextOut(10, 210, 34, "Arial", "EAN128")
    Call Bar_S("U", 10, 250, "1234")    'BU

    Call ecTextOut(10, 410, 34, "Arial", "Code128 Subset A")
    Call Bar_S("Q2", 10, 450, "A1234")  'BQ2

    Call JobEnd
    Call DisconnectPrinter

End Sub

'------------------------------------------------------------------------
' Click [Print PDF417] Button
'------------------------------------------------------------------------
Private Sub Btn_PDF417_Click()

    Dim StringData As String
    StringData = "GoDEX PDF417 Test"

    Call ConnectPrinter
    Call LabelSetup
    Call JobStart
    Call Bar_PDF417_S(10, 10, Len(StringData), StringData)
    Call JobEnd
    Call DisconnectPrinter

End Sub

'------------------------------------------------------------------------
' Click [Print Aztec] Button
'------------------------------------------------------------------------
Private Sub Btn_Aztec_Click()

    Dim StringData As String
    StringData = "GoDEX Aztec Test"

    Call ConnectPrinter
    Call LabelSetup
    Call JobStart
    Call Bar_Aztec_S(10, 10, Len(StringData), StringData)
    Call JobEnd
    Call DisconnectPrinter

End Sub

'------------------------------------------------------------------------
' Click [Print Maxicode] Button
'------------------------------------------------------------------------
Private Sub Btn_Maxicode_Click()

    Call ConnectPrinter
    Call LabelSetup
    Call JobStart
    Call Bar_Maxicode_S(10, 10, "840", "068107317", "666", 0, "123456")
    Call JobEnd
    Call DisconnectPrinter
    
End Sub

'------------------------------------------------------------------------
' Click [Print Maxicode] Button
'------------------------------------------------------------------------
Private Sub Btn_DataMatrix_Click()

    Dim StringData As String
    StringData = "GoDEX Test"
    
    Call ConnectPrinter
    Call LabelSetup
    Call JobStart
    Call Bar_DataMatrix_S(10, 10, Len(StringData), StringData)
    Call JobEnd
    Call DisconnectPrinter
    
End Sub

'------------------------------------------------------------------------
' Click [Print Shape] Button
'------------------------------------------------------------------------
Private Sub Btn_PrintShape_Click()

    Call ConnectPrinter
    Call LabelSetup

    ' First Label
    Call JobStart
    Call DrawHorLine(10, 10, 200, 5)
    Call DrawVerLine(10, 10, 200, 5)
    Call DrawOblique(10, 10, 5, 200, 200)
    Call FillRec(10, 260, 200, 150)
    Call DrawRec(300, 260, 200, 150, 5, 5)
    Call JobEnd

    ' Second Label
    Call JobStart
    Call DrawEllipse(10, 10, 200, 100, 5)
    Call DrawRoundRec(300, 10, 200, 100, 20, 20, 5)
    Call DrawTriangle(50, 150, 200, 180, 150, 250, 5)
    Call DrawDiamond(300, 150, 200, 100, 5)
    Call JobEnd
    
    Call DisconnectPrinter

End Sub

'------------------------------------------------------------------------
' Click [Internal Font Print] Button
'------------------------------------------------------------------------
Private Sub Btn_InternalFont_Click()

    Call ConnectPrinter
    Call LabelSetup

    ' Internal Font (Change Font)
    Call JobStart
    Call InternalFont_TextOut_S("A", 10, 10, "ABCDEFG")
    Call InternalFont_TextOut_S("B", 10, 60, "ABCDEFG")
    Call InternalFont_TextOut_S("C", 10, 110, "ABCDEFG")
    Call InternalFont_TextOut_S("D", 10, 160, "ABCDEFG")
    Call InternalFont_TextOut_S("E", 10, 210, "ABCDEFG")
    Call InternalFont_TextOut_S("F", 10, 260, "ABCDEFG")
    Call JobEnd

    ' Internal Font (Change Zoom)
    Call JobStart
    Call InternalFont_TextOut("C", 10, 10, 1, 1, 0, "0", "Font C x 1")
    Call InternalFont_TextOut("C", 10, 80, 2, 2, 0, "0", "Font C x 2")
    Call InternalFont_TextOut("C", 10, 150, 3, 3, 0, "0", "Font C x 3")
    Call InternalFont_TextOut("C", 10, 220, 4, 4, 0, "0", "Font C x 4")
    Call JobEnd

    ' Internal Font (Change Rotate & Inverse)
    Call JobStart
    Call InternalFont_TextOut("E", 10, 10, 1, 1, 0, "0", "Degree 0")
    Call InternalFont_TextOut("E", 100, 100, 1, 1, 0, "1I", "Degree 90")
    Call JobEnd

    Call DisconnectPrinter

End Sub

'------------------------------------------------------------------------
' Click [Asia Font Print] Button
'------------------------------------------------------------------------
Private Sub Btn_AsiaFont_Click()

    Call ConnectPrinter
    Call LabelSetup
    Call JobStart

    ' Asia Font (Need to upload [Tranditional Chainese] to AZ1)
    'Call InternalFont_TextOut_S("Z1", 10, 10, ChrW(20126) & ChrW(27954) & ChrW(23383) & ChrW(28204) & ChrW(35430))
    Call InternalFont_TextOut_S("Z1", 10, 10, "亞洲字測試")

    Call JobEnd
    Call DisconnectPrinter

End Sub

'------------------------------------------------------------------------
' Click [Download Font Print] Button
'------------------------------------------------------------------------
Private Sub Btn_BitmappedFont_Click()

    Call ConnectPrinter
    Call LabelSetup
    Call JobStart
    Call DownloadFont_TextOut_S("A", 10, 10, "Download Font")
    Call JobEnd
    Call DisconnectPrinter

End Sub

'------------------------------------------------------------------------
' Click [True Type Font Print] Button
'------------------------------------------------------------------------
Private Sub Btn_TrueTypeFont_Click()

    Call ConnectPrinter
    Call LabelSetup
    Call JobStart
    
    ' EZPL ATA ~ ATZ Command
    Call TrueTypeFont_TextOut_S("", 10, 10, "Built-In TTF Test")
    Call TrueTypeFont_TextOut_S("A", 10, 100, "ATA TTF Test")
    
    Call JobEnd
    Call DisconnectPrinter

End Sub

'------------------------------------------------------------------------
' Click [Print Halftone Image] Button
'------------------------------------------------------------------------
Private Sub Btn_PrintHalftoneImg_Click()

    Call ConnectPrinter
    Call LabelSetup
    Call JobStart
    Call putimage_Halftone(10, 10, "Lena.bmp", 0, 1)        'Cluster Dithering
    Call putimage_Halftone(160, 10, "Lena.bmp", 0, 2)       'Dispersed Dithering
    Call putimage_Halftone(310, 10, "Lena.bmp", 0, 3)       'Diffision Dithering
    Call JobEnd
    Call DisconnectPrinter

End Sub

'------------------------------------------------------------------------
' Click [Execute] Button
'------------------------------------------------------------------------
Private Sub Btn_Execute_Click()

    If Trim(Txt_Cmd.Text) <> "" Then
        Call ConnectPrinter
        Call sendcommand(Txt_Cmd.Text)
        Txt_Reply.Text = Read()
        Call DisconnectPrinter
    End If

End Sub

'------------------------------------------------------------------------
' Read Data From Printer
'------------------------------------------------------------------------
Public Function Read() As String
   
    Dim RetData As String
    Dim RetryNo As Integer
    Dim CurNo As Integer
    Dim Temp As String
    
    RetData = ""
    RetryNo = 3
    CurNo = 0
    
    While (CurNo < RetryNo)

        Dim ByteData(2048) As Byte
          
        If (RcvBuf(ByteData(0), UBound(ByteData) + 1) = 0) Then
            CurNo = CurNo + 1
        Else
            CurNo = 0
            Temp = StrConv(ByteData, vbUnicode)
            
            For i = 1 To Len(Temp)
                If Mid(Temp, i, 1) = Chr(0) Then
                    Temp = Mid(Temp, 1, i - 1)
                    Exit For
                End If
            Next i
            
            Temp = RTrim(Temp)
            RetData = RetData + Temp
        End If

    Wend
    
    RetData = Trim(RetData)
    Read = RetData

End Function
