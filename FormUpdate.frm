VERSION 5.00
Begin VB.Form FormUpdate 
   BorderStyle     =   0  'None
   Caption         =   "����"
   ClientHeight    =   6030
   ClientLeft      =   0
   ClientTop       =   30
   ClientWidth     =   8940
   Icon            =   "FormUpdate.frx":0000
   LinkMode        =   1  'Source
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "FormUpdate.frx":57E2
   ScaleHeight     =   6030
   ScaleWidth      =   8940
   StartUpPosition =   1  '����������
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   2535
      Index           =   3
      Left            =   7320
      ScaleHeight     =   2535
      ScaleWidth      =   135
      TabIndex        =   12
      Top             =   1440
      Width           =   135
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   135
      Index           =   2
      Left            =   1080
      ScaleHeight     =   135
      ScaleWidth      =   6375
      TabIndex        =   11
      Top             =   3720
      Width           =   6375
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   2535
      Index           =   1
      Left            =   968
      ScaleHeight     =   2535
      ScaleWidth      =   135
      TabIndex        =   10
      Top             =   1320
      Width           =   135
   End
   Begin VB.PictureBox Picture1 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   135
      Index           =   0
      Left            =   1080
      ScaleHeight     =   135
      ScaleWidth      =   6375
      TabIndex        =   9
      Top             =   1328
      Width           =   6375
   End
   Begin VB.ListBox ListUpdate 
      Height          =   2400
      Left            =   1080
      TabIndex        =   8
      Top             =   1440
      Width           =   6375
   End
   Begin Ty2yAntiVirus.Command CommandStop 
      Height          =   375
      Left            =   2280
      TabIndex        =   4
      Top             =   4560
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   661
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "����"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      XpType          =   3
      Caption         =   "ֹͣ����"
   End
   Begin Ty2yAntiVirus.Command CommandUpdate 
      Height          =   375
      Left            =   720
      TabIndex        =   3
      Top             =   4560
      Width           =   1335
      _ExtentX        =   2355
      _ExtentY        =   661
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "����"
         Size            =   9
         Charset         =   134
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      XpType          =   3
      Caption         =   "������"
   End
   Begin VB.Timer TimerAutoUpdate 
      Interval        =   1000
      Left            =   4080
      Top             =   4560
   End
   Begin Ty2yAntiVirus.UserControlUpdate UserControlUpdate1 
      Height          =   630
      Left            =   7560
      TabIndex        =   0
      Top             =   1200
      Width           =   630
      _ExtentX        =   1111
      _ExtentY        =   1111
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00C0C0C0&
      Height          =   3135
      Left            =   840
      Top             =   1080
      Width           =   7470
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "���µ���ʱ��"
      Height          =   180
      Left            =   3720
      TabIndex        =   7
      Top             =   720
      Width           =   1080
   End
   Begin VB.Label LabelUpdateLeftTime 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Height          =   180
      Left            =   4800
      TabIndex        =   6
      Top             =   720
      Width           =   90
   End
   Begin VB.Label LabelAutoUpdateMsg 
      BackStyle       =   0  'Transparent
      Height          =   495
      Left            =   4920
      TabIndex        =   5
      Top             =   4560
      Width           =   3495
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   2
      Left            =   8280
      Picture         =   "FormUpdate.frx":B4FDC
      Top             =   0
      Width           =   465
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   1
      Left            =   8280
      Picture         =   "FormUpdate.frx":B573E
      Top             =   0
      Width           =   465
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   0
      Left            =   8280
      Picture         =   "FormUpdate.frx":B5EA0
      Top             =   0
      Width           =   465
   End
   Begin VB.Label LabelAutoUpdateState 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "State"
      Height          =   180
      Left            =   1800
      TabIndex        =   2
      Top             =   720
      Width           =   450
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "�Զ����£�"
      Height          =   180
      Left            =   840
      TabIndex        =   1
      Top             =   720
      Width           =   900
   End
End
Attribute VB_Name = "FormUpdate"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'****************************************************************
'
' Ty2yɱ�����
' http://www.ty2y.com/
'
' ���������������
' ������ʽ˵�������������ļ��У�����������汾�š�����汾�š�������汾�Ź�������ͬ�İ汾�š�
' ����ʱ���������ļ��л�ȡ��������汾�ţ��뵱ǰ����е�����汾�Ž��бȶԣ���������е�����
' �汾�Ÿ��ߣ�����и��£����������ļ���ÿ�������������ļ�ͬʱҲ���أ���ͬ���汾�š�(Setting.ini)
' �����ļ���ʽ��"Update"(6λ�����ڱ�ʶ������У���ļ�)+����汾��(6λ)+�������ļ�+"$"
'
'****************************************************************

