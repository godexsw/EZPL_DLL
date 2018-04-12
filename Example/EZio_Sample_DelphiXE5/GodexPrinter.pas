//------------------------------------------------------------------------------
// Create GodexPrinter.pas by Jeffrey 2014/07/17
//------------------------------------------------------------------------------
unit GodexPrinter;

interface

uses
  Sysutils;

type
  TGodexPrinter = class(TObject)

  public

    // Interface
    const Interface_LPT1  = 0;
    const Interface_COM1  = 1;
    const Interface_COM2  = 2;
    const Interface_COM3  = 3;
    const Interface_COM4  = 4;
    const Interface_LPT2  = 5;
    const Interface_USB   = 6;

    // Barcode Type
    const BarCode_Code39_Extended             = 'A';
    const BarCode_Code39_Extended_CheckDidit  = 'A2';
    const BarCode_Code39                      = 'A3';
    const BarCode_Code39_CheckDidit           = 'A4';
    const BarCode_EAN8                        = 'B';
    const BarCode_EAN8_Add2                   = 'C';
    const BarCode_EAN8_Add5                   = 'D';
    const BarCode_EAN13                       = 'E';
    const BarCode_EAN13_Add2                  = 'F';
    const BarCode_EAN13_Add5                  = 'G';
    const BarCode_UPCA                        = 'H';
    const BarCode_UPCA_Add2                   = 'I';
    const BarCode_UPCA_Add5                   = 'J';
    const BarCode_UPCE                        = 'K';
    const BarCode_UPCE_Add2                   = 'L';
    const BarCode_UPCE_Add5                   = 'M';
    const BarCode_I2of5                       = 'N';
    const BarCode_I2of5_CheckDigit            = 'N2';
    const BarCode_Codabar                     = 'O';
    const BarCode_Code93                      = 'P';
    const BarCode_Code128_Auto                = 'Q';
    const BarCode_Code128_Subset              = 'Q2';
    const BarCode_UCC_128                     = 'R';
    const BarCode_PostNET                     = 'S';
    const BarCode_ITF14                       = 'T';
    const BarCode_EAN128                      = 'U';
    const BarCode_RPS128                      = 'V';
    const BarCode_HIBC                        = 'X';
    const BarCode_MSI_1MOD10                  = 'Y';
    const BarCode_MSI_2MOD10                  = 'Y2';
    const BarCode_MSI_1MOD1110                = 'Y3';
    const BarCode_MSI_NoDigitCheck            = 'Y4';
    const BarCode_I2of5_ShippingBearerBars    = 'Z';
    const BarCode_UCC_EAN128_KMART            = '1';
    const BarCode_UCC_EAN128_RANDOM           = '2';
    const BarCode_Telepen                     = '3';
    const BarCode_FIM                         = '4';
    const BarCode_Plessey                     = '7';

    // Image Type
    const BMP = 0;
    const PCX = 1;

    // Font Weight (Darkness)
    const FW_100_THIN         = 100;
    const FW_200_EXTRALIGHT   = 200;
    const FW_300_LIGHT        = 300;
    const FW_400_NORMAL       = 400;
    const FW_500_MEDIUM       = 500;
    const FW_600_FW_SEMIBOLD  = 600;
    const FW_700_BOLD         = 700;
    const FW_800_EXTRABOLD    = 800;
    const FW_900_HEAVY        = 900;

    // Rotate
    const Angle_0         = 0;
    const Angle_90        = 90;
    const Angle_180       = 180;
    const Angle_270       = 270;

    // Italic
    const Italic_OFF      = 0;
    const Italic_ON       = 1;

    // Underline
    const Underline_OFF   = 0;
    const Underline_ON    = 1;

    // Strikeout
    const Strikeout_OFF   = 0;
    const Strikeout_ON    = 1;

    // Inverse
    const Inverse_OFF     = 0;
    const Inverse_ON      = 1;


    //==============================================
    // Main Function
    //==============================================

    function OpenByName(PortName : string): Integer;
    function OpenByType(PortName : Integer): Integer;
    function OpenByNet(strIP, strPort : string): Integer;
    function OpenByDriver(PortName : string): Integer;
    function SetComBaudRate(nBaudRate : Integer): Integer;
    function Close(): Pointer;
    function GetVersion() : string;

    //==============================================
    // Config Function
    //==============================================

    function Setup(
      LabelLength,
      Darkness,
      Speed,
      LabelMode,
      LabelGap,
      BlackTop : Integer) : Integer;

    function LabelMode(
      nMode,
      nLabelHeight,
      nGapFeed : Integer) : Integer;

    function LabelWidth(nWidth : Integer) : Integer;
    function Dark(nDark : Integer) : Integer;
    function Speed(nSpeed : Integer) : Integer;
    function PageNo(nPageNo: Integer) : Integer;
    function CopyNo(nCopyNo : Integer) : Integer;

    //==============================================
    // Command Function
    //==============================================

    function StartJob() : Pointer;
    function EndJob() : Pointer;

    function PrintText(
      PosX, PosY, FontHeight : Integer ;
      FontName, Data : string) : Integer;

    function PrintText_More(
      PosX, PosY, FontHeight : Integer ;
      FontName, Data : string ;
      TextWidth, Dark, Rotate : Integer) : Integer;

    function PrintText_Detail(
      PosX, PosY, FontHeight : Integer ;
      FontName, Data : string ;
      TextWidth, Dark, Rotate, Italic, Underline, Strikeout, Inverse : Integer) : Integer;

    function UploadImage_Int(Filename, DisplayName : string ; mType : Integer) : Integer;
    function UploadImage_Ext(Filename, DisplayName : string ; mType : Integer) : Integer;
    function UploadImage_FullColor(Filename, DisplayName : string ; nRotate : Integer) : Integer;

    function UploadText(
      FontHeight : Integer ;
      FontName, Data : string ;
      TextWidth, Dark, Rotate : Integer ;
      Name : string) : Integer;


    function PrintImageByName(DisplayName : string ; PosX, PosY : Integer) : Integer;
    function PrintImage(PosX, PosY : Integer ; FileName : string ; nRotation : Integer) : Integer;
    function PrintImage_Halftone(PosX, PosY : Integer ; FileName : string ; nRotation, nHalftone : Integer) : Integer;
    function AutoSensing() : Integer;
    function Send(Cmd : string) : Integer;
    function SendByte(buf:array of byte) : Integer;
    function Read() : string;

    function PrintBarCode(
      mBarCodeType : string ;
      PosX, PosY : Integer ;
      Data : string) : Integer;

    function PrintBarCode_Detail(
      mBarCodeType : string ;
      PosX, PosY, Narrow, Wide, Height, Rotation, Raedable : Integer;
      Data : string) : Integer;

    function PrintQRCode(
      PosX, PosY : Integer;
      Data : string) : Integer;

    function PrintQRCode_Detail(
      PosX, PosY, nMode, nType : Integer;
      ErrorLavel : string;
      Mask, Mul, Rotation : Integer;
      Data : string) : Integer;

    function PrintPDF417(
      PosX, PosY : Integer;
      Data : string) : Integer;

    function PrintPDF417_Detail(
      PosX, PosY, Width, Height, Row, Col, ErrorLevel, Rotation : Integer;
      Data : string) : Integer;

    function PrintAztec(
      PosX, PosY : Integer;
      Data : string) : Integer;

    function PrintAztec_Detail(
      PosX, PosY, Rotation, Mul : Integer;
      ECICs, MenuSymbol : string;
      nType : Integer;
      Data : string) : Integer;

    function PrintMaxiCode(
      PosX, PosY : Integer;
      CountryCode, PostalCode, nClass, Data : string) : Integer;

    function PrintMaxiCode_Detail(
      PosX, PosY, SymbolNo, SetNo, Mode : Integer;
      CountryCode, PostalCode, nClass : string;
      Rotate : Integer;
      Data : string) : Integer;

    function PrintDataMatrix(
      PosX, PosY : Integer ;
      Data : string) : Integer;

    function PrintDataMatrix_Detail(
      PosX, PosY, Enlarge : Integer;
      RotationR, Data : string) : Integer;

    function PrintHorLine(PosX, PosY, Length, Thick: Integer): Integer;
    function PrintVerLine(PosX, PosY, Length, Thick: Integer): Integer;
    function PrintFillRec(PosX, PosY, Rec_W, Rec_H: Integer): Integer;
    function PrintRec(PosX, PosY, Rec_W, Rec_H, lrw, ubw: Integer): Integer;
    function PrintOblique(PosX1, PosY1, Thick, PosX2, PosY2: Integer): Integer;
    function PrintEllipse(PosX, PosY, Ellipse_W, Ellipse_H, PenWidth: Integer): Integer;
    function PrintRoundRec(PosX, PosY, Rec_W, Rec_H, Arc_W, Arc_H, PenWidth: Integer): Integer;
    function PrintTriangle(PosX1, PosY1, PosX2, PosY2, PosX3, PosY3, PenWidth: Integer): Integer;
    function PrintDiamond(PosX, PosY, Rec_W, Rec_H, PenWidth: Integer): Integer;

    function PrintText_EZPL_Internal_Detail(
        FontType: string;
        PosX, PosY, Mul_X, Mul_Y, Gap: Integer;
        RotationInverse,
        Data: string): Integer;

    function PrintText_EZPL_Internal(
        FontType: string;
        PosX, PosY: Integer;
        Data: string): Integer;

    function PrintText_EZPL_Bitmapped_Detail(
        FontName: string;
        PosX, PosY, Mul_X, Mul_Y, Gap: Integer;
        RotationInverse, Data: string): Integer;

    function PrintText_EZPL_Bitmapped(
        FontName : string;
        PosX, PosY: Integer;
        Data : string): Integer ;

    function PrintText_EZPL_TTF_Detail(
        FontName : string;
        PosX, PosY, Font_W, Font_H, SpaceChar: Integer;
        RotationInverse, TTFTable: string;
        WidthMode: Integer;
        Data: string): Integer;

    function PrintText_EZPL_TTF(
        FontName: string;
        PosX, PosY: Integer;
        Data: string): Integer;

  end;

