//---------------------------------------------------------------------------
// Create clsPrinterCommand.h by Jeffrey 2014/07/15
//---------------------------------------------------------------------------
#include <vcl>
#pragma hdrstop
#include "clsPrinterCommand.h"
#include "EZio32.h"
#pragma package(smart_init)
using namespace Ezio32;
//---------------------------------------------------------------------------
map < int, string > clsPrinterCommand::BarcodeTypeHash;

//---------------------------------------------------------------------------
// Get Barcode Type Hash (map)
//---------------------------------------------------------------------------
void clsPrinterCommand::GetBarcodeTypeHash()
{
    if (BarcodeTypeHash.size() > 0)
        return;

    BarcodeTypeHash[Code39_Extended] = "A";
    BarcodeTypeHash[Code39_Extended_CheckDidit] = "A2";
    BarcodeTypeHash[Code39] = "A3";
    BarcodeTypeHash[Code39_CheckDidit] = "A4";
    BarcodeTypeHash[EAN8] = "B";
    BarcodeTypeHash[EAN8_Add2] = "C";
    BarcodeTypeHash[EAN8_Add5] = "D";
    BarcodeTypeHash[EAN13] = "E";
    BarcodeTypeHash[EAN13_Add2] = "F";
    BarcodeTypeHash[EAN13_Add5] = "G";
    BarcodeTypeHash[UPCA] = "H";
    BarcodeTypeHash[UPCA_Add2] = "I";
    BarcodeTypeHash[UPCA_Add5] = "J";
    BarcodeTypeHash[UPCE] = "K";
    BarcodeTypeHash[UPCE_Add2] = "L";
    BarcodeTypeHash[UPCE_Add5] = "M";
    BarcodeTypeHash[I2of5] = "N";
    BarcodeTypeHash[I2of5_CheckDigit] = "N2";
    BarcodeTypeHash[Codabar] = "O";
    BarcodeTypeHash[Code93] = "P";
    BarcodeTypeHash[Code128_Auto] = "Q";
    BarcodeTypeHash[Code128_Subset] = "Q2";
    BarcodeTypeHash[UCC_128] = "R";
    BarcodeTypeHash[PostNET] = "S";
    BarcodeTypeHash[ITF14] = "T";
    BarcodeTypeHash[EAN128] = "U";
    BarcodeTypeHash[RPS128] = "V";
    BarcodeTypeHash[HIBC] = "X";
    BarcodeTypeHash[MSI_1MOD10] = "Y";
    BarcodeTypeHash[MSI_2MOD10] = "Y2";
    BarcodeTypeHash[MSI_1MOD1110] = "Y3";
    BarcodeTypeHash[MSI_NoDigitCheck] = "Y4";
    BarcodeTypeHash[I2of5_ShippingBearerBars] = "Z";
    BarcodeTypeHash[UCC_EAN128_KMART] = "1";
    BarcodeTypeHash[UCC_EAN128_RANDOM] = "2";
    BarcodeTypeHash[Telepen] = "3";
    BarcodeTypeHash[FIM] = "4";
    BarcodeTypeHash[Plessey] = "7";
}

//---------------------------------------------------------------------------
// Start Job (^L)
//---------------------------------------------------------------------------
void clsPrinterCommand::Start()
{
    sendcommand("^L");
}

//---------------------------------------------------------------------------
// End Job (E)
//---------------------------------------------------------------------------
void clsPrinterCommand::End()
{
    sendcommand("E");
}

//---------------------------------------------------------------------------
// Print Text (Simple)
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintText(int PosX, int PosY, int FontHeight, string FontName, string Data)
{
    return ecTextOut(PosX, PosY, FontHeight, (char *)FontName.c_str(), (char *)Data.c_str());
}

//---------------------------------------------------------------------------
// Print Text (More Parameter)
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintText(int PosX, int PosY, int FontHeight, string FontName, string Data, int TextWidth, FontWeight Dark, RotateMode Rotate)
{
    return ecTextOutR(PosX, PosY, FontHeight, (char *)FontName.c_str(), (char *)Data.c_str(), TextWidth, (int)Dark, (int)Rotate);
}

//---------------------------------------------------------------------------
// Print Text (Detail Parameter)
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintText(int PosX, int PosY, int FontHeight, string FontName, string Data, int TextWidth, FontWeight Dark, RotateMode Rotate, Italic_State Italic, Underline_State Underline, Strikeout_State Strikeout, Inverse_State Inverse)
{
    return ecTextOutFine(PosX, PosY, FontHeight, (char *)FontName.c_str(), (char *)Data.c_str(), TextWidth, (int)Dark, (int)Rotate, (int)Italic, (int)Underline, (int)Strikeout, (int)Inverse);
}

