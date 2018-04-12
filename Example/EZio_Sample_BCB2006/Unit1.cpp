//---------------------------------------------------------------------------
// Create Sample Code by Jeffrey 2014/07/15
//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
#include "GodexPrinter.h"
#include "Unit1.h"
#pragma package(smart_init)
#pragma resource "*.dfm"
TForm1 *Form1;

//---------------------------------------------------------------------------
__fastcall TForm1::TForm1(TComponent* Owner)
        : TForm(Owner)
{

}

//---------------------------------------------------------------------------
// Form Create
//---------------------------------------------------------------------------
void __fastcall TForm1::FormCreate(TObject *Sender)
{
    Cbo_COM->ItemIndex = 0;
    Cbo_LPT->ItemIndex = 0;
    vector < string > DriverPrinter = Printer.GetDriverPrinter();
    Cbo_Driver->Items->Clear();
    for (unsigned int i = 0; i < DriverPrinter.size(); i++)
        Cbo_Driver->Items->Add(DriverPrinter[i].c_str());
    if (Cbo_Driver->Items->Count > 0)
        Cbo_Driver->ItemIndex = 0;
        
    Cbo_PaperType->ItemIndex = 1;
}

//---------------------------------------------------------------------------
// Paper Type Change Event
//---------------------------------------------------------------------------
void __fastcall TForm1::Cbo_PaperTypeChange(TObject *Sender)
{
    if (Cbo_PaperType->ItemIndex == 0)
        Lbl_GapFeed->Caption = "Gap Length (mm)";
    else
        Lbl_GapFeed->Caption = "Feed Length (mm)";
}

//---------------------------------------------------------------------------
// Command Change
//---------------------------------------------------------------------------
void __fastcall TForm1::Cbo_CmdChange(TObject *Sender)
{

    Rich_Cmd->Text = Cbo_Cmd->Items->Strings[Cbo_Cmd->ItemIndex];
}

//------------------------------------------------------------------------
// Connect Printer
//------------------------------------------------------------------------
void TForm1::ConnectPrinter()
{
    if (RBtn_USB->Checked == true)
    {
        Printer.Open(USB);
    }
    else if (RBtn_COM->Checked == true)
    {

        Printer.Open(Cbo_COM->Items->Strings[Cbo_COM->ItemIndex].c_str());
        Printer.SetBaudrate(StrToInt(Ed_Baud->Text));
    }
    else if (RBtn_LPT->Checked == true)
    {
        if (Cbo_LPT->ItemIndex == 0)
            Printer.Open(LPT1);
        else
            Printer.Open(LPT2);
    }
    else if (RBtn_Driver->Checked == true)
    {
        Printer.Open(Cbo_Driver->Items->Strings[Cbo_Driver->ItemIndex].c_str());
    }
    else if (RBtn_NET->Checked == true)
    {
        Printer.Open(Ed_IP->Text.c_str(), StrToInt(Ed_NetPort->Text));
    }
}

//------------------------------------------------------------------------
// Disconnect Printer
//------------------------------------------------------------------------
void TForm1::DisconnectPrinter()
{
    Printer.Close();
}

//------------------------------------------------------------------------
// Label Setup
//------------------------------------------------------------------------
void TForm1::LabelSetup()
{
    Printer.Config.LabelMode((PaperMode)Cbo_PaperType->ItemIndex, StrToInt(Ed_Label_H->Text), StrToInt(Ed_GapFeed->Text));
    Printer.Config.LabelWidth(StrToInt(Ed_Label_W->Text));
    Printer.Config.Dark(StrToInt(Ed_Dark->Text));
    Printer.Config.Speed(StrToInt(Ed_Speed->Text));
    Printer.Config.PageNo(StrToInt(Ed_PageNo->Text));
    Printer.Config.CopyNo(StrToInt(Ed_CopyNo->Text));
}

//---------------------------------------------------------------------------
// Click [Print Text] Button
//---------------------------------------------------------------------------
void __fastcall TForm1::Btn_PrintTextClick(TObject *Sender)
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
void __fastcall TForm1::Btn_PrintImageClick(TObject *Sender)
{
    MyOpenDialog->Filter = "*.bmp|*.bmp";
    if (!MyOpenDialog->Execute())
        return;

    ConnectPrinter();
    LabelSetup();
    Printer.Command.Start();
    Printer.Command.PrintImage(10, 10, MyOpenDialog->FileName.c_str(), 0);
    Printer.Command.End();
    DisconnectPrinter();
}

//---------------------------------------------------------------------------
// Click [Auto Sensing] Button
//---------------------------------------------------------------------------
void __fastcall TForm1::Btn_AutoSensingClick(TObject *Sender)
{
    ConnectPrinter();
    LabelSetup();
    Printer.Command.AutoSensing();
    DisconnectPrinter();
}

//---------------------------------------------------------------------------
// Click [Get Dll Version] Button
//---------------------------------------------------------------------------
void __fastcall TForm1::Btn_GetVersionClick(TObject *Sender)
{
    Application->MessageBox(Printer.GetVersion().c_str(), "Test", MB_OKCANCEL);
}

//---------------------------------------------------------------------------
// Click [Send Byte Array] Button
//---------------------------------------------------------------------------
void __fastcall TForm1::Btn_SendByteClick(TObject *Sender)
{
    string Cmd = "~V\r\n";
    ConnectPrinter();
    Printer.Command.SendByte((char *)Cmd.c_str());
    Printer.Close();
}