implementation

//---------------------------------------------------------------------------
// EZio32.dll Function
//---------------------------------------------------------------------------
const Dllfilename = 'EZio32.dll';
function openport(PrinterName : AnsiString) : integer; stdcall; far; external Dllfilename;
function FindFirstUSB(var usbid : array of byte) : integer; stdcall; external Dllfilename;
function OpenUSB(DirverName : AnsiString) : integer; stdcall; far; external Dllfilename;
function OpenNet(IP : AnsiString; NetPort : AnsiString) : integer; stdcall; far; external Dllfilename;
function OpenDriver(DirverName : AnsiString) : integer; stdcall; far; external Dllfilename;
function setbaudrate(Baudrate : Integer) : integer; stdcall; far; external Dllfilename;
procedure closeport(); stdcall; far; external Dllfilename;
function sendcommand(Command : AnsiString) : integer; stdcall; far; external Dllfilename;
function sendbuf(buf : array of byte; len : integer) : integer; stdcall; external Dllfilename;
function RcvBuf(buf: PChar; len : integer) : integer; stdcall; external Dllfilename;
function setup(LabelLength, Dark, Speed, PaperType, LabelGap, BlackTop : integer) : integer; stdcall; far; external Dllfilename;

function ecTextOut(
  PosX, PosY, FontHeight : integer;
  FontName, data : AnsiString) : integer; stdcall; far; external Dllfilename;
