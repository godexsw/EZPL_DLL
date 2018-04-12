//------------------------------------------------------------------------------
// Create FrmMain.pas by Jeffrey 2014/07/17
//------------------------------------------------------------------------------
unit FrmMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, GodexPrinter, Printers;

type
  TFrmSample = class(TForm)
    Grp_Communication: TGroupBox;
    Lbl_Baud: TLabel;
    Lbl_NetPort: TLabel;
    RBtn_USB: TRadioButton;
    RBtn_COM: TRadioButton;
    RBtn_LPT: TRadioButton;
    RBtn_Driver: TRadioButton;
    RBtn_NET: TRadioButton;
    Cbo_COM: TComboBox;
    Cbo_LPT: TComboBox;
    Cbo_Driver: TComboBox;
    Ed_IP: TEdit;
    Ed_Baud: TEdit;
    Ed_NetPort: TEdit;
    Grp_Label: TGroupBox;
    Lbl_PaperType: TLabel;
    Lbl_Speed: TLabel;
    Lbl_GapFeed: TLabel;
    Lbl_Label_W: TLabel;
    Lbl_Label_H: TLabel;
    Lbl_Dark: TLabel;
    Lbl_CopyNo: TLabel;
    Lbl_PageNo: TLabel;
    Cbo_PaperType: TComboBox;
    Ed_GapFeed: TEdit;
    Ed_Label_W: TEdit;
    Ed_Label_H: TEdit;
    Ed_Speed: TEdit;
    Ed_Dark: TEdit;
    Ed_CopyNo: TEdit;
    Ed_PageNo: TEdit;
    Grp_Demo: TGroupBox;
    Btn_PrintText: TButton;
    Btn_PrintImage: TButton;
    Btn_AutoSensing: TButton;
    Btn_GetVersion: TButton;
    Btn_SendByte: TButton;
    Btn_UploadTextImage: TButton;
    Btn_PrintCode39: TButton;
    Btn_QRCode: TButton;
    Btn_PDF417: TButton;
    Btn_Aztec: TButton;
    Btn_Maxicode: TButton;
    Btn_DataMatrix: TButton;
    Grp_Command: TGroupBox;
    Cbo_Cmd: TComboBox;
    Btn_Execute: TButton;
    Rich_Reply: TRichEdit;
    Rich_Cmd: TRichEdit;
    MyOpenDialog: TOpenDialog;
    GroupBox1: TGroupBox;
    Btn_Upload_Ext: TButton;
    Btn_Upload_Int: TButton;
    Btn_HalfToneImage: TButton;
    Btn_PrintShape: TButton;
    Btn_InternalFont: TButton;
    Btn_AsiaFont: TButton;
    Btn_BitmappedFont: TButton;
    Btn_TrueTypeFont: TButton;
    Btn_PrintHalftoneImg: TButton;
    procedure Btn_PrintTextClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Cbo_CmdChange(Sender: TObject);
    procedure Btn_ExecuteClick(Sender: TObject);
    procedure Btn_HalfToneImageClick(Sender: TObject);
    procedure Btn_Upload_IntClick(Sender: TObject);
    procedure Btn_Upload_ExtClick(Sender: TObject);
    procedure Btn_PrintImageClick(Sender: TObject);
    procedure Btn_AutoSensingClick(Sender: TObject);
    procedure Btn_GetVersionClick(Sender: TObject);
    procedure Btn_SendByteClick(Sender: TObject);
    procedure Btn_UploadTextImageClick(Sender: TObject);
    procedure Btn_PrintCode39Click(Sender: TObject);
    procedure Btn_QRCodeClick(Sender: TObject);
    procedure Btn_PDF417Click(Sender: TObject);
    procedure Btn_AztecClick(Sender: TObject);
    procedure Btn_MaxicodeClick(Sender: TObject);
    procedure Btn_DataMatrixClick(Sender: TObject);
    procedure Btn_PrintShapeClick(Sender: TObject);
    procedure Btn_InternalFontClick(Sender: TObject);
    procedure Btn_AsiaFontClick(Sender: TObject);
    procedure Btn_BitmappedFontClick(Sender: TObject);
    procedure Btn_TrueTypeFontClick(Sender: TObject);
    procedure Btn_PrintHalftoneImgClick(Sender: TObject);

  private
    procedure ConnectPrinter();
    procedure DisconnectPrinter();
    procedure LabelSetup();
  public
    { Public declarations }
  end;

var
  FrmSample: TFrmSample;
  mPrinter: TGodexPrinter;
implementation

{$R *.dfm}

