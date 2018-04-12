//---------------------------------------------------------------------------
// Create clsPrinterCommand.h by Jeffrey 2014/07/15
//---------------------------------------------------------------------------
#ifndef clsPrinterCommandH
#define clsPrinterCommandH
//---------------------------------------------------------------------------
#include <string>
#include <map>
#include "ParaDef.h"
using namespace std;
//---------------------------------------------------------------------------
class clsPrinterCommand
{
public:

    void Start();

    void End();

    int PrintText(
        int PosX,
        int PosY,
        int FontHeight,
        string FontName,
        string Data);

    int PrintText(
        int PosX,
        int PosY,
        int FontHeight,
        string FontName,
        string Data,
        int TextWidth,
        FontWeight Dark,
        RotateMode Rotate);

    int PrintText(
        int PosX,
        int PosY,
        int FontHeight,
        string FontName,
        string Data,
        int TextWidth,
        FontWeight Dark,
        RotateMode Rotate,
        Italic_State Italic,
        Underline_State Underline,
        Strikeout_State Strikeout,
        Inverse_State Inverse);

    void UploadImage_Int(string Filename, string DisplayName, Image_Type mType);

    void UploadImage_Ext(string Filename, string DisplayName, Image_Type mType);

    void UploadImage_FullColor(string Filename, string DisplayName, int nRotate);

    void UploadText(int FontHeight, string FontName, string Data, int TextWidth, FontWeight Dark, RotateMode Rotate, string Name);

    void PrintImageByName(string DisplayName, int PosX, int PosY);

    int PrintImage(int PosX, int PosY, string FileName, int mRotation);

    int PrintImage(int PosX, int PosY, string FileName, int mRotation, int nHalftone);

    void AutoSensing();

    int Send(string Cmd);

    void SendByte(char ByteArray[]);

    void SendByte(char ByteArray[], int Len);

    string Read();

    int PrintBarCode(BarCodeType mBarCodeType, int PosX, int PosY, string Data);

    int PrintBarCode(BarCodeType mBarCodeType, int PosX, int PosY, int Narrow, int Wide, int Height, int Rotation, int Raedable, string Data);

    int PrintQRCode(int PosX, int PosY, string Data);

    int PrintQRCode(int PosX, int PosY, int Mode, int Type, string ErrorLavel, int Mask, int Mul, int Rotation, string Data);

    int PrintPDF417(int PosX, int PosY, string Data);

    int PrintPDF417(int PosX, int PosY, int Width, int Height, int Row, int Col, int ErrorLevel, int Rotation, string Data);

    int PrintAztec(int PosX, int PosY, string Data);

    int PrintAztec(int PosX, int PosY, int Rotation, int Mul, string ECICs, string MenuSymbol, int Type, string Data);

    int PrintMaxiCode(int PosX, int PosY, string CountryCode, string PostalCode, string nClass, string Data);

    int PrintMaxiCode(int PosX, int PosY, int SymbolNo, int SetNo, int Mode, string CountryCode, string PostalCode, string nClass, int Rotate, string Data);

    int PrintDataMatrix(int PosX, int PosY, string Data);

    int PrintDataMatrix(int PosX, int PosY, int Enlarge, string RotationR, string Data);

    int PrintHorLine(int PosX, int PosY, int Length, int Thick);
    int PrintVerLine(int PosX, int PosY, int Length, int Thick);
    int PrintFillRec(int PosX, int PosY, int Rec_W, int Rec_H);
    int PrintRec(int PosX, int PosY, int Rec_W, int Rec_H, int lrw, int ubw);
    int PrintOblique(int PosX1, int PosY1, int Thick, int PosX2, int PosY2);
    int PrintEllipse(int PosX, int PosY, int Ellipse_W, int Ellipse_H, int PenWidth);
    int PrintRoundRec(int PosX, int PosY, int Rec_W, int Rec_H, int Arc_W, int Arc_H, int PenWidth);
    int PrintTriangle(int PosX1, int PosY1, int PosX2, int PosY2, int PosX3, int PosY3, int PenWidth);
    int PrintDiamond(int PosX, int PosY, int Rec_W, int Rec_H, int PenWidth);

    int PrintText_EZPL_Internal(
        string FontType,
        int PosX,
        int PosY,
        int Mul_X,
        int Mul_Y,
        int Gap,
        string RotationInverse,
        string Data);

    int PrintText_EZPL_Internal(
        string FontType,
        int PosX,
        int PosY,
        string Data);

    int PrintText_EZPL_Bitmapped(
        string FontName,
        int PosX,
        int PosY,
        int Mul_X,
        int Mul_Y,
        int Gap,
        string RotationInverse,
        string Data);

    int PrintText_EZPL_Bitmapped(
        string FontName,
        int PosX,
        int PosY,
        string Data);

    int PrintText_EZPL_TTF(
        string FontName,
        int PosX,
        int PosY,
        int Font_W,
        int Font_H,
        int SpaceChar,
        string RotationInverse,
        string TTFTable,
        int WidthMode,
        string Data);

    int PrintText_EZPL_TTF(
        string FontName,
        int PosX,
        int PosY,
        string Data);

private:

    static map < int, string > BarcodeTypeHash;
    static void GetBarcodeTypeHash();

};
//---------------------------------------------------------------------------
#endif
