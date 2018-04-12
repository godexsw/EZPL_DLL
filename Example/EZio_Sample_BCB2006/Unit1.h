//---------------------------------------------------------------------------
#ifndef Unit1H
#define Unit1H
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <stdio.h>
#include <Dialogs.hpp>
#include <ComCtrls.hpp>
//---------------------------------------------------------------------------
class TForm1 : public TForm
{
__published:	// IDE-managed Components
    TGroupBox *Grp_Communication;
    TRadioButton *RBtn_USB;
    TRadioButton *RBtn_COM;
    TRadioButton *RBtn_LPT;
    TRadioButton *RBtn_Driver;
    TRadioButton *RBtn_NET;
    TComboBox *Cbo_COM;
    TComboBox *Cbo_LPT;
    TComboBox *Cbo_Driver;
    TEdit *Ed_IP;
    TLabel *Lbl_Baud;
    TLabel *Lbl_NetPort;
    TEdit *Ed_Baud;
    TEdit *Ed_NetPort;
    TGroupBox *Grp_Label;
    TLabel *Lbl_PaperType;
    TLabel *Lbl_Speed;
    TComboBox *Cbo_PaperType;
    TLabel *Lbl_GapFeed;
    TLabel *Lbl_Label_W;
    TLabel *Lbl_Label_H;
    TLabel *Lbl_Dark;
    TLabel *Lbl_CopyNo;
    TLabel *Lbl_PageNo;
    TGroupBox *Grp_Demo;
    TButton *Btn_PrintText;
    TEdit *Ed_GapFeed;
    TEdit *Ed_Label_W;
    TEdit *Ed_Label_H;
    TEdit *Ed_Speed;
    TEdit *Ed_Dark;
    TEdit *Ed_CopyNo;
    TEdit *Ed_PageNo;
    TButton *Btn_PrintImage;
    TButton *Btn_AutoSensing;
    TButton *Btn_GetVersion;
    TButton *Btn_SendByte;
    TButton *Btn_UploadTextImage;
    TButton *Btn_PrintCode39;
    TButton *Btn_QRCode;
    TButton *Btn_PDF417;
    TButton *Btn_Aztec;
    TButton *Btn_Maxicode;
    TButton *Btn_DataMatrix;
    TGroupBox *Grp_Command;
    TComboBox *Cbo_Cmd;
    TButton *Btn_Execute;
    TOpenDialog *MyOpenDialog;
    TRichEdit *Rich_Reply;
    TRichEdit *Rich_Cmd;
    TGroupBox *GroupBox1;
    TButton *Btn_Upload_Ext;
    TButton *Btn_Upload_Int;
    TButton *Btn_HalfToneImage;
    TButton *Btn_PrintShape;
    TButton *Btn_InternalFont;
    TButton *Btn_AsiaFont;
    TButton *Btn_BitmappedFont;
    TButton *Btn_TrueTypeFont;
    TButton *Btn_PrintHalftoneImg;

    void __fastcall FormCreate(TObject *Sender);
    void __fastcall Cbo_PaperTypeChange(TObject *Sender);
    void __fastcall Cbo_CmdChange(TObject *Sender);
    void __fastcall Btn_PrintTextClick(TObject *Sender);
    void __fastcall Btn_PrintImageClick(TObject *Sender);
    void __fastcall Btn_AutoSensingClick(TObject *Sender);
    void __fastcall Btn_GetVersionClick(TObject *Sender);
    void __fastcall Btn_SendByteClick(TObject *Sender);
    void __fastcall Btn_UploadTextImageClick(TObject *Sender);
    void __fastcall Btn_ExecuteClick(TObject *Sender);
    void __fastcall Btn_Upload_IntClick(TObject *Sender);
    void __fastcall Btn_Upload_ExtClick(TObject *Sender);
    void __fastcall Btn_HalfToneImageClick(TObject *Sender);
    void __fastcall Btn_PrintCode39Click(TObject *Sender);
    void __fastcall Btn_QRCodeClick(TObject *Sender);
    void __fastcall Btn_PDF417Click(TObject *Sender);
    void __fastcall Btn_AztecClick(TObject *Sender);
    void __fastcall Btn_MaxicodeClick(TObject *Sender);
    void __fastcall Btn_DataMatrixClick(TObject *Sender);
    void __fastcall Btn_PrintShapeClick(TObject *Sender);
    void __fastcall Btn_InternalFontClick(TObject *Sender);
    void __fastcall Btn_AsiaFontClick(TObject *Sender);
    void __fastcall Btn_BitmappedFontClick(TObject *Sender);
    void __fastcall Btn_TrueTypeFontClick(TObject *Sender);
    void __fastcall Btn_PrintHalftoneImgClick(TObject *Sender);
    
private:	// User declarations

    GodexPrinter Printer;
    void ConnectPrinter();
    void DisconnectPrinter();
    void LabelSetup();

public:		// User declarations
        __fastcall TForm1(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TForm1 *Form1;
//---------------------------------------------------------------------------
#endif
