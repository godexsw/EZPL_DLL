//---------------------------------------------------------------------------
#ifndef PARADEFH
#define PARADEFH
//---------------------------------------------------------------------------

    enum BarCodeType
    { 
        Code39_Extended,            // BA
        Code39_Extended_CheckDidit, // BA2
        Code39,                     // BA3
        Code39_CheckDidit,          // BA4
        EAN8,                       // BB
        EAN8_Add2,                  // BC
        EAN8_Add5,                  // BD
        EAN13,                      // BE
        EAN13_Add2,                 // BF
        EAN13_Add5,                 // BG
        UPCA,                       // BH
        UPCA_Add2,                  // BI
        UPCA_Add5,                  // BJ
        UPCE,                       // BK
        UPCE_Add2,                  // BL
        UPCE_Add5,                  // BM
        I2of5,                      // BN
        I2of5_CheckDigit,           // BN2
        Codabar,                    // BO
        Code93,                     // BP
        Code128_Auto,               // BQ
        Code128_Subset,             // BQ2
        UCC_128,                    // BR
        PostNET,                    // BS
        ITF14,                      // BT
        EAN128,                     // BU
        RPS128,                     // BV
        HIBC,                       // BX
        MSI_1MOD10,                 // BY
        MSI_2MOD10,                 // BY2
        MSI_1MOD1110,               // BY3
        MSI_NoDigitCheck,           // BY4
        I2of5_ShippingBearerBars,   // BZ
        UCC_EAN128_KMART,           // B1
        UCC_EAN128_RANDOM,          // B2
        Telepen,                    // B3
        FIM,                        // B4
        Plessey                     // B7
    };

    enum PortType
    {
        LPT1 = 0,
        COM1 = 1,
        COM2 = 2,
        COM3 = 3,
        COM4 = 4,
        LPT2 = 5,
        USB = 6
    };

    enum PaperMode
    { 
        GapLabel = 0,
        PlainPaperLabel = 1
    };

    enum RotateMode
    { 
        Angle_0 = 0,
        Angle_90 = 90,
        Angle_180 = 180,
        Angle_270 = 270
    };

    enum FontWeight
    {
        FW_100_THIN = 100,
        FW_200_EXTRALIGHT = 200,
        FW_300_LIGHT = 300,
        FW_400_NORMAL = 400,
        FW_500_MEDIUM = 500,
        FW_600_FW_SEMIBOLD = 600,
        FW_700_BOLD = 700,
        FW_800_EXTRABOLD = 800,
        FW_900_HEAVY = 900
    };

    enum Italic_State
    {
        Italic_OFF = 0,
        Italic_ON = 1
    };

    enum Underline_State
    {
        Underline_OFF = 0,
        Underline_ON = 1
    };

    enum Strikeout_State
    {
        Strikeout_OFF = 0,
        Strikeout_ON = 1
    };

    enum Inverse_State
    {
        Inverse_OFF = 0,
        Inverse_ON = 1
    };

    enum Image_Type
    {
        BMP = 0,
        PCX = 1
    };

//---------------------------------------------------------------------------
#endif
