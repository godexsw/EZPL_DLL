//---------------------------------------------------------------------------
// Create GodexPrinter.cpp by Jeffrey 2014/07/15
//---------------------------------------------------------------------------
#pragma hdrstop
#include "stdafx.h"
#include <winspool.h>
#include "GodexPrinter.h"
#include "EZio32.h"
#pragma package(smart_init)
using namespace Ezio32;
//---------------------------------------------------------------------------

string IntToStr(int nVal)
{
	char cRetData[100];
	itoa(nVal, cRetData, 10);
	string strRetData = cRetData;
	return strRetData;
}

void ToUpperCase(string &s1)
{
    for (string::iterator beg = s1.begin(); beg != s1.end(); ++beg)
    {
        *beg = toupper(*beg);
    }
}


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
            string PrinterName = prninfo[i].pPrinterName;
            string Filter = FilterName.c_str();
            ToUpperCase(PrinterName);
            ToUpperCase(Filter);
			if (PrinterName.find(Filter) != PrinterName.npos)
                PrinterList.push_back(prninfo[i].pPrinterName);
        }

    GlobalFree(prninfo);

    return PrinterList;
}

void GodexPrinter::Open(PortType mPortType)
{
    openport((char *)IntToStr((int)mPortType).c_str());
}

void GodexPrinter::Open(string PortName)
{
    if (PortName.find("COM", 0) != string::npos)
        OpenUSB((char *)PortName.c_str());
    else
        OpenDriver((char *)PortName.c_str());
}

void GodexPrinter::Open(string strIP, int nPort)
{
    OpenNet((char *)strIP.c_str(), (char *)IntToStr(nPort).c_str());
}

void GodexPrinter::SetBaudrate(int nBaud)
{
    setbaudrate(nBaud);
}

void GodexPrinter::Close()
{
    closeport();
}

string GodexPrinter::GetVersion()
{
    char version[100];
    memset(version, 0, sizeof(version));
    GetDllVersion((char **)&version);
    return string(version);
}



