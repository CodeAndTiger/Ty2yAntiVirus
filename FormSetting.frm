VERSION 5.00
Begin VB.Form FormSetting 
   BorderStyle     =   0  'None
   Caption         =   "����"
   ClientHeight    =   6660
   ClientLeft      =   0
   ClientTop       =   30
   ClientWidth     =   9360
   Icon            =   "FormSetting.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "FormSetting.frx":57E2
   ScaleHeight     =   6660
   ScaleWidth      =   9360
   StartUpPosition =   1  '����������
   Begin Ty2yAntiVirus.Command CommandCancel 
      Height          =   375
      Left            =   7200
      TabIndex        =   28
      Top             =   6000
      Width           =   1215
      _ExtentX        =   2143
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
      Caption         =   "ȡ��"
   End
   Begin VB.PictureBox PictureUpdate 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   2895
      Left            =   10000
      ScaleHeight     =   2895
      ScaleWidth      =   8175
      TabIndex        =   22
      Top             =   960
      Width           =   8175
      Begin VB.Frame Frame2 
         BackColor       =   &H00FBFDFB&
         Caption         =   "�Զ�����"
         Height          =   1455
         Left            =   240
         TabIndex        =   23
         Top             =   240
         Width           =   7695
         Begin VB.CheckBox CheckAutoUpdate 
            BackColor       =   &H00FBFDFB&
            Caption         =   "�Զ�����"
            Height          =   255
            Left            =   480
            TabIndex        =   25
            Top             =   360
            Width           =   2775
         End
         Begin VB.ComboBox ComboAutoUpdateInterval 
            Height          =   300
            Left            =   1080
            Style           =   2  'Dropdown List
            TabIndex        =   24
            Top             =   720
            Width           =   735
         End
         Begin VB.Label Label6 
            AutoSize        =   -1  'True
            BackColor       =   &H00FBFDFB&
            Caption         =   "Ƶ�ʣ�"
            Height          =   180
            Left            =   480
            TabIndex        =   27
            Top             =   720
            Width           =   540
         End
         Begin VB.Label Label7 
            AutoSize        =   -1  'True
            BackColor       =   &H00FBFDFB&
            Caption         =   "Сʱ�Զ�����һ�Ρ�"
            Height          =   180
            Left            =   1920
            TabIndex        =   26
            Top             =   720
            Width           =   1620
         End
      End
   End
   Begin VB.PictureBox PictureShield 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   4575
      Left            =   480
      ScaleHeight     =   4575
      ScaleWidth      =   8295
      TabIndex        =   14
      Top             =   1200
      Width           =   8295
      Begin VB.Frame Frame1 
         BackColor       =   &H00FBFDFB&
         Caption         =   "��ʾ��Ϣ"
         Height          =   1215
         Left            =   240
         TabIndex        =   17
         Top             =   2760
         Width           =   7935
         Begin VB.CheckBox CheckAutoCloseAlert 
            BackColor       =   &H00FBFDFB&
            Caption         =   "Check1"
            Height          =   255
            Left            =   360
            TabIndex        =   20
            Top             =   720
            Width           =   255
         End
         Begin VB.ComboBox ComboAutoCloseAlertInterval 
            Height          =   300
            Left            =   720
            Style           =   2  'Dropdown List
            TabIndex        =   19
            Top             =   720
            Width           =   1335
         End
         Begin VB.CheckBox CheckEnableAlert 
            BackColor       =   &H00FBFDFB&
            Caption         =   "�Զ������ļ�ʱ������ʾ��"
            Height          =   255
            Left            =   360
            TabIndex        =   18
            Top             =   360
            Width           =   7455
         End
         Begin VB.Label Label5 
            AutoSize        =   -1  'True
            BackColor       =   &H00FBFDFB&
            Caption         =   "����Զ��ر���ʾ��Ϣ��"
            Height          =   180
            Left            =   2160
            TabIndex        =   21
            Top             =   720
            Width           =   2160
         End
      End
      Begin VB.Frame FrameShieldLevel 
         BackColor       =   &H00FBFDFB&
         Caption         =   "��������"
         Height          =   2415
         Left            =   240
         TabIndex        =   15
         Top             =   240
         Width           =   7935
         Begin VB.OptionButton OptionHighShildLevel 
            BackColor       =   &H00FBFDFB&
            Caption         =   "�ϸ񣺽�ֹһ�г������С�"
            Height          =   255
            Left            =   360
            TabIndex        =   32
            Top             =   1920
            Width           =   4215
         End
         Begin VB.OptionButton OptionNormalShieldLevel 
            BackColor       =   &H00FBFDFB&
            Caption         =   "��ͨ������⵽����ʱ���ء�"
            Height          =   255
            Left            =   360
            TabIndex        =   31
            Top             =   1560
            Value           =   -1  'True
            Width           =   4215
         End
         Begin VB.CheckBox CheckEnableShield 
            BackColor       =   &H00FBFDFB&
            Caption         =   "��������"
            Height          =   255
            Left            =   360
            TabIndex        =   29
            Top             =   360
            Width           =   1215
         End
         Begin VB.Label Label2 
            AutoSize        =   -1  'True
            BackStyle       =   0  'Transparent
            Caption         =   "�����ȼ���"
            Height          =   180
            Left            =   360
            TabIndex        =   30
            Top             =   1200
            Width           =   900
         End
         Begin VB.Label Label1 
            AutoSize        =   -1  'True
            BackColor       =   &H00FBFDFB&
            Caption         =   "�Զ����ز���������ϵͳ�����������֡�"
            Height          =   180
            Left            =   360
            TabIndex        =   16
            Top             =   720
            Width           =   3240
         End
      End
   End
   Begin VB.PictureBox PictureScan 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   4575
      Left            =   60000
      ScaleHeight     =   4575
      ScaleWidth      =   8175
      TabIndex        =   4
      Top             =   1200
      Width           =   8175
      Begin VB.Frame Frame5 
         BackColor       =   &H00FBFDFB&
         Caption         =   "һ������"
         Height          =   855
         Left            =   120
         TabIndex        =   12
         Top             =   0
         Width           =   8055
         Begin VB.CheckBox CheckLowCPU 
            BackColor       =   &H00FBFDFB&
            Caption         =   "����ɨ��ʱ�������ȼ����Լ���CPUռ��"
            Height          =   255
            Left            =   240
            TabIndex        =   13
            Top             =   360
            Width           =   4095
         End
      End
      Begin VB.Frame Frame4 
         BackColor       =   &H00FBFDFB&
         Caption         =   "ɨ�赽�����Ĵ���ʽ"
         Height          =   1575
         Left            =   120
         TabIndex        =   8
         Top             =   2280
         Width           =   8055
         Begin VB.OptionButton OptionIgnore 
            BackColor       =   &H00FBFDFB&
            Caption         =   "����"
            Height          =   255
            Left            =   240
            TabIndex        =   11
            Top             =   1080
            Width           =   1215
         End
         Begin VB.OptionButton OptionAlert 
            BackColor       =   &H00FBFDFB&
            Caption         =   "ѯ��"
            Height          =   255
            Left            =   240
            TabIndex        =   10
            Top             =   720
            Width           =   1215
         End
         Begin VB.OptionButton OptionClear 
            BackColor       =   &H00FBFDFB&
            Caption         =   "�Զ����"
            Height          =   255
            Left            =   240
            TabIndex        =   9
            Top             =   360
            Width           =   2055
         End
      End
      Begin VB.Frame Frame3 
         BackColor       =   &H00FBFDFB&
         Caption         =   "ɨ��Ŀ��"
         Height          =   1215
         Left            =   120
         TabIndex        =   5
         Top             =   960
         Width           =   8055
         Begin VB.OptionButton OptionScanPeFiles 
            BackColor       =   &H00FBFDFB&
            Caption         =   "��ִ���ļ�"
            Height          =   255
            Left            =   240
            TabIndex        =   7
            Top             =   720
            Value           =   -1  'True
            Width           =   2295
         End
         Begin VB.OptionButton OptionScanAllFiles 
            BackColor       =   &H00FBFDFB&
            Caption         =   "�����ļ�"
            Height          =   255
            Left            =   240
            TabIndex        =   6
            Top             =   360
            Width           =   2175
         End
      End
   End
   Begin VB.PictureBox PictureGeneral 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   4455
      Left            =   600
      ScaleHeight     =   4455
      ScaleWidth      =   8055
      TabIndex        =   1
      Top             =   1200
      Width           =   8055
      Begin VB.CheckBox CheckAutoTray 
         BackColor       =   &H00FFFFFF&
         Caption         =   "�Զ���С��"
         Height          =   255
         Left            =   240
         TabIndex        =   3
         Top             =   720
         Width           =   1695
      End
      Begin VB.CheckBox CheckAutoRun 
         BackColor       =   &H00FFFFFF&
         Caption         =   "����������"
         Height          =   255
         Left            =   240
         TabIndex        =   2
         Top             =   360
         Width           =   1575
      End
   End
   Begin Ty2yAntiVirus.Command CommandOK 
      Height          =   375
      Left            =   5880
      TabIndex        =   0
      Top             =   6000
      Width           =   1215
      _ExtentX        =   2143
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
      Caption         =   "ȷ��"
   End
   Begin VB.Image ImageUpdate 
      Height          =   420
      Index           =   1
      Left            =   5160
      Picture         =   "FormSetting.frx":D06E4
      Top             =   660
      Width           =   1545
   End
   Begin VB.Image ImageUpdate 
      Height          =   420
      Index           =   0
      Left            =   5160
      Picture         =   "FormSetting.frx":D2946
      Top             =   660
      Width           =   1545
   End
   Begin VB.Image ImageShield 
      Height          =   420
      Index           =   1
      Left            =   3600
      Picture         =   "FormSetting.frx":D4BA8
      Top             =   660
      Width           =   1545
   End
   Begin VB.Image ImageShield 
      Height          =   420
      Index           =   0
      Left            =   3600
      Picture         =   "FormSetting.frx":D6E0A
      Top             =   660
      Width           =   1545
   End
   Begin VB.Image ImageScan 
      Height          =   420
      Index           =   1
      Left            =   2040
      Picture         =   "FormSetting.frx":D906C
      Top             =   660
      Width           =   1545
   End
   Begin VB.Image ImageScan 
      Height          =   420
      Index           =   0
      Left            =   2040
      Picture         =   "FormSetting.frx":DB2CE
      Top             =   660
      Width           =   1545
   End
   Begin VB.Image ImageGeneral 
      Height          =   420
      Index           =   1
      Left            =   480
      Picture         =   "FormSetting.frx":DD530
      Top             =   660
      Width           =   1545
   End
   Begin VB.Image ImageGeneral 
      Height          =   420
      Index           =   0
      Left            =   480
      Picture         =   "FormSetting.frx":DF792
      Top             =   660
      Width           =   1545
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   2
      Left            =   8760
      Picture         =   "FormSetting.frx":E19F4
      Top             =   0
      Width           =   465
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   1
      Left            =   8760
      Picture         =   "FormSetting.frx":E2156
      Top             =   0
      Width           =   465
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   0
      Left            =   8760
      Picture         =   "FormSetting.frx":E28B8
      Top             =   0
      Width           =   465
   End
