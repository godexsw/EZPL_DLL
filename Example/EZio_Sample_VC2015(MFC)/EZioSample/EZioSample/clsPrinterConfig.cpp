//---------------------------------------------------------------------------
// Create clsPrinterConfig.cpp by Jeffrey 2014/07/15
//---------------------------------------------------------------------------
#pragma hdrstop
#include "stdafx.h"
#include "clsPrinterConfig.h"
#include "EZio32.h"
#pragma package(smart_init)
using namespace Ezio32;
//---------------------------------------------------------------------------

string clsPrinterConfig::IntToStr(int nVal)
{
	char cRetData[100];
	itoa(nVal, cRetData, 10);
	string strRetData = cRetData;
	return strRetData;
}

//---------------------------------------------------------------------------
// Setup Function
//---------------------------------------------------------------------------
void clsPrinterConfig::Setup(
    int LabelLength,
    int Darkness,
    int Speed,
    int LabelMode,
    int LabelGap,
    int BlackTop)
{
    setup(LabelLength, Darkness, Speed, LabelMode, LabelGap, BlackTop);
}

//---------------------------------------------------------------------------
// Set Label Height & Paper Type (^Q)
//---------------------------------------------------------------------------
void clsPrinterConfig::LabelMode(PaperMode nMode, int nLabelHeight, int nGapFeed)
{
    if (nMode == GapLabel)
        sendcommand((char *)("^Q" + IntToStr(nLabelHeight) + "," + IntToStr(nGapFeed)).c_str());
    else
        sendcommand((char *)("^Q" + IntToStr(nLabelHeight) + ",0," + IntToStr(nGapFeed)).c_str());
}

//---------------------------------------------------------------------------
// Set Label Width (^W)
//---------------------------------------------------------------------------
void clsPrinterConfig::LabelWidth(int nWidth)
{
    sendcommand((char *)("^W" + IntToStr(nWidth)).c_str());
}

//---------------------------------------------------------------------------
// Set Dark (^H)
//---------------------------------------------------------------------------
void clsPrinterConfig::Dark(int nDark)
{
    sendcommand((char *)("^H" + IntToStr(nDark)).c_str());
}

//---------------------------------------------------------------------------
// Set Speed (^S)
//---------------------------------------------------------------------------
void clsPrinterConfig::Speed(int nSpeed)
{
    sendcommand((char *)("^S" + IntToStr(nSpeed)).c_str());
}

//---------------------------------------------------------------------------
// Set Page No (^P)
//---------------------------------------------------------------------------
void clsPrinterConfig::PageNo(int nPageNo)
{
    sendcommand((char *)("^P" + IntToStr(nPageNo)).c_str());
}

//---------------------------------------------------------------------------
// Set Copy No (^C)
//---------------------------------------------------------------------------
void clsPrinterConfig::CopyNo(int nCopyNo)
{
    sendcommand((char *)("^C" + IntToStr(nCopyNo)).c_str());
}

//---------------------------------------------------------------------------