Option Explicit

'api����
Private Declare Function InternetOpen Lib "WinInet.dll" Alias "InternetOpenA" (ByVal sAgent As String, ByVal lAccessType As Long, ByVal sProxyName As String, ByVal sProxyBypass As String, ByVal lFlags As Long) As Long
Private Declare Function InternetOpenUrl Lib "WinInet.dll" Alias "InternetOpenUrlA" (ByVal hInternetSession As Long, ByVal sUrl As String, ByVal sHeaders As String, ByVal lHeadersLength As Long, ByVal lFlags As Long, ByVal lContext As Long) As Long
Private Declare Function InternetReadFile Lib "WinInet.dll" (ByVal hFile As Long, ByVal sBuffer As String, ByVal lNumBytesToRead As Long, lNumberOfBytesRead As Long) As Integer
Private Declare Function InternetCloseHandle Lib "WinInet.dll" (ByVal hInet As Long) As Integer
Private Declare Function ReleaseCapture Lib "user32" () As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function MoveFileEx Lib "kernel32" Alias "MoveFileExA" (ByVal lpExistingFileName As String, ByVal lpNewFileName As String, ByVal dwFlags As Long) As Long
Private Declare Function WinExec Lib "kernel32" (ByVal lpCmdLine As String, ByVal nCmdShow As Long) As Long

'��������
Private Const INTERNET_FLAG_NO_CACHE_WRITE = &H4000000

'�Ƿ����������һ���ļ�
Dim bEnableDownloadNext As Boolean
'�Ƿ���ֹ����
Dim bStopDownload As Boolean
'��ǰ���ص��ļ���С
Dim lCurrentFileSize
'�Զ���������
Dim lCurrentSecond As Long

Dim lFinishedCount As Long

'****************************************************************
'
' ��ȡָ����ַ��������
' ������URL��ַ
' ����ֵ����������ҳ���ݣ���Ϊ��
'
'****************************************************************
Public Function DetectUpdateFile(sUrl As String) As String
    
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
            '��ʾ���Ӵ���
            If Me.Visible = True Then
                MsgBox "������룺001����������������ʧ�ܣ�������������״����"
            Else
                LabelAutoUpdateMsg.Caption = "������룺001����������������ʧ�ܣ�������������״����"
            End If
            DetectUpdateFile = ""
            Exit Function
        End If
        
        lInternetReadFile = InternetCloseHandle(lInternetOpenUrl)
    Else
        '��ʾ���Ӵ���
        If Me.Visible = True Then
            MsgBox "������룺002����������������ʧ�ܣ�������������״����"
        Else
            LabelAutoUpdateMsg.Caption = "������룺002����������������ʧ�ܣ�������������״����"
        End If
        DetectUpdateFile = ""
        Exit Function
    End If
    
    '������ѯ�����ԡ�Update����ʼΪ��ʶ
    If UCase(Left(sContent, 6)) = UCase("Update") Then
        DetectUpdateFile = Right(sContent, Len(sContent) - 6)
    Else
        DetectUpdateFile = ""
    End If
    
End Function