End
Attribute VB_Name = "FormSetting"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'****************************************************************
'
' Ty2yɱ�����
' http://www.ty2y.com/
'
' ������ô���
'
'****************************************************************
Option Explicit

'api����
Private Declare Function ReleaseCapture Lib "user32" () As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long

'���ȡ���ť
Private Sub CommandCancel_Click()
    Unload Me
End Sub

'ȷ����ť������������Ϣ
Private Sub CommandOK_Click()
    
    Dim sSettingsFile As String
    
    '������ü�¼�ļ�
    If Right(App.Path, 1) = "\" Then
        sSettingsFile = App.Path & "Settings.ini"
    Else
        sSettingsFile = App.Path & "\Settings.ini"
    End If
    
    '����������
    Call WriteIni(sSettingsFile, "Normal", "AutoRun", CheckAutoRun.value)
    
    If CheckAutoRun.value = 1 Then
        SetAutoRun
    Else
        StopAutoRun
    End If
    
    '�Զ���������ͼ��
    Call WriteIni(sSettingsFile, "Normal", "AutoTray", CheckAutoTray.value)
    
    'ɨ��ʱ����CPUռ��
    Call WriteIni(sSettingsFile, "Scan", "CheckLowCPU", CheckLowCPU.value)
    
    'ɨ�������ļ�
    Call WriteIni(sSettingsFile, "Scan", "ScanAllFiles", OptionScanAllFiles.value)
    
    'ɨ���ִ���ļ�
    Call WriteIni(sSettingsFile, "Scan", "ScanPeFiles", OptionScanPeFiles.value)
    
    '�Զ����
    Call WriteIni(sSettingsFile, "Scan", "ClearVirus", OptionClear.value)
    
    'ѯ��
    Call WriteIni(sSettingsFile, "Scan", "AlertVirus", OptionAlert.value)
    
    '����
    Call WriteIni(sSettingsFile, "Scan", "IgnoreVirus", OptionIgnore.value)
    
    '����״̬
    Call WriteIni(sSettingsFile, "Shield", "EnableShield", CheckEnableShield.value)
    If CheckEnableShield.value = 1 Then
        OnTimeProtectON
    End If
    
    '��������
    Call WriteIni(sSettingsFile, "Shield", "EnableAlertMessage", CheckEnableAlert.value)
    
    '�Զ��رշ�����ʾ��Ϣ
    Call WriteIni(sSettingsFile, "Shield", "AutoCloseAlertMessage", CheckAutoCloseAlert.value)
    
    '�Զ��رշ�����ʾ��ϢƵ��
    Call WriteIni(sSettingsFile, "Shield", "AutoCloseAlertMessageInterval", ComboAutoCloseAlertInterval.Text)
    
    '�����ȼ�
    If OptionNormalShieldLevel.value = True Then
        '1Ϊ��ͨ
        Call WriteIni(sSettingsFile, "Shield", "ShieldLevel", 1)
    Else
        '2Ϊ�ϸ�
        Call WriteIni(sSettingsFile, "Shield", "ShieldLevel", 2)
    End If
    
    '�Զ�����
    Call WriteIni(sSettingsFile, "Update", "AutoUpdate", CheckAutoUpdate.value)
    
    '�Զ�����Ƶ��
    Call WriteIni(sSettingsFile, "Update", "AutoUpdateIntervel", ComboAutoUpdateInterval.Text)
        
    DoEvents
    
    '����ɨ���������״̬
    Dim lAutoUpdate As Long
    lAutoUpdate = ReadIni(sSettingsFile, "Update", "AutoUpdate")
        
    '�Զ���������
    If lAutoUpdate = 1 Then
        With FormScan
            .LabelAutoUpdateState.Caption = "�Զ�������������"
            .ImageAutoUpdate(0).Visible = False
            .ImageAutoUpdate(1).Visible = True
        End With
    Else
        With FormScan
            .LabelAutoUpdateState.Caption = "�Զ��������ѽ���"
            .ImageAutoUpdate(0).Visible = True
            .ImageAutoUpdate(1).Visible = False
        End With
    End If
    
    '����״̬
    
     '����������
    Dim lAutorun As Long
    lAutorun = ReadIni(sSettingsFile, "Normal", "AutoRun")
    If lAutorun = 1 Then
        With FormScan
            .LabelAutorun.Caption = "������������������"
            .ImageAutoRun(0).Visible = False
            .ImageAutoRun(1).Visible = True
        End With
    Else
        With FormScan
            .LabelAutorun.Caption = "������������δ����"
            .ImageAutoRun(0).Visible = True
            .ImageAutoRun(1).Visible = False
        End With
    End If

    '�Զ���С��
    Dim lAutomin As Long
    lAutomin = ReadIni(sSettingsFile, "Normal", "AutoTray")
    If lAutomin = 1 Then
        With FormScan
            .LabelAutoMin.Caption = "������С����������"
            .ImageAutoMin(0).Visible = False
            .ImageAutoMin(1).Visible = True
        End With
    Else
        With FormScan
            .LabelAutoMin.Caption = "������С����δ����"
            .ImageAutoMin(0).Visible = True
            .ImageAutoMin(1).Visible = False
        End With
    End If
    
    '���ֲ���ʱ�Զ����
    Dim bClearVirus As Boolean
    bClearVirus = ReadIni(sSettingsFile, "Scan", "ClearVirus")
                        
    '���ֲ���ʱ��ʾ
    Dim bAlertVirus As Boolean
    bAlertVirus = ReadIni(sSettingsFile, "Scan", "AlertVirus")
                        
    '���ֲ���ʱ����
    Dim bIgnoreVirus As Boolean
    bIgnoreVirus = ReadIni(sSettingsFile, "Scan", "IgnoreVirus ")
    
    If bClearVirus = True Then
        FormScan.LabelActionWhenDetectVirus.Caption = "ɨ�赽��������ʽ���Զ����"
    End If
    
    If bAlertVirus = True Then
        FormScan.LabelActionWhenDetectVirus.Caption = "ɨ�赽��������ʽ��ѯ��"
    End If
    
    If bIgnoreVirus = True Then
        FormScan.LabelActionWhenDetectVirus.Caption = "ɨ�赽��������ʽ������"
    End If
                        
    
    Unload Me
    
    MsgBox "�����ѱ��档", vbInformation
    
    