function ecTextOutR(
  PosX, PosY, FontHeight : integer;
  FontName , data : AnsiString;
  Width, weight, rotate : integer) : integer; stdcall; far; external Dllfilename;
function ecTextOutFine(
  PosX, PosY, FontHeight : integer;
  FontName, data : AnsiString;
  Width, weight, rotate, italic, underline, strikeout, inverse : integer) : integer; stdcall; far; external Dllfilename;

function intloadimage(Filename, RecallName, ImageType : AnsiString) : integer; stdcall; far; external Dllfilename;
function extloadimage(Filename, RecallName, ImageType : AnsiString) : integer; stdcall; far; external Dllfilename;
function ecTextDownLoad(
  FontHeight : Integer;
  FontName, data : AnsiString;
  Width, weight, rotate : integer;
  name : AnsiString) : integer; stdcall; far; external Dllfilename;
function putimage(
  PosX, PosY : integer;
  Filename : AnsiString;
  Degree:integer) : integer; stdcall; far; external Dllfilename;
function putimage_Halftone(
  PosX, PosY : integer;
  Filename : AnsiString;
  Degree, Halftone : integer) : integer; stdcall; far; external Dllfilename;
function downloadimage(
  FileName : AnsiString;
  Degree : integer;
  name : AnsiString) : integer; stdcall; far; external Dllfilename;
function GetDllVersion(var version : array of byte) : integer; stdcall; external Dllfilename;

function Bar(
  BarcodeType : string;
  PosX, PosY, Narrow, Wide, Height, Rotation, Readable : Integer;
  data : AnsiString) : integer; stdcall; far; external Dllfilename;
function Bar_S(
  BarcodeType : string;
  PosX, PosY : Integer;
  data : AnsiString) : integer; stdcall; far; external Dllfilename;

function Bar_GS1DataBar(
  BarcodeType : string;
  PosX, PosY, Narrow, Segment, Height, Rotation, Readable : Integer;
  data : AnsiString) : integer; stdcall; far; external Dllfilename;
function Bar_GS1DataBar_S(
  BarcodeType : string;
  PosX, PosY : Integer;
  data : AnsiString) : integer; stdcall; far; external Dllfilename;

function Bar_PDF417(
  PosX, PosY, Width, Height, Row, Column, ErrorLevel, Len, Rotation : Integer;
  data : AnsiString) : integer; stdcall; far;external Dllfilename;
function Bar_PDF417_S(
  PosX, PosY, Len : Integer;
  data : AnsiString) : integer; stdcall; far; external Dllfilename;

function Bar_MicroPDF417(
  PosX, PosY, Width, Height, Mode, Len, Rotation : Integer;
  data : AnsiString) : integer; stdcall; far; external Dllfilename;
function Bar_MicroPDF417_S(
  PosX, PosY, Len : Integer;
  data : string) : integer; stdcall; far;external Dllfilename;

function Bar_Maxicode(
  PosX, PosY, SymbolNo, SetNo, Mode : Integer;
  CountryCode, PostalCode, mClass : string;
  Rotation : Integer;
  data : AnsiString) : integer; stdcall; far; external Dllfilename;