//------------------------------------------------------------------------
// Connect Printer
//------------------------------------------------------------------------
procedure TFrmSample.ConnectPrinter();
begin
    if (RBtn_USB.Checked = True) then
      begin
        mPrinter.OpenByType(mPrinter.Interface_USB);
      end
    else if (RBtn_COM.Checked = true) then
      begin
        mPrinter.OpenByName(Cbo_COM.Items.Strings[Cbo_COM.ItemIndex]);
        mPrinter.SetComBaudrate(StrToInt(Ed_Baud.Text));
      end
    else if (RBtn_LPT.Checked = true) then
      begin
        if (Cbo_LPT.ItemIndex = 0)then
            mPrinter.OpenByType(mPrinter.Interface_LPT1)
        else
            mPrinter.OpenByType(mPrinter.Interface_LPT2);
      end
    else if (RBtn_Driver.Checked = true) then
        mPrinter.OpenByDriver(Cbo_Driver.Items.Strings[Cbo_Driver.ItemIndex])
    else if (RBtn_NET.Checked = true) then
        mPrinter.OpenByNet(Ed_IP.Text, Ed_NetPort.Text);
end;

//------------------------------------------------------------------------
// Disconnect Printer
//------------------------------------------------------------------------
procedure TFrmSample.DisconnectPrinter();
begin
    mPrinter.Close();
end;

//------------------------------------------------------------------------
// Label Setup
//------------------------------------------------------------------------
procedure TFrmSample.LabelSetup();
begin
    mPrinter.LabelMode(Cbo_PaperType.ItemIndex, StrToInt(Ed_Label_H.Text), StrToInt(Ed_GapFeed.Text));
    mPrinter.LabelWidth(StrToInt(Ed_Label_W.Text));
    mPrinter.Dark(StrToInt(Ed_Dark.Text));
    mPrinter.Speed(StrToInt(Ed_Speed.Text));
    mPrinter.PageNo(StrToInt(Ed_PageNo.Text));
    mPrinter.CopyNo(StrToInt(Ed_CopyNo.Text));
end;

//---------------------------------------------------------------------------
// Form Create
//---------------------------------------------------------------------------
procedure TFrmSample.FormCreate(Sender: TObject);
var
  I: Integer;
  DriverName : AnsiString;
begin

    for I := 0 to Printer.Printers.Count - 1 do
    begin
      DriverName := Printer.Printers.Strings[I];
      if (Pos('Godex', DriverName) > 0) then
          Cbo_Driver.Items.Add(DriverName);
    end;

    Cbo_COM.ItemIndex := 0;
    Cbo_LPT.ItemIndex := 0;
    Cbo_Driver.ItemIndex := 0;
    Cbo_PaperType.ItemIndex := 1;
end;

//---------------------------------------------------------------------------
// Command Change
//---------------------------------------------------------------------------
procedure TFrmSample.Cbo_CmdChange(Sender: TObject);
begin
    Rich_Cmd.Text := Cbo_Cmd.Items.Strings[Cbo_Cmd.ItemIndex];
end;

//---------------------------------------------------------------------------
// Click [Auto Sensing] Button
//---------------------------------------------------------------------------
procedure TFrmSample.Btn_AutoSensingClick(Sender: TObject);
begin
    ConnectPrinter();
    LabelSetup();
    mPrinter.AutoSensing();
    DisconnectPrinter();
end;

//---------------------------------------------------------------------------
// Click [Print Aztec] Button
//---------------------------------------------------------------------------
procedure TFrmSample.Btn_AztecClick(Sender: TObject);
begin
    ConnectPrinter();
    LabelSetup();
    mPrinter.StartJob();
    mPrinter.PrintAztec(10, 10, 'GoDEX Aztec Test');
    mPrinter.EndJob();
    DisconnectPrinter();
end;

//---------------------------------------------------------------------------
// Click [Print Data Matrix] Button
//---------------------------------------------------------------------------
procedure TFrmSample.Btn_DataMatrixClick(Sender: TObject);
begin
    ConnectPrinter();
    LabelSetup();
    mPrinter.StartJob();
    mPrinter.PrintDataMatrix(10, 10, 'GoDEX Test');
    mPrinter.EndJob();
    DisconnectPrinter();
end;

//---------------------------------------------------------------------------
// Click [Execute] Button
//---------------------------------------------------------------------------
procedure TFrmSample.Btn_ExecuteClick(Sender: TObject);
begin
    ConnectPrinter();
    if (Rich_Cmd.Text <> '') then
    begin
        mPrinter.Send(Rich_Cmd.Text);
        Rich_Reply.Text := mPrinter.Read();
        DisconnectPrinter();
    end;