End Sub

'������������
Private Sub Form_Load()
    ReSkinMe
    '��ʼ���ؼ�λ��
    PictureGeneral.Left = 480
    PictureGeneral.Top = 1200
    PictureScan.Left = PictureGeneral.Left
    PictureScan.Top = PictureGeneral.Top
    PictureShield.Left = PictureGeneral.Left
    PictureShield.Top = PictureGeneral.Top
    PictureUpdate.Left = PictureGeneral.Left
    PictureUpdate.Top = PictureGeneral.Top
    
    PictureGeneral.Visible = True
    PictureScan.Visible = False
    PictureShield.Visible = False
    PictureUpdate.Visible = False
    
    ImageGeneral(0).Visible = True
    ImageGeneral(1).Visible = False
    ImageScan(0).Visible = False
    ImageScan(1).Visible = True
    ImageShield(0).Visible = False
    ImageShield(1).Visible = True
    ImageUpdate(0).Visible = False
    ImageUpdate(1).Visible = True
    
    Dim I As Long
    For I = 0 To 2
        '��ʼ���ر��ťλ��
        With ImageExit(I)
            .Left = 8760
            .Top = 0
        End With
    Next
    
    '�ر��ť
    ImageExit(0).Visible = True
    ImageExit(1).Visible = False
    ImageExit(2).Visible = False
        
    '��ʾ�����Զ��ر�Ƶ��
    With ComboAutoCloseAlertInterval
        .AddItem "3"
        .AddItem "5"
        .AddItem "10"
        .AddItem "15"
    End With
    
    '�Զ�����Ƶ��
    With ComboAutoUpdateInterval
        .AddItem "1"
        .AddItem "3"
        .AddItem "5"
    End With
    
    Dim sSettingsFile As String
    
    '������ü�¼�ļ�
    If Right(App.Path, 1) = "\" Then
        sSettingsFile = App.Path & "Settings.ini"
    Else
        sSettingsFile = App.Path & "\Settings.ini"
    End If
    
    '�л���ɨ������
    ImageScan_Click (0)
    
    '��ȡ����������
     CheckAutoRun.value = ReadIni(sSettingsFile, "Normal", "AutoRun")
    
    '��ȡ�Զ���������ͼ������
    CheckAutoTray.value = ReadIni(sSettingsFile, "Normal", "AutoTray")
    
    '��ȡɨ��ʱ����CPUռ������
    CheckLowCPU.value = ReadIni(sSettingsFile, "Scan", "CheckLowCPU")
    
    '��ȡɨ�������ļ�����
    OptionScanAllFiles.value = ReadIni(sSettingsFile, "Scan", "ScanAllFiles")
    
    '��ȡɨ���ִ���ļ�����
    OptionScanPeFiles.value = ReadIni(sSettingsFile, "Scan", "ScanPeFiles")
    
    '��ȡ�Զ��������
    OptionClear.value = ReadIni(sSettingsFile, "Scan", "ClearVirus")
    
    '��ȡѯ������
    OptionAlert.value = ReadIni(sSettingsFile, "Scan", "AlertVirus")
    
    '��ȡ��������
    OptionIgnore.value = ReadIni(sSettingsFile, "Scan", "IgnoreVirus")
    
    '��ȡ����״̬
    CheckEnableShield.value = ReadIni(sSettingsFile, "Shield", "EnableShield")
    If CheckEnableShield.value = 1 Then
        OnTimeProtectON
    End If
    
    '�����ȼ�
    Dim ShieldLevel
    ShieldLevel = ReadIni(sSettingsFile, "Shield", "ShieldLevel")
    If ShieldLevel = 1 Then
        OptionNormalShieldLevel.value = True
    Else
        OptionHighShildLevel.value = True
    End If
   
    '��ȡ������������
    CheckEnableAlert.value = ReadIni(sSettingsFile, "Shield", "EnableAlertMessage")
    
    '�Զ��رշ�����ʾ��Ϣ
    CheckAutoCloseAlert.value = ReadIni(sSettingsFile, "Shield", "AutoCloseAlertMessage")
    
    '�Զ��رշ�����ʾ��ϢƵ��
    ComboAutoCloseAlertInterval.Text = ReadIni(sSettingsFile, "Shield", "AutoCloseAlertMessageInterval")
    
    '�Զ�����
    CheckAutoUpdate.value = ReadIni(sSettingsFile, "Update", "AutoUpdate")
    
    '�Զ�����Ƶ��
    ComboAutoUpdateInterval.Text = ReadIni(sSettingsFile, "Update", "AutoUpdateIntervel")
    

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

