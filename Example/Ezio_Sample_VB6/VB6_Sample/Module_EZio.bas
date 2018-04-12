Attribute VB_Name = "Module1"
'=================================================================================
' Important !! You Must Set Dll Path First (C:\EZio\Ezio32.dll)
'=================================================================================

Public Declare Function openport Lib "C:\EZio\Ezio32.dll" (ByVal Port As String) As Boolean
Public Declare Function OpenDriver Lib "C:\EZio\Ezio32.dll" (ByVal DeviceName As String) As Boolean
Public Declare Function OpenNet Lib "C:\EZio\Ezio32.dll" (ByVal IP As String, ByVal Port As String) As Boolean
Public Declare Function setup Lib "C:\EZio\Ezio32.dll" (ByVal LabelLength As Integer, ByVal Darkness As Integer, ByVal Speed As Integer, ByVal LabelMode As Integer, ByVal LabelGap As Integer, ByVal BlackTop As Integer) As Integer
Public Declare Function setbaudrate Lib "C:\EZio\Ezio32.dll" (ByVal BaudRte As Integer) As Integer
Public Declare Sub closeport Lib "C:\EZio\Ezio32.dll" ()
Public Declare Sub sendbuf Lib "C:\EZio\Ezio32.dll" (ByRef command As Byte, ByVal length As Integer)
Public Declare Function sendcommand Lib "C:\EZio\Ezio32.dll" (ByVal command As String) As Integer
Public Declare Function intloadimage Lib "C:\EZio\Ezio32.dll" (ByVal Filename As String, ByVal ImageName As String, ByVal ImageType As String) As Integer
Public Declare Function extloadimage Lib "C:\EZio\Ezio32.dll" (ByVal Filename As String, ByVal ImageName As String, ByVal ImageType As String) As Integer
Public Declare Sub ecTextOut Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal FontHeight As Integer, ByVal FontName As String, ByVal data As String)
'Public Declare Sub ecTextOut Lib "C:\EZio\Ezio32.dll" (ByVal x%, ByVal y%, ByVal b%, ByVal c$, ByVal d$)
Public Declare Sub ecTextOutR Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal FontHeight As Integer, ByVal FontName As String, ByVal data As String, ByVal TextWidth As Integer, ByVal Dark As Integer, ByVal Rotate As Integer)
Public Declare Sub ecTextOutFine Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal FontHeight As Integer, ByVal FontName As String, ByVal data As String, ByVal TextWidth As Integer, ByVal Dark As Integer, ByVal Rotate As Integer, ByVal Italic As Integer, ByVal Underline As Integer, ByVal Strikeout As Integer, ByVal Inverse As Integer)
Public Declare Function ecTextDownLoad Lib "C:\EZio\Ezio32.dll" (ByVal FontHeight As Integer, ByVal FontName As String, ByVal data As String, ByVal TextWidth As Integer, ByVal Dark As Integer, ByVal Rotate As Integer, ByVal ObjectName As String) As Integer
Public Declare Function putimage Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal Filename As String, ByVal Degree As Integer) As Integer
Public Declare Function putimage_Halftone Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal Filename As String, ByVal Degree As Integer, ByVal Halftone As Integer) As Integer
Public Declare Function downloadimage Lib "C:\EZio\Ezio32.dll" (ByVal Filename As String, ByVal Degree As Integer, ByVal ObjectName As String) As Integer
Public Declare Function FindFirstUSB Lib "C:\EZio\Ezio32.dll" (ByRef UsbID As Byte) As Integer
Public Declare Function RcvBuf Lib "C:\EZio\Ezio32.dll" (ByRef ByteArray As Byte, ByVal ByteArraySize As Integer) As Integer
Public Declare Function FindNextUSB Lib "C:\EZio\Ezio32.dll" (ByRef UsbID As Byte) As Integer
Public Declare Function OpenUSB Lib "C:\EZio\Ezio32.dll" (ByVal UsbID As String) As Integer
Public Declare Sub GetDllVersion Lib "C:\EZio\Ezio32.dll" (ByRef Version As Byte)
Public Declare Function Bar Lib "C:\EZio\Ezio32.dll" (ByVal BarcodeType As String, ByVal PosX As Integer, ByVal PosY As Integer, ByVal Narrow As Integer, ByVal Wide As Integer, ByVal Height As Integer, ByVal Rotation As Integer, ByVal Readable As Integer, ByVal data As String) As Integer
Public Declare Function Bar_S Lib "C:\EZio\Ezio32.dll" (ByVal BarcodeType As String, ByVal PosX As Integer, ByVal PosY As Integer, ByVal data As String) As Integer
Public Declare Function Bar_GS1DataBar Lib "C:\EZio\Ezio32.dll" (ByVal BarcodeType As String, ByVal PosX As Integer, ByVal PosY As Integer, ByVal Narrow As Integer, ByVal Segment As Integer, ByVal Height As Integer, ByVal Rotation As Integer, ByVal Readable As Integer, ByVal data As String) As Integer
Public Declare Function Bar_GS1DataBar_S Lib "C:\EZio\Ezio32.dll" (ByVal BarcodeType As String, ByVal PosX As Integer, ByVal PosY As Integer, ByVal data As String) As Integer
Public Declare Function Bar_PDF417 Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal Width As Integer, ByVal Height As Integer, ByVal Row As Integer, ByVal Column As Integer, ByVal ErrorLevel As Integer, ByVal nLen As Integer, ByVal Rotation As Integer, ByVal data As String) As Integer
Public Declare Function Bar_PDF417_S Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal nLen As Integer, ByVal data As String) As Integer
Public Declare Function Bar_MicroPDF417 Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal Width As Integer, ByVal Height As Integer, ByVal Mode As Integer, ByVal nLen As Integer, ByVal Rotation As Integer, ByVal data As String) As Integer
Public Declare Function Bar_MicroPDF417_S Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal nLen As Integer, ByVal data As String) As Integer
Public Declare Function Bar_Maxicode Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal SymbolNo As Integer, ByVal SetNo As Integer, ByVal Mode As Integer, ByVal CountryCode As String, ByVal PostalCode As String, ByVal strClass As String, ByVal Rotation As Integer, ByVal data As String) As Integer
Public Declare Function Bar_Maxicode_S Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal CountryCode As String, ByVal PostalCode As String, ByVal strClass As String, ByVal Rotation As Integer, ByVal data As String) As Integer
Public Declare Function Bar_DataMatrix Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal Enlarge As Integer, ByVal RotationR As String, ByVal nLen As Integer, ByVal data As String) As Integer
Public Declare Function Bar_DataMatrix_S Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal nLen As Integer, ByVal data As String) As Integer
Public Declare Function Bar_QRcode Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal Mode As Integer, ByVal nType As Integer, ByVal ErrorLevel As String, ByVal Mask As Integer, ByVal Mul As Integer, ByVal nLen As Integer, ByVal Rotation As Integer, ByVal data As String) As Integer
'Public Declare Function Bar_QRcode Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal Mode As Integer, ByVal nType As Integer, ByVal ErrorLevel As String, ByVal Mask As Integer, ByVal Mul As Integer, ByVal nLen As Integer, ByVal Rotation As Integer, ByRef data As Byte) As Integer
'Public Declare Function Bar_QRcode_S Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal nLen As Integer, ByVal data As String) As Integer
Public Declare Function Bar_QRcode_S Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal nLen As Integer, ByRef data As Byte) As Integer
Public Declare Function Bar_Aztec Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal Rotation As Integer, ByVal Mul As Integer, ByVal ECICs As String, ByVal nType As Integer, ByVal MenuSymbol As String, ByVal nLen As Integer, ByVal data As String) As Integer
Public Declare Function Bar_Aztec_S Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal nLen As Integer, ByVal data As String) As Integer
Public Declare Function DrawHorLine Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal length As Integer, ByVal Thick As Integer) As Integer
Public Declare Function DrawVerLine Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal length As Integer, ByVal Thick As Integer) As Integer
Public Declare Function FillRec Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal Rec_W As Integer, ByVal Rec_H As Integer) As Integer
Public Declare Function DrawRec Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal Rec_W As Integer, ByVal Rec_H As Integer, ByVal lrw As Integer, ByVal ubw As Integer) As Integer
Public Declare Function DrawOblique Lib "C:\EZio\Ezio32.dll" (ByVal PosX1 As Integer, ByVal PosY1 As Integer, ByVal Thick As Integer, ByVal PosX2 As Integer, ByVal PosY2 As Integer) As Integer
Public Declare Function DrawEllipse Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal Ellipse_W As Integer, ByVal Ellipse_H As Integer, ByVal PenWidth As Integer) As Integer
Public Declare Function DrawRoundRec Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal Rec_W As Integer, ByVal Rec_H As Integer, ByVal Arc_W As Integer, ByVal Arc_H As Integer, ByVal PenWidth As Integer) As Integer
Public Declare Function DrawTriangle Lib "C:\EZio\Ezio32.dll" (ByVal PosX1 As Integer, ByVal PosY1 As Integer, ByVal PosX2 As Integer, ByVal PosY2 As Integer, ByVal PosX3 As Integer, ByVal PosY3 As Integer, ByVal Thick As Integer) As Integer
Public Declare Function DrawDiamond Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal Diamand_W As Integer, ByVal Diamand_H As Integer, ByVal Thick As Integer) As Integer
Public Declare Function InternalFont_TextOut Lib "C:\EZio\Ezio32.dll" (ByVal FontType As String, ByVal PosX As Integer, ByVal PosY As Integer, ByVal Mul_X As Integer, ByVal Mul_Y As Integer, ByVal Gap As Integer, ByVal RotationInverse As String, ByVal data As String) As Integer
Public Declare Function InternalFont_TextOut_S Lib "C:\EZio\Ezio32.dll" (ByVal FontType As String, ByVal PosX As Integer, ByVal PosY As Integer, ByVal data As String) As Integer
Public Declare Function DownloadFont_TextOut Lib "C:\EZio\Ezio32.dll" (ByVal FontName As String, ByVal PosX As Integer, ByVal PosY As Integer, ByVal Mul_X As Integer, ByVal Mul_Y As Integer, ByVal Gap As Integer, ByVal RotationInverse As String, ByVal data As String) As Integer
Public Declare Function DownloadFont_TextOut_S Lib "C:\EZio\Ezio32.dll" (ByVal FontName As String, ByVal PosX As Integer, ByVal PosY As Integer, ByVal data As String) As Integer
Public Declare Function TrueTypeFont_TextOut Lib "C:\EZio\Ezio32.dll" (ByVal FontName As String, ByVal PosX As Integer, ByVal PosY As Integer, ByVal Font_W As Integer, ByVal Font_H As Integer, ByVal SpaceChar As Integer, ByVal RotationInverse As String, ByVal TTFTable As String, ByVal WidthMode As Integer, ByVal data As String) As Integer
Public Declare Function TrueTypeFont_TextOut_S Lib "C:\EZio\Ezio32.dll" (ByVal FontName As String, ByVal PosX As Integer, ByVal PosY As Integer, ByVal data As String) As Integer
Public Declare Function ecTextOutW Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal FontSize As Integer, ByVal FontName As String, ByRef DataText As Byte, ByVal DataLength As Integer) As Boolean
Public Declare Function ecTextOutRW Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal FontSize As Integer, ByVal FontName As String, ByRef DataText As Byte, ByVal FontWidth As Integer, ByVal Dark As Integer, ByVal Rotate As Integer, ByVal DataLength As Integer) As Boolean
Public Declare Function ecTextOutFineW Lib "C:\EZio\Ezio32.dll" (ByVal PosX As Integer, ByVal PosY As Integer, ByVal FontSize As Integer, ByVal FontName As String, ByRef DataText As Byte, ByVal FontWidth As Integer, ByVal Dark As Integer, ByVal Rotate As Integer, ByVal Italic As Integer, ByVal Underline As Integer, ByVal Strickout As Integer, ByVal Inverse As Integer, ByVal DataLength As Integer) As Boolean

