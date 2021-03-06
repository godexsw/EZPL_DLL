
// EZioSampleDlg.cpp : implementation file
//

#include "stdafx.h"
#include "EZioSample.h"
#include "EZioSampleDlg.h"

#ifdef _DEBUG
#define new DEBUG_NEW
#endif


// CEZioSampleDlg dialog




CEZioSampleDlg::CEZioSampleDlg(CWnd* pParent /*=NULL*/)
	: CDialog(CEZioSampleDlg::IDD, pParent)
{
	m_hIcon = AfxGetApp()->LoadIcon(IDR_MAINFRAME);
}

void CEZioSampleDlg::DoDataExchange(CDataExchange* pDX)
{
	CDialog::DoDataExchange(pDX);
	DDX_Control(pDX, IDC_COMBO1, Cbo_COM);
	DDX_Control(pDX, IDC_COMBO2, Cbo_LPT);
	DDX_Control(pDX, IDC_EDIT1, Ed_Baud);
	DDX_Control(pDX, IDC_COMBO3, Cbo_Driver);
	DDX_Control(pDX, IDC_EDIT3, Ed_IP);
	DDX_Control(pDX, IDC_EDIT4, Ed_NetPort);
	DDX_Control(pDX, IDC_COMBO4, Cbo_PaperType);
	DDX_Control(pDX, IDC_EDIT2, Ed_GapFeed);
	DDX_Control(pDX, IDC_EDIT6, Ed_Label_W);
	DDX_Control(pDX, IDC_EDIT5, Ed_Label_H);
	DDX_Control(pDX, IDC_EDIT7, Ed_Speed);
	DDX_Control(pDX, IDC_EDIT9, Ed_Dark);
	DDX_Control(pDX, IDC_EDIT8, Ed_CopyNo);
	DDX_Control(pDX, IDC_EDIT10, Ed_PageNo);
	DDX_Control(pDX, IDC_EDIT11, Ed_Cmd);
	DDX_Control(pDX, IDC_EDIT12, Ed_Reply);
	DDX_Control(pDX, IDC_COMBO5, Cbo_Cmd);
}

BEGIN_MESSAGE_MAP(CEZioSampleDlg, CDialog)
	ON_WM_PAINT()
	ON_WM_QUERYDRAGICON()
	//}}AFX_MSG_MAP
	ON_BN_CLICKED(IDC_BUTTON16, &CEZioSampleDlg::Btn_Execute_Clicked)
	ON_BN_CLICKED(IDC_BUTTON1, &CEZioSampleDlg::OnBnClickedButton1)
	ON_CBN_SELCHANGE(IDC_COMBO5, &CEZioSampleDlg::OnCbnSelchangeCombo5)
	ON_BN_CLICKED(IDC_BUTTON17, &CEZioSampleDlg::OnBnClickedButton17)
	ON_BN_CLICKED(IDC_BUTTON3, &CEZioSampleDlg::OnBnClickedButton3)
	ON_BN_CLICKED(IDC_BUTTON2, &CEZioSampleDlg::OnBnClickedButton2)
	ON_BN_CLICKED(IDC_BUTTON4, &CEZioSampleDlg::OnBnClickedButton4)
	ON_BN_CLICKED(IDC_BUTTON5, &CEZioSampleDlg::OnBnClickedButton5)
	ON_BN_CLICKED(IDC_BUTTON6, &CEZioSampleDlg::OnBnClickedButton6)
	ON_BN_CLICKED(IDC_BUTTON7, &CEZioSampleDlg::OnBnClickedButton7)
	ON_BN_CLICKED(IDC_BUTTON9, &CEZioSampleDlg::OnBnClickedButton9)
	ON_BN_CLICKED(IDC_BUTTON8, &CEZioSampleDlg::OnBnClickedButton8)
	ON_BN_CLICKED(IDC_BUTTON10, &CEZioSampleDlg::OnBnClickedButton10)
	ON_BN_CLICKED(IDC_BUTTON11, &CEZioSampleDlg::OnBnClickedButton11)
	ON_BN_CLICKED(IDC_BUTTON12, &CEZioSampleDlg::OnBnClickedButton12)
	ON_BN_CLICKED(IDC_BUTTON13, &CEZioSampleDlg::OnBnClickedButton13)
	ON_BN_CLICKED(IDC_BUTTON14, &CEZioSampleDlg::OnBnClickedButton14)
	ON_BN_CLICKED(IDC_BUTTON15, &CEZioSampleDlg::OnBnClickedButton15)
	ON_BN_CLICKED(IDC_BUTTON18, &CEZioSampleDlg::OnBnClickedButton18)
	ON_BN_CLICKED(IDC_BUTTON19, &CEZioSampleDlg::OnBnClickedButton19)
	ON_BN_CLICKED(IDC_BUTTON20, &CEZioSampleDlg::OnBnClickedButton20)
	ON_BN_CLICKED(IDC_BUTTON21, &CEZioSampleDlg::OnBnClickedButton21)
	ON_BN_CLICKED(IDC_BUTTON22, &CEZioSampleDlg::OnBnClickedButton22)
	ON_BN_CLICKED(IDC_BUTTON23, &CEZioSampleDlg::OnBnClickedButton23)
