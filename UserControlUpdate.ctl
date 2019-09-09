VERSION 5.00
Begin VB.UserControl UserControlUpdate 
   ClientHeight    =   1755
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2370
   ScaleHeight     =   1755
   ScaleWidth      =   2370
   Begin VB.Image ImageLogo 
      Height          =   630
      Left            =   0
      Picture         =   "UserControlUpdate.ctx":0000
      Top             =   0
      Width           =   630
   End
End
Attribute VB_Name = "UserControlUpdate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
'****************************************************************
'
' Ty2yɱ�����
' http://www.ty2y.com/
'
' ��������Ͳ�����ؼ�
'
'****************************************************************

'API����
Option Explicit
Private Declare Function InternetOpen Lib "wininet" Alias "InternetOpenA" (ByVal sAgent As String, ByVal lAccessType As Long, ByVal sProxyName As String, ByVal sProxyBypass As String, ByVal lFlags As Long) As Long
Private Declare Function InternetCloseHandle Lib "wininet" (ByRef hInet As Long) As Long
Private Declare Function InternetReadFile Lib "wininet" (ByVal lFile As Long, bBuffer As Byte, ByVal lNumBytesToRead As Long, lNumberOfBytesRead As Long) As Integer
Private Declare Function InternetOpenUrl Lib "wininet" Alias "InternetOpenUrlA" (ByVal hInternetSession As Long, ByVal lpszUrl As String, ByVal lpszHeaders As String, ByVal dwHeadersLength As Long, ByVal dwFlags As Long, ByVal dwContext As Long) As Long
Private Declare Function HttpQueryInfo Lib "WinInet.dll" Alias "HttpQueryInfoA" (ByVal hHttpRequest As Long, ByVal lInfoLevel As Long, ByVal bBuffer As Any, ByRef lsBufferLength As Long, ByRef lIndex As Long) As Integer
Private Declare Function InternetSetFilePointer Lib "WinInet.dll" (ByVal lFile As Long, ByVal lDistanceToMove As Long, ByVal pReserved As Long, ByVal dwMoveMethod As Long, ByVal dwContext As Long) As Long
Private Declare Function DeleteFile Lib "kernel32" Alias "DeleteFileA" (ByVal lpFileName As String) As Long
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

'��������
Private Const INTERNET_OPEN_TYPE_PRECONFIG = 0
Private Const scUserAgent = "Wing"
Private Const INTERNET_OPEN_TYPE_DIRECT = 1
Private Const INTERNET_OPEN_TYPE_PROXY = 3
Private Const INTERNET_FLAG_RELOAD = &H80000000

'�ؼ��ڹ�������
Private sUrl As String
Private sSaveFile As String

Private bConnect As Boolean
Private lOpen As Long
Private lFile As Long
Private sBuffer As String
Private lBuffer As Long
Private bRetQueryInfo As Boolean


'�ؼ������¼��������ⲿ����

'���ؽ���
Public Event DownloadProcess(lProgress As Long)
'��������¼�
Public Event DownLoadFinish()
'������Ϣ
Public Event ErrorMassage(sDescription As String)

'****************************************************************
'
' ��ʼ��
'
'****************************************************************
Public Function Init() As Boolean
    
    bConnect = True
    '�ú����ǵ�һ����Ӧ�ó�����õ� WinINet ������������ Internet DLL ��ʼ���ڲ����ݽṹ��׼������Ӧ�ó���֮����������á�
    '��Ӧ�ó������ʹ�� Internet ����ʱ��Ӧ���� InternetCloseHandle �������ͷ���֮��ص���Դ
    lOpen = InternetOpen(scUserAgent, INTERNET_OPEN_TYPE_PRECONFIG, vbNullString, vbNullString, 0)
    
    '����bConnect״̬������ֹ����
    If bConnect = False Then
        CancelDownload
        
        '�û���ֹ����������ʧ��
        Init = False
        Exit Function
    End If
    
    If lOpen = 0 Then
        CancelDownload
        '������������ʧ��
        bConnect = False
        
        '��������ʧ��
        Init = False
        
        '���������¼�
        RaiseEvent ErrorMassage("������������ʧ�ܡ�")
        Exit Function
    Else
    
        'ͨ��һ��������FTP��Gopher��HTTP��ַ��һ����Դ��
        lFile = InternetOpenUrl(lOpen, sUrl, vbNullString, 0, INTERNET_FLAG_RELOAD, 0)
        
        If bConnect = False Then
            CancelDownload
            
            '�û���ֹ����������ʧ��
            Init = False
            Exit Function
        End If
        
        If lFile = 0 Then
            CancelDownload
            '�޷����ӵ���������
            bConnect = False
            
            '��������ʧ��
            Init = False
            
            '���������¼�
            RaiseEvent ErrorMassage("�޷����ӵ�������������")
            Exit Function
        Else
            sBuffer = Space(1024)
            lBuffer = 1024
            
            '�ӷ�������ȡ HTTP ����ͷ��Ϣ
            bRetQueryInfo = HttpQueryInfo(lFile, 21, sBuffer, lBuffer, 0)
            
            '��ȡ�ɹ�
            If bRetQueryInfo Then
                
                sBuffer = Mid(sBuffer, 1, lBuffer)
                '�������سɹ�
                Init = True
                Exit Function
            Else
                sBuffer = ""
                '��������ʧ��
                Init = False
                Exit Function
            End If
        End If
    End If

End Function