end;

//---------------------------------------------------------------------------
// Click [Get Dll Version] Button
//---------------------------------------------------------------------------
procedure TFrmSample.Btn_GetVersionClick(Sender: TObject);
begin
    Application.MessageBox(PChar(mPrinter.GetVersion()), 'Test', MB_OKCANCEL);
end;

//---------------------------------------------------------------------------
// Click [Print PDF417] Button
//---------------------------------------------------------------------------
procedure TFrmSample.Btn_PDF417Click(Sender: TObject);
begin
    ConnectPrinter();
    LabelSetup();
    mPrinter.StartJob();
    mPrinter.PrintPDF417(10, 10, 'GoDEX PDF417 Test');
    mPrinter.EndJob();
    DisconnectPrinter();
end;

//---------------------------------------------------------------------------
// Click [Print 1D Barcode] Button
//---------------------------------------------------------------------------
procedure TFrmSample.Btn_PrintCode39Click(Sender: TObject);
begin

    ConnectPrinter();
    LabelSetup();

    mPrinter.StartJob();
    mPrinter.PrintText(10, 10, 34, 'Arial', 'Code 39');
    mPrinter.PrintBarCode(mPrinter.BarCode_Code39, 10, 50, '1234');           // Code39
    mPrinter.PrintText(10, 210, 34, 'Arial', 'EAN128');
    mPrinter.PrintBarCode(mPrinter.BarCode_EAN128, 10, 250, '1234');          // EAN128(GS1128)
    mPrinter.PrintText(10, 410, 34, 'Arial', 'Code128 Subset A');
    mPrinter.PrintBarCode_Detail(mPrinter.BarCode_Code128_Subset, 10, 450, 2, 6, 80, 0, 1, 'A1234');     // Code128 Subset A
    mPrinter.EndJob();

    DisconnectPrinter();

end;

//---------------------------------------------------------------------------
// Click [Print Image] Button
//---------------------------------------------------------------------------
procedure TFrmSample.Btn_PrintImageClick(Sender: TObject);
begin

    MyOpenDialog.Filter := '*.bmp|*.bmp';
    if (MyOpenDialog.Execute()) then
    begin

        ConnectPrinter();
        LabelSetup();
        mPrinter.StartJob();
        mPrinter.PrintImage(10, 10, MyOpenDialog.FileName, 0);
        mPrinter.EndJob();
        DisconnectPrinter();

    end;

end;



//---------------------------------------------------------------------------
// Click [Print Text] Button
//---------------------------------------------------------------------------
procedure TFrmSample.Btn_PrintTextClick(Sender: TObject);
var
    FontHeight : Integer;
begin

    FontHeight := 34;
    ConnectPrinter();
    LabelSetup();

    // Print Text
    mPrinter.StartJob();

    mPrinter.PrintText(10, 10, FontHeight, 'Arial', '這是測試');

    mPrinter.PrintText_More(
        10,
        50,
        FontHeight,
        'Arial',
        'GoDEX EZio DLL Test',
        0,
        mPrinter.FW_900_HEAVY,
        mPrinter.Angle_180);

    mPrinter.PrintText_Detail(
        10,
        90,
        FontHeight,
        'Arial',
        'GoDEX EZio DLL Test',
        0,
        mPrinter.FW_700_BOLD,
        mPrinter.Angle_0,
        mPrinter.Italic_OFF,
        mPrinter.Underline_OFF,
        mPrinter.Strikeout_OFF,
        mPrinter.Inverse_ON);

    mPrinter.EndJob();
    DisconnectPrinter();

end;

//---------------------------------------------------------------------------
// Press [Print QRCode] Button
//---------------------------------------------------------------------------
procedure TFrmSample.Btn_QRCodeClick(Sender: TObject);
begin
    ConnectPrinter();
    LabelSetup();
    mPrinter.StartJob();
    mPrinter.PrintQRCode(10, 10, 'GoDEX QRCode Test');
    mPrinter.EndJob();
    DisconnectPrinter();
end;

//---------------------------------------------------------------------------
// Click [Send Byte Array] Button
//---------------------------------------------------------------------------
procedure TFrmSample.Btn_SendByteClick(Sender: TObject);
var
    AString:AnsiString;
    AByteArray:  array of byte;
    BinarySize:integer;