//---------------------------------------------------------------------------
// UploadImage (Internal)
//---------------------------------------------------------------------------
void clsPrinterCommand::UploadImage_Int(string Filename, string DisplayName, Image_Type mType)
{
    string strType;
    if (mType == BMP)
        strType = "bmp";
    else
        strType = "pcx";

    // Delete Image
    sendcommand((char *)("~MDELG," + DisplayName).c_str());

    // Upload Image
    intloadimage((char *)Filename.c_str(), (char *)DisplayName.c_str(), (char *)strType.c_str());
}

//---------------------------------------------------------------------------
// UploadImage (External)
//---------------------------------------------------------------------------
void clsPrinterCommand::UploadImage_Ext(string Filename, string DisplayName, Image_Type mType)
{
    string strType;
    if (mType == BMP)
        strType = "bmp";
    else
        strType = "pcx";

    // Delete Image
    sendcommand((char *)("~MDELG," + DisplayName).c_str());

    // Upload Image
    extloadimage((char *)Filename.c_str(), (char *)DisplayName.c_str(), (char *)strType.c_str());
}

//---------------------------------------------------------------------------
// UploadImage (Full Color)
//---------------------------------------------------------------------------
void clsPrinterCommand::UploadImage_FullColor(string Filename, string DisplayName, int nRotate)
{
    // Delete Image
    sendcommand((char *)("~MDELG," + DisplayName).c_str());

    // Upload Image
    downloadimage((char *)Filename.c_str(), nRotate, (char *)DisplayName.c_str());
}

//---------------------------------------------------------------------------
// Upload Text Image
//---------------------------------------------------------------------------
void clsPrinterCommand::UploadText(int FontHeight, string FontName, string Data, int TextWidth, FontWeight Dark, RotateMode Rotate, string Name)
{
    // Delete Image
    sendcommand((char *)("~MDELG," + Name).c_str());

    // Upload Text Image
    ecTextDownLoad(FontHeight, (char *)FontName.c_str(), (char *)Data.c_str(), TextWidth, (int)Dark, (int)Rotate, (char *)Name.c_str());
}

//---------------------------------------------------------------------------
// Print Image By Name
//---------------------------------------------------------------------------
void clsPrinterCommand::PrintImageByName(string DisplayName, int PosX, int PosY)
{
    // Print Image
    sendcommand(("Y" + IntToStr(PosX) + "," + IntToStr(PosY) + "," + DisplayName.c_str()).c_str());
}

//---------------------------------------------------------------------------
// Print Image
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintImage(int PosX, int PosY, string FileName, int mRotation)
{
    return putimage(PosX, PosY, (char *)FileName.c_str(), mRotation);
}

//---------------------------------------------------------------------------
// Print Image
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintImage(int PosX, int PosY, string FileName, int mRotation, int nHalftone)
{
    return putimage_Halftone(PosX, PosY, (char *)FileName.c_str(), mRotation, nHalftone);
}

//---------------------------------------------------------------------------
// Auto Sensing
//---------------------------------------------------------------------------
void clsPrinterCommand::AutoSensing()
{
    sendcommand("~S,SENSOR,0");
}

//---------------------------------------------------------------------------
// Send Command String
//---------------------------------------------------------------------------
int clsPrinterCommand::Send(string Cmd)
{
    return sendcommand((char *)Cmd.c_str());
}

//---------------------------------------------------------------------------
// Send Byte Array
//---------------------------------------------------------------------------
void clsPrinterCommand::SendByte(char ByteArray[])
{
    sendbuf(ByteArray, sizeof(ByteArray));
}

//---------------------------------------------------------------------------
// Send Byte Array
//---------------------------------------------------------------------------
void clsPrinterCommand::SendByte(char ByteArray[], int Len)
{
    sendbuf(ByteArray, Len);
}

//---------------------------------------------------------------------------
// Read Return Data
//---------------------------------------------------------------------------
string clsPrinterCommand::Read()
{
    unsigned char byteArray[2048];
    string RetData = "";
    int RetryNo = 3;
    int CurNo = 0;

    while (true)
    {
        if (RcvBuf(byteArray, sizeof(byteArray)) == 0)
        {
            CurNo++;
        }
        else
        {
            CurNo = 0;
            RetData += string((char *)byteArray);
        }

        memset(byteArray, 0, 2048);

        if (CurNo >= RetryNo)
            break;
    }

    return RetData;
}