'Tab��һ������
Private Sub ImageGeneral_Click(Index As Integer)
    PictureGeneral.Visible = True
    PictureScan.Visible = False
    PictureShield.Visible = False
    PictureUpdate.Visible = False
    
    ImageGeneral(0).Visible = True
    ImageGeneral(1).Visible = False
    ImageScan(0).Visible = False
    ImageScan(1).Visible = True
    ImageShield(0).Visible = False
    ImageShield(1).Visible = True
    ImageUpdate(0).Visible = False
    ImageUpdate(1).Visible = True
End Sub

'Tab��ɨ������
Private Sub ImageScan_Click(Index As Integer)
    PictureGeneral.Visible = False
    PictureScan.Visible = True
    PictureShield.Visible = False
    PictureUpdate.Visible = False
    
    ImageGeneral(0).Visible = False
    ImageGeneral(1).Visible = True
    ImageScan(0).Visible = True
    ImageScan(1).Visible = False
    ImageShield(0).Visible = False
    ImageShield(1).Visible = True
    ImageUpdate(0).Visible = False
    ImageUpdate(1).Visible = True
End Sub

'Tab����������
Private Sub ImageShield_Click(Index As Integer)
    PictureGeneral.Visible = False
    PictureScan.Visible = False
    PictureShield.Visible = True
    PictureUpdate.Visible = False
    
    ImageGeneral(0).Visible = False
    ImageGeneral(1).Visible = True
    ImageScan(0).Visible = False
    ImageScan(1).Visible = True
    ImageShield(0).Visible = True
    ImageShield(1).Visible = False
    ImageUpdate(0).Visible = False
    ImageUpdate(1).Visible = True