begin

    AString := '~V' + Chr(13) + Chr(10);
    BinarySize := Length(AString);
    SetLength(AByteArray, BinarySize);
    Move(AString[1], AByteArray[0], BinarySize);

    ConnectPrinter();
    mPrinter.SendByte(AByteArray);
    DisconnectPrinter();

end;

//---------------------------------------------------------------------------
// Click [Upload Text Image] Button
//---------------------------------------------------------------------------
procedure TFrmSample.Btn_UploadTextImageClick(Sender: TObject);
var
    TextObjectName, mData : string;

begin

    TextObjectName := 'MyText';
    mData := 'EZio Download Text';

    ConnectPrinter();
    LabelSetup();

    // Upload Text Image
    mPrinter.UploadText(34, 'Arial', mData, 20, mPrinter.FW_400_NORMAL, mPrinter.Angle_0, TextObjectName);

    // Print Text Image
    mPrinter.StartJob();
    mPrinter.PrintImageByName(TextObjectName, 10, 10);
    mPrinter.EndJob();
    DisconnectPrinter();
end;

//---------------------------------------------------------------------------
// Press [Upload Image To External Memory] Button
//---------------------------------------------------------------------------
procedure TFrmSample.Btn_Upload_ExtClick(Sender: TObject);
var
    DisplayName, FilePath : string;
begin

    FilePath := 'Test.bmp';
    DisplayName := 'CCC';

    ConnectPrinter();

    // Upload Image
    mPrinter.UploadImage_Int(FilePath, DisplayName, mPrinter.BMP);

    // Print Image
    mPrinter.StartJob();
    mPrinter.PrintImageByName(DisplayName, 10, 10);
    mPrinter.EndJob();

    DisconnectPrinter();
end;

//---------------------------------------------------------------------------
// Press [Upload Image To Internal Memory] Button
//---------------------------------------------------------------------------
procedure TFrmSample.Btn_Upload_IntClick(Sender: TObject);
var
    DisplayName, FilePath : string;
begin

    FilePath := 'Test.bmp';
    DisplayName := 'AAA';

    ConnectPrinter();

    // Upload Image
    mPrinter.UploadImage_Int(FilePath, DisplayName, mPrinter.BMP);

    // Print Image
    mPrinter.StartJob();
    mPrinter.PrintImageByName(DisplayName, 10, 10);
    mPrinter.EndJob();

    DisconnectPrinter();
end;

//---------------------------------------------------------------------------
// Press [Upload Image And Do Halftoning] Button
//---------------------------------------------------------------------------
procedure TFrmSample.Btn_HalfToneImageClick(Sender: TObject);
var
    DisplayName : string;
begin

    MyOpenDialog.Filter := '*.bmp|*.bmp|*.jpg|*.jpg';

    if (MyOpenDialog.Execute()) then
    begin

        DisplayName := 'BBB';
        ConnectPrinter();
        mPrinter.UploadImage_FullColor(MyOpenDialog.FileName, DisplayName, 0);

        // Print Image
        mPrinter.StartJob();
        mPrinter.PrintImageByName(DisplayName, 10, 10);
        mPrinter.EndJob();

        DisconnectPrinter();

    end;

end;

//---------------------------------------------------------------------------
// Press [Print Maxicode] Button
//---------------------------------------------------------------------------
procedure TFrmSample.Btn_MaxicodeClick(Sender: TObject);
begin
    ConnectPrinter();
    LabelSetup();
    mPrinter.StartJob();
    mPrinter.PrintMaxiCode(10, 10, '840', '068107317', '666', '123456');
    mPrinter.EndJob();
    DisconnectPrinter();
end;

//---------------------------------------------------------------------------
// Press [Print Sharp] Button
//---------------------------------------------------------------------------
procedure TFrmSample.Btn_PrintShapeClick(Sender: TObject);
begin

    ConnectPrinter();
    LabelSetup();

    // First Label
    mPrinter.StartJob();
    mPrinter.PrintHorLine(10, 10, 200, 5);
    mPrinter.PrintVerLine(10, 10, 200, 5);
    mPrinter.PrintOblique(10, 10, 5, 200, 200);
    mPrinter.PrintFillRec(10, 260, 200, 150);
    mPrinter.PrintRec(300, 260, 200, 150, 5, 5);
    mPrinter.EndJob();

    // Second Label
    mPrinter.StartJob();
    mPrinter.PrintEllipse(10, 10, 200, 100, 5);
    mPrinter.PrintRoundRec(300, 10, 200, 100, 20, 20, 5);
    mPrinter.PrintTriangle(50, 150, 200, 180, 150, 250, 5);
    mPrinter.PrintDiamond(300, 150, 200, 100, 5);
    mPrinter.EndJob();

    DisconnectPrinter();