function Bar_Maxicode_S(
  PosX, PosY : Integer;
  CountryCode, PostalCode, mClass : string;
  Rotation : Integer;
  data : AnsiString) : integer; stdcall; far; external Dllfilename;

function Bar_DataMatrix(
  PosX, PosY, Enlarge : Integer;
  RotationR : string;
  Len : Integer;
  data : AnsiString) : integer; stdcall; far; external Dllfilename;
function Bar_DataMatrix_S(
  PosX, PosY, Len : Integer;
  data : AnsiString) : integer; stdcall; far; external Dllfilename;

function Bar_QRcode(
  PosX, PosY, Mode, CodeType : Integer;
  ErrorLevel : string;
  Mask, Mul, Len, Rotation : Integer;
  data : AnsiString) : integer; stdcall; far; external Dllfilename;
function Bar_QRcode_S(
  PosX, PosY, Len : Integer;
  data : AnsiString) : integer; stdcall; far; external Dllfilename;

function Bar_Aztec(
  PosX, PosY, Rotation, Mul : Integer;
  ECICs : string;
  CodeType : Integer;
  MenuSymbol : string;
  Len : Integer;
  data : AnsiString) : integer; stdcall; far; external Dllfilename;
function Bar_Aztec_S(
  PosX, PosY, Len : Integer;
  data : AnsiString) : integer; stdcall; far; external Dllfilename;

function InternalFont_TextOut(FontType : AnsiString; PosX, PosY, Mul_X, Mul_Y, Gap : Integer; RotationInverse, Data : AnsiString) : integer; stdcall; far; external Dllfilename;
function InternalFont_TextOut_S(FontType : AnsiString; PosX, PosY : Integer; Data: AnsiString) : integer; stdcall; far; external Dllfilename;
function DownloadFont_TextOut(FontName: AnsiString; PosX, PosY, Mul_X, Mul_Y, Gap : Integer; RotationInverse, Data: AnsiString) : integer; stdcall; far; external Dllfilename;
function DownloadFont_TextOut_S(FontName: AnsiString; PosX, PosY : Integer; Data: AnsiString) : integer; stdcall; far; external Dllfilename;
function TrueTypeFont_TextOut(FontName: AnsiString; PosX, PosY, Font_W, Font_H, SpaceChar : Integer; RotationInverse, TTFTable: AnsiString; WidthMode : Integer; Data: AnsiString) : integer; stdcall; far; external Dllfilename;
function TrueTypeFont_TextOut_S(FontName: AnsiString; PosX, PosY : Integer; Data: AnsiString) : integer; stdcall; far; external Dllfilename;
function DrawHorLine(PosX, PosY, Length, Thick : Integer) : integer; stdcall; far; external Dllfilename;
function DrawVerLine(PosX, PosY, Length, Thick : Integer) : integer; stdcall; far; external Dllfilename;
function FillRec(PosX, PosY, Rec_W, Rec_H : Integer) : integer; stdcall; far; external Dllfilename;
function DrawRec(PosX, PosY, Rec_W, Rec_H, lrw, ubw : Integer) : integer; stdcall; far; external Dllfilename;
function DrawOblique(PosX1, PosY1, Thick, PosX2, PosY2 : Integer) : integer; stdcall; far; external Dllfilename;
function DrawEllipse(PosX, PosY, Ellipse_W, Ellipse_H, PenWidth : Integer) : integer; stdcall; far; external Dllfilename;
function DrawRoundRec(PosX, PosY, Rec_W, Rec_H, Arc_W, Arc_H, PenWidth : Integer) : integer; stdcall; far; external Dllfilename;
function DrawTriangle(PosX1, PosY1, PosX2, PosY2, PosX3, PosY3, Thick : Integer) : integer; stdcall; far; external Dllfilename;
function DrawDiamond(PosX, PosY, Diamond_W, Diamond_H, Thick : Integer) : integer; stdcall; far; external Dllfilename;

//---------------------------------------------------------------------------
// Open By Name
//---------------------------------------------------------------------------
function TGodexPrinter.OpenByName(PortName : string): Integer;
begin
  Result := OpenUSB(PortName);
end;

//---------------------------------------------------------------------------
// Open By Type
//---------------------------------------------------------------------------
function TGodexPrinter.OpenByType(PortName : Integer): Integer;
begin
  Result := openport(IntToStr(PortName));
end;

//---------------------------------------------------------------------------
// Open By Network
//---------------------------------------------------------------------------
function TGodexPrinter.OpenByNet(strIP, strPort : string): Integer;
begin
  Result := OpenNet(strIP, strPort);
end;

//---------------------------------------------------------------------------
// Open By Driver
//---------------------------------------------------------------------------
function TGodexPrinter.OpenByDriver(PortName : string): Integer;
begin
  Result := OpenDriver(PortName);
end;

//---------------------------------------------------------------------------
// Set Com Port Baudrate
//---------------------------------------------------------------------------
function TGodexPrinter.SetComBaudRate(nBaudRate : Integer): Integer;
begin
    setbaudrate(nBaudRate);