//---------------------------------------------------------------------------
// Click [Upload Text Image] Button
//---------------------------------------------------------------------------
void __fastcall TForm1::Btn_UploadTextImageClick(TObject *Sender)
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
// Click [Execute] Button
//---------------------------------------------------------------------------
void __fastcall TForm1::Btn_ExecuteClick(TObject *Sender)
{
    ConnectPrinter();
    Printer.Command.Send(Rich_Cmd->Text.c_str());
    Rich_Reply->Text = Printer.Command.Read().c_str();
    DisconnectPrinter();
}

//---------------------------------------------------------------------------
// Press [Upload Image To Internal Memory] Button
//---------------------------------------------------------------------------
void __fastcall TForm1::Btn_Upload_IntClick(TObject *Sender)
{
    string FilePath = "Test.bmp";
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

//---------------------------------------------------------------------------
// Press [Upload Image To External Memory] Button
//---------------------------------------------------------------------------
void __fastcall TForm1::Btn_Upload_ExtClick(TObject *Sender)
{
    string FilePath = "Test.bmp";
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
// Press [Upload Image And Do Halftoning] Button
//---------------------------------------------------------------------------
void __fastcall TForm1::Btn_HalfToneImageClick(TObject *Sender)
{
    MyOpenDialog->Filter = "*.bmp|*.bmp|*.jpg|*.jpg";
    if (!MyOpenDialog->Execute())
        return;

    string DisplayName = "BBB";

    ConnectPrinter();
    Printer.Command.UploadImage_FullColor(MyOpenDialog->FileName.c_str(), DisplayName.c_str(), 0);

    // Print Image
    Printer.Command.Start();
    Printer.Command.PrintImageByName(DisplayName, 10, 10);
    Printer.Command.End();

    DisconnectPrinter();
}

//---------------------------------------------------------------------------
// Press [Print 1D Barcode] Button
//---------------------------------------------------------------------------
void __fastcall TForm1::Btn_PrintCode39Click(TObject *Sender)
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
void __fastcall TForm1::Btn_QRCodeClick(TObject *Sender)
{
    ConnectPrinter();
    LabelSetup();
    Printer.Command.Start();
    Printer.Command.PrintQRCode(10, 10, "GoDEX QRCode Test");
    Printer.Command.End();
    DisconnectPrinter();
}

//---------------------------------------------------------------------------
// Press [Print PDF417] Button
//---------------------------------------------------------------------------
void __fastcall TForm1::Btn_PDF417Click(TObject *Sender)
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
void __fastcall TForm1::Btn_AztecClick(TObject *Sender)
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
void __fastcall TForm1::Btn_MaxicodeClick(TObject *Sender)
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
void __fastcall TForm1::Btn_DataMatrixClick(TObject *Sender)
{
    ConnectPrinter();
    LabelSetup();
    Printer.Command.Start();
    Printer.Command.PrintDataMatrix(10, 10, "GoDEX Test");
    Printer.Command.End();
    DisconnectPrinter();
}

//------------------------------------------------------------------------
// Press [Print Shape] Button
//------------------------------------------------------------------------
void __fastcall TForm1::Btn_PrintShapeClick(TObject *Sender)
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

//------------------------------------------------------------------------
// Press [Internal Font Print] Button
//------------------------------------------------------------------------
void __fastcall TForm1::Btn_InternalFontClick(TObject *Sender)
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

//------------------------------------------------------------------------
// Press [Internal Font Print] Button
//------------------------------------------------------------------------
void __fastcall TForm1::Btn_AsiaFontClick(TObject *Sender)
{
    ConnectPrinter();
    LabelSetup();

    // Asia Font (Need to upload [Tranditional Chainese] to AZ1)
    Printer.Command.Start();
    Printer.Command.PrintText_EZPL_Internal("Z1", 10, 10, "亞洲字測試");
    Printer.Command.End();

    DisconnectPrinter();
}

//------------------------------------------------------------------------
// Press [Download Font Print] Button
//------------------------------------------------------------------------
void __fastcall TForm1::Btn_BitmappedFontClick(TObject *Sender)
{
    ConnectPrinter();
    LabelSetup();

    // EZPL VA ~ VZ Command
    Printer.Command.Start();
    Printer.Command.PrintText_EZPL_Bitmapped("A", 10, 10, "Download Font");
    Printer.Command.End();

    DisconnectPrinter();
}
//---------------------------------------------------------------------------

void __fastcall TForm1::Btn_TrueTypeFontClick(TObject *Sender)
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
//---------------------------------------------------------------------------

void __fastcall TForm1::Btn_PrintHalftoneImgClick(TObject *Sender)
{
    MyOpenDialog->Filter = "*.bmp|*.bmp|*.gif|*.gif|*.jpg|*.jpg|*.png|*.png";
    if (!MyOpenDialog->Execute())
        return;

    ConnectPrinter();
    LabelSetup();
    Printer.Command.Start();
    Printer.Command.PrintImage(10, 10, MyOpenDialog->FileName.c_str(), 0, 1);
    Printer.Command.PrintImage(160, 10, MyOpenDialog->FileName.c_str(), 0, 2);
    Printer.Command.PrintImage(310, 10, MyOpenDialog->FileName.c_str(), 0, 3);
    Printer.Command.End();
    DisconnectPrinter();
}
//---------------------------------------------------------------------------