END_MESSAGE_MAP()


// CEZioSampleDlg message handlers

BOOL CEZioSampleDlg::OnInitDialog()
{
	CDialog::OnInitDialog();

	// Set the icon for this dialog.  The framework does this automatically
	//  when the application's main window is not a dialog
	SetIcon(m_hIcon, TRUE);			// Set big icon
	SetIcon(m_hIcon, FALSE);		// Set small icon

	// TODO: Add extra initialization here

	//===========================================================
	// Communication Group
	//===========================================================

	// USB
	CButton * RBtn_USB = (CButton *)GetDlgItem(IDC_RADIO1);
	RBtn_USB->SetCheck(1);

	// COM
	Cbo_COM.SetCurSel(0);
	Ed_Baud.SetWindowTextA("9600");

	// LPT
	Cbo_LPT.SetCurSel(0);

	// Driver
	vector < string > DriverPrinter = Printer.GetDriverPrinter();
	for (unsigned int i = 0; i < DriverPrinter.size(); i++)
		Cbo_Driver.AddString(DriverPrinter[i].c_str());
	if (Cbo_Driver.GetCount() > 0)
		Cbo_Driver.SetCurSel(0);

	// Network
	Ed_IP.SetWindowTextA("192.168.102.101");
	Ed_NetPort.SetWindowTextA("9100");

	//===========================================================
	// Label Setup Group
	//===========================================================

	// Continue Paper
	Cbo_PaperType.SetCurSel(1);

	// Gap or Feed
	Ed_GapFeed.SetWindowTextA("3");

	// Label Width
	Ed_Label_W.SetWindowTextA("54");

	// Label Height
	Ed_Label_H.SetWindowTextA("40");

	// Speed
	Ed_Speed.SetWindowTextA("3");

	// Dark
	Ed_Dark.SetWindowTextA("10");

	// Copy No
	Ed_CopyNo.SetWindowTextA("1");

	// Page No
	Ed_PageNo.SetWindowTextA("1");

	return TRUE;  // return TRUE  unless you set the focus to a control
}

// If you add a minimize button to your dialog, you will need the code below
//  to draw the icon.  For MFC applications using the document/view model,
//  this is automatically done for you by the framework.

void CEZioSampleDlg::OnPaint()
{
	if (IsIconic())
	{
		CPaintDC dc(this); // device context for painting

		SendMessage(WM_ICONERASEBKGND, reinterpret_cast<WPARAM>(dc.GetSafeHdc()), 0);

		// Center icon in client rectangle
		int cxIcon = GetSystemMetrics(SM_CXICON);
		int cyIcon = GetSystemMetrics(SM_CYICON);
		CRect rect;
		GetClientRect(&rect);
		int x = (rect.Width() - cxIcon + 1) / 2;
		int y = (rect.Height() - cyIcon + 1) / 2;

		// Draw the icon
		dc.DrawIcon(x, y, m_hIcon);
	}
	else
	{
		CDialog::OnPaint();
	}
}

// The system calls this function to obtain the cursor to display while the user drags
//  the minimized window.
HCURSOR CEZioSampleDlg::OnQueryDragIcon()
{
	return static_cast<HCURSOR>(m_hIcon);
}

