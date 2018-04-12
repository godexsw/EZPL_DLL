
// EZioSampleDlg.h : header file
//

#pragma once
#include "afxwin.h"
#include "GodexPrinter.h"

// CEZioSampleDlg dialog
class CEZioSampleDlg : public CDialog
{
private:

	GodexPrinter Printer;
    void ConnectPrinter();
    void DisconnectPrinter();
    void LabelSetup();

// Construction
public:
	CEZioSampleDlg(CWnd* pParent = NULL);	// standard constructor

// Dialog Data
	enum { IDD = IDD_EZIOSAMPLE_DIALOG };

	protected:
	virtual void DoDataExchange(CDataExchange* pDX);	// DDX/DDV support


// Implementation
protected:
	HICON m_hIcon;

	// Generated message map functions
	virtual BOOL OnInitDialog();
	afx_msg void OnPaint();
	afx_msg HCURSOR OnQueryDragIcon();
	DECLARE_MESSAGE_MAP()
public:
	BOOL PreTranslateMessage(MSG* pMsg) ;
	void OnOK();
	afx_msg void Btn_Execute_Clicked();
	CComboBox Cbo_COM;
	CComboBox Cbo_LPT;
	CEdit Ed_Baud;
	CComboBox Cbo_Driver;
	CEdit Ed_IP;
	CEdit Ed_NetPort;
	CComboBox Cbo_PaperType;
	CEdit Ed_GapFeed;
	CEdit Ed_Label_W;
	CEdit Ed_Label_H;
	CEdit Ed_Speed;
	CEdit Ed_Dark;
	CEdit Ed_CopyNo;
	CEdit Ed_PageNo;
	afx_msg void OnBnClickedButton1();
	CEdit Ed_Cmd;
	CEdit Ed_Reply;
	afx_msg void OnCbnSelchangeCombo5();
	CComboBox Cbo_Cmd;
	afx_msg void OnBnClickedButton17();
	afx_msg void OnBnClickedButton3();
	afx_msg void OnBnClickedButton2();
	afx_msg void OnBnClickedButton4();
	afx_msg void OnBnClickedButton5();
	afx_msg void OnBnClickedButton6();
	afx_msg void OnBnClickedButton7();
	afx_msg void OnBnClickedButton9();
	afx_msg void OnBnClickedButton8();
	afx_msg void OnBnClickedButton10();
	afx_msg void OnBnClickedButton11();
	afx_msg void OnBnClickedButton12();
	afx_msg void OnBnClickedButton13();
	afx_msg void OnBnClickedButton14();
	afx_msg void OnBnClickedButton15();
	afx_msg void OnBnClickedButton18();
	afx_msg void OnBnClickedButton19();
	afx_msg void OnBnClickedButton20();
	afx_msg void OnBnClickedButton21();
	afx_msg void OnBnClickedButton22();
	afx_msg void OnBnClickedButton23();
};