'****************************************************************
'
' ���������������
'
'****************************************************************
Private Sub CommandUpdate_Click()
    lFinishedCount = 0
    
    '�Ƿ���ֹ���ر�־
    bStopDownload = False

    '��ָ����ַ��ȡ�ָ����ļ�����
    Dim sUpdateFiles As String
    sUpdateFiles = DetectUpdateFile("http://www.ty2y.com/ty2yantivirus/update/update.txt")
    
    If sUpdateFiles = "" Then
        If Me.Visible = True Then
            MsgBox "���������������޷���ȡ�����ļ���"
        Else
            LabelAutoUpdateMsg.Caption = "���������������޷���ȡ�����ļ���"
        End If
        Exit Sub
    End If
    
    'ȡ��������汾��
    Dim lNewWholeVersion As Long
    lNewWholeVersion = Left(sUpdateFiles, 6)
    sUpdateFiles = Right(sUpdateFiles, Len(sUpdateFiles) - 6)
    
    '����汾��¼�ļ�
    Dim sVersionFile As String
    If Right(App.Path, 1) = "\" Then
        sVersionFile = App.Path & "Version.ini"
    Else
        sVersionFile = App.Path & "\Version.ini"
    End If
        
    '��ȡ������汾
    Dim lOldWholeVersion As Long
    lOldWholeVersion = ReadIni(sVersionFile, "Version", "WholeVersion")
    
    '�ж��Ƿ�����������
    If lNewWholeVersion <= lOldWholeVersion Then
        If Me.Visible = True Then
            MsgBox "�������°汾������������"
        Else
            LabelAutoUpdateMsg.Caption = "�������°汾������������"
        End If
        Exit Sub
    End If
    
    '��վ���������
    ListUpdate.Clear
    
    CommandUpdate.Enabled = False
    CommandStop.Enabled = True
    
    '����и�������
    Do While Not sUpdateFiles = ""
        DoEvents
        '�ӷ���������ȡ�óָ����ļ���
        With ListUpdate
            .AddItem Left(sUpdateFiles, InStr(1, sUpdateFiles, "$") - 1)
        End With
        sUpdateFiles = Right(sUpdateFiles, Len(sUpdateFiles) - InStr(1, sUpdateFiles, "$"))
    Loop
    
    '��������ÿ���ļ�
    Dim I As Long
    For I = 0 To ListUpdate.ListCount - 1
        DoEvents
        '�Ƿ���ֹ����
        If bStopDownload = True Then
            Exit For
        End If
        
        '�����Ҫ����exe�ļ�������movefileexȥ������ִ�б���
        If InStr(1, LCase(ListUpdate.List(I)), LCase(".exe")) Then
            Call MoveFileEx(ListUpdate.List(I), RndChr(6), 1)
        End If
        
        '�Ƿ���Ը�����һ���ļ����������ν��У����������ļ�ʱ���ܽ��д˲���
        If bEnableDownloadNext = True Then
            With UserControlUpdate1
                '�ļ����ص�ַ
                .URL = "http://www.ty2y.com/ty2yantivirus/update/" & ListUpdate.List(I)
                '���ر����ַ
                .SaveFile = App.Path & "\" & ListUpdate.List(I)
                If .Init = True Then
                    '��ǰ���ص��ļ���С����λ��byte
                    lCurrentFileSize = .GetHeader("Content-Length")
                    '�����������ر�־
                    bEnableDownloadNext = False
                    '��ʼ�����ļ�
                    .StartUpdate
                End If
            End With
        End If
    Next
    
End Sub

Private Sub CommandStop_Click()
    bStopDownload = True
    UserControlUpdate1.CancelDownload
    CommandUpdate.Enabled = True
    CommandStop.Enabled = False
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)

    '�ر��ť
    ImageExit(0).Visible = True
    ImageExit(1).Visible = False
    ImageExit(2).Visible = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If bEnableUnloadForm = False Then
        Cancel = 1
        Me.Hide
    End If
End Sub

Private Sub ImageExit_Click(Index As Integer)
    Me.Hide
End Sub

Private Sub ImageExit_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    '�˳��ť״̬
    ImageExit(0).Visible = False
    ImageExit(1).Visible = True
    ImageExit(2).Visible = False
End Sub

Private Sub ImageExit_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    '�˳��ť״̬
    ImageExit(0).Visible = False
    ImageExit(1).Visible = False
    ImageExit(2).Visible = True
End Sub

Private Sub ImageExit_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    '�˳�����ť
    If ImageExit(2).Visible = True Then
        Me.Hide
    End If
End Sub

'������������
Private Sub Form_Load()
    ReSkinMe
    Dim I As Long
    For I = 0 To 2

        '��ʼ���ر��ťλ��
        With ImageExit(I)
            .Left = 8280
            .Top = 0
        End With
    Next
    
    '�Զ���������
    lCurrentSecond = 0
    
    '�ر��ť
    ImageExit(0).Visible = True
    ImageExit(1).Visible = False
    ImageExit(2).Visible = False
    
    '�����������ر�־
    bEnableDownloadNext = True
    
    '������ü�¼�ļ�
    Dim sSettingsFile As String
    If Right(App.Path, 1) = "\" Then
        sSettingsFile = App.Path & "Settings.ini"
    Else
        sSettingsFile = App.Path & "\Settings.ini"
    End If
    
    '��ȡ��������
    Dim lAutoUpdate As Long
    lAutoUpdate = ReadIni(sSettingsFile, "Update", "AutoUpdate")
        
    '�Զ���������
    If lAutoUpdate = 1 Then
        LabelAutoUpdateState.Caption = "������"
        TimerAutoUpdate.Enabled = True
    Else
        LabelAutoUpdateState.Caption = "δ����"
        TimerAutoUpdate.Enabled = False
    End If
    
    CommandUpdate.Enabled = True
    CommandStop.Enabled = False
        
End Sub

Private Sub Form_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    '����������
    If Button = vbLeftButton Then
        'Ϊ��ǰ��Ӧ�ó����ͷ���겶��
        ReleaseCapture
        '�ƶ�����
        SendMessage Me.hWnd, &HA1, 2, 0
    End If
End Sub