void CEZioSampleDlg::OnOK()
{

}

BOOL CEZioSampleDlg::PreTranslateMessage(MSG* pMsg)    
{  
	if (pMsg->message == WM_KEYDOWN && pMsg->wParam == VK_ESCAPE)    
    {    
		pMsg->wParam = VK_RETURN;                                                          
	}    
    
	return   CDialog::PreTranslateMessage(pMsg);  
}  

//------------------------------------------------------------------------
// Connect Printer
//------------------------------------------------------------------------
void CEZioSampleDlg::ConnectPrinter()
{	
	CString SelText;

    if (((CButton *)GetDlgItem(IDC_RADIO1))->GetCheck())
    {
        Printer.Open(USB);
    }
    else if (((CButton *)GetDlgItem(IDC_RADIO2))->GetCheck())
    {
		Cbo_COM.GetWindowTextA(SelText);
		Printer.Open(SelText.GetString());
		
		Ed_Baud.GetWindowTextA(SelText);
		Printer.SetBaudrate(StrToInt(SelText));
    }
    else if (((CButton *)GetDlgItem(IDC_RADIO3))->GetCheck())
    {
		if (Cbo_LPT.GetCurSel() == 0)
            Printer.Open(LPT1);
        else
            Printer.Open(LPT2);
    }
    else if (((CButton *)GetDlgItem(IDC_RADIO4))->GetCheck())
    {
		((CButton *)GetDlgItem(IDC_RADIO4))->GetWindowTextA(SelText);
        Printer.Open(SelText.GetString());
    }
    else if (((CButton *)GetDlgItem(IDC_RADIO5))->GetCheck())
    {
		CString strIP;
		Ed_IP.GetWindowTextA(strIP);

		CString strNetPort;
		Ed_NetPort.GetWindowTextA(strNetPort);

		Printer.Open(strIP.GetString(), StrToInt(strNetPort.GetString()));
    }
}

//------------------------------------------------------------------------
// Disconnect Printer
//------------------------------------------------------------------------
void CEZioSampleDlg::DisconnectPrinter()
{
    Printer.Close();
}

//------------------------------------------------------------------------
// Label Setup
//------------------------------------------------------------------------
void CEZioSampleDlg::LabelSetup()
{
	PaperMode nPaperMode;
	CString Label_W;
	CString Label_H;
	CString GapFeed;
	CString Dark;
	CString Speed;
	CString CopyNo;
	CString PageNo;

	nPaperMode = (PaperMode)Cbo_PaperType.GetCurSel();
	Ed_Label_H.GetWindowTextA(Label_H);
	Ed_Label_W.GetWindowTextA(Label_W);
	Ed_GapFeed.GetWindowTextA(GapFeed);
	Ed_Dark.GetWindowTextA(Dark);
	Ed_Speed.GetWindowTextA(Speed);
	Ed_PageNo.GetWindowTextA(PageNo);
	Ed_CopyNo.GetWindowTextA(CopyNo);

    Printer.Config.LabelMode(nPaperMode, StrToInt(Label_H), StrToInt(GapFeed));
    Printer.Config.LabelWidth(StrToInt(Label_W));
    Printer.Config.Dark(StrToInt(Dark));
    Printer.Config.Speed(StrToInt(Speed));
    Printer.Config.PageNo(StrToInt(PageNo));
    Printer.Config.CopyNo(StrToInt(CopyNo));
}

//---------------------------------------------------------------------------
// Click [Execute] Button
//---------------------------------------------------------------------------
void CEZioSampleDlg::Btn_Execute_Clicked()
{
    ConnectPrinter();
	
	CString mCommand;
	Ed_Cmd.GetWindowText(mCommand);
	Printer.Command.Send(mCommand.GetString());

	CString mReply = CString(Printer.Command.Read().c_str());
	Ed_Reply.SetWindowText(mReply);

    DisconnectPrinter();
}

//---------------------------------------------------------------------------
// Command Change
//---------------------------------------------------------------------------
void CEZioSampleDlg::OnCbnSelchangeCombo5()
{
	CString mCommand;
	Cbo_Cmd.GetWindowTextA(mCommand);
	Ed_Cmd.SetWindowTextA(mCommand);
}