End Sub

'Tab:��������
Private Sub ImageUpdate_Click(Index As Integer)
    PictureGeneral.Visible = False
    PictureScan.Visible = False
    PictureShield.Visible = False
    PictureUpdate.Visible = True
    
    ImageGeneral(0).Visible = False
    ImageGeneral(1).Visible = True
    ImageScan(0).Visible = False
    ImageScan(1).Visible = True
    ImageShield(0).Visible = False
    ImageShield(1).Visible = True
    ImageUpdate(0).Visible = True
    ImageUpdate(1).Visible = False
End Sub

Public Function ReSkinMe()
    With Me
        .Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Setting2.bmp")
        .ImageExit(0).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit0.bmp")
        .ImageExit(1).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit1.bmp")
        .ImageExit(2).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit2.bmp")
        .ImageGeneral(0).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\GeneralSetting0.bmp")
        .ImageGeneral(1).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\GeneralSetting1.bmp")
        .ImageScan(0).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\ScanSetting0.bmp")
        .ImageScan(1).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\ScanSetting1.bmp")
        .ImageShield(0).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\ShieldSetting0.bmp")
        .ImageShield(1).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\ShieldSetting1.bmp")
        .ImageUpdate(0).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\UpdateSetting0.bmp")
        .ImageUpdate(1).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\UpdateSetting1.bmp")
    End With
End Function