'�Զ�����
Private Sub TimerAutoUpdate_Timer()
    
    Dim sSettingsFile As String
    
    '������ü�¼�ļ�
    If Right(App.Path, 1) = "\" Then
        sSettingsFile = App.Path & "Settings.ini"
    Else
        sSettingsFile = App.Path & "\Settings.ini"
    End If
    
    '�Զ�����Ƶ��
    Dim lAutoUpdateIntervel As Long
    lAutoUpdateIntervel = ReadIni(sSettingsFile, "Update", "AutoUpdateIntervel")
    
    '����Ƶ�ʱ�Ϊ��
    Dim lMaxSecond As Long
    lMaxSecond = lAutoUpdateIntervel * 3600
    
    '�Զ���������
    lCurrentSecond = lCurrentSecond + 1
    LabelUpdateLeftTime.Caption = 3600 - lCurrentSecond & "��"
    
    '�Ƿ񵽴��Զ�����ʱ��
    If lCurrentSecond >= lMaxSecond Then
        '������������
        lCurrentSecond = 0
        '����
        CommandUpdate_Click
    End If
End Sub

'****************************************************************
'
' �����ؼ��¼���һ���������
'
'****************************************************************
Private Sub UserControlUpdate1_DownLoadFinish()
    lFinishedCount = lFinishedCount + 1
    bEnableDownloadNext = True
    Dim I As Long
    'For i = 0 To ListUpdate.ListCount - 1

        Dim sListText As String
        sListText = ListUpdate.List(ListUpdate.ListCount - 1)
        
        'If InStr(sListText, "100%") Then
        
            '�����exe�ļ�,���غ�����
            If InStr(LCase(sListText), LCase(".exe")) Then
                        
                DoEvents
                                
                Dim sRunFile  As String
                sRunFile = sListText
                                
                '���غ�ִ��
                Call WinExec(sRunFile, 1)
                DoEvents
            End If
                        
            If ListUpdate.ListCount = lFinishedCount Then
            
                LabelAutoUpdateMsg.Caption = ""
                
                CommandUpdate.Enabled = True
                CommandStop.Enabled = False
                If Me.Visible = True Then
                    MsgBox "������ɡ�"
                Else
                    LabelAutoUpdateMsg.Caption = "������ɡ�"
                    
                    '���Ѵ���
                    Dim uAlertForm As New FormAlertMessage
                    
                    '����������ʾ�û�
                    With uAlertForm
                        '���ô���λ��
                        .Top = Screen.Height - .Height - 300
                        .Left = Screen.Width - .Width
                                    
                        '���������ʾ
                        Dim sUpdated  As String
                        sUpdated = "�Զ�������ɣ��������ļ���" & vbCrLf
                        Dim j As Long
                        For j = 0 To ListUpdate.ListCount - 1
                            sUpdated = sUpdated & ListUpdate.List(j) & " "
                        Next j
                        
                        '��ʾ����
                        .LabelInfo.Caption = sUpdated
                        '��ʾ����
                        .Show vbModal
                    End With
                    
                End If
                
                'ˢ������汾��������汾��Web�ؼ�
                FormScan.TimerUpdateRefresh.Enabled = True
            End If
        'End If
    'Next
End Sub

'****************************************************************
'
' �����ؼ��¼���ʵʱ���ؽ�չ
'
'****************************************************************
Private Sub UserControlUpdate1_DownloadProcess(lProgress As Long)

    LabelAutoUpdateMsg.Caption = "�������أ����Ժ󡭡� " & ((lProgress * 100) \ lCurrentFileSize) & "%"
    Exit Sub
    
    bEnableDownloadNext = False
    Dim I As Long
    For I = 0 To ListUpdate.ListCount - 1
        Dim sListText As String
        sListText = ListUpdate.List(I)
        
        If InStr(sListText, "%") = 0 Then
            sListText = sListText & " " & ((lProgress * 100) \ lCurrentFileSize) & "%"
        Else
            sListText = Left(sListText, InStr(sListText, " ") - 1)
            sListText = sListText & " " & ((lProgress * 100) \ lCurrentFileSize) & "%"
        End If
        
        If InStr(ListUpdate.List(I), "100%") = 0 Then
            ListUpdate.List(I) = sListText
        End If
        
    Next
End Sub

'****************************************************************
'
' �����ؼ��¼���������Ϣ
'
'****************************************************************
Private Sub UserControlUpdate1_ErrorMassage(sDescription As String)
    If Me.Visible = True Then
        MsgBox sDescription
    Else
        LabelAutoUpdateMsg.Caption = sDescription
    End If
End Sub

Public Function ReSkinMe()
    With Me
        .Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Update2.bmp")
        .ImageExit(0).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit0.bmp")
        .ImageExit(1).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit1.bmp")
        .ImageExit(2).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit2.bmp")
    End With
End Function