//---------------------------------------------------------------------------
// Exit
//---------------------------------------------------------------------------
void CEZioSampleDlg::OnBnClickedButton17()
{
	OnCancel();
}

//---------------------------------------------------------------------------
// Click [Print Text] Button
//---------------------------------------------------------------------------
void CEZioSampleDlg::OnBnClickedButton1()
{
    int PosX = 10;
    int PosY = 10;
    int FontHeight = 34;

    ConnectPrinter();
    LabelSetup();

    // Print Text
    Printer.Command.Start();
    Printer.Command.PrintText(PosX, PosY += 40, FontHeight, "Arial", "這是測試");
    Printer.Command.PrintText(PosX, PosY += 40, FontHeight, "Arial", "GoDEX EZio DLL Test", 0, FW_900_HEAVY, Angle_180);
    Printer.Command.PrintText(PosX, PosY += 40, FontHeight, "Arial", "GoDEX EZio DLL Test", 0, FW_700_BOLD, Angle_0, Italic_OFF, Underline_OFF, Strikeout_OFF, Inverse_ON);
    Printer.Command.End();

    DisconnectPrinter();
}

//---------------------------------------------------------------------------
// Click [Print Image] Button
//---------------------------------------------------------------------------
void CEZioSampleDlg::OnBnClickedButton3()
{
    ConnectPrinter();
    LabelSetup();
    Printer.Command.Start();
    Printer.Command.PrintImage(10, 10, "GoDEX.BMP", 0);
    Printer.Command.End();
    DisconnectPrinter();
}

//---------------------------------------------------------------------------
// Click [Auto Sensing] Button
//---------------------------------------------------------------------------
void CEZioSampleDlg::OnBnClickedButton2()
{
    ConnectPrinter();
    LabelSetup();
    Printer.Command.AutoSensing();
    DisconnectPrinter();
}

//---------------------------------------------------------------------------
// Click [Auto Sensing] Button
//---------------------------------------------------------------------------
void CEZioSampleDlg::OnBnClickedButton4()
{
    MessageBox(Printer.GetVersion().c_str(), "Test", MB_OKCANCEL);
}

//---------------------------------------------------------------------------
// Click [Send Byte Array] Button
//---------------------------------------------------------------------------
void CEZioSampleDlg::OnBnClickedButton5()
{
    string Cmd = "~V\r\n";
    ConnectPrinter();
    Printer.Command.SendByte((char *)Cmd.c_str());
    Printer.Close();
}

//---------------------------------------------------------------------------
// Click [Upload Text Image] Button
//---------------------------------------------------------------------------
void CEZioSampleDlg::OnBnClickedButton6()
{
    string TextObjectName = "MyText";
    string mData = "EZio DLL - Download Text";

    ConnectPrinter();
    LabelSetup();

    // Upload Text Image
    Printer.Command.UploadText(34, "Arial", mData, 20, FW_400_NORMAL, Angle_0, TextObjectName);

    // Print Text Image
    Printer.Command.Start();
    Printer.Command.PrintImageByName(TextObjectName, 10, 10);
    Printer.Command.End();

    DisconnectPrinter();
}

//---------------------------------------------------------------------------
// Press [Print 1D Barcode] Button
//---------------------------------------------------------------------------
void CEZioSampleDlg::OnBnClickedButton7()
{
    ConnectPrinter();
    LabelSetup();

    Printer.Command.Start();
    Printer.Command.PrintText(10, 10, 34, "Arial", "Code 39");
    Printer.Command.PrintBarCode(Code39, 10, 50, "1234");           // Code39
    Printer.Command.PrintText(10, 210, 34, "Arial", "EAN128");
    Printer.Command.PrintBarCode(EAN128, 10, 250, "1234");          // EAN128(GS1128)
    Printer.Command.PrintText(10, 410, 34, "Arial", "Code128 Subset A");
    Printer.Command.PrintBarCode(Code128_Subset, 10, 450, 2, 6, 80, 0, 1, "A1234");     // Code128 Subset A
    Printer.Command.End();

    DisconnectPrinter();
}