end;

//---------------------------------------------------------------------------
// Press [Internal Font Print] Button
//---------------------------------------------------------------------------
procedure TFrmSample.Btn_InternalFontClick(Sender: TObject);
begin

    ConnectPrinter();
    LabelSetup();

    // Internal Font (Change Font)
    mPrinter.StartJob();
    mPrinter.PrintText_EZPL_Internal('A', 10, 10, 'ABCDEFG');
    mPrinter.PrintText_EZPL_Internal('B', 10, 60, 'ABCDEFG');
    mPrinter.PrintText_EZPL_Internal('C', 10, 110, 'ABCDEFG');
    mPrinter.PrintText_EZPL_Internal('D', 10, 160, 'ABCDEFG');
    mPrinter.PrintText_EZPL_Internal('E', 10, 210, 'ABCDEFG');
    mPrinter.PrintText_EZPL_Internal('F', 10, 260, 'ABCDEFG');
    mPrinter.EndJob();

    // Internal Font (Change Zoom)
    mPrinter.StartJob();
    mPrinter.PrintText_EZPL_Internal_Detail('C', 10, 10, 1, 1, 0, '0', 'Font C x 1');
    mPrinter.PrintText_EZPL_Internal_Detail('C', 10, 80, 2, 2, 0, '0', 'Font C x 2');
    mPrinter.PrintText_EZPL_Internal_Detail('C', 10, 150, 3, 3, 0, '0', 'Font C x 3');
    mPrinter.PrintText_EZPL_Internal_Detail('C', 10, 220, 4, 4, 0, '0', 'Font C x 4');
    mPrinter.EndJob();

    // Internal Font (Change Rotate & Inverse)
    mPrinter.StartJob();
    mPrinter.PrintText_EZPL_Internal_Detail('E', 10, 10, 1, 1, 0, '0', 'Degree 0');
    mPrinter.PrintText_EZPL_Internal_Detail('E', 100, 100, 1, 1, 0, '1I', 'Degree 90');
    mPrinter.EndJob();


    DisconnectPrinter();

end;

//---------------------------------------------------------------------------
// Press [Asia Font Print] Button
//---------------------------------------------------------------------------
procedure TFrmSample.Btn_AsiaFontClick(Sender: TObject);
begin

    ConnectPrinter();
    LabelSetup();

    // Asia Font (Need to upload [Tranditional Chainese] to AZ1)
    mPrinter.StartJob();
    mPrinter.PrintText_EZPL_Internal('Z1', 10, 10, '亞洲字測試');
    mPrinter.EndJob();

    DisconnectPrinter();

end;

//---------------------------------------------------------------------------
// Press [Download Font Print] Button
//---------------------------------------------------------------------------
procedure TFrmSample.Btn_BitmappedFontClick(Sender: TObject);
begin

    ConnectPrinter();
    LabelSetup();

    // EZPL VA ~ VZ Command
    mPrinter.StartJob();
    mPrinter.PrintText_EZPL_Bitmapped('A', 10, 10, 'Download Font');
    mPrinter.EndJob();

    DisconnectPrinter();

end;

//---------------------------------------------------------------------------
// Press [True Type Font Print] Button
//---------------------------------------------------------------------------
procedure TFrmSample.Btn_TrueTypeFontClick(Sender: TObject);
begin

    ConnectPrinter();
    LabelSetup();

    // EZPL ATA ~ ATZ Command
    mPrinter.StartJob();
    mPrinter.PrintText_EZPL_TTF('A', 10, 100, 'ATA TTF Test');
    mPrinter.EndJob();

    DisconnectPrinter();

end;

//---------------------------------------------------------------------------
// Press [Print Halftone Image] Button
//---------------------------------------------------------------------------
procedure TFrmSample.Btn_PrintHalftoneImgClick(Sender: TObject);
begin

    MyOpenDialog.Filter := '*.bmp|*.bmp';
    if (MyOpenDialog.Execute()) then
    begin

        ConnectPrinter();
        LabelSetup();
        mPrinter.StartJob();
        mPrinter.PrintImage_Halftone(10, 10, MyOpenDialog.FileName, 0, 1);
        mPrinter.PrintImage_Halftone(160, 10, MyOpenDialog.FileName, 0, 2);
        mPrinter.PrintImage_Halftone(310, 10, MyOpenDialog.FileName, 0, 3);
        mPrinter.EndJob();
        DisconnectPrinter();

    end;

end;

//---------------------------------------------------------------------------
end.