//---------------------------------------------------------------------------
// Print 1D BarCode
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintBarCode(BarCodeType mBarCodeType, int PosX, int PosY, string Data)
{
    GetBarcodeTypeHash();
    return Bar_S((char *)BarcodeTypeHash[mBarCodeType].c_str(), PosX, PosY, (char *)Data.c_str());
}

//---------------------------------------------------------------------------
// Print 1D BarCode (More Parameter)
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintBarCode(BarCodeType mBarCodeType, int PosX, int PosY, int Narrow, int Wide, int Height, int Rotation, int Raedable, string Data)
{
    GetBarcodeTypeHash();
    return Bar((char *)BarcodeTypeHash[mBarCodeType].c_str(), PosX, PosY, Narrow, Wide, Height, Rotation, Raedable, (char *)Data.c_str());
}

//---------------------------------------------------------------------------
// Print QR Code
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintQRCode(int PosX, int PosY, string Data)
{
    return Bar_QRcode_S(PosX, PosY, Data.size(), (char *)Data.c_str());
}

//---------------------------------------------------------------------------
// Print QR Code (More Parameter)
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintQRCode(int PosX, int PosY, int Mode, int Type, string ErrorLavel, int Mask, int Mul, int Rotation, string Data)
{
    return Bar_QRcode(PosX, PosY, Mode, Type, (char *)ErrorLavel.c_str(), Mask, Mul, Data.size(), Rotation, (char *)Data.c_str());
}

//---------------------------------------------------------------------------
// Print PDF417
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintPDF417(int PosX, int PosY, string Data)
{
    return Bar_PDF417_S(PosX, PosY, Data.size(), (char *)Data.c_str());
}

//---------------------------------------------------------------------------
// Print PDF417 (More Parameter)
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintPDF417(int PosX, int PosY, int Width, int Height, int Row, int Col, int ErrorLevel, int Rotation, string Data)
{
    return Bar_PDF417(PosX, PosY, Width, Height, Row, Col, ErrorLevel, Data.size(), Rotation, (char *)Data.c_str());
}

//---------------------------------------------------------------------------
// Print Aztec
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintAztec(int PosX, int PosY, string Data)
{
    return Bar_Aztec_S(PosX, PosY, Data.size(), (char *)Data.c_str());
}

//---------------------------------------------------------------------------
// Print Aztec (More Parameter)
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintAztec(int PosX, int PosY, int Rotation, int Mul, string ECICs, string MenuSymbol, int Type, string Data)
{
    return Bar_Aztec(PosX, PosY, Rotation, Mul, (char *)ECICs.c_str(), Type, (char *)MenuSymbol.c_str(), Data.size(), (char *)Data.c_str());
}

//---------------------------------------------------------------------------
// Print MaxiCode
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintMaxiCode(int PosX, int PosY, string CountryCode, string PostalCode, string nClass, string Data)
{
    return Bar_Maxicode_S(PosX, PosY, (char *)CountryCode.c_str(), (char *)PostalCode.c_str(), (char *)nClass.c_str(), 0, (char *)Data.c_str());
}

//---------------------------------------------------------------------------
// Print MaxiCode (More Parameter)
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintMaxiCode(int PosX, int PosY, int SymbolNo, int SetNo, int Mode, string CountryCode, string PostalCode, string nClass, int Rotate, string Data)
{
    return Bar_Maxicode(PosX, PosY, SymbolNo, SetNo, Mode, (char *)CountryCode.c_str(), (char *)PostalCode.c_str(), (char *)nClass.c_str(), Rotate, (char *)Data.c_str());
}

//---------------------------------------------------------------------------
// Print Data Matrix
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintDataMatrix(int PosX, int PosY, string Data)
{
    return Bar_DataMatrix_S(PosX, PosY, Data.size(), (char *)Data.c_str());
}

//---------------------------------------------------------------------------
// Print Data Matrix (More Parameter)
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintDataMatrix(int PosX, int PosY, int Enlarge, string RotationR, string Data)
{
    return Bar_DataMatrix(PosX, PosY, Enlarge, (char *)RotationR.c_str(), Data.size(), (char *)Data.c_str());
}

//---------------------------------------------------------------------------
// Print Horizental Line
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintHorLine(int PosX, int PosY, int Length, int Thick)
{
	return DrawHorLine(PosX, PosY, Length, Thick);
}

//---------------------------------------------------------------------------
// Print Vertical Line
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintVerLine(int PosX, int PosY, int Length, int Thick)
{
    return DrawVerLine(PosX, PosY, Length, Thick);
}