end;

//---------------------------------------------------------------------------
// Close
//---------------------------------------------------------------------------
function TGodexPrinter.Close(): Pointer;
begin
    closeport();
end;

//---------------------------------------------------------------------------
// Get Dll Version
//---------------------------------------------------------------------------
function TGodexPrinter.GetVersion() : string;
var
    buf: array[0..256] of byte;
    dllversion:string;
begin
    GetDllVersion(buf);
    SetString(dllversion, PAnsiChar(@buf[0]), 256);
    Result := dllversion;
end;

//---------------------------------------------------------------------------
// Setup Function
//---------------------------------------------------------------------------
function TGodexPrinter.Setup(
    LabelLength,
    Darkness,
    Speed,
    LabelMode,
    LabelGap,
    BlackTop : Integer) : Integer;
begin
    Result := setup(LabelLength, Darkness, Speed, LabelMode, LabelGap, BlackTop);
end;

//---------------------------------------------------------------------------
// Set Label Height & Paper Type (^Q)
//---------------------------------------------------------------------------
function TGodexPrinter.LabelMode(nMode, nLabelHeight, nGapFeed : Integer) : Integer;
begin
    if (nMode = 0) then
        Result := sendcommand('^Q' + IntToStr(nLabelHeight) + ',' + IntToStr(nGapFeed))
    else
        Result := sendcommand('^Q' + IntToStr(nLabelHeight) + ',0,' + IntToStr(nGapFeed));
end;

//---------------------------------------------------------------------------
// Set Label Width (^W)
//---------------------------------------------------------------------------
function TGodexPrinter.LabelWidth(nWidth : Integer) : Integer;
begin
    Result := sendcommand('^W' + IntToStr(nWidth));
end;

//---------------------------------------------------------------------------
// Set Dark (^H)
//---------------------------------------------------------------------------
function TGodexPrinter.Dark(nDark : Integer) : Integer;
begin
    Result := sendcommand('^H' + IntToStr(nDark));
end;

//---------------------------------------------------------------------------
// Set Speed (^S)
//---------------------------------------------------------------------------
function TGodexPrinter.Speed(nSpeed : Integer) : Integer;
begin
    Result := sendcommand('^S' + IntToStr(nSpeed));
end;

//---------------------------------------------------------------------------
// Set Page No (^P)
//---------------------------------------------------------------------------
function TGodexPrinter.PageNo(nPageNo : Integer) : Integer;
begin
    Result := sendcommand('^P' + IntToStr(nPageNo));
end;

//---------------------------------------------------------------------------
// Set Copy No (^C)
//---------------------------------------------------------------------------
function TGodexPrinter.CopyNo(nCopyNo : Integer) : Integer;
begin
    Result := sendcommand('^C' + IntToStr(nCopyNo));
end;


//---------------------------------------------------------------------------
// Start Job (^L)
//---------------------------------------------------------------------------
function TGodexPrinter.StartJob() : Pointer;
begin
    sendcommand('^L');
end;

//---------------------------------------------------------------------------
// End Job (E)
//---------------------------------------------------------------------------
function TGodexPrinter.EndJob() : Pointer;
begin
    sendcommand('E');
end;

//---------------------------------------------------------------------------
// Print Text (Simple)
//---------------------------------------------------------------------------
function TGodexPrinter.PrintText(
      PosX, PosY, FontHeight : Integer ;
      FontName, Data : string) : Integer;
begin
    Result := ecTextOut(PosX, PosY, FontHeight, FontName, Data);
end;

//---------------------------------------------------------------------------
// Print Text (More Parameter)
//---------------------------------------------------------------------------
function TGodexPrinter.PrintText_More(
      PosX, PosY, FontHeight : Integer ;
      FontName, Data : string ;
      TextWidth, Dark, Rotate : Integer) : Integer;
begin
    Result := ecTextOutR(PosX, PosY, FontHeight, FontName, Data, TextWidth, Dark, Rotate);
end;

//---------------------------------------------------------------------------
// Print Text (Detail Parameter)
//---------------------------------------------------------------------------
function TGodexPrinter.PrintText_Detail(
      PosX, PosY, FontHeight : Integer ;
      FontName, Data : string ;
      TextWidth, Dark, Rotate, Italic, Underline, Strikeout, Inverse : Integer) : Integer;
begin
    Result := ecTextOutFine(PosX, PosY, FontHeight, FontName, Data, TextWidth, Dark, Rotate, Italic, Underline, Strikeout, Inverse);
end;

//---------------------------------------------------------------------------
// UploadImage (Internal)
//---------------------------------------------------------------------------
function TGodexPrinter.UploadImage_Int(Filename, DisplayName : string ; mType : Integer) : Integer;
var
    strType : string;
