import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.border.EmptyBorder;
import javax.swing.JButton;

import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;

import javax.swing.border.TitledBorder;
import javax.swing.UIManager;
import javax.swing.JRadioButton;
import javax.swing.JComboBox;
import javax.swing.JTextField;
import javax.swing.JLabel;
import javax.swing.JTextPane;
import javax.swing.DefaultComboBoxModel;
import javax.swing.ButtonGroup;
import javax.swing.JOptionPane;

import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.UnsupportedEncodingException;

import javax.print.*;

public class FrmMain extends JFrame {

	private JPanel contentPane;
	private JTextField Txt_IP;
	private JTextField Txt_Baud;
	private JTextField Txt_NetPort;
	private JTextField Txt_GapFeed;
	private JTextField Txt_Label_W;
	private JTextField Txt_Label_H;
	private JTextField Txt_Dark;
	private JTextField Txt_Copy;
	private JTextField Txt_Page;
	private JTextField Txt_Speed;
	private final ButtonGroup buttonGroup = new ButtonGroup();

	GodexPrinter Printer = new GodexPrinter(); 
	private JRadioButton rdbtnUsb;
	private JRadioButton rdbtnCom;
	private JRadioButton rdbtnLpt;
	private JRadioButton rdbtnDriver;
	private JRadioButton rdbtnNetwork;

	private JComboBox Cbo_COM;
	private JComboBox Cbo_LPT;
	private JComboBox Cbo_Driver;
	private JComboBox Cbo_PaperType;
	private JComboBox Cbo_Cmd;
	