//---------------------------------------------------------------------------
// Print Fill Rectangle
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintFillRec(int PosX, int PosY, int Rec_W, int Rec_H)
{
    return FillRec(PosX, PosY, Rec_W, Rec_H);
}

//---------------------------------------------------------------------------
// Print Rectangle
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintRec(int PosX, int PosY, int Rec_W, int Rec_H, int lrw, int ubw)
{
    return DrawRec(PosX, PosY, Rec_W, Rec_H, lrw, ubw);
}

//---------------------------------------------------------------------------
// Print Oblique
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintOblique(int PosX1, int PosY1, int Thick, int PosX2, int PosY2)
{
    return DrawOblique(PosX1, PosY1, Thick, PosX2, PosY2);
}

//---------------------------------------------------------------------------
// Print Ellipse
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintEllipse(int PosX, int PosY, int Ellipse_W, int Ellipse_H, int PenWidth)
{
    return DrawEllipse(PosX, PosY, Ellipse_W, Ellipse_H, PenWidth);
}

//---------------------------------------------------------------------------
// Print Round Rectangle
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintRoundRec(int PosX, int PosY, int Rec_W, int Rec_H, int Arc_W, int Arc_H, int PenWidth)
{
    return DrawRoundRec(PosX, PosY, Rec_W, Rec_H, Arc_W, Arc_H, PenWidth);
}

//---------------------------------------------------------------------------
// Print Triangle
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintTriangle(int PosX1, int PosY1, int PosX2, int PosY2, int PosX3, int PosY3, int PenWidth)
{
    return DrawTriangle(PosX1, PosY1, PosX2, PosY2, PosX3, PosY3, PenWidth);
}

//---------------------------------------------------------------------------
// Print Diamond
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintDiamond(int PosX, int PosY, int Rec_W, int Rec_H, int PenWidth)
{
    return DrawDiamond(PosX, PosY, Rec_W, Rec_H, PenWidth);
}

//---------------------------------------------------------------------------
// Print Internal Font Text (EZPL Command)
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintText_EZPL_Internal(
    string FontType,
    int PosX,
    int PosY,
    int Mul_X,
    int Mul_Y,
    int Gap,
    string RotationInverse,
    string Data)
{
    return InternalFont_TextOut((char *)FontType.c_str(), PosX, PosY, Mul_X, Mul_Y, Gap, (char *)RotationInverse.c_str(), (char *)Data.c_str());
}

//---------------------------------------------------------------------------
// Print Internal Font Text (EZPL Command)
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintText_EZPL_Internal(
    string FontType,
    int PosX,
    int PosY,
    string Data)
{
    return InternalFont_TextOut_S((char *)FontType.c_str(), PosX, PosY, (char *)Data.c_str());
}

//---------------------------------------------------------------------------
// Print Bitmapped Font Text (EZPL Command)
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintText_EZPL_Bitmapped(
    string FontName,
    int PosX,
    int PosY,
    int Mul_X,
    int Mul_Y,
    int Gap,
    string RotationInverse,
    string Data)
{
    return DownloadFont_TextOut((char *)FontName.c_str(), PosX, PosY, Mul_X, Mul_Y, Gap, (char *)RotationInverse.c_str(), (char *)Data.c_str());
}

//---------------------------------------------------------------------------
// Print Bitmapped Font Text (EZPL Command)
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintText_EZPL_Bitmapped(
    string FontName,
    int PosX,
    int PosY,
    string Data)
{
    return DownloadFont_TextOut_S((char *)FontName.c_str(), PosX, PosY, (char *)Data.c_str());
}

//---------------------------------------------------------------------------
// Print True Type Font Text (EZPL Command)
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintText_EZPL_TTF(
    string FontName,
    int PosX,
    int PosY,
    int Font_W,
    int Font_H,
    int SpaceChar,
    string RotationInverse,
    string TTFTable,
    int WidthMode,
    string Data)
{
    return TrueTypeFont_TextOut(
        (char *)FontName.c_str(),
        PosX,
        PosY,
        Font_W,
        Font_H,
        SpaceChar,
        (char *)RotationInverse.c_str(),
        (char *)TTFTable.c_str(),
        WidthMode,
        (char *)Data.c_str());
}

//---------------------------------------------------------------------------
// Print True Type Font Text (EZPL Command)
//---------------------------------------------------------------------------
int clsPrinterCommand::PrintText_EZPL_TTF(
    string FontName,
    int PosX,
    int PosY,
    string Data)
{
    return TrueTypeFont_TextOut_S((char *)FontName.c_str(), PosX, PosY, (char *)Data.c_str());
}

//---------------------------------------------------------------------------