begin

    if (mType = BMP) then
        strType := 'bmp'
    else
        strType := 'pcx';

    // Delete Image
    sendcommand('~MDELG,' + DisplayName);

    // Upload Image
    Result := intloadimage(Filename, DisplayName, strType);
end;

//---------------------------------------------------------------------------
// UploadImage (External)
//---------------------------------------------------------------------------
function TGodexPrinter.UploadImage_Ext(Filename, DisplayName : string ; mType : Integer) : Integer;
var
    strType : string;
begin

    if (mType = BMP) then
        strType := 'bmp'
    else
        strType := 'pcx';

    // Delete Image
    sendcommand('~MDELG,' + DisplayName);

    // Upload Image
    Result := extloadimage(Filename, DisplayName, strType);
end;

//---------------------------------------------------------------------------
// UploadImage (Full Color)
//---------------------------------------------------------------------------
function TGodexPrinter.UploadImage_FullColor(Filename, DisplayName : string ; nRotate : Integer) : Integer;
begin

    // Delete Image
    sendcommand(('~MDELG,' + DisplayName));

    // Upload Image
    Result := downloadimage(Filename, nRotate, DisplayName);

end;

//---------------------------------------------------------------------------
// Upload Text Image
//---------------------------------------------------------------------------
function TGodexPrinter.UploadText(
      FontHeight : Integer ;
      FontName, Data : string ;
      TextWidth, Dark, Rotate : Integer ;
      Name : string) : Integer;
begin

    // Delete Image
    sendcommand('~MDELG,' + Name);

    // Upload Text Image
    Result := ecTextDownLoad(FontHeight, FontName, Data, TextWidth, Dark, Rotate, Name);

end;

//---------------------------------------------------------------------------
// Print Image By Name
//---------------------------------------------------------------------------
function TGodexPrinter.PrintImageByName(DisplayName : string ; PosX, PosY : Integer) : Integer;
begin

    // Print Image
    Result := sendcommand('Y' + IntToStr(PosX) + ',' + IntToStr(PosY) + ',' + DisplayName);

end;

//---------------------------------------------------------------------------
// Print Image
//---------------------------------------------------------------------------
function TGodexPrinter.PrintImage(PosX, PosY : Integer ; FileName : string ; nRotation : Integer) : Integer;
begin
    Result := putimage(PosX, PosY, FileName, nRotation);
end;

//---------------------------------------------------------------------------
// Print Image
//---------------------------------------------------------------------------
function TGodexPrinter.PrintImage_Halftone(PosX, PosY : Integer ; FileName : string ; nRotation, nHalftone : Integer) : Integer;
begin
    Result := putimage_Halftone(PosX, PosY, FileName, nRotation, nHalftone);
end;

//---------------------------------------------------------------------------
// Auto Sensing
//---------------------------------------------------------------------------
function TGodexPrinter.AutoSensing() : Integer;
begin
    Result := sendcommand('~S,SENSOR,0');
end;

//---------------------------------------------------------------------------
// Send Command String
//---------------------------------------------------------------------------
function TGodexPrinter.Send(Cmd : string) : Integer;
begin
    Result := sendcommand(Cmd);
end;

//---------------------------------------------------------------------------
// Send Byte Array
//---------------------------------------------------------------------------
function TGodexPrinter.SendByte(buf : array of byte) : Integer;
var
    nSize:integer;
begin
    nSize := sizeof(buf);
    Result := sendbuf(buf, nSize);
end;

//---------------------------------------------------------------------------
// Read Return Data
//---------------------------------------------------------------------------
function TGodexPrinter.Read() : string;
var
    buf : array[0..4095] of Byte;
    nSize : Integer;
    RetData : string;
    RetData_All : string;
    I: Integer;
begin

    RetData_All := '';

    //for I := 0 to 3 do
    for I := 0 to 1 do
    begin
        Sleep(100);
        nSize := RcvBuf(@buf[0], sizeof(buf));
        if nSize > 0 then
        begin
            SetString(RetData, PAnsiChar(@buf[0]), nSize);
            RetData_All := RetData_All + RetData;
        end
        else
        begin
            break;
        end;
    end;

    Result := RetData_All;

end;

//---------------------------------------------------------------------------
// Print 1D BarCode
//---------------------------------------------------------------------------
function TGodexPrinter.PrintBarCode(
      mBarCodeType : string ;
      PosX, PosY : Integer ;
      Data : string) : Integer;
begin
    Result := Bar_S(mBarCodeType, PosX, PosY, Data);
end;

//---------------------------------------------------------------------------
// Print 1D BarCode (More Parameter)
//---------------------------------------------------------------------------
function TGodexPrinter.PrintBarCode_Detail(
      mBarCodeType : string ;
      PosX, PosY, Narrow, Wide, Height, Rotation, Raedable : Integer ;
      Data : string) : Integer;
begin
    Result := Bar(mBarCodeType, PosX, PosY, Narrow, Wide, Height, Rotation, Raedable, Data);
end;

