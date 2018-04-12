//---------------------------------------------------------------------------
// Create GodexPrinter.h by Jeffrey 2014/07/15
//---------------------------------------------------------------------------
#ifndef GodexPrinterH
#define GodexPrinterH
//---------------------------------------------------------------------------
#include "clsPrinterCommand.h"
#include "clsPrinterConfig.h"
#include <vector>
using namespace std;
 //---------------------------------------------------------------------------
class GodexPrinter
{
public:

    clsPrinterCommand Command;
    clsPrinterConfig Config;

    static vector < string > GetDriverPrinter(string FilterName = "GoDEX");

    void Open(PortType mPortType);

    void Open(string PortName);

    void Open(string strIP, int nPort);

    void SetBaudrate(int nBaud);

    void Close();

    string GetVersion();

private:




};

#endif
