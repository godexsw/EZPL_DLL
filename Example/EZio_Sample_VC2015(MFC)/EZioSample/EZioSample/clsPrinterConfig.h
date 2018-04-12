//---------------------------------------------------------------------------
// Create clsPrinterConfig.h by Jeffrey 2014/07/15
//---------------------------------------------------------------------------
#ifndef clsPrinterConfigH
#define clsPrinterConfigH
//---------------------------------------------------------------------------
#include "ParaDef.h"
#include <string>
using namespace std;
//---------------------------------------------------------------------------
class clsPrinterConfig
{
public:

    void Setup(
        int LabelLength,
        int Darkness,
        int Speed,
        int LabelMode,
        int LabelGap,
        int BlackTop);

    void LabelMode(PaperMode nMode, int nLabelHeight, int nGapFeed);
    void LabelWidth(int nWidth);
    void Dark(int nDark);
    void Speed(int nSpeed);
    void PageNo(int nPageNo);
    void CopyNo(int nCopyNo);

private:

	string IntToStr(int nVal);


};
//---------------------------------------------------------------------------
#endif