//---------------------------------------------------------------------------
// Print QR Code
//---------------------------------------------------------------------------
function TGodexPrinter.PrintQRCode(
      PosX, PosY : Integer ;
      Data : string) : Integer;
begin
    Result := Bar_QRcode_S(PosX, PosY, Length(Data), Data);
end;

//---------------------------------------------------------------------------
// Print QR Code (More Parameter)
//---------------------------------------------------------------------------
function TGodexPrinter.PrintQRCode_Detail(
      PosX, PosY, nMode, nType : Integer ;
      ErrorLavel : string ;
      Mask, Mul, Rotation : Integer ;
      Data : string) : Integer ;
begin
    Result := Bar_QRcode(PosX, PosY, nMode, nType, ErrorLavel, Mask, Mul, Length(Data), Rotation, Data);
end;

//---------------------------------------------------------------------------
// Print PDF417
//---------------------------------------------------------------------------
function TGodexPrinter.PrintPDF417(
      PosX, PosY : Integer ;
      Data : string) : Integer;
begin
    Result := Bar_PDF417_S(PosX, PosY, Length(Data), Data);
end;

//---------------------------------------------------------------------------
// Print PDF417 (More Parameter)
//---------------------------------------------------------------------------
function TGodexPrinter.PrintPDF417_Detail(
      PosX, PosY, Width, Height, Row, Col, ErrorLevel, Rotation : Integer ;
      Data : string) : Integer;
begin
    Result := Bar_PDF417(PosX, PosY, Width, Height, Row, Col, ErrorLevel, Length(Data), Rotation, Data);
end;

//---------------------------------------------------------------------------
// Print Aztec
//---------------------------------------------------------------------------
function TGodexPrinter.PrintAztec(
      PosX, PosY : Integer ;
      Data : string) : Integer;
begin
    Result := Bar_Aztec_S(PosX, PosY, Length(Data), Data);
end;

//---------------------------------------------------------------------------
// Print Aztec (More Parameter)
//---------------------------------------------------------------------------
function TGodexPrinter.PrintAztec_Detail(
      PosX, PosY, Rotation, Mul : Integer ;
      ECICs, MenuSymbol : string ;
      nType : Integer ;
      Data : string) : Integer;
begin
    Result := Bar_Aztec(PosX, PosY, Rotation, Mul, ECICs, nType, MenuSymbol, Length(Data), Data);
end;

//---------------------------------------------------------------------------
// Print MaxiCode
//---------------------------------------------------------------------------
function TGodexPrinter.PrintMaxiCode(
      PosX, PosY : Integer ;
      CountryCode, PostalCode, nClass, Data : string) : Integer;
begin
    Result := Bar_Maxicode_S(PosX, PosY, CountryCode, PostalCode, nClass, 0, Data);
end;

//---------------------------------------------------------------------------
// Print MaxiCode (More Parameter)
//---------------------------------------------------------------------------
function TGodexPrinter.PrintMaxiCode_Detail(
      PosX, PosY, SymbolNo, SetNo, Mode : Integer ;
      CountryCode, PostalCode, nClass : string ;
      Rotate : Integer ;
      Data : string) : Integer ;
begin
    Result := Bar_Maxicode(PosX, PosY, SymbolNo, SetNo, Mode, CountryCode, PostalCode, nClass, Rotate, Data);
end;

//---------------------------------------------------------------------------
// Print Data Matrix
//---------------------------------------------------------------------------
function TGodexPrinter.PrintDataMatrix(
      PosX, PosY : Integer ;
      Data : string) : Integer;
begin
    Result := Bar_DataMatrix_S(PosX, PosY, Length(Data), Data);
end;

//---------------------------------------------------------------------------
// Print Data Matrix (More Parameter)
//---------------------------------------------------------------------------
function TGodexPrinter.PrintDataMatrix_Detail(
      PosX, PosY, Enlarge : Integer ;
      RotationR, Data : string) : Integer ;
begin
    Result := Bar_DataMatrix(PosX, PosY, Enlarge, RotationR, Length(Data), Data);
end;

//---------------------------------------------------------------------------
// Print Horizental Line
//---------------------------------------------------------------------------
function TGodexPrinter.PrintHorLine(PosX, PosY, Length, Thick: Integer) : Integer;
begin
    Result := DrawHorLine(PosX, PosY, Length, Thick);
end;

//---------------------------------------------------------------------------
// Print Vertical Line
//---------------------------------------------------------------------------
function TGodexPrinter.PrintVerLine(PosX, PosY, Length, Thick: Integer) : Integer;
begin
    Result := DrawVerLine(PosX, PosY, Length, Thick);
end;

//---------------------------------------------------------------------------
// Print Fill Rectangle
//---------------------------------------------------------------------------
function TGodexPrinter.PrintFillRec(PosX, PosY, Rec_W, Rec_H: Integer) : Integer;
begin
    Result := FillRec(PosX, PosY, Rec_W, Rec_H);
end;