//---------------------------------------------------------------------------
// Press [Print QRCode] Button
//---------------------------------------------------------------------------
void CEZioSampleDlg::OnBnClickedButton9()
{
    ConnectPrinter();
    //LabelSetup();
    Printer.Command.Start();
    //Printer.Command.PrintQRCode(10, 10, "GoDEX QRCode Test");
	Printer.Command.PrintQRCode(10, 10, "ttt");
    Printer.Command.End();
    DisconnectPrinter();
}

//---------------------------------------------------------------------------
// Press [Print PDF417] Button
//---------------------------------------------------------------------------
void CEZioSampleDlg::OnBnClickedButton8()
{
    ConnectPrinter();
    LabelSetup();
    Printer.Command.Start();
    Printer.Command.PrintPDF417(10, 10, "GoDEX PDF417 Test");
    Printer.Command.End();
    DisconnectPrinter();
}

//---------------------------------------------------------------------------
// Press [Print Aztec] Button
//---------------------------------------------------------------------------
void CEZioSampleDlg::OnBnClickedButton10()
{
    ConnectPrinter();
    LabelSetup();
    Printer.Command.Start();
    Printer.Command.PrintAztec(10, 10, "GoDEX Aztec Test");
    Printer.Command.End();
    DisconnectPrinter();
}

//---------------------------------------------------------------------------
// Press [Print Maxicode] Button
//---------------------------------------------------------------------------
void CEZioSampleDlg::OnBnClickedButton11()
{
    ConnectPrinter();
    LabelSetup();
    Printer.Command.Start();
    Printer.Command.PrintMaxiCode(10, 10, "840", "068107317", "666", "123456");
    Printer.Command.End();
    DisconnectPrinter();
}

//---------------------------------------------------------------------------
// Press [Print DataMatrix Code] Button
//---------------------------------------------------------------------------
void CEZioSampleDlg::OnBnClickedButton12()
{
    ConnectPrinter();
    LabelSetup();
    Printer.Command.Start();
    Printer.Command.PrintDataMatrix(10, 10, "GoDEX Test");
    Printer.Command.End();
    DisconnectPrinter();
}

//---------------------------------------------------------------------------
// Press [Upload Image And Do Halftoning] Button
//---------------------------------------------------------------------------
void CEZioSampleDlg::OnBnClickedButton13()
{
    string DisplayName = "BBB";

    ConnectPrinter();
    Printer.Command.UploadImage_FullColor("GoDEX.BMP", DisplayName.c_str(), 0);

    // Print Image
    Printer.Command.Start();
    Printer.Command.PrintImageByName(DisplayName, 10, 10);
    Printer.Command.End();

    DisconnectPrinter();
}

//---------------------------------------------------------------------------
// Press [Upload Image To External Memory] Button
//---------------------------------------------------------------------------
void CEZioSampleDlg::OnBnClickedButton14()
{
    string FilePath = "GoDEX.bmp";
    string DisplayName = "CCC";

    ConnectPrinter();

    // Upload Image
    Printer.Command.UploadImage_Ext(FilePath, DisplayName, BMP);

    // Print Image
    Printer.Command.Start();
    Printer.Command.PrintImageByName(DisplayName, 10, 10);
    Printer.Command.End();

    DisconnectPrinter();
}

//---------------------------------------------------------------------------
// Press [Upload Image To External Memory] Button
//---------------------------------------------------------------------------
void CEZioSampleDlg::OnBnClickedButton15()
{
    string FilePath = "GoDEX.bmp";
    string DisplayName = "AAA";

    ConnectPrinter();

    // Upload Image
    Printer.Command.UploadImage_Int(FilePath, DisplayName, BMP);

    // Print Image
    Printer.Command.Start();
    Printer.Command.PrintImageByName(DisplayName, 10, 10);
    Printer.Command.End();

    DisconnectPrinter();
}

