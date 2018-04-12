//---------------------------------------------------------------------------
// Create GodexPrinter.cpp by Jeffrey 2014/07/15
//---------------------------------------------------------------------------

#include <vcl>
#pragma hdrstop
#include "GodexPrinter.h"
#include "EZio32.h"
#pragma package(smart_init)
using namespace Ezio32;
//---------------------------------------------------------------------------

//---------------------------------------------------------------------------
// Get Driver Printer
//---------------------------------------------------------------------------
vector < string > GodexPrinter::GetDriverPrinter(string FilterName)
{
    PRINTER_INFO_2* prninfo=NULL;
    DWORD needed, returned;
    DWORD flags = PRINTER_ENUM_LOCAL;

    vector < string > PrinterList;

    EnumPrinters(flags, NULL, 2, NULL, 0, &needed, &returned);
    prninfo = (PRINTER_INFO_2*) GlobalAlloc(GPTR,needed);
    if (EnumPrinters(flags, NULL, 2, (LPBYTE) prninfo, needed, &needed, &returned))
        for (unsigned int i = 0; i < returned; i++)
        {
            AnsiString PrinterName = prninfo[i].pPrinterName;
            AnsiString Filter = FilterName.c_str();
            PrinterName = PrinterName.UpperCase();
            Filter = Filter.UpperCase();
            if (PrinterName.Pos(Filter) > 0)
                PrinterList.push_back(prninfo[i].pPrinterName);
        }

    GlobalFree(prninfo);

    return PrinterList;
}

//---------------------------------------------------------------------------
// Open By Communication Type
//---------------------------------------------------------------------------
void GodexPrinter::Open(PortType mPortType)
{
    openport(IntToStr((int)mPortType).c_str());
}

//---------------------------------------------------------------------------
// Open By String
//---------------------------------------------------------------------------
void GodexPrinter::Open(string PortName)
{
    if (PortName.find("COM", 0) != string::npos)
        OpenUSB((char *)PortName.c_str());
    else
        OpenDriver((char *)PortName.c_str());
}

//---------------------------------------------------------------------------
// Open By Network
//---------------------------------------------------------------------------
void GodexPrinter::Open(string strIP, int nPort)
{
    OpenNet((char *)strIP.c_str(), (char *)IntToStr(nPort).c_str());
}

//---------------------------------------------------------------------------
// Set COM Port (RS232) Baudrate
//---------------------------------------------------------------------------
void GodexPrinter::SetBaudrate(int nBaud)
{
    setbaudrate(nBaud);
}

//---------------------------------------------------------------------------
// Close
//---------------------------------------------------------------------------
void GodexPrinter::Close()
{
    closeport();
}

//---------------------------------------------------------------------------
// Get Dll Version
//---------------------------------------------------------------------------
string GodexPrinter::GetVersion()
{
    char version[100];
    memset(version, 0, sizeof(version));
    GetDllVersion((Char **)&version);
    return string(version);
}

//---------------------------------------------------------------------------
