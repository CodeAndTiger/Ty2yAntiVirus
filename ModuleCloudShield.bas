Attribute VB_Name = "ModuleCloudShield"
'****************************************************************
'
' �ư�ȫ����
'
'****************************************************************

Option Explicit

Private Declare Function ReleaseCapture Lib "user32" () As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function InternetOpen Lib "WinInet.dll" Alias "InternetOpenA" (ByVal sAgent As String, ByVal lAccessType As Long, ByVal sProxyName As String, ByVal sProxyBypass As String, ByVal lFlags As Long) As Long
Private Declare Function InternetOpenUrl Lib "WinInet.dll" Alias "InternetOpenUrlA" (ByVal hInternetSession As Long, ByVal sUrl As String, ByVal sHeaders As String, ByVal lHeadersLength As Long, ByVal lFlags As Long, ByVal lContext As Long) As Long
Private Declare Function InternetReadFile Lib "WinInet.dll" (ByVal hFile As Long, ByVal sBuffer As String, ByVal lNumBytesToRead As Long, lNumberOfBytesRead As Long) As Integer
Private Declare Function InternetCloseHandle Lib "WinInet.dll" (ByVal hInet As Long) As Integer
Private Declare Function SetForegroundWindow Lib "user32" (ByVal hWnd As Long) As Long

Private Const INTERNET_FLAG_NO_CACHE_WRITE = &H4000000


'****************************************************************
'
' ��ȡָ����ַ����ֵ���ݣ����ڽ����ư�ȫ��ѯ
' ������URL��ַ
' ����ֵ����������ҳ���ݣ���Ϊ��
'
'****************************************************************
Public Function CloudMatch(sUrl As String) As String
    
    Dim lInternetOpenUrl As Long
    Dim lInternetOpen As Long
    Dim sTemp As String * 1024
    Dim lInternetReadFile As Long
    Dim lSize As Long
    
    Dim sContent As String
    sContent = vbNullString
          
    '��ʼ������ʹ�� WinINet ����
    lInternetOpen = InternetOpen("WangLiwen", 1, vbNullString, vbNullString, 0)
          
    If lInternetOpen Then
        '����ַ
        lInternetOpenUrl = InternetOpenUrl(lInternetOpen, sUrl, vbNullString, 0, INTERNET_FLAG_NO_CACHE_WRITE, 0)
        
        If lInternetOpenUrl Then
            Do
                '��ȡ��ҳ����
                lInternetReadFile = InternetReadFile(lInternetOpenUrl, sTemp, 1024, lSize)
                sContent = sContent & Mid(sTemp, 1, lSize)
            Loop While (lSize <> 0)
        Else
            'SetForegroundWindow FormScan.hWnd
            '��ʾ�ư�ȫ���Ӵ���
            'MsgBox "�����ư�ȫ������ʧ�ܣ��޷������ư�ȫ����ϵͳ��������������״����", vbInformation, "������룺001"
            CloudMatch = ""
            Exit Function
        End If
        
        lInternetReadFile = InternetCloseHandle(lInternetOpenUrl)
    Else
    
        'SetForegroundWindow FormScan.hWnd
        '��ʾ�ư�ȫ���Ӵ���
        'MsgBox "�����ư�ȫ������ʧ�ܣ��޷������ư�ȫ����ϵͳ��������������״����", vbInformation, "������룺002"
        CloudMatch = ""
        Exit Function
    End If
    
    '�ư�ȫ����ϵͳ��ѯ���أ�Cloud$(�ư�ȫ��ʶ)+1/0(����or�����ļ���ʶ)+��������/�����������
    If UCase(Left(sContent, 6)) = UCase("Cloud$") Then
        CloudMatch = Right(sContent, Len(sContent) - 6)
    Else
        CloudMatch = ""
    End If
    
    
End Function