	private JTextPane TxtPnl_Cmd;
	private JTextPane TxtPnl_Reply;

	
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					FrmMain frame = new FrmMain();
					frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}
	
	/**
	 * Create the frame.
	 */
	public FrmMain() 
	{
		addWindowListener(new WindowAdapter() {
			@Override
			public void windowOpened(WindowEvent arg0) 
			{
				String PrinterName;
		        PrintService[] printServices = PrintServiceLookup.lookupPrintServices(null, null);
		        for (PrintService printer : printServices)
		        {
		        	PrinterName = printer.getName();
		        	if (PrinterName.toUpperCase().contains("GODEX") == true)
		        		Cbo_Driver.addItem(PrinterName);
		        }
			}
		});
		setTitle("EZio Sample Java");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 698, 563);
		contentPane = new JPanel();
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		JPanel Pnl_Communication = new JPanel();
		Pnl_Communication.setBorder(new TitledBorder(null, " Communication ", TitledBorder.LEADING, TitledBorder.TOP, null, null));
		Pnl_Communication.setBounds(10, 10, 664, 151);
		contentPane.add(Pnl_Communication);
		Pnl_Communication.setLayout(null);
		
		rdbtnUsb = new JRadioButton("USB");
		buttonGroup.add(rdbtnUsb);
		rdbtnUsb.setSelected(true);
		rdbtnUsb.setBounds(19, 20, 107, 23);
		Pnl_Communication.add(rdbtnUsb);
		
		rdbtnCom = new JRadioButton("COM");
		buttonGroup.add(rdbtnCom);
		rdbtnCom.setBounds(19, 44, 107, 23);
		Pnl_Communication.add(rdbtnCom);
		
		rdbtnLpt = new JRadioButton("LPT");
		buttonGroup.add(rdbtnLpt);
		rdbtnLpt.setBounds(19, 69, 107, 23);
		Pnl_Communication.add(rdbtnLpt);
		
		rdbtnDriver = new JRadioButton("Driver");
		buttonGroup.add(rdbtnDriver);
		rdbtnDriver.setBounds(19, 94, 107, 23);
		Pnl_Communication.add(rdbtnDriver);
		
		rdbtnNetwork = new JRadioButton("Network");
		buttonGroup.add(rdbtnNetwork);
		rdbtnNetwork.setBounds(19, 119, 107, 23);
		Pnl_Communication.add(rdbtnNetwork);
		
		Cbo_COM = new JComboBox();
		Cbo_COM.setModel(new DefaultComboBoxModel(new String[] {"COM1", "COM2", "COM3", "COM4"}));
		Cbo_COM.setSelectedIndex(0);
		Cbo_COM.setBounds(132, 45, 342, 21);
		Pnl_Communication.add(Cbo_COM);
		
		Cbo_LPT = new JComboBox();
		Cbo_LPT.setModel(new DefaultComboBoxModel(new String[] {"LPT1", "LPT2"}));
		Cbo_LPT.setSelectedIndex(0);
		Cbo_LPT.setBounds(132, 70, 342, 21);
		Pnl_Communication.add(Cbo_LPT);
		
		Cbo_Driver = new JComboBox();
		Cbo_Driver.setBounds(132, 95, 342, 21);
		Pnl_Communication.add(Cbo_Driver);
		
		Txt_IP = new JTextField();
		Txt_IP.setText("192.168.102.101");
		Txt_IP.setBounds(132, 120, 342, 21);
		Pnl_Communication.add(Txt_IP);
		Txt_IP.setColumns(10);
		
		Txt_Baud = new JTextField();
		Txt_Baud.setText("9600");
		Txt_Baud.setColumns(10);
		Txt_Baud.setBounds(552, 45, 96, 21);
		Pnl_Communication.add(Txt_Baud);
		
		Txt_NetPort = new JTextField();
		Txt_NetPort.setText("9100");
		Txt_NetPort.setColumns(10);
		Txt_NetPort.setBounds(552, 120, 96, 21);
		Pnl_Communication.add(Txt_NetPort);
		
		JLabel lblBaudrate = new JLabel("Baudrate");
		lblBaudrate.setBounds(496, 48, 58, 15);
		Pnl_Communication.add(lblBaudrate);
		
		JLabel lblPort = new JLabel("Port");
		lblPort.setBounds(496, 123, 58, 15);
		Pnl_Communication.add(lblPort);
		
		JPanel Pnl_LabelSetup = new JPanel();
		Pnl_LabelSetup.setBorder(new TitledBorder(UIManager.getBorder("TitledBorder.border"), " Label Setup ", TitledBorder.LEADING, TitledBorder.TOP, null, null));
		Pnl_LabelSetup.setBounds(10, 168, 408, 127);
		contentPane.add(Pnl_LabelSetup);
		Pnl_LabelSetup.setLayout(null);
		
		JLabel lblPaperType = new JLabel("Paper Type");
		lblPaperType.setBounds(24, 24, 104, 15);
		Pnl_LabelSetup.add(lblPaperType);
		
		JLabel lblFeedLengthmm = new JLabel("Feed Length (mm)");
		lblFeedLengthmm.setBounds(24, 49, 104, 15);
		Pnl_LabelSetup.add(lblFeedLengthmm);
		
		JLabel lblLabelWidthmm = new JLabel("Label Width (mm)");
		lblLabelWidthmm.setBounds(24, 74, 104, 15);
		Pnl_LabelSetup.add(lblLabelWidthmm);
		
		JLabel lblLabelHeightmm = new JLabel("Label Height (mm)");
		lblLabelHeightmm.setBounds(24, 99, 104, 15);
		Pnl_LabelSetup.add(lblLabelHeightmm);
		
		Cbo_PaperType = new JComboBox();
		Cbo_PaperType.setModel(new DefaultComboBoxModel(new String[] {"Gap", "Continue"}));
		Cbo_PaperType.setSelectedIndex(1);
		Cbo_PaperType.setBounds(132, 21, 94, 21);
		Pnl_LabelSetup.add(Cbo_PaperType);
		
		Txt_GapFeed = new JTextField();
		Txt_GapFeed.setText("3");
		Txt_GapFeed.setColumns(10);
		Txt_GapFeed.setBounds(132, 46, 94, 21);
		Pnl_LabelSetup.add(Txt_GapFeed);
		
		Txt_Label_W = new JTextField();
		Txt_Label_W.setText("54");
		Txt_Label_W.setColumns(10);
		Txt_Label_W.setBounds(132, 71, 94, 21);
		Pnl_LabelSetup.add(Txt_Label_W);
		
		Txt_Label_H = new JTextField();
		Txt_Label_H.setText("40");
		Txt_Label_H.setColumns(10);
		Txt_Label_H.setBounds(132, 96, 94, 21);
		Pnl_LabelSetup.add(Txt_Label_H);
		
		JLabel lblSpeed = new JLabel("Speed");
		lblSpeed.setBounds(248, 21, 58, 15);
		Pnl_LabelSetup.add(lblSpeed);
		
		JLabel lblDark = new JLabel("Dark");
		lblDark.setBounds(248, 46, 58, 15);
		Pnl_LabelSetup.add(lblDark);
		
		JLabel lblCopyNo = new JLabel("Copy No.");
		lblCopyNo.setBounds(248, 71, 58, 15);
		Pnl_LabelSetup.add(lblCopyNo);
		
		JLabel lblPageNo = new JLabel("Page No.");
		lblPageNo.setBounds(248, 96, 58, 15);
		Pnl_LabelSetup.add(lblPageNo);
		
		Txt_Dark = new JTextField();
		Txt_Dark.setText("10");
		Txt_Dark.setColumns(10);
		Txt_Dark.setBounds(316, 43, 78, 21);
		Pnl_LabelSetup.add(Txt_Dark);
		
		Txt_Copy = new JTextField();
		Txt_Copy.setText("1");
		Txt_Copy.setColumns(10);
		Txt_Copy.setBounds(316, 68, 78, 21);
		Pnl_LabelSetup.add(Txt_Copy);
		
		Txt_Page = new JTextField();
		Txt_Page.setText("1");
		Txt_Page.setColumns(10);
		Txt_Page.setBounds(316, 93, 78, 21);
		Pnl_LabelSetup.add(Txt_Page);
		
		Txt_Speed = new JTextField();
		Txt_Speed.setText("3");
		Txt_Speed.setColumns(10);
		Txt_Speed.setBounds(316, 18, 78, 21);
		Pnl_LabelSetup.add(Txt_Speed);
		
		JPanel Pnl_PrintDemo = new JPanel();
		Pnl_PrintDemo.setBorder(new TitledBorder(UIManager.getBorder("TitledBorder.border"), " Print Demo ", TitledBorder.LEADING, TitledBorder.TOP, null, null));
		Pnl_PrintDemo.setBounds(10, 299, 441, 214);
		contentPane.add(Pnl_PrintDemo);
		Pnl_PrintDemo.setLayout(null);
		
		JButton btnPrintText = new JButton("Print Text");
		btnPrintText.addActionListener(new ActionListener() 
		{
			//---------------------------------------------------------------------------
			// Click [Print Text] Button
			//---------------------------------------------------------------------------
			public void actionPerformed(ActionEvent arg0) 
			{
			    int PosX = 10;
			    int PosY = 10;
			    int FontHeight = 34;

			    ConnectPrinter();
			    LabelSetup();

			    // Print Text
			    Printer.Command.Start();
	            Printer.Command.PrintText_Unicode(PosX, PosY += 40, FontHeight, "Arial", "這是中文測試");
	            Printer.Command.PrintText_Unicode(PosX, PosY += 40, FontHeight, "MS Gothic", "これは日本のテストです", 0, FontWeight.FW_400_NORMAL, RotateMode.Angle_180);
	            Printer.Command.PrintText_Unicode(PosX, PosY += 40, FontHeight, "GulimChe", "이것은 한국의 테스트입니다", 0, FontWeight.FW_900_HEAVY, RotateMode.Angle_0);
	            Printer.Command.PrintText(PosX, PosY += 40, FontHeight, "Arial", "GoDEX EZio DLL Test");
	            Printer.Command.PrintText(PosX, PosY += 40, FontHeight, "Arial", "GoDEX EZio DLL Test", 0, FontWeight.FW_900_HEAVY, RotateMode.Angle_180);
	            Printer.Command.PrintText(PosX, PosY += 40, FontHeight, "Arial", "GoDEX EZio DLL Test", 0, FontWeight.FW_700_BOLD, RotateMode.Angle_0, Italic_State.Italic_OFF, Underline_State.Underline_OFF, Strikeout_State.Strikeout_OFF, Inverse_State.Inverse_ON);
			    Printer.Command.End();

			    DisconnectPrinter();		
			}
			
			//---------------------------------------------------------------------------
		});
		btnPrintText.setBounds(10, 25, 135, 23);
		Pnl_PrintDemo.add(btnPrintText);
		
		JButton btnPrintImage = new JButton("Print Image");
		btnPrintImage.addActionListener(new ActionListener() 
		{
			//---------------------------------------------------------------------------
			// Click [Print Image] Button
			//---------------------------------------------------------------------------
			public void actionPerformed(ActionEvent arg0) 
			{
			    String mPath = System.getProperty("user.dir"); 
			    String mFileName = mPath + "\\" + "Test.BMP"; 
			    ConnectPrinter();
			    LabelSetup();
			    Printer.Command.Start();
			    Printer.Command.PrintImage(10, 10, mFileName, 0);
			    Printer.Command.End();
			    DisconnectPrinter();
			}
			
			//---------------------------------------------------------------------------
		});
		btnPrintImage.setBounds(10, 50, 135, 23);
		Pnl_PrintDemo.add(btnPrintImage);
		
		JButton btnAutoSensing = new JButton("Auto Sensing");
		btnAutoSensing.addActionListener(new ActionListener() 
		{
			//---------------------------------------------------------------------------
			// Click [Auto Sensing] Button
			//---------------------------------------------------------------------------
			public void actionPerformed(ActionEvent e) 
			{
			    ConnectPrinter();
			    LabelSetup();
			    Printer.Command.AutoSensing();
			    DisconnectPrinter();
			}
			
			//---------------------------------------------------------------------------
		});
		btnAutoSensing.setBounds(10, 75, 135, 23);
		Pnl_PrintDemo.add(btnAutoSensing);
		
		JButton btnUploadTextImage = new JButton("Upload Text Image");
		btnUploadTextImage.addActionListener(new ActionListener() 
		{
			//---------------------------------------------------------------------------
			// Click [Upload Text Image] Button
			//---------------------------------------------------------------------------
			public void actionPerformed(ActionEvent arg0) 
			{
			    String TextObjectName = "MyText";
			    String mData = "Download Text";

			    ConnectPrinter();
			    LabelSetup();

			    // Upload Text Image
			    Printer.Command.UploadText(34, "Arial", mData, 20, FontWeight.FW_400_NORMAL, RotateMode.Angle_0, TextObjectName);

			    // Print Text Image
			    Printer.Command.Start();
			    Printer.Command.PrintImageByName(TextObjectName, 10, 10);
			    Printer.Command.End();

			    DisconnectPrinter();
			}
			
			//---------------------------------------------------------------------------
		});
		btnUploadTextImage.setBounds(10, 151, 135, 23);
		Pnl_PrintDemo.add(btnUploadTextImage);
		
		JButton btnSendByteArray = new JButton("Send Byte Array");
		btnSendByteArray.addActionListener(new ActionListener() 
		{
			//---------------------------------------------------------------------------
			// Click [Send Byte Array] Button
			//---------------------------------------------------------------------------
			public void actionPerformed(ActionEvent e) 
			{
				ConnectPrinter();
				String stsCommand = "~V\r\n";
				byte[] ByteArray = stsCommand.getBytes();
				Printer.Command.SendByte(ByteArray);
				DisconnectPrinter();
			}
			
			//---------------------------------------------------------------------------
		});
		btnSendByteArray.setBounds(10, 124, 135, 23);
		Pnl_PrintDemo.add(btnSendByteArray);
		
		JButton btnGetDllVersion = new JButton("Get Dll Version");
		btnGetDllVersion.addActionListener(new ActionListener() 
		{
			//---------------------------------------------------------------------------
			// Click [Get Dll Version] Button
			//---------------------------------------------------------------------------
			public void actionPerformed(ActionEvent e) 
			{
				JOptionPane.showMessageDialog(null, Printer.GetVersion());
			}
			
			//---------------------------------------------------------------------------
		});
		btnGetDllVersion.setBounds(10, 99, 135, 23);
		Pnl_PrintDemo.add(btnGetDllVersion);
		
		JButton btnPrintdBarcode = new JButton("Print 1D Barcode");
		btnPrintdBarcode.addActionListener(new ActionListener() 
		{
			//---------------------------------------------------------------------------
			// Press [Print 1D Barcode] Button
			//---------------------------------------------------------------------------
			public void actionPerformed(ActionEvent e) 
			{
			    ConnectPrinter();
			    LabelSetup();

			    Printer.Command.Start();
			    Printer.Command.PrintText(10, 10, 34, "Arial", "Code 39");
			    Printer.Command.PrintBarCode(BarCodeType.Code39, 10, 50, "1234");           // Code39
			    Printer.Command.PrintText(10, 210, 34, "Arial", "EAN128");
			    Printer.Command.PrintBarCode(BarCodeType.EAN128, 10, 250, "1234");          // EAN128(GS1128)
			    Printer.Command.PrintText(10, 410, 34, "Arial", "Code128 Subset A");
			    Printer.Command.PrintBarCode(BarCodeType.Code128_Subset, 10, 450, 2, 6, 80, 0, 1, "A1234");     // Code128 Subset A
			    Printer.Command.End();

			    DisconnectPrinter();
			}

			//---------------------------------------------------------------------------
		});
		btnPrintdBarcode.setBounds(150, 26, 135, 23);
		Pnl_PrintDemo.add(btnPrintdBarcode);
		
		JButton btnPrintQrcode = new JButton("Print QRCode");
		btnPrintQrcode.addActionListener(new ActionListener() 
		{
			//---------------------------------------------------------------------------
			// Press [Print QRCode] Button
			//---------------------------------------------------------------------------
			public void actionPerformed(ActionEvent e) 
			{
			    ConnectPrinter();
			    LabelSetup();
			    Printer.Command.Start();
			    Printer.Command.PrintQRCode(10, 10, "GoDEX QRCode Test");
			    Printer.Command.End();
			    DisconnectPrinter();
			}
			
			//---------------------------------------------------------------------------
		});
		btnPrintQrcode.setBounds(150, 51, 135, 23);
		Pnl_PrintDemo.add(btnPrintQrcode);
		
		JButton btnPrintPdf = new JButton("Print PDF417");
		btnPrintPdf.addActionListener(new ActionListener() 
		{
			//---------------------------------------------------------------------------
			// Press [Print PDF417] Button
			//---------------------------------------------------------------------------
			public void actionPerformed(ActionEvent arg0) 
			{
			    ConnectPrinter();
			    LabelSetup();
			    Printer.Command.Start();
			    Printer.Command.PrintPDF417(10, 10, "GoDEX PDF417 Test");
			    Printer.Command.End();
			    DisconnectPrinter();
			}
			
			//---------------------------------------------------------------------------
		});
		btnPrintPdf.setBounds(150, 76, 135, 23);
		Pnl_PrintDemo.add(btnPrintPdf);
		
		JButton btnPrintAztec = new JButton("Print Aztec");
		btnPrintAztec.addActionListener(new ActionListener() 
		{
			//---------------------------------------------------------------------------
			// Press [Print Aztec] Button
			//---------------------------------------------------------------------------
			public void actionPerformed(ActionEvent e) 
			{
			    ConnectPrinter();
			    LabelSetup();
			    Printer.Command.Start();
			    Printer.Command.PrintAztec(10, 10, "GoDEX Aztec Test");
			    Printer.Command.End();
			    DisconnectPrinter();
			}
			
			//---------------------------------------------------------------------------
		});
		btnPrintAztec.setBounds(150, 100, 135, 23);
		Pnl_PrintDemo.add(btnPrintAztec);
		
		JButton btnPrintMaxicode = new JButton("Print Maxicode");
		btnPrintMaxicode.addActionListener(new ActionListener() 
		{
			//---------------------------------------------------------------------------
			// Press [Print Maxicode] Button
			//---------------------------------------------------------------------------
			public void actionPerformed(ActionEvent e) 
			{
			    ConnectPrinter();
			    LabelSetup();
			    Printer.Command.Start();
			    Printer.Command.PrintMaxiCode(10, 10, "840", "068107317", "666", "123456");
			    Printer.Command.End();
			    DisconnectPrinter();
			}
			
			//---------------------------------------------------------------------------
		});
		btnPrintMaxicode.setBounds(150, 124, 135, 23);
		Pnl_PrintDemo.add(btnPrintMaxicode);
		
		JButton btnPrintDatamatrix = new JButton("Print DataMatrix");
		btnPrintDatamatrix.addActionListener(new ActionListener() 
		{
			//---------------------------------------------------------------------------
			// Press [Print DataMatrix Code] Button
			//---------------------------------------------------------------------------
			public void actionPerformed(ActionEvent e) 
			{
			    ConnectPrinter();
			    LabelSetup();
			    Printer.Command.Start();
			    Printer.Command.PrintDataMatrix(10, 10, "GoDEX Test");
			    Printer.Command.End();
			    DisconnectPrinter();
			}
			
			//---------------------------------------------------------------------------
		});
		btnPrintDatamatrix.setBounds(150, 151, 135, 23);
		Pnl_PrintDemo.add(btnPrintDatamatrix);
		
		JButton btnPrintShape = new JButton("Print Shape");
		btnPrintShape.addActionListener(new ActionListener() {
			
			public void actionPerformed(ActionEvent e) 
			{
	            ConnectPrinter();
	            LabelSetup();

	            // First Label
	            Printer.Command.Start();
	            Printer.Command.DrawHorLine(10, 10, 200, 5);
	            Printer.Command.DrawVerLine(10, 10, 200, 5);
	            Printer.Command.DrawOblique(10, 10, 5, 200, 200);
	            Printer.Command.FillRec(10, 260, 200, 150);
	            Printer.Command.DrawRec(300, 260, 200, 150, 5, 5);
	            Printer.Command.End();

	            // Second Label
	            Printer.Command.Start();
	            Printer.Command.DrawEllipse(10, 10, 200, 100, 5);
	            Printer.Command.DrawRoundRec(300, 10, 200, 100, 20, 20, 5);
	            Printer.Command.DrawTriangle(50, 150, 200, 180, 150, 250, 5);
	            Printer.Command.DrawDiamond(300, 150, 200, 100, 5);
	            Printer.Command.End();

	            DisconnectPrinter();
			}
			
		});
		btnPrintShape.setBounds(296, 25, 135, 23);
		Pnl_PrintDemo.add(btnPrintShape);
		
		JButton btnInternalFontPrint = new JButton("Internal Font Print");
		btnInternalFontPrint.addActionListener(new ActionListener() {
			
			public void actionPerformed(ActionEvent e) 
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
			
		});
		btnInternalFontPrint.setBounds(296, 51, 135, 23);
		Pnl_PrintDemo.add(btnInternalFontPrint);
		
		JButton btnAsiaFontPrint = new JButton("Asia Font Print");
		btnAsiaFontPrint.addActionListener(new ActionListener() {
			
			public void actionPerformed(ActionEvent e) 
			{
	            ConnectPrinter();
	            LabelSetup();

	            // Asia Font (Need to upload [Tranditional Chainese] to AZ1)
	            Printer.Command.Start();
	            Printer.Command.PrintText_EZPL_Internal("Z1", 10, 10, "亞洲字測試");
	            Printer.Command.End();

	            DisconnectPrinter();
			}
			
		});
		btnAsiaFontPrint.setBounds(295, 75, 135, 23);
		Pnl_PrintDemo.add(btnAsiaFontPrint);
		
		JButton btnDownloadFontPrint = new JButton("Download Font Print");
		btnDownloadFontPrint.addActionListener(new ActionListener() {

			public void actionPerformed(ActionEvent e) 
			{
	            ConnectPrinter();
	            LabelSetup();

	            // EZPL VA ~ VZ Command
	            Printer.Command.Start();
	            Printer.Command.PrintText_EZPL_Bitmapped("A", 10, 10, "Download Font");
	            Printer.Command.End();

	            DisconnectPrinter();
			}
			
		});
		btnDownloadFontPrint.setBounds(296, 99, 135, 23);
		Pnl_PrintDemo.add(btnDownloadFontPrint);
		
		JButton btnTrueTypeFont = new JButton("True Type Font Print");
		btnTrueTypeFont.addActionListener(new ActionListener() {
			
			public void actionPerformed(ActionEvent e) 
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
			
		});
		btnTrueTypeFont.setBounds(296, 124, 135, 23);
		Pnl_PrintDemo.add(btnTrueTypeFont);
		
		JButton btnPrintHalftoneImage = new JButton("Print Halftone Image");
		btnPrintHalftoneImage.addActionListener(new ActionListener() {
			
			public void actionPerformed(ActionEvent e) 
			{
			    String mPath = System.getProperty("user.dir"); 
			    String mFileName = mPath + "\\" + "Test.BMP"; 
			    ConnectPrinter();
			    LabelSetup();
			    Printer.Command.Start();
			    Printer.Command.PrintImage(10, 10, mFileName, 0, 1);
			    Printer.Command.PrintImage(160, 10, mFileName, 0, 2);
			    Printer.Command.PrintImage(310, 10, mFileName, 0, 3);
			    Printer.Command.End();
			    DisconnectPrinter();				
			}
			
		});
		btnPrintHalftoneImage.setBounds(295, 151, 135, 23);
		Pnl_PrintDemo.add(btnPrintHalftoneImage);
		
		JPanel Pnl_Terminal = new JPanel();
		Pnl_Terminal.setBorder(new TitledBorder(UIManager.getBorder("TitledBorder.border"), " Terminal (Send And Receive) ", TitledBorder.LEADING, TitledBorder.TOP, null, null));
		Pnl_Terminal.setBounds(461, 299, 213, 214);
		contentPane.add(Pnl_Terminal);
		Pnl_Terminal.setLayout(null);
		
		Cbo_Cmd = new JComboBox();
		Cbo_Cmd.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent arg0) 
			{
				TxtPnl_Cmd.setText(Cbo_Cmd.getSelectedItem().toString());	
			}
		});
		Cbo_Cmd.setModel(new DefaultComboBoxModel(new String[] {"~B", "~V", "~S,CHECK"}));
		Cbo_Cmd.setBounds(24, 24, 168, 21);
		Pnl_Terminal.add(Cbo_Cmd);
		
		TxtPnl_Cmd = new JTextPane();
		TxtPnl_Cmd.setBounds(24, 49, 168, 46);
		Pnl_Terminal.add(TxtPnl_Cmd);
		
		TxtPnl_Reply = new JTextPane();
		TxtPnl_Reply.setBounds(24, 99, 168, 72);
		Pnl_Terminal.add(TxtPnl_Reply);
		
		JButton btnExecute = new JButton("Execute");
		btnExecute.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) 
			{
			    ConnectPrinter();
			    String Cmd = TxtPnl_Cmd.getText();
			    Printer.Command.Send(Cmd);
			    TxtPnl_Reply.setText(Printer.Command.Read());
			    DisconnectPrinter();
			}
		});
		btnExecute.setBounds(24, 177, 168, 23);
		Pnl_Terminal.add(btnExecute);
		
		JButton btnUploadImage_H = new JButton("Upload Image And Do Halftoning");
		btnUploadImage_H.setBounds(428, 171, 244, 23);
		contentPane.add(btnUploadImage_H);
		
		JButton btnUploadImage_E = new JButton("Upload Image To External Memory");
		btnUploadImage_E.setBounds(428, 204, 244, 23);
		contentPane.add(btnUploadImage_E);
		
		JButton btnUploadImage_I = new JButton("Upload Image To Internal Memory");
		btnUploadImage_I.setBounds(428, 237, 244, 23);
		contentPane.add(btnUploadImage_I);
		btnUploadImage_I.addActionListener(new ActionListener() 
		{
			//---------------------------------------------------------------------------
			// Press [Upload Image To Internal Memory] Button
			//---------------------------------------------------------------------------
			public void actionPerformed(ActionEvent e) 
			{
			    String FilePath = "Test.bmp";
			    String DisplayName = "AAA";

			    ConnectPrinter();

			    // Upload Image
			    Printer.Command.UploadImage_Int(FilePath, DisplayName, Image_Type.BMP);
			            
			    // Print Image
			    Printer.Command.Start();
			    Printer.Command.PrintImageByName(DisplayName, 10, 10);
			    Printer.Command.End();

			    DisconnectPrinter();
			}
			
			//---------------------------------------------------------------------------
		});
		btnUploadImage_E.addActionListener(new ActionListener() 
		{
			//---------------------------------------------------------------------------
			// Press [Upload Image To External Memory] Button
			//---------------------------------------------------------------------------
			public void actionPerformed(ActionEvent e) 
			{
			    String FilePath = "Test.bmp";
			    String DisplayName = "CCC";

			    ConnectPrinter();

			    // Upload Image
			    Printer.Command.UploadImage_Ext(FilePath, DisplayName, Image_Type.BMP);

			    // Print Image
			    Printer.Command.Start();
			    Printer.Command.PrintImageByName(DisplayName, 10, 10);
			    Printer.Command.End();

			    DisconnectPrinter();
			}
			
			//---------------------------------------------------------------------------
		});
		btnUploadImage_H.addActionListener(new ActionListener() 
		{
			//---------------------------------------------------------------------------
			// Press [Upload Image And Do Halftoning] Button
			//---------------------------------------------------------------------------
			public void actionPerformed(ActionEvent e) 
			{
			    String mPath = System.getProperty("user.dir"); 
			    String mFileName = mPath + "\\" + "Test.BMP"; 
			    String DisplayName = "BBB";

			    ConnectPrinter();
			    Printer.Command.UploadImage_FullColor(mFileName, DisplayName, 0);

			    // Print Image
			    Printer.Command.Start();
			    Printer.Command.PrintImageByName(DisplayName, 10, 10);
			    Printer.Command.End();

			    DisconnectPrinter();			
			}
			
			//---------------------------------------------------------------------------
		});
	}
	
	//------------------------------------------------------------------------
	// Connect Printer
	//------------------------------------------------------------------------
	void ConnectPrinter()
	{
	    if (rdbtnUsb.isSelected() == true)
	    {
	        Printer.Open(PortType.USB.Val());
	    }	 
	    else if (rdbtnCom.isSelected() == true)
	    {
	        Printer.Open(Cbo_COM.getSelectedItem().toString());
	        Printer.SetBaudrate(Integer.parseInt(Txt_Baud.getText()));
	    }
	    else if (rdbtnLpt.isSelected() == true)
	    {
	        if (Cbo_LPT.getSelectedIndex() == 0)
	            Printer.Open(PortType.LPT1.Val());
	        else
	            Printer.Open(PortType.LPT2.Val());
	    }
	    else if (rdbtnDriver.isSelected() == true)
	    {
	        Printer.Open(Cbo_Driver.getSelectedItem().toString());
	    }
	    else if (rdbtnNetwork.isSelected() == true)
	    {
	        Printer.Open(Txt_IP.getText(), Txt_NetPort.getText());
	    }
	}

	//------------------------------------------------------------------------
	// Disconnect Printer
	//------------------------------------------------------------------------
	void DisconnectPrinter()
	{
	    Printer.Close();
	}

	//------------------------------------------------------------------------
	// Label Setup
	//------------------------------------------------------------------------
	void LabelSetup()
	{
		Printer.Config.LabelMode(
				PaperMode.GetEnum(Cbo_PaperType.getSelectedIndex()), 		// Paper Type
				Integer.parseInt(Txt_Label_H.getText()), 					// Label Height
				Integer.parseInt(Txt_GapFeed.getText()));					// Gap / Feed Length (continue paper)
		
	    Printer.Config.LabelWidth(
	    		Integer.parseInt(Txt_Label_W.getText()));					// Label Width
	    
	    Printer.Config.Dark(Integer.parseInt(Txt_Dark.getText()));			// Dark
	    Printer.Config.Speed(Integer.parseInt(Txt_Speed.getText()));		// Speed
	    Printer.Config.PageNo(Integer.parseInt(Txt_Page.getText()));		// Page No
	    Printer.Config.CopyNo(Integer.parseInt(Txt_Copy.getText()));		// Copy No
	}
}