void CEZioSampleDlg::OnBnClickedButton18()
{
    ConnectPrinter();
    LabelSetup();

    // First Label
    Printer.Command.Start();
    Printer.Command.PrintHorLine(10, 10, 200, 5);
    Printer.Command.PrintVerLine(10, 10, 200, 5);
    Printer.Command.PrintOblique(10, 10, 5, 200, 200);
    Printer.Command.PrintFillRec(10, 260, 200, 150);
    Printer.Command.PrintRec(300, 260, 200, 150, 5, 5);
    Printer.Command.End();

    // Second Label
    Printer.Command.Start();
    Printer.Command.PrintEllipse(10, 10, 200, 100, 5);
    Printer.Command.PrintRoundRec(300, 10, 200, 100, 20, 20, 5);
    Printer.Command.PrintTriangle(50, 150, 200, 180, 150, 250, 5);
    Printer.Command.PrintDiamond(300, 150, 200, 100, 5);
    Printer.Command.End();

    DisconnectPrinter();
}

void CEZioSampleDlg::OnBnClickedButton19()
{
    ConnectPrinter();
    LabelSetup();

    // Internal Font (Change Font)
    Printer.Command.Start();
    Printer.Command.PrintText_EZPL_Internal("A", 10, 10, "ABCDEFG");
    Printer.Command.PrintText_EZPL_Internal("B", 10, 60, "ABCDEFG");
    Printer.Command.PrintText_EZPL_Internal("C", 10, 110, "ABCDEFG");
    Printer.Command.PrintText_EZPL_Internal("D", 10, 160, "ABCDEFG");
    Printer.Command.PrintText_EZPL_Internal("E", 10, 210, "ABCDEFG");
    Printer.Command.PrintText_EZPL_Internal("F", 10, 260, "ABCDEFG");
    Printer.Command.End();

    // Internal Font (Change Zoom)
    Printer.Command.Start();
    Printer.Command.PrintText_EZPL_Internal("C", 10, 10, 1, 1, 0, "0", "Font C x 1");
    Printer.Command.PrintText_EZPL_Internal("C", 10, 80, 2, 2, 0, "0", "Font C x 2");
    Printer.Command.PrintText_EZPL_Internal("C", 10, 150, 3, 3, 0, "0", "Font C x 3");
    Printer.Command.PrintText_EZPL_Internal("C", 10, 220, 4, 4, 0, "0", "Font C x 4");
    Printer.Command.End();

    // Internal Font (Change Rotate & Inverse)
    Printer.Command.Start();
    Printer.Command.PrintText_EZPL_Internal("E", 10, 10, 1, 1, 0, "0", "Degree 0");
    Printer.Command.PrintText_EZPL_Internal("E", 100, 100, 1, 1, 0, "1I", "Degree 90");
    Printer.Command.End();

    DisconnectPrinter();
}

void CEZioSampleDlg::OnBnClickedButton20()
{
    ConnectPrinter();
    LabelSetup();

    // Asia Font (Need to upload [Tranditional Chainese] to AZ1)
    Printer.Command.Start();
    Printer.Command.PrintText_EZPL_Internal("Z1", 10, 10, "亞洲字測試");
    Printer.Command.End();

    DisconnectPrinter();
}

void CEZioSampleDlg::OnBnClickedButton21()
{
    ConnectPrinter();
    LabelSetup();

    // EZPL VA ~ VZ Command
    Printer.Command.Start();
    Printer.Command.PrintText_EZPL_Bitmapped("A", 10, 10, "Download Font");
    Printer.Command.End();

    DisconnectPrinter();
}

void CEZioSampleDlg::OnBnClickedButton22()
{
    ConnectPrinter();
    LabelSetup();

    // EZPL ATA ~ ATZ Command
    Printer.Command.Start();
    Printer.Command.PrintText_EZPL_TTF("", 10, 10, "Built-In TTF Test");
    Printer.Command.PrintText_EZPL_TTF("A", 10, 100, "ATA TTF Test");
    Printer.Command.End();

    DisconnectPrinter();
}

void CEZioSampleDlg::OnBnClickedButton23()
{
    ConnectPrinter();
    LabelSetup();
    Printer.Command.Start();

    Printer.Command.PrintImage(10, 10, "Lena.BMP", 0, 1);
    Printer.Command.PrintImage(160, 10, "Lena.BMP", 0, 2);
    Printer.Command.PrintImage(310, 10, "Lena.BMP", 0, 3);

    Printer.Command.End();
    DisconnectPrinter();
}
