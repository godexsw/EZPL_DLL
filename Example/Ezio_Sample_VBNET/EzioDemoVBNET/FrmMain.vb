'------------------------------------------------------------------------------------------------
' Create FrmMain.vb by Jeffrey 2014/07/14
'------------------------------------------------------------------------------------------------

Imports System
Imports System.ComponentModel
Imports System.Drawing
Imports System.IO.Ports
Imports System.Text
Imports System.Windows.Forms
Imports System.IO
Imports System.Text.RegularExpressions

Public Class FrmMain

    Private Printer As GodexPrinter = New GodexPrinter()

    Dim CodePage_Code() As Integer = {0, _
            864, 708, 720, 28596, 10004, 1256, 775, 28594, 1257, 852, _
            28592, 10029, 1250, 51936, 54936, 936, 20936, 52936, 50227, 10008, _
            950, 20000, 20002, 10002, 10082, 866, 28595, 20866, 21866, 10007, _
            1251, 28603, 29001, 863, 20106, 737, 28597, 10006, 1253, 869, _
            862, 38598, 28598, 10005, 1255, 20420, 20880, 21025, 20277, 1142, _
            20278, 1143, 20297, 1147, 20273, 1141, 875, 20423, 20424, 20871, _
            1149, 500, 1148, 20280, 1144, 20290, 20833, 870, 20284, 1145, _
            20838, 1026, 20905, 20285, 1146, 37, 1140, 1047, 20924, 20003, _
            861, 10079, 57006, 57003, 57002, 57010, 57008, 57009, 57007, 57011, _
            57004, 57005, 20269, 51932, 20932, 50220, 50222, 50221, 10001, 932, _
            949, 51949, 50225, 1361, 10003, 20949, 28593, 28605, 865, 20108, _
            855, 858, 437, 860, 10010, 20107, 20261, 20001, 20004, 10021, _
            874, 857, 28599, 10081, 1254, 10017, 1200, 1201, 12001, 12000, _
            65000, 65001, 20127, 1258, 20005, 850, 20105, 28591, 10000, 1252}

    Dim CodePage_Name() As String = {"System Default", _
            "IBM864", "ASMO-708", "DOS-720", "iso-8859-6", "x-mac-arabic", "windows-1256", "ibm775", "iso-8859-4", "windows-1257", "ibm852", _
            "iso-8859-2", "x-mac-ce", "windows-1250", "EUC-CN", "GB18030", "gb2312", "x-cp20936", "hz-gb-2312", "x-cp50227", "x-mac-chinesesimp", _
            "big5", "x-Chinese-CNS", "x-Chinese-Eten", "x-mac-chinesetrad", "x-mac-croatian", "cp866", "iso-8859-5", "koi8-r", "koi8-u", "x-mac-cyrillic", _
            "windows-1251", "iso-8859-13", "x-Europa", "IBM863", "x-IA5-German", "ibm737", "iso-8859-7", "x-mac-greek", "windows-1253", "ibm869", _
            "DOS-862", "iso-8859-8-i", "iso-8859-8", "x-mac-hebrew", "windows-1255", "IBM420", "IBM880", "cp1025", "IBM277", "IBM01142", _
            "IBM278", "IBM01143", "IBM297", "IBM01147", "IBM273", "IBM01141", "cp875", "IBM423", "IBM424", "IBM871", _
            "IBM01149", "IBM500", "IBM01148", "IBM280", "IBM01144", "IBM290", "x-EBCDIC-KoreanExtended", "IBM870", "IBM284", "IBM01145", _
            "IBM-Thai", "IBM1026", "IBM905", "IBM285", "IBM01146", "IBM037", "IBM01140", "IBM01047", "IBM00924", "x-cp20003", _
            "ibm861", "x-mac-icelandic", "x-iscii-as", "x-iscii-be", "x-iscii-de", "x-iscii-gu", "x-iscii-ka", "x-iscii-ma", "x-iscii-or", "x-iscii-pa", _
            "x-iscii-ta", "x-iscii-te", "x-cp20269", "euc-jp", "EUC-JP", "iso-2022-jp", "iso-2022-jp", "csISO2022JP", "x-mac-japanese", "shift_jis", _
            "ks_c_5601-1987", "euc-kr", "iso-2022-kr", "Johab", "x-mac-korean", "x-cp20949", "iso-8859-3", "iso-8859-15", "IBM865", "x-IA5-Norwegian", _
            "IBM855", "IBM00858", "IBM437", "IBM860", "x-mac-romanian", "x-IA5-Swedish", "x-cp20261", "x-cp20001", "x-cp20004", "x-mac-thai", _
            "windows-874", "ibm857", "iso-8859-9", "x-mac-turkish", "windows-1254", "x-mac-ukrainian", "utf-16", "unicodeFFFE", "utf-32BE", "utf-32", _
            "utf-7", "utf-8", "us-ascii", "windows-1258", "x-cp20005", "ibm850", "x-IA5", "iso-8859-1", "macintosh", "Windows-1252"}

    Dim CodePage_DispName() As String = {"System Default", _
            "Arabic (864)", "Arabic (ASMO 708)", "Arabic (DOS)", "Arabic (ISO)", "Arabic (Mac)", _
            "Arabic (Windows)", "Baltic (DOS)", "Baltic (ISO)", "Baltic (Windows)", "Central European (DOS)", _
            "Central European (ISO)", "Central European (Mac)", "Central European (Windows)", "Chinese Simplified (EUC)", "Chinese Simplified (GB18030)", _
            "Chinese Simplified (GB2312)", "Chinese Simplified (GB2312-80)", "Chinese Simplified (HZ)", "Chinese Simplified (ISO-2022)", "Chinese Simplified (Mac)", _
            "Chinese Traditional (Big5)", "Chinese Traditional (CNS)", "Chinese Traditional (Eten)", "Chinese Traditional (Mac)", "Croatian (Mac)", _
            "Cyrillic (DOS)", "Cyrillic (ISO)", "Cyrillic (KOI8-R)", "Cyrillic (KOI8-U)", "Cyrillic (Mac)", _
            "Cyrillic (Windows)", "Estonian (ISO)", "Europa", "French Canadian (DOS)", "German (IA5)", _
            "Greek (DOS)", "Greek (ISO)", "Greek (Mac)", "Greek (Windows)", "Greek, Modern (DOS)", _
            "Hebrew (DOS)", "Hebrew (ISO-Logical)", "Hebrew (ISO-Visual)", "Hebrew (Mac)", "Hebrew (Windows)", _
            "IBM EBCDIC (Arabic)", "IBM EBCDIC (Cyrillic Russian)", "IBM EBCDIC (Cyrillic Serbian-Bulgarian)", "IBM EBCDIC (Denmark-Norway)", "IBM EBCDIC (Denmark-Norway-Euro)", _
            "IBM EBCDIC (Finland-Sweden)", "IBM EBCDIC (Finland-Sweden-Euro)", "IBM EBCDIC (France)", "IBM EBCDIC (France-Euro)", "IBM EBCDIC (Germany)", _
            "IBM EBCDIC (Germany-Euro)", "IBM EBCDIC (Greek Modern)", "IBM EBCDIC (Greek)", "IBM EBCDIC (Hebrew)", "IBM EBCDIC (Icelandic)", _
            "IBM EBCDIC (Icelandic-Euro)", "IBM EBCDIC (International)", "IBM EBCDIC (International-Euro)", "IBM EBCDIC (Italy)", "IBM EBCDIC (Italy-Euro)", _
            "IBM EBCDIC (Japanese katakana)", "IBM EBCDIC (Korean Extended)", "IBM EBCDIC (Multilingual Latin-2)", "IBM EBCDIC (Spain)", "IBM EBCDIC (Spain-Euro)", _
            "IBM EBCDIC (Thai)", "IBM EBCDIC (Turkish Latin-5)", "IBM EBCDIC (Turkish)", "IBM EBCDIC (UK)", "IBM EBCDIC (UK-Euro)", _
            "IBM EBCDIC (US-Canada)", "IBM EBCDIC (US-Canada-Euro)", "IBM Latin-1", "IBM Latin-1", "IBM5550 Taiwan", _
            "Icelandic (DOS)", "Icelandic (Mac)", "ISCII Assamese", "ISCII Bengali", "ISCII Devanagari", _
            "ISCII Gujarati", "ISCII Kannada", "ISCII Malayalam", "ISCII Oriya", "ISCII Punjabi", _
            "ISCII Tamil", "ISCII Telugu", "ISO-6937", "Japanese (EUC)", "Japanese (JIS 0208-1990 and 0212-1990)", _
            "Japanese (JIS)", "Japanese (JIS-Allow 1 byte Kana - SO/SI)", "Japanese (JIS-Allow 1 byte Kana)", "Japanese (Mac)", "Japanese (Shift-JIS)", _
            "Korean", "Korean (EUC)", "Korean (ISO)", "Korean (Johab)", "Korean (Mac)", "Korean Wansung", _
            "Latin 3 (ISO)", "Latin 9 (ISO)", "Nordic (DOS)", "Norwegian (IA5)", _
            "OEM Cyrillic", "OEM Multilingual Latin I", "OEM United States", "Portuguese (DOS)", "Romanian (Mac)", _
            "Swedish (IA5)", "T.61", "TCA Taiwan", "TeleText Taiwan", "Thai (Mac)", _
            "Thai (Windows)", "Turkish (DOS)", "Turkish (ISO)", "Turkish (Mac)", "Turkish (Windows)", _
            "Ukrainian (Mac)", "Unicode", "Unicode (Big endian)", "Unicode (UTF-32 Big endian)", "Unicode (UTF-32)", _
            "Unicode (UTF-7)", "Unicode (UTF-8)", "US-ASCII", "Vietnamese (Windows)", "Wang Taiwan", _
            "Western European (DOS)", "Western European (IA5)", "Western European (ISO)", "Western European (Mac)", "Western European (Windows)"}

    '------------------------------------------------------------------------
    ' Form Load
    '------------------------------------------------------------------------
    Private Sub FrmMain_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load

        ' Find Com Port
        Dim ComPrinter As String() = SerialPort.GetPortNames()
        If ComPrinter IsNot Nothing Then
            Cbo_COM.Items.Clear()
            For i As Integer = 0 To ComPrinter.Length - 1
                Cbo_COM.Items.Add(ComPrinter(i))
            Next
            If Cbo_COM.Items.Count > 0 Then
                Cbo_COM.SelectedIndex = 0
            End If
        End If

        ' Find GoDEX Driver Printer
        Dim driverPrinter As String() = GodexPrinter.GetDriverPrinter()
        If driverPrinter IsNot Nothing Then
            Cbo_Driver.Items.Clear()
            For i As Integer = 0 To driverPrinter.Length - 1
                Cbo_Driver.Items.Add(driverPrinter(i))
            Next
            If Cbo_Driver.Items.Count > 0 Then
                Cbo_Driver.SelectedIndex = 0
            End If
        End If

        Cbo_LPT.SelectedIndex = 0
        Cbo_PaperType.SelectedIndex = 1

        ' Set QrCode Encoding
        Cbo_QR_Encoding.Items.Clear()
        CodePage_Code(0) = Encoding.Default.CodePage
        For i As Integer = 0 To CodePage_DispName.Length - 1
            Cbo_QR_Encoding.Items.Add(CodePage_DispName(i) + " - " + CodePage_Code(i).ToString())
        Next

        ' UTF8
        'Cbo_QR_Encoding.SelectedIndex = 132

        ' Default Encoding
        Cbo_QR_Encoding.SelectedIndex = 0
        Cbo_PosTTF.SelectedIndex = 0

    End Sub

    '------------------------------------------------------------------------
    ' Connect Printer
    '------------------------------------------------------------------------
    Private Sub ConnectPrinter()

        If RBtn_USB.Checked Then
            Printer.Open(PortType.USB)
        ElseIf RBtn_COM.Checked Then
            If Cbo_COM.SelectedItem IsNot Nothing Then
                Printer.Open(Cbo_COM.SelectedItem.ToString())
                Printer.SetBaudrate(CInt(Txt_Baud.Text))
            End If
        ElseIf RBtn_LPT.Checked Then
            If Cbo_LPT.SelectedIndex = 0 Then
                Printer.Open(PortType.LPT1)
            Else
                Printer.Open(PortType.LPT2)
            End If
        ElseIf RBtn_Driver.Checked Then
            Printer.Open(Cbo_Driver.SelectedItem.ToString())
        ElseIf RBtn_NET.Checked Then
            Printer.Open(Txt_IP.Text, Integer.Parse(Txt_NetPort.Text))
        End If

    End Sub

    '------------------------------------------------------------------------
    ' Disconnect Printer
    '------------------------------------------------------------------------
    Private Sub DisconnectPrinter()
        Printer.Close()
    End Sub

    '------------------------------------------------------------------------
    ' Label Setup
    '------------------------------------------------------------------------
    Private Sub LabelSetup()

        Printer.Config.LabelMode(CType(Cbo_PaperType.SelectedIndex, PaperMode), CInt(Num_Label_H.Value), CInt(Num_GapFeed.Value))
        Printer.Config.LabelWidth(CInt(Num_Label_W.Value))
        Printer.Config.Dark(CInt(Num_Dark.Value))
        Printer.Config.Speed(CInt(Num_Speed.Value))
        Printer.Config.PageNo(CInt(Num_Page.Value))
        Printer.Config.CopyNo(CInt(Num_Copy.Value))

    End Sub

    '------------------------------------------------------------------------
    ' Paper Type Change Event
    '------------------------------------------------------------------------
    Private Sub Cbo_PaperType_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cbo_PaperType.SelectedIndexChanged

        If Cbo_PaperType.SelectedIndex = 0 Then
            Lbl_GapFeed.Text = "Gap Length (mm)"
        Else
            Lbl_GapFeed.Text = "Feed Length (mm)"
        End If

    End Sub

    '------------------------------------------------------------------------
    ' Command Change
    '------------------------------------------------------------------------
    Private Sub Cbo_Cmd_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cbo_Cmd.SelectedIndexChanged

        Txt_Cmd.Text = Cbo_Cmd.SelectedItem.ToString()

    End Sub

    '------------------------------------------------------------------------
    ' Click [Print Text] Button
    '------------------------------------------------------------------------
    Private Sub Btn_PrintText_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_PrintText.Click

        Dim fontHeight As Integer = 34
        ConnectPrinter()
        LabelSetup()

        Printer.Command.JobStart()
        Printer.Command.PrintText_Unicode(10, 10, fontHeight, "Arial", "這是中文測試")
        Printer.Command.PrintText_Unicode(10, 50, fontHeight, "MS Gothic", "これは日本のテストです", 0, FontWeight.FW_400_NORMAL, RotateMode.Angle_180)
        Printer.Command.PrintText_Unicode(10, 90, fontHeight, "GulimChe", "이것은 한국의 테스트입니다", 0, FontWeight.FW_900_HEAVY, RotateMode.Angle_0)
        Printer.Command.PrintText(10, 140, fontHeight, "Arial", "GoDEX EZio DLL Test")
        Printer.Command.PrintText(10, 190, fontHeight, "Arial", "GoDEX EZio DLL Test", 0, FontWeight.FW_900_HEAVY, RotateMode.Angle_180)
        Printer.Command.PrintText(10, 240, fontHeight, "Arial", "GoDEX EZio DLL Test", 0, FontWeight.FW_700_BOLD, RotateMode.Angle_0, Italic_State.S_OFF, Underline_State.S_OFF, Strikeout_State.S_OFF, Inverse_State.S_ON)
        Printer.Command.JobEnd()

        DisconnectPrinter()

    End Sub

    '------------------------------------------------------------------------
    ' Click [Print Image] Button
    '------------------------------------------------------------------------
    Private Sub Btn_PrintImage_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_PrintImage.Click

        Dim mOpenFileDialog As OpenFileDialog = New OpenFileDialog()
        mOpenFileDialog.Filter = "*.bmp|*.bmp"

        If mOpenFileDialog.ShowDialog() <> DialogResult.OK Then
            Return
        End If

        ConnectPrinter()
        LabelSetup()

        Printer.Command.JobStart()
        Printer.Command.PrintImage(10, 10, mOpenFileDialog.FileName, 0)
        Printer.Command.JobEnd()

        DisconnectPrinter()

    End Sub

    '------------------------------------------------------------------------
    ' Click [Auto Sensing] Button
    '------------------------------------------------------------------------
    Private Sub Btn_AutoSensing_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_AutoSensing.Click

        ConnectPrinter()
        LabelSetup()
        Printer.Command.AutoSensing()
        DisconnectPrinter()

    End Sub

    '------------------------------------------------------------------------
    ' Click [Get DLL Version] Button
    '------------------------------------------------------------------------
    Private Sub Btn_GetVersion_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_GetVersion.Click

        MessageBox.Show(Printer.GetDllVersion())

    End Sub

    '------------------------------------------------------------------------
    ' Click [Send Byte Array] Button
    '------------------------------------------------------------------------
    Private Sub Btn_SendByte_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_SendByte.Click

        ConnectPrinter()
        Dim bytes As Byte() = Encoding.[Default].GetBytes("~V" & vbCrLf)
        Printer.Command.SendByte(bytes)
        DisconnectPrinter()

    End Sub

    '------------------------------------------------------------------------
    ' Click [Upload Text Image] Button
    '------------------------------------------------------------------------
    Private Sub Btn_UploadTextImage_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_UploadTextImage.Click

        Dim text As String = "MyText"
        Dim data As String = "EZio DLL - Download Text"

        ConnectPrinter()
        LabelSetup()

        ' Upload Text Image
        Printer.Command.UploadText(34, "Arial", data, 20, FontWeight.FW_400_NORMAL, RotateMode.Angle_0, text)

        ' Print Text Image
        Printer.Command.JobStart()
        Printer.Command.PrintImageByName(text, 10, 10)
        Printer.Command.JobEnd()

        DisconnectPrinter()

    End Sub

    '------------------------------------------------------------------------
    ' Click [Execute] Button
    '------------------------------------------------------------------------
    Private Sub Btn_Execute_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_Execute.Click

        ConnectPrinter()
        Printer.Command.Send(Txt_Cmd.Text)
        Txt_Reply.Text = Printer.Command.Read()
        DisconnectPrinter()

    End Sub

    '------------------------------------------------------------------------
    ' Press [Upload Image To Internal Memory] Button
    '------------------------------------------------------------------------
    Private Sub Btn_Upload_Int_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_Upload_Int.Click

        Dim filename As String = "Test.bmp"
        Dim displayName As String = "AAA"

        ConnectPrinter()

        Printer.Command.UploadImage_Int(filename, displayName, Image_Type.BMP)

        Printer.Command.JobStart()
        Printer.Command.PrintImageByName(displayName, 10, 10)
        Printer.Command.JobEnd()

        DisconnectPrinter()

    End Sub

    '------------------------------------------------------------------------
    ' Press [Upload Image To External Memory] Button
    '------------------------------------------------------------------------
    Private Sub Btn_Upload_Ext_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_Upload_Ext.Click

        Dim filename As String = "Test.bmp"
        Dim displayName As String = "CCC"

        ConnectPrinter()

        Printer.Command.UploadImage_Ext(filename, displayName, Image_Type.BMP)

        Printer.Command.JobStart()
        Printer.Command.PrintImageByName(displayName, 10, 10)
        Printer.Command.JobEnd()

        DisconnectPrinter()

    End Sub

    '------------------------------------------------------------------------
    ' Press [Upload Image And Do Halftoning] Button
    '------------------------------------------------------------------------
    Private Sub Btn_HalfToneImage_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_HalfToneImage.Click

        Dim mOpenFileDialog As OpenFileDialog = New OpenFileDialog()
        mOpenFileDialog.Filter = "*.bmp|*.bmp|*.jpg|*.jpg"
        If mOpenFileDialog.ShowDialog() <> DialogResult.OK Then
            Return
        End If

        Dim displayName As String = "BBB"

        ConnectPrinter()

        Printer.Command.UploadImage_FullColor(mOpenFileDialog.FileName, displayName, 0)

        Printer.Command.JobStart()
        Printer.Command.PrintImageByName(displayName, 10, 10)
        Printer.Command.JobEnd()

        DisconnectPrinter()

    End Sub

    '------------------------------------------------------------------------
    ' Press [Print 1D Barcode] Button
    '------------------------------------------------------------------------
    Private Sub Btn_PrintCode39_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_PrintCode39.Click

        ConnectPrinter()
        LabelSetup()
        Printer.Command.JobStart()

        Printer.Command.PrintText(10, 10, 34, "Arial", "Code 39")
        Printer.Command.PrintBarCode(BarCodeType.Code39, 10, 50, "1234")    ' Code39

        Printer.Command.PrintText(10, 210, 34, "Arial", "EAN128")
        Printer.Command.PrintBarCode(BarCodeType.EAN128, 10, 250, "1234")   ' EAN128

        Printer.Command.PrintText(10, 410, 34, "Arial", "Code128 Subset A")
        Printer.Command.PrintBarCode(BarCodeType.Code128_Subset, 10, 450, 2, 6, 80, 0, 1, "A1234")  'Code128 Subset A

        Printer.Command.JobEnd()
        DisconnectPrinter()

    End Sub

    '------------------------------------------------------------------------
    ' Press [Print QRCode] Button
    '------------------------------------------------------------------------
    Private Sub Btn_QRCode_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_QRCode.Click

        ConnectPrinter()
        LabelSetup()
        Printer.Command.JobStart()

        ' Print QR Code by Dll Function
        Dim mEncoding As Encoding = Encoding.GetEncoding(CodePage_Code(Cbo_QR_Encoding.SelectedIndex))
        Printer.Command.PrintQRCode(10, 10, Txt_QRcode_Data.Text, mEncoding)

        ' Print QR Code by Send() & SendByte()
        Printer.Command.Send("W240,10,5,2,M,8,5," & mEncoding.GetByteCount(Txt_QRcode_Data.Text) & ",0")
        Printer.Command.SendByte(mEncoding.GetBytes(Txt_QRcode_Data.Text))

        Printer.Command.JobEnd()
        DisconnectPrinter()

    End Sub

    '------------------------------------------------------------------------
    ' Press [Print PDF417] Button
    '------------------------------------------------------------------------
    Private Sub Btn_PDF417_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_PDF417.Click
        ConnectPrinter()
        LabelSetup()
        Printer.Command.JobStart()
        Printer.Command.PrintPDF417(10, 10, "GoDEX PDF417 Test")
        Printer.Command.JobEnd()
        DisconnectPrinter()
    End Sub

    '------------------------------------------------------------------------
    ' Press [Print Aztec] Button
    '------------------------------------------------------------------------
    Private Sub Btn_Aztec_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_Aztec.Click
        ConnectPrinter()
        LabelSetup()
        Printer.Command.JobStart()
        Printer.Command.PrintAztec(10, 10, "GoDEX Aztec Test")
        Printer.Command.JobEnd()
        DisconnectPrinter()
    End Sub

    '------------------------------------------------------------------------
    ' Press [Print Maxicode] Button
    '------------------------------------------------------------------------
    Private Sub Btn_Maxicode_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_Maxicode.Click
        ConnectPrinter()
        LabelSetup()
        Printer.Command.JobStart()
        Printer.Command.PrintMaxiCode(10, 10, "840", "068107317", "666", "123456")
        Printer.Command.JobEnd()
        DisconnectPrinter()
    End Sub

    '------------------------------------------------------------------------
    ' Press [Print DataMatrix Code] Button
    '------------------------------------------------------------------------
    Private Sub Btn_DataMatrix_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_DataMatrix.Click
        ConnectPrinter()
        LabelSetup()
        Printer.Command.JobStart()
        Printer.Command.PrintDataMatrix(10, 10, "GoDEX Test")
        Printer.Command.JobEnd()
        DisconnectPrinter()
    End Sub

    '------------------------------------------------------------------------
    ' Press [Print Shape] Button
    '------------------------------------------------------------------------
    Private Sub Btn_PrintShape_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_PrintShape.Click

        ConnectPrinter()
        LabelSetup()

        ' First Label
        Printer.Command.JobStart()
        Printer.Command.DrawHorLine(10, 10, 200, 5)
        Printer.Command.DrawVerLine(10, 10, 200, 5)
        Printer.Command.DrawOblique(10, 10, 5, 200, 200)
        Printer.Command.FillRec(10, 260, 200, 150)
        Printer.Command.DrawRec(300, 260, 200, 150, 5, 5)
        Printer.Command.JobEnd()

        ' Second Label
        Printer.Command.JobStart()
        Printer.Command.DrawEllipse(10, 10, 200, 100, 5)
        Printer.Command.DrawRoundRec(300, 10, 200, 100, 20, 20, 5)
        Printer.Command.DrawTriangle(50, 150, 200, 180, 150, 250, 5)
        Printer.Command.DrawDiamond(300, 150, 200, 100, 5)
        Printer.Command.JobEnd()

        DisconnectPrinter()

    End Sub

    '------------------------------------------------------------------------
    ' Press [Internal Font Print] Button
    '------------------------------------------------------------------------
    Private Sub Btn_InternalFont_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_InternalFont.Click

        ConnectPrinter()
        LabelSetup()

        ' Internal Font (Change Font)
        Printer.Command.JobStart()
        Printer.Command.PrintText_EZPL_Internal("A", 10, 10, "ABCDEFG")
        Printer.Command.PrintText_EZPL_Internal("B", 10, 60, "ABCDEFG")
        Printer.Command.PrintText_EZPL_Internal("C", 10, 110, "ABCDEFG")
        Printer.Command.PrintText_EZPL_Internal("D", 10, 160, "ABCDEFG")
        Printer.Command.PrintText_EZPL_Internal("E", 10, 210, "ABCDEFG")
        Printer.Command.PrintText_EZPL_Internal("F", 10, 260, "ABCDEFG")
        Printer.Command.JobEnd()

        ' Internal Font (Change Zoom)
        Printer.Command.JobStart()
        Printer.Command.PrintText_EZPL_Internal("C", 10, 10, 1, 1, 0, "0", "Font C x 1")
        Printer.Command.PrintText_EZPL_Internal("C", 10, 80, 2, 2, 0, "0", "Font C x 2")
        Printer.Command.PrintText_EZPL_Internal("C", 10, 150, 3, 3, 0, "0", "Font C x 3")
        Printer.Command.PrintText_EZPL_Internal("C", 10, 220, 4, 4, 0, "0", "Font C x 4")
        Printer.Command.JobEnd()

        ' Internal Font (Change Rotate & Inverse)
        Printer.Command.JobStart()
        Printer.Command.PrintText_EZPL_Internal("E", 10, 10, 1, 1, 0, "0", "Degree 0")
        Printer.Command.PrintText_EZPL_Internal("E", 100, 100, 1, 1, 0, "1I", "Degree 90")
        Printer.Command.JobEnd()

        DisconnectPrinter()

    End Sub

    '------------------------------------------------------------------------
    ' Press [Asia Font Print] Button
    '------------------------------------------------------------------------
    Private Sub Btn_AsiaFont_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_AsiaFont.Click

        ConnectPrinter()
        LabelSetup()
        Printer.Command.JobStart()

        ' Asia Font (Need to upload [Tranditional Chainese] to AZ1)
        'Printer.Command.PrintText_EZPL_Internal("Z1", 10, 10, ChrW(20126) & ChrW(27954) & ChrW(23383) & ChrW(28204) & ChrW(35430))
        Printer.Command.PrintText_EZPL_Internal("Z1", 10, 10, "亞洲字測試")

        Printer.Command.JobEnd()
        DisconnectPrinter()

    End Sub

    '------------------------------------------------------------------------
    ' Press [Download Font Print] Button
    '------------------------------------------------------------------------
    Private Sub Btn_BitmappedFont_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_BitmappedFont.Click

        ConnectPrinter()
        LabelSetup()
        Printer.Command.JobStart()
        Printer.Command.PrintText_EZPL_Bitmapped("A", 10, 10, "Download Font")
        Printer.Command.JobEnd()
        DisconnectPrinter()

    End Sub

    '------------------------------------------------------------------------
    ' Press [True Type Font Print] Button
    '------------------------------------------------------------------------
    Private Sub Btn_TrueTypeFont_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_TrueTypeFont.Click

        ConnectPrinter()
        LabelSetup()

        ' EZPL ATA ~ ATZ Command
        Printer.Command.JobStart()
        Printer.Command.PrintText_EZPL_TTF("", 10, 10, "Built-In TTF Test")
        Printer.Command.PrintText_EZPL_TTF("A", 10, 100, "ATA TTF Test")
        Printer.Command.JobEnd()

        DisconnectPrinter()

    End Sub


    '------------------------------------------------------------------------
    ' Press [Print Halftone Image] Button
    '------------------------------------------------------------------------
    Private Sub Btn_PrintHalftoneImg_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_PrintHalftoneImg.Click

        Dim openFileDialog As OpenFileDialog = New OpenFileDialog()
        openFileDialog.Filter = "*.bmp|*.bmp|*.gif|*.gif|*.jpg|*.jpg|*.png|*.png"

        If openFileDialog.ShowDialog() = DialogResult.OK Then
            ConnectPrinter()
            LabelSetup()
            Printer.Command.JobStart()
            Printer.Command.PrintHalftoneImage(10, 10, openFileDialog.FileName, 0, HalftoneMode.ClusterDithering)
            Printer.Command.PrintHalftoneImage(160, 10, openFileDialog.FileName, 0, HalftoneMode.DispersedDithering)
            Printer.Command.PrintHalftoneImage(310, 10, openFileDialog.FileName, 0, HalftoneMode.DiffisionDithering)
            Printer.Command.JobEnd()
            DisconnectPrinter()
        End If

    End Sub

    Private Sub Btn_TTF_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Btn_TTF.Click

        Dim nCurrentSize As Integer = 0
        Dim nPackageSize As Integer = 1024
        Dim array As Byte() = New Byte(nPackageSize - 1) {}

        ' Select TTF File
        Dim openFileDialog As OpenFileDialog = New OpenFileDialog()
        openFileDialog.Filter = "*.ttf|*.ttf"
        If openFileDialog.ShowDialog() <> DialogResult.OK Then
            Return
        End If

        ' TTFFontName : English alphabet and numbers only
        Dim TTFFontName As String = Path.GetFileNameWithoutExtension(openFileDialog.FileName)
        For i As Integer = TTFFontName.Length - 1 To 0 Step -1
            If Not Regex.IsMatch(TTFFontName.Substring(i, 1), "^[0-9]+$") AndAlso Not Regex.IsMatch(TTFFontName.Substring(i, 1), "^[a-z]+$") AndAlso Not Regex.IsMatch(TTFFontName.Substring(i, 1), "^[A-Z]+$") Then
                TTFFontName = TTFFontName.Remove(i, 1)
            End If
        Next

        ' Get File Size
        Dim fileInfo As FileInfo = New FileInfo(openFileDialog.FileName)
        Dim length As Long = fileInfo.Length

        Prog_TTF.Visible = True
        ConnectPrinter()

        Dim mCommand As String = "~MDELC," & Cbo_PosTTF.SelectedItem.ToString() & vbCrLf & vbCrLf & vbCrLf & "~H,TTF," & Cbo_PosTTF.SelectedItem.ToString() & TTFFontName & "," & length.ToString() & vbCr
        Dim mByteCmd() As Byte = Encoding.Default.GetBytes(mCommand)
        Printer.Command.SendByte(mByteCmd, mByteCmd.Length)

        '' Delete TTF Command
        'Printer.Command.Send("~MDELC," & Cbo_PosTTF.SelectedItem.ToString() + vbCrLf & vbCrLf)
        '
        '' Upload TTF Command
        'Printer.Command.Send("~H,TTF," & Cbo_PosTTF.SelectedItem.ToString() & TTFFontName & "," & length.ToString())

        ' Open TTF File 
        Dim fileStream As FileStream = File.OpenRead(openFileDialog.FileName)

        ' Upload TTF Body
        While CLng(nCurrentSize) < length
            Dim nLen As Integer = fileStream.Read(array, 0, nPackageSize)
            If nLen > 0 Then
                'array = New Byte(nLen - 1) {}
                Printer.Command.SendByte(array, nLen)
                nCurrentSize += nLen
            End If
            Me.Prog_TTF.Value = CInt((CLng((nCurrentSize * 100)) / length))
        End While

        Printer.Command.Send(vbCrLf & vbCrLf)

        fileStream.Close()
        Me.DisconnectPrinter()
        Me.Prog_TTF.Visible = False



    End Sub

    Private Sub Cbo_PosTTF_SelectedIndexChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Cbo_PosTTF.SelectedIndexChanged

    End Sub
End Class