'****************************************************************
'
' ��ʼ����
'
'****************************************************************
Public Function StartUpdate() As Boolean
    
    '����������
    'On Error GoTo ErrorExit
    
    Dim bBuffer(1 To 1024) As Byte
    Dim lRet As Long
        
    '�����ش�С
    Dim lDownloadSize As Long
    Dim I As Long
    
    '�û���ֹ
    If bConnect = False Then
        CancelDownload
        StartUpdate = False
        Exit Function
    End If
    
    '���ļ���ţ��磺#1
    Dim lFileNumber As Long
    lFileNumber = FreeFile()
    
    '���ر����ļ���ʽ:���ر���Ϊfile.exe.bak ������� ɾ��file.exe ������ file.exe.bak Ϊfile.exe
    Dim sTempDownloadFile As String
    sTempDownloadFile = Trim(sSaveFile) & ".bak"
    
    '����ļ��Ѿ����ڣ���ɾ��
    If Dir(sTempDownloadFile) <> "" Then
        Call DeleteFile(sTempDownloadFile)
        DoEvents
    End If
    
    '���ļ���������������
    Open sTempDownloadFile For Binary Access Write As #lFileNumber
        
        Do
            '��ȡ�������ļ�����
            InternetReadFile lFile, bBuffer(1), 1024, lRet
            
            DoEvents
            '������1024
            If lRet = 1024 Then
                If bConnect = False Then
                    StartUpdate = False
                    Close #lFileNumber
                    GoTo UserCancel
                End If
                
                'д���ļ�
                Put #1, , bBuffer
            Else
                'ʣ�ಿ�ֿ�
                For I = 1 To lRet
                    Put #1, , bBuffer(I)
                    DoEvents
                Next I
            End If
            
            '�Ѿ����ص��ֽ���
            lDownloadSize = lDownloadSize + lRet
            
            '�������ؽ����¼�
            RaiseEvent DownloadProcess(lDownloadSize)
            
        Loop Until lRet < 1024
    Close #lFileNumber
    
    '����������ֽ�����Ҫ�����ļ���С�Ƿ�һ����һ��˵����������ˡ�
    If lDownloadSize = CLng(GetHeader("Content-Length")) Then
        
        '������ɣ�ɾ��ԭ�ļ��������������ļ�Ϊԭ�ļ���
        If Dir(Trim(sSaveFile)) <> "" Then
        
            If Dir(Trim(sSaveFile)) <> "" Then
                Call DeleteFile(sSaveFile)
            End If
            DoEvents
                
        End If
        
        Sleep 50
        DoEvents
        
        If Dir(sSaveFile) = "" Then
            '���������ص��ļ�
            Name sTempDownloadFile As sSaveFile
        End If
        DoEvents
        
    End If

    '�������,������������¼�
    RaiseEvent DownLoadFinish
    
'�û�������������ֹ
UserCancel:
    CancelDownload
    Exit Function
   
'�����˳�
ErrorExit:
    '���������¼�
    RaiseEvent ErrorMassage("�������̷����������")
    CancelDownload
    Close #lFileNumber
    
End Function

'****************************************************************
'
' �û���ֹ��������
'
'****************************************************************
Public Function CancelDownload()
    bConnect = False
    InternetCloseHandle lOpen
    InternetCloseHandle lFile
End Function


'****************************************************************
'
' ��ȡҪ�����ļ�����Ϣ
'
'****************************************************************
Public Function GetHeader(Optional hdrName As String) As String
    Dim sTemp As Long
    Dim sTemp2 As String
    
    '�û���ֹ
    If bConnect = False Then
        GetHeader = "0"
        CancelDownload
        Exit Function
    End If
    
    If sBuffer <> "" Then
        Select Case UCase(hdrName)
        '�ļ���С
        Case "CONTENT-LENGTH"
            sTemp = InStr(sBuffer, "Content-Length")
            sTemp2 = Mid(sBuffer, sTemp + 16, Len(sBuffer))
            sTemp = InStr(sTemp2, Chr(0))
            GetHeader = CStr(Mid(sTemp2, 1, sTemp - 1))
            
        Case "CONTENT-TYPE"
            sTemp = InStr(sBuffer, "Content-Type")
            sTemp2 = Mid(sBuffer, sTemp + 14, Len(sBuffer))
            sTemp = InStr(sTemp2, Chr(0))
            GetHeader = CStr(Mid(sTemp2, 1, sTemp - 1))
        
        Case "DATE"
            sTemp = InStr(sBuffer, "Date")
            sTemp2 = Mid(sBuffer, sTemp + 6, Len(sBuffer))
            sTemp = InStr(sTemp2, Chr(0))
            GetHeader = CStr(Mid(sTemp2, 1, sTemp - 1))
        '����޸�ʱ��
        Case "LAST-MODIFIED"
            sTemp = InStr(sBuffer, "Last-Modified")
            sTemp2 = Mid(sBuffer, sTemp + 15, Len(sBuffer))
            sTemp = InStr(sTemp2, Chr(0))
            GetHeader = CStr(Mid(sTemp2, 1, sTemp - 1))
            
        Case "SERVER"
            sTemp = InStr(sBuffer, "Server")
            sTemp2 = Mid(sBuffer, sTemp + 8, Len(sBuffer))
            sTemp = InStr(sTemp2, Chr(0))
            GetHeader = CStr(Mid(sTemp2, 1, sTemp - 1))
            
        Case vbNullString
            GetHeader = sBuffer
            Case Else
            GetHeader = "0"
            
        End Select
    Else
        GetHeader = "0"
    End If

End Function

'****************************************************************
'
' �ؼ���������,�����ļ���
'
'****************************************************************
Public Property Let SaveFile(ByVal sInFileName As String)
    sSaveFile = sInFileName
End Property

'****************************************************************
'
' �ؼ��������ԣ�URL��ַ
'
'****************************************************************
Public Property Let URL(ByVal sInUrl As String)
    sUrl = sInUrl
End Property

Private Sub UserControl_Resize()
    With UserControl
        .Width = ImageLogo.Width
        .Height = ImageLogo.Height
    End With
End Sub