//---------------------------------------------------------------------------
// Print Rectangle
//---------------------------------------------------------------------------
function TGodexPrinter.PrintRec(PosX, PosY, Rec_W, Rec_H, lrw, ubw: Integer) : Integer;
begin
    Result := DrawRec(PosX, PosY, Rec_W, Rec_H, lrw, ubw);
end;

//---------------------------------------------------------------------------
// Print Oblique
//---------------------------------------------------------------------------
function TGodexPrinter.PrintOblique(PosX1, PosY1, Thick, PosX2, PosY2: Integer) : Integer;
begin
    Result := DrawOblique(PosX1, PosY1, Thick, PosX2, PosY2);
end;

//---------------------------------------------------------------------------
// Print Ellipse
//---------------------------------------------------------------------------
function TGodexPrinter.PrintEllipse(PosX, PosY, Ellipse_W, Ellipse_H, PenWidth: Integer) : Integer;
begin
    Result := DrawEllipse(PosX, PosY, Ellipse_W, Ellipse_H, PenWidth);
end;

//---------------------------------------------------------------------------
// Print Round Rectangle
//---------------------------------------------------------------------------
function TGodexPrinter.PrintRoundRec(PosX, PosY, Rec_W, Rec_H, Arc_W, Arc_H, PenWidth: Integer) : Integer;
begin
    Result := DrawRoundRec(PosX, PosY, Rec_W, Rec_H, Arc_W, Arc_H, PenWidth);
end;

//---------------------------------------------------------------------------
// Print Triangle
//---------------------------------------------------------------------------
function TGodexPrinter.PrintTriangle(PosX1, PosY1, PosX2, PosY2, PosX3, PosY3, PenWidth: Integer) : Integer;
begin
    Result := DrawTriangle(PosX1, PosY1, PosX2, PosY2, PosX3, PosY3, PenWidth);
end;

//---------------------------------------------------------------------------
// Print Diamond
//---------------------------------------------------------------------------
function TGodexPrinter.PrintDiamond(PosX, PosY, Rec_W, Rec_H, PenWidth: Integer) : Integer;
begin
    Result := DrawDiamond(PosX, PosY, Rec_W, Rec_H, PenWidth);
end;

//---------------------------------------------------------------------------
// Print Internal Font Text (EZPL Command)
//---------------------------------------------------------------------------
function TGodexPrinter.PrintText_EZPL_Internal_Detail(
    FontType : string;
    PosX, PosY, Mul_X, Mul_Y, Gap : Integer;
    RotationInverse, Data: string) : Integer;
begin
    Result := InternalFont_TextOut(FontType, PosX, PosY, Mul_X, Mul_Y, Gap, RotationInverse, Data);
end;

//---------------------------------------------------------------------------
// Print Internal Font Text (EZPL Command)
//---------------------------------------------------------------------------
function TGodexPrinter.PrintText_EZPL_Internal(
    FontType: string;
    PosX, PosY : Integer;
    Data: string) : Integer;
begin
    Result := InternalFont_TextOut_S(FontType, PosX, PosY, Data);
end;

//---------------------------------------------------------------------------
// Print Bitmapped Font Text (EZPL Command)
//---------------------------------------------------------------------------
function TGodexPrinter.PrintText_EZPL_Bitmapped_Detail(
    FontName: string;
    PosX, PosY, Mul_X, Mul_Y, Gap: Integer;
    RotationInverse, Data: string) : Integer;
begin
    Result := DownloadFont_TextOut(FontName, PosX, PosY, Mul_X, Mul_Y, Gap, RotationInverse, Data);
end;

//---------------------------------------------------------------------------
// Print Bitmapped Font Text (EZPL Command)
//---------------------------------------------------------------------------
function TGodexPrinter.PrintText_EZPL_Bitmapped(
    FontName: string;
    PosX, PosY: Integer;
    Data: string) : Integer;
begin
    Result := DownloadFont_TextOut_S(FontName, PosX, PosY, Data);
end;

//---------------------------------------------------------------------------
// Print True Type Font Text (EZPL Command)
//---------------------------------------------------------------------------
function TGodexPrinter.PrintText_EZPL_TTF_Detail(
    FontName: string;
    PosX, PosY, Font_W, Font_H, SpaceChar: Integer;
    RotationInverse, TTFTable: string;
    WidthMode: Integer;
    Data: string) : Integer;
begin
    Result := TrueTypeFont_TextOut(
        FontName,
        PosX,
        PosY,
        Font_W,
        Font_H,
        SpaceChar,
        RotationInverse,
        TTFTable,
        WidthMode,
        Data);
end;

//---------------------------------------------------------------------------
// Print True Type Font Text (EZPL Command)
//---------------------------------------------------------------------------
function TGodexPrinter.PrintText_EZPL_TTF(
    FontName: string;
    PosX, PosY: Integer;
    Data: string) : Integer;
begin
    Result := TrueTypeFont_TextOut_S(FontName, PosX, PosY, Data);
end;

//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
end.
