Attribute VB_Name = "ModuleTrayIcon"
'****************************************************************
'
' Ty2yɱ�����
' http://www.ty2y.com/
'
' ����ͼ�����ģ��
'
'****************************************************************

Option Explicit

'api����
Private Declare Function Shell_NotifyIcon Lib "shell32.dll" Alias "Shell_NotifyIconA" (ByVal dwMessage As Long, lpData As NOTIFYICONDATA) As Long
Private Declare Function LoadImage Lib "user32" Alias "LoadImageA" (ByVal hInst As Long, ByVal lpsz As String, ByVal un1 As Long, ByVal n1 As Long, ByVal n2 As Long, ByVal un2 As Long) As Long

'�Զ�������
Private Type NOTIFYICONDATA
    cbSize As Long
    hWnd As Long
    Uid As Long
    uFlags As Long
    UCallbackMessage As Long
    hIcon As Long
    SzTip As String * 64
End Type

'��������
Private Const NIF_MESSAGE = &H1
Private Const NIF_TIP = &H4
Private Const WM_USER = &H400
Private Const TRAY_CALLBACK = (WM_USER + 1001&)
Private Const NIF_ICON = &H2

Dim uTrayIcon As NOTIFYICONDATA

'****************************************************************
'
' �������ͼ��
' �޲������޷���ֵ
'
'****************************************************************
Public Function AddTrayIcon()
    
    Dim lIcon As Long
    lIcon = LoadImage(0&, App.Path & "\Ty2yAntiVirus.ico", 1, 16, 16, &H10)
    
    With uTrayIcon
        .Uid = 0
        .hWnd = FormScan.hWnd
        .cbSize = Len(uTrayIcon)
        .hIcon = lIcon
        .uFlags = NIF_ICON
        .UCallbackMessage = TRAY_CALLBACK
        .uFlags = .uFlags Or NIF_MESSAGE Or NIF_TIP
        .cbSize = Len(uTrayIcon)
        .SzTip = "Ty2yɱ�����" & Chr(0)
    End With
    Shell_NotifyIcon 0, uTrayIcon
End Function

'****************************************************************
'
' �Ƴ�����ͼ��
' �޲������޷���ֵ
'
'****************************************************************
Public Function RemoveTrayIcon()
    Shell_NotifyIcon 2, uTrayIcon
End Function
