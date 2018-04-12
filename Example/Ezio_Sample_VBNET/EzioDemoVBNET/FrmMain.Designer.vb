<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class FrmMain
    Inherits System.Windows.Forms.Form

    'Form 覆寫 Dispose 以清除元件清單。
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    '為 Windows Form 設計工具的必要項
    Private components As System.ComponentModel.IContainer

    '注意: 以下為 Windows Form 設計工具所需的程序
    '可以使用 Windows Form 設計工具進行修改。
    '請不要使用程式碼編輯器進行修改。
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.Grp_Communication = New System.Windows.Forms.GroupBox
        Me.Cbo_Driver = New System.Windows.Forms.ComboBox
        Me.Lbl_NetPort = New System.Windows.Forms.Label
        Me.Lbl_Baud = New System.Windows.Forms.Label
        Me.Cbo_LPT = New System.Windows.Forms.ComboBox
        Me.Txt_NetPort = New System.Windows.Forms.TextBox
        Me.Txt_IP = New System.Windows.Forms.TextBox
        Me.RBtn_NET = New System.Windows.Forms.RadioButton
        Me.Cbo_COM = New System.Windows.Forms.ComboBox
        Me.RBtn_Driver = New System.Windows.Forms.RadioButton
        Me.Txt_Baud = New System.Windows.Forms.TextBox
        Me.RBtn_LPT = New System.Windows.Forms.RadioButton
        Me.RBtn_COM = New System.Windows.Forms.RadioButton
        Me.RBtn_USB = New System.Windows.Forms.RadioButton
        Me.Grp_Label = New System.Windows.Forms.GroupBox
        Me.Lbl_Page = New System.Windows.Forms.Label
        Me.Num_Page = New System.Windows.Forms.NumericUpDown
        Me.Num_Speed = New System.Windows.Forms.NumericUpDown
        Me.Lbl_Speed = New System.Windows.Forms.Label
        Me.Lbl_Copy = New System.Windows.Forms.Label
        Me.Num_Copy = New System.Windows.Forms.NumericUpDown
        Me.Num_Dark = New System.Windows.Forms.NumericUpDown
        Me.Lbl_Dark = New System.Windows.Forms.Label
        Me.Num_GapFeed = New System.Windows.Forms.NumericUpDown
        Me.Lbl_GapFeed = New System.Windows.Forms.Label
        Me.Lbl_PaperType = New System.Windows.Forms.Label
        Me.Lbl_Label_H = New System.Windows.Forms.Label
        Me.Num_Label_H = New System.Windows.Forms.NumericUpDown
        Me.Num_Label_W = New System.Windows.Forms.NumericUpDown
        Me.Cbo_PaperType = New System.Windows.Forms.ComboBox
        Me.Lbl_Label_W = New System.Windows.Forms.Label
        Me.Grp_Demo = New System.Windows.Forms.GroupBox
        Me.Btn_PrintHalftoneImg = New System.Windows.Forms.Button
        Me.Btn_TrueTypeFont = New System.Windows.Forms.Button
        Me.Btn_BitmappedFont = New System.Windows.Forms.Button
        Me.Btn_AsiaFont = New System.Windows.Forms.Button
        Me.Btn_InternalFont = New System.Windows.Forms.Button
        Me.Btn_PrintShape = New System.Windows.Forms.Button
        Me.label1 = New System.Windows.Forms.Label
        Me.Txt_QRcode_Data = New System.Windows.Forms.TextBox
        Me.Cbo_QR_Encoding = New System.Windows.Forms.ComboBox
        Me.Btn_DataMatrix = New System.Windows.Forms.Button
        Me.Btn_Maxicode = New System.Windows.Forms.Button
        Me.Btn_Aztec = New System.Windows.Forms.Button
        Me.Btn_PDF417 = New System.Windows.Forms.Button
        Me.Btn_QRCode = New System.Windows.Forms.Button
        Me.Btn_PrintCode39 = New System.Windows.Forms.Button
        Me.Btn_PrintText = New System.Windows.Forms.Button
        Me.Btn_GetVersion = New System.Windows.Forms.Button
        Me.Btn_AutoSensing = New System.Windows.Forms.Button
        Me.Btn_PrintImage = New System.Windows.Forms.Button
        Me.Btn_UploadTextImage = New System.Windows.Forms.Button
        Me.Btn_SendByte = New System.Windows.Forms.Button
        Me.Btn_Upload_Ext = New System.Windows.Forms.Button
        Me.Btn_Upload_Int = New System.Windows.Forms.Button
        Me.Btn_HalfToneImage = New System.Windows.Forms.Button
        Me.Grp_Command = New System.Windows.Forms.GroupBox
        Me.Txt_Reply = New System.Windows.Forms.TextBox
        Me.Txt_Cmd = New System.Windows.Forms.TextBox
        Me.Cbo_Cmd = New System.Windows.Forms.ComboBox
        Me.Btn_Execute = New System.Windows.Forms.Button
        Me.Grp_UploadTTF = New System.Windows.Forms.GroupBox
        Me.Prog_TTF = New System.Windows.Forms.ProgressBar
        Me.Btn_TTF = New System.Windows.Forms.Button
        Me.Cbo_PosTTF = New System.Windows.Forms.ComboBox
        Me.GroupBox1 = New System.Windows.Forms.GroupBox
        Me.Grp_Communication.SuspendLayout()
        Me.Grp_Label.SuspendLayout()
        CType(Me.Num_Page, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Num_Speed, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Num_Copy, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Num_Dark, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Num_GapFeed, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Num_Label_H, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Num_Label_W, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Grp_Demo.SuspendLayout()
        Me.Grp_Command.SuspendLayout()
        Me.Grp_UploadTTF.SuspendLayout()
        Me.GroupBox1.SuspendLayout()
        Me.SuspendLayout()
        '
        'Grp_Communication
        '
        Me.Grp_Communication.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Grp_Communication.Controls.Add(Me.Cbo_Driver)
        Me.Grp_Communication.Controls.Add(Me.Lbl_NetPort)
        Me.Grp_Communication.Controls.Add(Me.Lbl_Baud)
        Me.Grp_Communication.Controls.Add(Me.Cbo_LPT)
        Me.Grp_Communication.Controls.Add(Me.Txt_NetPort)
        Me.Grp_Communication.Controls.Add(Me.Txt_IP)
        Me.Grp_Communication.Controls.Add(Me.RBtn_NET)
        Me.Grp_Communication.Controls.Add(Me.Cbo_COM)
        Me.Grp_Communication.Controls.Add(Me.RBtn_Driver)
        Me.Grp_Communication.Controls.Add(Me.Txt_Baud)
        Me.Grp_Communication.Controls.Add(Me.RBtn_LPT)
        Me.Grp_Communication.Controls.Add(Me.RBtn_COM)
        Me.Grp_Communication.Controls.Add(Me.RBtn_USB)
        Me.Grp_Communication.Location = New System.Drawing.Point(12, 12)
        Me.Grp_Communication.Name = "Grp_Communication"
        Me.Grp_Communication.Size = New System.Drawing.Size(743, 143)
        Me.Grp_Communication.TabIndex = 13
        Me.Grp_Communication.TabStop = False
        Me.Grp_Communication.Text = " Communication "
        '
        'Cbo_Driver
        '
        Me.Cbo_Driver.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Cbo_Driver.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.Cbo_Driver.FormattingEnabled = True
        Me.Cbo_Driver.Items.AddRange(New Object() {"LPT1", "LPT2"})
        Me.Cbo_Driver.Location = New System.Drawing.Point(127, 86)
        Me.Cbo_Driver.Name = "Cbo_Driver"
        Me.Cbo_Driver.Size = New System.Drawing.Size(418, 20)
        Me.Cbo_Driver.TabIndex = 26
        '
        'Lbl_NetPort
        '
        Me.Lbl_NetPort.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Lbl_NetPort.AutoSize = True
        Me.Lbl_NetPort.Location = New System.Drawing.Point(576, 114)
        Me.Lbl_NetPort.Name = "Lbl_NetPort"
        Me.Lbl_NetPort.Size = New System.Drawing.Size(24, 12)
        Me.Lbl_NetPort.TabIndex = 25
        Me.Lbl_NetPort.Text = "Port"
        '
        'Lbl_Baud
        '
        Me.Lbl_Baud.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Lbl_Baud.AutoSize = True
        Me.Lbl_Baud.Location = New System.Drawing.Point(576, 47)
        Me.Lbl_Baud.Name = "Lbl_Baud"
        Me.Lbl_Baud.Size = New System.Drawing.Size(54, 12)
        Me.Lbl_Baud.TabIndex = 24
        Me.Lbl_Baud.Text = "Baud Rate"
        '
        'Cbo_LPT
        '
        Me.Cbo_LPT.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Cbo_LPT.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.Cbo_LPT.FormattingEnabled = True
        Me.Cbo_LPT.Items.AddRange(New Object() {"LPT1", "LPT2"})
        Me.Cbo_LPT.Location = New System.Drawing.Point(127, 64)
        Me.Cbo_LPT.Name = "Cbo_LPT"
        Me.Cbo_LPT.Size = New System.Drawing.Size(418, 20)
        Me.Cbo_LPT.TabIndex = 22
        '
        'Txt_NetPort
        '
        Me.Txt_NetPort.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Txt_NetPort.Location = New System.Drawing.Point(641, 108)
        Me.Txt_NetPort.Name = "Txt_NetPort"
        Me.Txt_NetPort.Size = New System.Drawing.Size(84, 22)
        Me.Txt_NetPort.TabIndex = 21
        Me.Txt_NetPort.Text = "9100"
        '
        'Txt_IP
        '
        Me.Txt_IP.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Txt_IP.Location = New System.Drawing.Point(127, 109)
        Me.Txt_IP.Name = "Txt_IP"
        Me.Txt_IP.Size = New System.Drawing.Size(418, 22)
        Me.Txt_IP.TabIndex = 20
        Me.Txt_IP.Text = "192.168.102.101"
        '
        'RBtn_NET
        '
        Me.RBtn_NET.AutoSize = True
        Me.RBtn_NET.Location = New System.Drawing.Point(22, 109)
        Me.RBtn_NET.Name = "RBtn_NET"
        Me.RBtn_NET.Size = New System.Drawing.Size(63, 16)
        Me.RBtn_NET.TabIndex = 4
        Me.RBtn_NET.Text = "Network"
        Me.RBtn_NET.UseVisualStyleBackColor = True
        '
        'Cbo_COM
        '
        Me.Cbo_COM.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Cbo_COM.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.Cbo_COM.FormattingEnabled = True
        Me.Cbo_COM.Items.AddRange(New Object() {"COM1", "COM2", "COM3", "COM4"})
        Me.Cbo_COM.Location = New System.Drawing.Point(127, 42)
        Me.Cbo_COM.Name = "Cbo_COM"
        Me.Cbo_COM.Size = New System.Drawing.Size(418, 20)
        Me.Cbo_COM.TabIndex = 1
        '
        'RBtn_Driver
        '
        Me.RBtn_Driver.AutoSize = True
        Me.RBtn_Driver.Location = New System.Drawing.Point(22, 87)
        Me.RBtn_Driver.Name = "RBtn_Driver"
        Me.RBtn_Driver.Size = New System.Drawing.Size(53, 16)
        Me.RBtn_Driver.TabIndex = 3
        Me.RBtn_Driver.Text = "Driver"
        Me.RBtn_Driver.UseVisualStyleBackColor = True
        '
        'Txt_Baud
        '
        Me.Txt_Baud.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Txt_Baud.Location = New System.Drawing.Point(641, 42)
        Me.Txt_Baud.Name = "Txt_Baud"
        Me.Txt_Baud.Size = New System.Drawing.Size(84, 22)
        Me.Txt_Baud.TabIndex = 0
        Me.Txt_Baud.Text = "9600"
        '
        'RBtn_LPT
        '
        Me.RBtn_LPT.AutoSize = True
        Me.RBtn_LPT.Location = New System.Drawing.Point(22, 65)
        Me.RBtn_LPT.Name = "RBtn_LPT"
        Me.RBtn_LPT.Size = New System.Drawing.Size(43, 16)
        Me.RBtn_LPT.TabIndex = 2
        Me.RBtn_LPT.Text = "LPT"
        Me.RBtn_LPT.UseVisualStyleBackColor = True
        '
        'RBtn_COM
        '
        Me.RBtn_COM.AutoSize = True
        Me.RBtn_COM.Location = New System.Drawing.Point(22, 43)
        Me.RBtn_COM.Name = "RBtn_COM"
        Me.RBtn_COM.Size = New System.Drawing.Size(49, 16)
        Me.RBtn_COM.TabIndex = 1
        Me.RBtn_COM.Text = "COM"
        Me.RBtn_COM.UseVisualStyleBackColor = True
        '
        'RBtn_USB
        '
        Me.RBtn_USB.AutoSize = True
        Me.RBtn_USB.Checked = True
        Me.RBtn_USB.Location = New System.Drawing.Point(22, 21)
        Me.RBtn_USB.Name = "RBtn_USB"
        Me.RBtn_USB.Size = New System.Drawing.Size(45, 16)
        Me.RBtn_USB.TabIndex = 0
        Me.RBtn_USB.TabStop = True
        Me.RBtn_USB.Text = "USB"
        Me.RBtn_USB.UseVisualStyleBackColor = True
        '
        'Grp_Label
        '
        Me.Grp_Label.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Grp_Label.Controls.Add(Me.Lbl_Page)
        Me.Grp_Label.Controls.Add(Me.Num_Page)
        Me.Grp_Label.Controls.Add(Me.Num_Speed)
        Me.Grp_Label.Controls.Add(Me.Lbl_Speed)
        Me.Grp_Label.Controls.Add(Me.Lbl_Copy)
        Me.Grp_Label.Controls.Add(Me.Num_Copy)
        Me.Grp_Label.Controls.Add(Me.Num_Dark)
        Me.Grp_Label.Controls.Add(Me.Lbl_Dark)
        Me.Grp_Label.Controls.Add(Me.Num_GapFeed)
        Me.Grp_Label.Controls.Add(Me.Lbl_GapFeed)
        Me.Grp_Label.Controls.Add(Me.Lbl_PaperType)
        Me.Grp_Label.Controls.Add(Me.Lbl_Label_H)
        Me.Grp_Label.Controls.Add(Me.Num_Label_H)
        Me.Grp_Label.Controls.Add(Me.Num_Label_W)
        Me.Grp_Label.Controls.Add(Me.Cbo_PaperType)
        Me.Grp_Label.Controls.Add(Me.Lbl_Label_W)
        Me.Grp_Label.Location = New System.Drawing.Point(12, 171)
        Me.Grp_Label.Name = "Grp_Label"
        Me.Grp_Label.Size = New System.Drawing.Size(386, 143)
        Me.Grp_Label.TabIndex = 19
        Me.Grp_Label.TabStop = False
        Me.Grp_Label.Text = " Label Setup "
        '
        'Lbl_Page
        '
        Me.Lbl_Page.AutoSize = True
        Me.Lbl_Page.Location = New System.Drawing.Point(217, 113)
        Me.Lbl_Page.Name = "Lbl_Page"
        Me.Lbl_Page.Size = New System.Drawing.Size(44, 12)
        Me.Lbl_Page.TabIndex = 40
        Me.Lbl_Page.Text = "Page No"
        '
        'Num_Page
        '
        Me.Num_Page.Location = New System.Drawing.Point(294, 108)
        Me.Num_Page.Name = "Num_Page"
        Me.Num_Page.Size = New System.Drawing.Size(72, 22)
        Me.Num_Page.TabIndex = 39
        Me.Num_Page.Value = New Decimal(New Integer() {1, 0, 0, 0})
        '
        'Num_Speed
        '
        Me.Num_Speed.Location = New System.Drawing.Point(294, 24)
        Me.Num_Speed.Maximum = New Decimal(New Integer() {5, 0, 0, 0})
        Me.Num_Speed.Minimum = New Decimal(New Integer() {2, 0, 0, 0})
        Me.Num_Speed.Name = "Num_Speed"
        Me.Num_Speed.Size = New System.Drawing.Size(72, 22)
        Me.Num_Speed.TabIndex = 38
        Me.Num_Speed.Value = New Decimal(New Integer() {3, 0, 0, 0})
        '
        'Lbl_Speed
        '
        Me.Lbl_Speed.AutoSize = True
        Me.Lbl_Speed.Location = New System.Drawing.Point(217, 29)
        Me.Lbl_Speed.Name = "Lbl_Speed"
        Me.Lbl_Speed.Size = New System.Drawing.Size(57, 12)
        Me.Lbl_Speed.TabIndex = 37
        Me.Lbl_Speed.Text = "Speed (ips)"
        '
        'Lbl_Copy
        '
        Me.Lbl_Copy.AutoSize = True
        Me.Lbl_Copy.Location = New System.Drawing.Point(217, 85)
        Me.Lbl_Copy.Name = "Lbl_Copy"
        Me.Lbl_Copy.Size = New System.Drawing.Size(48, 12)
        Me.Lbl_Copy.TabIndex = 36
        Me.Lbl_Copy.Text = "Copy No"
        '
        'Num_Copy
        '
        Me.Num_Copy.Location = New System.Drawing.Point(294, 80)
        Me.Num_Copy.Name = "Num_Copy"
        Me.Num_Copy.Size = New System.Drawing.Size(72, 22)
        Me.Num_Copy.TabIndex = 35
        Me.Num_Copy.Value = New Decimal(New Integer() {1, 0, 0, 0})
        '
        'Num_Dark
        '
        Me.Num_Dark.Location = New System.Drawing.Point(294, 52)
        Me.Num_Dark.Maximum = New Decimal(New Integer() {19, 0, 0, 0})
        Me.Num_Dark.Name = "Num_Dark"
        Me.Num_Dark.Size = New System.Drawing.Size(72, 22)
        Me.Num_Dark.TabIndex = 34
        Me.Num_Dark.Value = New Decimal(New Integer() {10, 0, 0, 0})
        '
        'Lbl_Dark
        '
        Me.Lbl_Dark.AutoSize = True
        Me.Lbl_Dark.Location = New System.Drawing.Point(217, 57)
        Me.Lbl_Dark.Name = "Lbl_Dark"
        Me.Lbl_Dark.Size = New System.Drawing.Size(28, 12)
        Me.Lbl_Dark.TabIndex = 33
        Me.Lbl_Dark.Text = "Dark"
        '
        'Num_GapFeed
        '
        Me.Num_GapFeed.Location = New System.Drawing.Point(127, 52)
        Me.Num_GapFeed.Name = "Num_GapFeed"
        Me.Num_GapFeed.Size = New System.Drawing.Size(71, 22)
        Me.Num_GapFeed.TabIndex = 32
        Me.Num_GapFeed.Value = New Decimal(New Integer() {3, 0, 0, 0})
        '
        'Lbl_GapFeed
        '
        Me.Lbl_GapFeed.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Lbl_GapFeed.AutoSize = True
        Me.Lbl_GapFeed.Location = New System.Drawing.Point(20, 57)
        Me.Lbl_GapFeed.Name = "Lbl_GapFeed"
        Me.Lbl_GapFeed.Size = New System.Drawing.Size(89, 12)
        Me.Lbl_GapFeed.TabIndex = 31
        Me.Lbl_GapFeed.Text = "Gap Length (mm)"
        '
        'Lbl_PaperType
        '
        Me.Lbl_PaperType.AutoSize = True
        Me.Lbl_PaperType.Location = New System.Drawing.Point(20, 29)
        Me.Lbl_PaperType.Name = "Lbl_PaperType"
        Me.Lbl_PaperType.Size = New System.Drawing.Size(58, 12)
        Me.Lbl_PaperType.TabIndex = 30
        Me.Lbl_PaperType.Text = "Paper Type"
        '
        'Lbl_Label_H
        '
        Me.Lbl_Label_H.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Lbl_Label_H.AutoSize = True
        Me.Lbl_Label_H.Location = New System.Drawing.Point(20, 113)
        Me.Lbl_Label_H.Name = "Lbl_Label_H"
        Me.Lbl_Label_H.Size = New System.Drawing.Size(94, 12)
        Me.Lbl_Label_H.TabIndex = 29
        Me.Lbl_Label_H.Text = "Label Height (mm)"
        '
        'Num_Label_H
        '
        Me.Num_Label_H.Location = New System.Drawing.Point(127, 108)
        Me.Num_Label_H.Name = "Num_Label_H"
        Me.Num_Label_H.Size = New System.Drawing.Size(71, 22)
        Me.Num_Label_H.TabIndex = 28
        Me.Num_Label_H.Value = New Decimal(New Integer() {40, 0, 0, 0})
        '
        'Num_Label_W
        '
        Me.Num_Label_W.Location = New System.Drawing.Point(127, 80)
        Me.Num_Label_W.Name = "Num_Label_W"
        Me.Num_Label_W.Size = New System.Drawing.Size(71, 22)
        Me.Num_Label_W.TabIndex = 27
        Me.Num_Label_W.Value = New Decimal(New Integer() {54, 0, 0, 0})
        '
        'Cbo_PaperType
        '
        Me.Cbo_PaperType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.Cbo_PaperType.FormattingEnabled = True
        Me.Cbo_PaperType.Items.AddRange(New Object() {"Gap", "Continue"})
        Me.Cbo_PaperType.Location = New System.Drawing.Point(127, 26)
        Me.Cbo_PaperType.Name = "Cbo_PaperType"
        Me.Cbo_PaperType.Size = New System.Drawing.Size(70, 20)
        Me.Cbo_PaperType.TabIndex = 26
        '
        'Lbl_Label_W
        '
        Me.Lbl_Label_W.AutoSize = True
        Me.Lbl_Label_W.Location = New System.Drawing.Point(20, 85)
        Me.Lbl_Label_W.Name = "Lbl_Label_W"
        Me.Lbl_Label_W.Size = New System.Drawing.Size(92, 12)
        Me.Lbl_Label_W.TabIndex = 24
        Me.Lbl_Label_W.Text = "Label Width (mm)"
        '
        'Grp_Demo
        '
        Me.Grp_Demo.Controls.Add(Me.Btn_PrintHalftoneImg)
        Me.Grp_Demo.Controls.Add(Me.Btn_TrueTypeFont)
        Me.Grp_Demo.Controls.Add(Me.Btn_BitmappedFont)
        Me.Grp_Demo.Controls.Add(Me.Btn_AsiaFont)
        Me.Grp_Demo.Controls.Add(Me.Btn_InternalFont)
        Me.Grp_Demo.Controls.Add(Me.Btn_PrintShape)
        Me.Grp_Demo.Controls.Add(Me.label1)
        Me.Grp_Demo.Controls.Add(Me.Txt_QRcode_Data)
        Me.Grp_Demo.Controls.Add(Me.Cbo_QR_Encoding)
        Me.Grp_Demo.Controls.Add(Me.Btn_DataMatrix)
        Me.Grp_Demo.Controls.Add(Me.Btn_Maxicode)
        Me.Grp_Demo.Controls.Add(Me.Btn_Aztec)
        Me.Grp_Demo.Controls.Add(Me.Btn_PDF417)
        Me.Grp_Demo.Controls.Add(Me.Btn_QRCode)
        Me.Grp_Demo.Controls.Add(Me.Btn_PrintCode39)
        Me.Grp_Demo.Controls.Add(Me.Btn_PrintText)
        Me.Grp_Demo.Controls.Add(Me.Btn_GetVersion)
        Me.Grp_Demo.Controls.Add(Me.Btn_AutoSensing)
        Me.Grp_Demo.Controls.Add(Me.Btn_PrintImage)
        Me.Grp_Demo.Controls.Add(Me.Btn_UploadTextImage)
        Me.Grp_Demo.Controls.Add(Me.Btn_SendByte)
        Me.Grp_Demo.Location = New System.Drawing.Point(12, 320)
        Me.Grp_Demo.Name = "Grp_Demo"
        Me.Grp_Demo.Size = New System.Drawing.Size(559, 208)
        Me.Grp_Demo.TabIndex = 23
        Me.Grp_Demo.TabStop = False
        Me.Grp_Demo.Text = " Print Demo "
        '
        'Btn_PrintHalftoneImg
        '
        Me.Btn_PrintHalftoneImg.Location = New System.Drawing.Point(421, 174)
        Me.Btn_PrintHalftoneImg.Name = "Btn_PrintHalftoneImg"
        Me.Btn_PrintHalftoneImg.Size = New System.Drawing.Size(122, 23)
        Me.Btn_PrintHalftoneImg.TabIndex = 43
        Me.Btn_PrintHalftoneImg.Text = "Print Halftone Image"
        Me.Btn_PrintHalftoneImg.UseVisualStyleBackColor = True
        '
        'Btn_TrueTypeFont
        '
        Me.Btn_TrueTypeFont.Location = New System.Drawing.Point(421, 145)
        Me.Btn_TrueTypeFont.Name = "Btn_TrueTypeFont"
        Me.Btn_TrueTypeFont.Size = New System.Drawing.Size(122, 23)
        Me.Btn_TrueTypeFont.TabIndex = 42
        Me.Btn_TrueTypeFont.Text = "True Type Font Print"
        Me.Btn_TrueTypeFont.UseVisualStyleBackColor = True
        '
        'Btn_BitmappedFont
        '
        Me.Btn_BitmappedFont.Location = New System.Drawing.Point(421, 116)
        Me.Btn_BitmappedFont.Name = "Btn_BitmappedFont"
        Me.Btn_BitmappedFont.Size = New System.Drawing.Size(122, 23)
        Me.Btn_BitmappedFont.TabIndex = 41
        Me.Btn_BitmappedFont.Text = "Download Font Print"
        Me.Btn_BitmappedFont.UseVisualStyleBackColor = True
        '
        'Btn_AsiaFont
        '
        Me.Btn_AsiaFont.Location = New System.Drawing.Point(421, 87)
        Me.Btn_AsiaFont.Name = "Btn_AsiaFont"
        Me.Btn_AsiaFont.Size = New System.Drawing.Size(122, 23)
        Me.Btn_AsiaFont.TabIndex = 40
        Me.Btn_AsiaFont.Text = "Asia Font Print"
        Me.Btn_AsiaFont.UseVisualStyleBackColor = True
        '
        'Btn_InternalFont
        '
        Me.Btn_InternalFont.Location = New System.Drawing.Point(421, 58)
        Me.Btn_InternalFont.Name = "Btn_InternalFont"
        Me.Btn_InternalFont.Size = New System.Drawing.Size(122, 23)
        Me.Btn_InternalFont.TabIndex = 39
        Me.Btn_InternalFont.Text = "Internal Font Print"
        Me.Btn_InternalFont.UseVisualStyleBackColor = True
        '
        'Btn_PrintShape
        '
        Me.Btn_PrintShape.Location = New System.Drawing.Point(421, 29)
        Me.Btn_PrintShape.Name = "Btn_PrintShape"
        Me.Btn_PrintShape.Size = New System.Drawing.Size(122, 23)
        Me.Btn_PrintShape.TabIndex = 38
        Me.Btn_PrintShape.Text = "Print Shape"
        Me.Btn_PrintShape.UseVisualStyleBackColor = True
        '
        'label1
        '
        Me.label1.AutoSize = True
        Me.label1.Location = New System.Drawing.Point(155, 30)
        Me.label1.Name = "label1"
        Me.label1.Size = New System.Drawing.Size(49, 12)
        Me.label1.TabIndex = 34
        Me.label1.Text = "QR Code"
        '
        'Txt_QRcode_Data
        '
        Me.Txt_QRcode_Data.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Txt_QRcode_Data.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Txt_QRcode_Data.Location = New System.Drawing.Point(284, 57)
        Me.Txt_QRcode_Data.Multiline = True
        Me.Txt_QRcode_Data.Name = "Txt_QRcode_Data"
        Me.Txt_QRcode_Data.Size = New System.Drawing.Size(122, 108)
        Me.Txt_QRcode_Data.TabIndex = 33
        Me.Txt_QRcode_Data.Text = "English" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "繁體" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "简体" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "日本語テスト" & Global.Microsoft.VisualBasic.ChrW(13) & Global.Microsoft.VisualBasic.ChrW(10) & "한국어 시험"
        '
        'Cbo_QR_Encoding
        '
        Me.Cbo_QR_Encoding.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.Cbo_QR_Encoding.FormattingEnabled = True
        Me.Cbo_QR_Encoding.Location = New System.Drawing.Point(219, 26)
        Me.Cbo_QR_Encoding.Name = "Cbo_QR_Encoding"
        Me.Cbo_QR_Encoding.Size = New System.Drawing.Size(187, 20)
        Me.Cbo_QR_Encoding.TabIndex = 32
        '
        'Btn_DataMatrix
        '
        Me.Btn_DataMatrix.Location = New System.Drawing.Point(156, 174)
        Me.Btn_DataMatrix.Name = "Btn_DataMatrix"
        Me.Btn_DataMatrix.Size = New System.Drawing.Size(122, 23)
        Me.Btn_DataMatrix.TabIndex = 25
        Me.Btn_DataMatrix.Text = "Print DataMatrix Code"
        Me.Btn_DataMatrix.UseVisualStyleBackColor = True
        '
        'Btn_Maxicode
        '
        Me.Btn_Maxicode.Location = New System.Drawing.Point(157, 145)
        Me.Btn_Maxicode.Name = "Btn_Maxicode"
        Me.Btn_Maxicode.Size = New System.Drawing.Size(122, 23)
        Me.Btn_Maxicode.TabIndex = 24
        Me.Btn_Maxicode.Text = "Print Maxicode"
        Me.Btn_Maxicode.UseVisualStyleBackColor = True
        '
        'Btn_Aztec
        '
        Me.Btn_Aztec.Location = New System.Drawing.Point(156, 116)
        Me.Btn_Aztec.Name = "Btn_Aztec"
        Me.Btn_Aztec.Size = New System.Drawing.Size(122, 23)
        Me.Btn_Aztec.TabIndex = 23
        Me.Btn_Aztec.Text = "Print Aztec"
        Me.Btn_Aztec.UseVisualStyleBackColor = True
        '
        'Btn_PDF417
        '
        Me.Btn_PDF417.Location = New System.Drawing.Point(156, 87)
        Me.Btn_PDF417.Name = "Btn_PDF417"
        Me.Btn_PDF417.Size = New System.Drawing.Size(122, 23)
        Me.Btn_PDF417.TabIndex = 22
        Me.Btn_PDF417.Text = "Print PDF417"
        Me.Btn_PDF417.UseVisualStyleBackColor = True
        '
        'Btn_QRCode
        '
        Me.Btn_QRCode.Location = New System.Drawing.Point(284, 174)
        Me.Btn_QRCode.Name = "Btn_QRCode"
        Me.Btn_QRCode.Size = New System.Drawing.Size(122, 23)
        Me.Btn_QRCode.TabIndex = 21
        Me.Btn_QRCode.Text = "Print QRCode"
        Me.Btn_QRCode.UseVisualStyleBackColor = True
        '
        'Btn_PrintCode39
        '
        Me.Btn_PrintCode39.Location = New System.Drawing.Point(156, 58)
        Me.Btn_PrintCode39.Name = "Btn_PrintCode39"
        Me.Btn_PrintCode39.Size = New System.Drawing.Size(122, 23)
        Me.Btn_PrintCode39.TabIndex = 20
        Me.Btn_PrintCode39.Text = "Print 1D Barcode"
        Me.Btn_PrintCode39.UseVisualStyleBackColor = True
        '
        'Btn_PrintText
        '
        Me.Btn_PrintText.Location = New System.Drawing.Point(19, 29)
        Me.Btn_PrintText.Name = "Btn_PrintText"
        Me.Btn_PrintText.Size = New System.Drawing.Size(122, 23)
        Me.Btn_PrintText.TabIndex = 0
        Me.Btn_PrintText.Text = "Print Text"
        Me.Btn_PrintText.UseVisualStyleBackColor = True
        '
        'Btn_GetVersion
        '
        Me.Btn_GetVersion.Location = New System.Drawing.Point(19, 116)
        Me.Btn_GetVersion.Name = "Btn_GetVersion"
        Me.Btn_GetVersion.Size = New System.Drawing.Size(122, 23)
        Me.Btn_GetVersion.TabIndex = 15
        Me.Btn_GetVersion.Text = "Get Dll Version"
        Me.Btn_GetVersion.UseVisualStyleBackColor = True
        '
        'Btn_AutoSensing
        '
        Me.Btn_AutoSensing.Location = New System.Drawing.Point(19, 87)
        Me.Btn_AutoSensing.Name = "Btn_AutoSensing"
        Me.Btn_AutoSensing.Size = New System.Drawing.Size(122, 23)
        Me.Btn_AutoSensing.TabIndex = 19
        Me.Btn_AutoSensing.Text = "Auto Sensing"
        Me.Btn_AutoSensing.UseVisualStyleBackColor = True
        '
        'Btn_PrintImage
        '
        Me.Btn_PrintImage.Location = New System.Drawing.Point(19, 58)
        Me.Btn_PrintImage.Name = "Btn_PrintImage"
        Me.Btn_PrintImage.Size = New System.Drawing.Size(122, 23)
        Me.Btn_PrintImage.TabIndex = 6
        Me.Btn_PrintImage.Text = "Print Image"
        Me.Btn_PrintImage.UseVisualStyleBackColor = True
        '
        'Btn_UploadTextImage
        '
        Me.Btn_UploadTextImage.Location = New System.Drawing.Point(20, 174)
        Me.Btn_UploadTextImage.Name = "Btn_UploadTextImage"
        Me.Btn_UploadTextImage.Size = New System.Drawing.Size(122, 23)
        Me.Btn_UploadTextImage.TabIndex = 5
        Me.Btn_UploadTextImage.Text = "Upload Text Image"
        Me.Btn_UploadTextImage.UseVisualStyleBackColor = True
        '
        'Btn_SendByte
        '
        Me.Btn_SendByte.Location = New System.Drawing.Point(20, 145)
        Me.Btn_SendByte.Name = "Btn_SendByte"
        Me.Btn_SendByte.Size = New System.Drawing.Size(122, 23)
        Me.Btn_SendByte.TabIndex = 14
        Me.Btn_SendByte.Text = "Send Byte Array"
        Me.Btn_SendByte.UseVisualStyleBackColor = True
        '
        'Btn_Upload_Ext
        '
        Me.Btn_Upload_Ext.Location = New System.Drawing.Point(18, 55)
        Me.Btn_Upload_Ext.Name = "Btn_Upload_Ext"
        Me.Btn_Upload_Ext.Size = New System.Drawing.Size(180, 30)
        Me.Btn_Upload_Ext.TabIndex = 17
        Me.Btn_Upload_Ext.Text = "Upload Image To External Memory"
        Me.Btn_Upload_Ext.UseVisualStyleBackColor = True
        '
        'Btn_Upload_Int
        '
        Me.Btn_Upload_Int.Location = New System.Drawing.Point(18, 91)
        Me.Btn_Upload_Int.Name = "Btn_Upload_Int"
        Me.Btn_Upload_Int.Size = New System.Drawing.Size(180, 32)
        Me.Btn_Upload_Int.TabIndex = 1
        Me.Btn_Upload_Int.Text = "Upload Image To Internal Memory"
        Me.Btn_Upload_Int.UseVisualStyleBackColor = True
        '
        'Btn_HalfToneImage
        '
        Me.Btn_HalfToneImage.Location = New System.Drawing.Point(18, 22)
        Me.Btn_HalfToneImage.Name = "Btn_HalfToneImage"
        Me.Btn_HalfToneImage.Size = New System.Drawing.Size(180, 25)
        Me.Btn_HalfToneImage.TabIndex = 7
        Me.Btn_HalfToneImage.Text = "Upload Image And Do Halftoning"
        Me.Btn_HalfToneImage.UseVisualStyleBackColor = True
        '
        'Grp_Command
        '
        Me.Grp_Command.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Grp_Command.Controls.Add(Me.Txt_Reply)
        Me.Grp_Command.Controls.Add(Me.Txt_Cmd)
        Me.Grp_Command.Controls.Add(Me.Cbo_Cmd)
        Me.Grp_Command.Controls.Add(Me.Btn_Execute)
        Me.Grp_Command.Location = New System.Drawing.Point(577, 320)
        Me.Grp_Command.Name = "Grp_Command"
        Me.Grp_Command.Size = New System.Drawing.Size(178, 208)
        Me.Grp_Command.TabIndex = 24
        Me.Grp_Command.TabStop = False
        Me.Grp_Command.Text = " Terminal (Send And Receive) "
        '
        'Txt_Reply
        '
        Me.Txt_Reply.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
                    Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Txt_Reply.BackColor = System.Drawing.SystemColors.Info
        Me.Txt_Reply.Location = New System.Drawing.Point(16, 100)
        Me.Txt_Reply.Multiline = True
        Me.Txt_Reply.Name = "Txt_Reply"
        Me.Txt_Reply.ReadOnly = True
        Me.Txt_Reply.ScrollBars = System.Windows.Forms.ScrollBars.Both
        Me.Txt_Reply.Size = New System.Drawing.Size(143, 70)
        Me.Txt_Reply.TabIndex = 22
        '
        'Txt_Cmd
        '
        Me.Txt_Cmd.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Txt_Cmd.Location = New System.Drawing.Point(17, 47)
        Me.Txt_Cmd.Multiline = True
        Me.Txt_Cmd.Name = "Txt_Cmd"
        Me.Txt_Cmd.Size = New System.Drawing.Size(143, 47)
        Me.Txt_Cmd.TabIndex = 21
        '
        'Cbo_Cmd
        '
        Me.Cbo_Cmd.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Cbo_Cmd.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.Cbo_Cmd.FormattingEnabled = True
        Me.Cbo_Cmd.Items.AddRange(New Object() {"~B", "~V", "~S,CHECK", "^XGET,CONFIG"})
        Me.Cbo_Cmd.Location = New System.Drawing.Point(16, 22)
        Me.Cbo_Cmd.Name = "Cbo_Cmd"
        Me.Cbo_Cmd.Size = New System.Drawing.Size(146, 20)
        Me.Cbo_Cmd.TabIndex = 20
        '
        'Btn_Execute
        '
        Me.Btn_Execute.Anchor = CType(((System.Windows.Forms.AnchorStyles.Bottom Or System.Windows.Forms.AnchorStyles.Left) _
                    Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Btn_Execute.Location = New System.Drawing.Point(17, 176)
        Me.Btn_Execute.Name = "Btn_Execute"
        Me.Btn_Execute.Size = New System.Drawing.Size(142, 23)
        Me.Btn_Execute.TabIndex = 16
        Me.Btn_Execute.Text = "Execute"
        Me.Btn_Execute.UseVisualStyleBackColor = True
        '
        'Grp_UploadTTF
        '
        Me.Grp_UploadTTF.Controls.Add(Me.Prog_TTF)
        Me.Grp_UploadTTF.Controls.Add(Me.Btn_TTF)
        Me.Grp_UploadTTF.Controls.Add(Me.Cbo_PosTTF)
        Me.Grp_UploadTTF.Location = New System.Drawing.Point(404, 173)
        Me.Grp_UploadTTF.Name = "Grp_UploadTTF"
        Me.Grp_UploadTTF.Size = New System.Drawing.Size(135, 141)
        Me.Grp_UploadTTF.TabIndex = 25
        Me.Grp_UploadTTF.TabStop = False
        Me.Grp_UploadTTF.Text = "Upload TTF"
        '
        'Prog_TTF
        '
        Me.Prog_TTF.Location = New System.Drawing.Point(18, 55)
        Me.Prog_TTF.Name = "Prog_TTF"
        Me.Prog_TTF.Size = New System.Drawing.Size(101, 19)
        Me.Prog_TTF.TabIndex = 3
        Me.Prog_TTF.Visible = False
        '
        'Btn_TTF
        '
        Me.Btn_TTF.Location = New System.Drawing.Point(18, 99)
        Me.Btn_TTF.Name = "Btn_TTF"
        Me.Btn_TTF.Size = New System.Drawing.Size(101, 26)
        Me.Btn_TTF.TabIndex = 2
        Me.Btn_TTF.Text = "Upload TTF"
        Me.Btn_TTF.UseVisualStyleBackColor = True
        '
        'Cbo_PosTTF
        '
        Me.Cbo_PosTTF.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList
        Me.Cbo_PosTTF.FormattingEnabled = True
        Me.Cbo_PosTTF.Items.AddRange(New Object() {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"})
        Me.Cbo_PosTTF.Location = New System.Drawing.Point(18, 27)
        Me.Cbo_PosTTF.Name = "Cbo_PosTTF"
        Me.Cbo_PosTTF.Size = New System.Drawing.Size(101, 20)
        Me.Cbo_PosTTF.TabIndex = 1
        '
        'GroupBox1
        '
        Me.GroupBox1.Controls.Add(Me.Btn_HalfToneImage)
        Me.GroupBox1.Controls.Add(Me.Btn_Upload_Ext)
        Me.GroupBox1.Controls.Add(Me.Btn_Upload_Int)
        Me.GroupBox1.Location = New System.Drawing.Point(545, 173)
        Me.GroupBox1.Name = "GroupBox1"
        Me.GroupBox1.Size = New System.Drawing.Size(212, 141)
        Me.GroupBox1.TabIndex = 26
        Me.GroupBox1.TabStop = False
        Me.GroupBox1.Text = " Upload Image "
        '
        'FrmMain
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 12.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(767, 537)
        Me.Controls.Add(Me.GroupBox1)
        Me.Controls.Add(Me.Grp_UploadTTF)
        Me.Controls.Add(Me.Grp_Command)
        Me.Controls.Add(Me.Grp_Demo)
        Me.Controls.Add(Me.Grp_Label)
        Me.Controls.Add(Me.Grp_Communication)
        Me.MaximizeBox = False
        Me.MinimizeBox = False
        Me.Name = "FrmMain"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "EZio32 Demo VB.NET"
        Me.Grp_Communication.ResumeLayout(False)
        Me.Grp_Communication.PerformLayout()
        Me.Grp_Label.ResumeLayout(False)
        Me.Grp_Label.PerformLayout()
        CType(Me.Num_Page, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Num_Speed, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Num_Copy, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Num_Dark, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Num_GapFeed, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Num_Label_H, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Num_Label_W, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Grp_Demo.ResumeLayout(False)
        Me.Grp_Demo.PerformLayout()
        Me.Grp_Command.ResumeLayout(False)
        Me.Grp_Command.PerformLayout()
        Me.Grp_UploadTTF.ResumeLayout(False)
        Me.GroupBox1.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Private WithEvents Grp_Communication As System.Windows.Forms.GroupBox
    Private WithEvents Cbo_Driver As System.Windows.Forms.ComboBox
    Private WithEvents Lbl_NetPort As System.Windows.Forms.Label
    Private WithEvents Lbl_Baud As System.Windows.Forms.Label
    Private WithEvents Cbo_LPT As System.Windows.Forms.ComboBox
    Private WithEvents Txt_NetPort As System.Windows.Forms.TextBox
    Private WithEvents Txt_IP As System.Windows.Forms.TextBox
    Private WithEvents RBtn_NET As System.Windows.Forms.RadioButton
    Private WithEvents Cbo_COM As System.Windows.Forms.ComboBox
    Private WithEvents RBtn_Driver As System.Windows.Forms.RadioButton
    Private WithEvents Txt_Baud As System.Windows.Forms.TextBox
    Private WithEvents RBtn_LPT As System.Windows.Forms.RadioButton
    Private WithEvents RBtn_COM As System.Windows.Forms.RadioButton
    Private WithEvents RBtn_USB As System.Windows.Forms.RadioButton
    Private WithEvents Grp_Label As System.Windows.Forms.GroupBox
    Private WithEvents Lbl_Page As System.Windows.Forms.Label
    Private WithEvents Num_Page As System.Windows.Forms.NumericUpDown
    Private WithEvents Num_Speed As System.Windows.Forms.NumericUpDown
    Private WithEvents Lbl_Speed As System.Windows.Forms.Label
    Private WithEvents Lbl_Copy As System.Windows.Forms.Label
    Private WithEvents Num_Copy As System.Windows.Forms.NumericUpDown
    Private WithEvents Num_Dark As System.Windows.Forms.NumericUpDown
    Private WithEvents Lbl_Dark As System.Windows.Forms.Label
    Private WithEvents Num_GapFeed As System.Windows.Forms.NumericUpDown
    Private WithEvents Lbl_GapFeed As System.Windows.Forms.Label
    Private WithEvents Lbl_PaperType As System.Windows.Forms.Label
    Private WithEvents Lbl_Label_H As System.Windows.Forms.Label
    Private WithEvents Num_Label_H As System.Windows.Forms.NumericUpDown
    Private WithEvents Num_Label_W As System.Windows.Forms.NumericUpDown
    Private WithEvents Cbo_PaperType As System.Windows.Forms.ComboBox
    Private WithEvents Lbl_Label_W As System.Windows.Forms.Label
    Private WithEvents Grp_Demo As System.Windows.Forms.GroupBox
    Private WithEvents Btn_DataMatrix As System.Windows.Forms.Button
    Private WithEvents Btn_Maxicode As System.Windows.Forms.Button
    Private WithEvents Btn_Aztec As System.Windows.Forms.Button
    Private WithEvents Btn_PDF417 As System.Windows.Forms.Button
    Private WithEvents Btn_QRCode As System.Windows.Forms.Button
    Private WithEvents Btn_PrintCode39 As System.Windows.Forms.Button
    Private WithEvents Btn_PrintText As System.Windows.Forms.Button
    Private WithEvents Btn_GetVersion As System.Windows.Forms.Button
    Private WithEvents Btn_AutoSensing As System.Windows.Forms.Button
    Private WithEvents Btn_PrintImage As System.Windows.Forms.Button
    Private WithEvents Btn_Upload_Ext As System.Windows.Forms.Button
    Private WithEvents Btn_Upload_Int As System.Windows.Forms.Button
    Private WithEvents Btn_UploadTextImage As System.Windows.Forms.Button
    Private WithEvents Btn_HalfToneImage As System.Windows.Forms.Button
    Private WithEvents Btn_SendByte As System.Windows.Forms.Button
    Private WithEvents Grp_Command As System.Windows.Forms.GroupBox
    Private WithEvents Txt_Reply As System.Windows.Forms.TextBox
    Private WithEvents Txt_Cmd As System.Windows.Forms.TextBox
    Private WithEvents Cbo_Cmd As System.Windows.Forms.ComboBox
    Private WithEvents Btn_Execute As System.Windows.Forms.Button
    Private WithEvents Btn_PrintHalftoneImg As System.Windows.Forms.Button
    Private WithEvents Btn_TrueTypeFont As System.Windows.Forms.Button
    Private WithEvents Btn_BitmappedFont As System.Windows.Forms.Button
    Private WithEvents Btn_AsiaFont As System.Windows.Forms.Button
    Private WithEvents Btn_InternalFont As System.Windows.Forms.Button
    Private WithEvents Btn_PrintShape As System.Windows.Forms.Button
    Private WithEvents label1 As System.Windows.Forms.Label
    Private WithEvents Txt_QRcode_Data As System.Windows.Forms.TextBox
    Private WithEvents Cbo_QR_Encoding As System.Windows.Forms.ComboBox
    Private WithEvents Grp_UploadTTF As System.Windows.Forms.GroupBox
    Private WithEvents Prog_TTF As System.Windows.Forms.ProgressBar
    Private WithEvents Btn_TTF As System.Windows.Forms.Button
    Private WithEvents Cbo_PosTTF As System.Windows.Forms.ComboBox
    Friend WithEvents GroupBox1 As System.Windows.Forms.GroupBox

End Class
