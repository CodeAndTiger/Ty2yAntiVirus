VERSION 5.00
Begin VB.Form FormScan 
   BorderStyle     =   0  'None
   Caption         =   "Ty2yɱ�����"
   ClientHeight    =   7680
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   9780
   Icon            =   "FormScan.frx":0000
   LinkMode        =   1  'Source
   LinkTopic       =   "FormScan"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "FormScan.frx":57E2
   ScaleHeight     =   7680
   ScaleWidth      =   9780
   StartUpPosition =   1  '����������
   Begin VB.Timer TimerRightClickScan 
      Interval        =   10
      Left            =   7440
      Top             =   3960
   End
   Begin VB.Timer TimerUpdateRefresh 
      Interval        =   300
      Left            =   7920
      Top             =   3960
   End
   Begin VB.ListBox ListProcess 
      Height          =   240
      ItemData        =   "FormScan.frx":FA024
      Left            =   4200
      List            =   "FormScan.frx":FA026
      TabIndex        =   23
      Top             =   84000
      Visible         =   0   'False
      Width           =   2775
   End
   Begin VB.PictureBox PictureShield 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   2295
      Left            =   8880
      ScaleHeight     =   2295
      ScaleWidth      =   9135
      TabIndex        =   15
      Top             =   4320
      Width           =   9135
      Begin VB.TextBox TextShieldLog 
         BorderStyle     =   0  'None
         Height          =   1815
         Left            =   240
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   32
         Top             =   240
         Width           =   8775
      End
      Begin VB.Shape Shape2 
         BorderColor     =   &H00E0E0E0&
         Height          =   2070
         Left            =   105
         Top             =   105
         Width           =   9030
      End
   End
   Begin VB.PictureBox PictureSecurityState 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   2295
      Left            =   360
      Picture         =   "FormScan.frx":FA028
      ScaleHeight     =   2295
      ScaleWidth      =   9135
      TabIndex        =   13
      Top             =   4680
      Width           =   9135
      Begin VB.Image ImageEnableShield 
         Height          =   240
         Index           =   0
         Left            =   3600
         Picture         =   "FormScan.frx":142AEA
         Top             =   1440
         Width           =   240
      End
      Begin VB.Image ImageEnableShield 
         Height          =   240
         Index           =   1
         Left            =   3600
         Picture         =   "FormScan.frx":142E2C
         Top             =   1440
         Width           =   240
      End
      Begin VB.Image ImageAutoMin 
         Height          =   240
         Index           =   0
         Left            =   3600
         Picture         =   "FormScan.frx":14316E
         Top             =   1080
         Width           =   240
      End
      Begin VB.Image ImageAutoMin 
         Height          =   240
         Index           =   1
         Left            =   3600
         Picture         =   "FormScan.frx":1434B0
         Top             =   1080
         Width           =   240
      End
      Begin VB.Image ImageAutoRun 
         Height          =   240
         Index           =   0
         Left            =   3600
         Picture         =   "FormScan.frx":1437F2
         Top             =   720
         Width           =   240
      End
      Begin VB.Image ImageAutoRun 
         Height          =   240
         Index           =   1
         Left            =   3600
         Picture         =   "FormScan.frx":143B34
         Top             =   720
         Width           =   240
      End
      Begin VB.Image ImageShieldLevel 
         Height          =   240
         Index           =   2
         Left            =   3600
         Picture         =   "FormScan.frx":143E76
         Top             =   1800
         Width           =   240
      End
      Begin VB.Label LabelActionWhenDetectVirus 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "ɨ�赽��������ʽ"
         Height          =   180
         Left            =   3960
         TabIndex        =   30
         Top             =   1800
         Width           =   1620
      End
      Begin VB.Label LabelAutoMin 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "�Զ���С����"
         Height          =   180
         Left            =   3960
         TabIndex        =   29
         Top             =   1080
         Width           =   1080
      End
      Begin VB.Label LabelAutorun 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "������������"
         Height          =   180
         Left            =   3960
         TabIndex        =   28
         Top             =   720
         Width           =   1080
      End
      Begin VB.Label Label6 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "����汾��"
         Height          =   180
         Left            =   600
         TabIndex        =   27
         Top             =   360
         Width           =   900
      End
      Begin VB.Label LabelSoftwareVersion 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "software version"
         Height          =   180
         Left            =   1560
         TabIndex        =   26
         Top             =   360
         Width           =   1440
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "������汾��"
         Height          =   180
         Left            =   600
         TabIndex        =   25
         Top             =   720
         Width           =   1080
      End
      Begin VB.Label LabelSignatureVersion 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "signature version"
         Height          =   180
         Left            =   1680
         TabIndex        =   24
         Top             =   720
         Width           =   1530
      End
      Begin VB.Image ImageSignatureVersion 
         Height          =   240
         Left            =   240
         Picture         =   "FormScan.frx":1441B8
         Top             =   720
         Width           =   240
      End
      Begin VB.Image ImageSoftwareVersion 
         Height          =   240
         Left            =   240
         Picture         =   "FormScan.frx":1444FA
         Top             =   360
         Width           =   240
      End
      Begin VB.Image Image2 
         Height          =   2325
         Left            =   3240
         Picture         =   "FormScan.frx":14483C
         Top             =   120
         Width           =   180
      End
      Begin VB.Image ImageAutoUpdate 
         Height          =   240
         Index           =   1
         Left            =   3600
         Picture         =   "FormScan.frx":145E4A
         Top             =   360
         Width           =   240
      End
      Begin VB.Image ImageAutoUpdate 
         Height          =   240
         Index           =   0
         Left            =   3600
         Picture         =   "FormScan.frx":14618C
         Top             =   360
         Width           =   240
      End
      Begin VB.Label LabelEnableShield 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "����״̬��"
         Height          =   180
         Left            =   3960
         TabIndex        =   16
         Top             =   1440
         Width           =   900
      End
      Begin VB.Label LabelAutoUpdateState 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "�Զ�����"
         Height          =   180
         Left            =   3960
         TabIndex        =   14
         Top             =   360
         Width           =   720
      End
   End
   Begin VB.PictureBox PictureScanBottoms 
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   2535
      Left            =   240
      Picture         =   "FormScan.frx":1464CE
      ScaleHeight     =   2535
      ScaleWidth      =   9255
      TabIndex        =   12
      Top             =   1320
      Width           =   9255
      Begin VB.Label LabelLastDetectedSpywaresTitle 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "��⵽��������"
         ForeColor       =   &H00404040&
         Height          =   180
         Left            =   3960
         TabIndex        =   22
         Top             =   120
         Width           =   1260
      End
      Begin VB.Label LabelLastScanFilesTitle 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "ɨ���ļ�����"
         ForeColor       =   &H00404040&
         Height          =   180
         Left            =   2040
         TabIndex        =   21
         Top             =   120
         Width           =   1080
      End
      Begin VB.Label LabelLastScanUsedTimeTitle 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "�ϴ�ɨ����ʱ��"
         ForeColor       =   &H00404040&
         Height          =   180
         Left            =   120
         TabIndex        =   20
         Top             =   120
         Width           =   1260
      End
      Begin VB.Label LabelLastDetectedSpywares 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         ForeColor       =   &H000080FF&
         Height          =   180
         Left            =   5280
         TabIndex        =   19
         Top             =   120
         Width           =   90
      End
      Begin VB.Label LabelLastScanFiles 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         ForeColor       =   &H000080FF&
         Height          =   180
         Left            =   3240
         TabIndex        =   18
         Top             =   120
         Width           =   90
      End
      Begin VB.Label LabelLastScanUsedTime 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         ForeColor       =   &H000080FF&
         Height          =   180
         Left            =   1440
         TabIndex        =   17
         Top             =   120
         Width           =   90
      End
      Begin VB.Image ImageMemoryScan 
         Height          =   1950
         Index           =   1
         Left            =   0
         Picture         =   "FormScan.frx":153750
         Top             =   600
         Width           =   3030
      End
      Begin VB.Image ImageCustomerScan 
         Height          =   1950
         Index           =   1
         Left            =   6240
         OLEDropMode     =   1  'Manual
         Picture         =   "FormScan.frx":166C52
         Top             =   600
         Width           =   3030
      End
      Begin VB.Image ImageFullDiskScan 
         Height          =   1950
         Index           =   1
         Left            =   3120
         Picture         =   "FormScan.frx":17A154
         Top             =   600
         Width           =   3030
      End
      Begin VB.Image ImageCustomerScan 
         Height          =   1950
         Index           =   0
         Left            =   6240
         OLEDropMode     =   1  'Manual
         Picture         =   "FormScan.frx":18D656
         Top             =   600
         Width           =   3030
      End
      Begin VB.Image ImageFullDiskScan 
         Height          =   1950
         Index           =   0
         Left            =   3120
         Picture         =   "FormScan.frx":1A0B58
         Top             =   600
         Width           =   3030
      End
      Begin VB.Image ImageMemoryScan 
         Height          =   1950
         Index           =   0
         Left            =   0
         Picture         =   "FormScan.frx":1B405A
         Top             =   600
         Width           =   3030
      End
   End
   Begin VB.PictureBox PictureScanResult 
      Appearance      =   0  'Flat
      BackColor       =   &H80000005&
      BorderStyle     =   0  'None
      ForeColor       =   &H80000008&
      Height          =   2295
      Left            =   360
      ScaleHeight     =   2295
      ScaleWidth      =   9135
      TabIndex        =   11
      Top             =   4680
      Width           =   9135
      Begin VB.TextBox TextScanResult 
         BorderStyle     =   0  'None
         ForeColor       =   &H00404040&
         Height          =   1815
         Left            =   240
         Locked          =   -1  'True
         MultiLine       =   -1  'True
         TabIndex        =   31
         Top             =   240
         Width           =   8655
      End
      Begin VB.Shape Shape1 
         BorderColor     =   &H00E0E0E0&
         Height          =   2075
         Left            =   110
         Top             =   110
         Width           =   8915
      End
   End
   Begin VB.PictureBox PictureScanState 
      BackColor       =   &H00FFFFFF&
      BorderStyle     =   0  'None
      Height          =   2295
      Left            =   240
      ScaleHeight     =   2295
      ScaleWidth      =   9015
      TabIndex        =   1
      Top             =   1560
      Width           =   9015
      Begin Ty2yAntiVirus.Command CommandStop 
         Height          =   375
         Left            =   7080
         TabIndex        =   10
         Top             =   240
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
         Caption         =   "ֹͣ"
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "�ļ�������"
         Height          =   180
         Left            =   240
         TabIndex        =   9
         Top             =   600
         Width           =   900
      End
      Begin VB.Label LabelScanedFileCount 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "����"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   1200
         TabIndex        =   8
         Top             =   600
         Width           =   90
      End
      Begin VB.Label LabelTrojanFileCount 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         BeginProperty Font 
            Name            =   "����"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H00000000&
         Height          =   180
         Left            =   1200
         TabIndex        =   7
         Top             =   960
         Width           =   90
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "����������"
         Height          =   180
         Left            =   240
         TabIndex        =   6
         Top             =   960
         Width           =   900
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "��ʱ��"
         Height          =   180
         Left            =   240
         TabIndex        =   5
         Top             =   1320
         Width           =   540
      End
      Begin VB.Label LabelTimeUsed 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "0"
         Height          =   180
         Left            =   840
         TabIndex        =   4
         Top             =   1320
         Width           =   90
      End
      Begin VB.Label LabelNowScaning 
         BackStyle       =   0  'Transparent
         Caption         =   "ɨ��δ��ʼ"
         Height          =   180
         Left            =   1200
         TabIndex        =   3
         Top             =   240
         Width           =   5685
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackStyle       =   0  'Transparent
         Caption         =   "����ɨ�裺"
         Height          =   180
         Left            =   240
         TabIndex        =   2
         Top             =   240
         Width           =   900
      End
   End
   Begin VB.ListBox ListFolders 
      Height          =   420
      Left            =   11760
      Sorted          =   -1  'True
      TabIndex        =   0
      Top             =   240
      Visible         =   0   'False
      Width           =   1215
   End
   Begin VB.Image ImageHomePage 
      Height          =   240
      Left            =   480
      MouseIcon       =   "FormScan.frx":1C755C
      MousePointer    =   99  'Custom
      Picture         =   "FormScan.frx":1C76AE
      Top             =   7220
      Width           =   660
   End
   Begin VB.Image ImageSkin 
      Height          =   285
      Index           =   2
      Left            =   8040
      Picture         =   "FormScan.frx":1C7F30
      Top             =   0
      Width           =   465
   End
   Begin VB.Image ImageSkin 
      Height          =   285
      Index           =   1
      Left            =   8040
      Picture         =   "FormScan.frx":1C8692
      Top             =   0
      Width           =   465
   End
   Begin VB.Image ImageSkin 
      Height          =   285
      Index           =   0
      Left            =   8040
      Picture         =   "FormScan.frx":1C8DF4
      Top             =   0
      Width           =   465
   End
   Begin VB.Image ImageUpdate 
      Height          =   240
      Left            =   7680
      MouseIcon       =   "FormScan.frx":1C9556
      MousePointer    =   99  'Custom
      Picture         =   "FormScan.frx":1C96A8
      Top             =   7200
      Width           =   660
   End
   Begin VB.Image ImageSetting 
      Height          =   240
      Left            =   8640
      MouseIcon       =   "FormScan.frx":1C9F2A
      MousePointer    =   99  'Custom
      Picture         =   "FormScan.frx":1CA07C
      Top             =   7200
      Width           =   660
   End
   Begin VB.Image ImageSecurityState 
      Height          =   420
      Index           =   0
      Left            =   240
      Picture         =   "FormScan.frx":1CA8FE
      Top             =   4140
      Width           =   1545
   End
   Begin VB.Image ImageSecurityState 
      Height          =   420
      Index           =   1
      Left            =   240
      Picture         =   "FormScan.frx":1CCB60
      Top             =   4140
      Width           =   1545
   End
   Begin VB.Image ImageScanResult 
      Height          =   420
      Index           =   0
      Left            =   1800
      Picture         =   "FormScan.frx":1CEDC2
      Top             =   4140
      Width           =   1545
   End
   Begin VB.Image ImageScanResult 
      Height          =   420
      Index           =   1
      Left            =   1800
      Picture         =   "FormScan.frx":1D1024
      Top             =   4140
      Width           =   1545
   End
   Begin VB.Image ImageShield 
      Height          =   420
      Index           =   1
      Left            =   3360
      Picture         =   "FormScan.frx":1D3286
      Top             =   4140
      Width           =   1545
   End
   Begin VB.Image ImageShield 
      Height          =   420
      Index           =   0
      Left            =   3360
      Picture         =   "FormScan.frx":1D54E8
      Top             =   4140
      Width           =   1545
   End
   Begin VB.Image ImageMin 
      Height          =   285
      Index           =   0
      Left            =   8640
      Picture         =   "FormScan.frx":1D774A
      Top             =   0
      Width           =   465
   End
   Begin VB.Image ImageMin 
      Height          =   285
      Index           =   1
      Left            =   8640
      Picture         =   "FormScan.frx":1D7EAC
      Top             =   0
      Width           =   465
   End
   Begin VB.Image ImageMin 
      Height          =   285
      Index           =   2
      Left            =   8640
      Picture         =   "FormScan.frx":1D860E
      Top             =   0
      Width           =   465
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   0
      Left            =   9105
      Picture         =   "FormScan.frx":1D8D70
      Top             =   0
      Width           =   480
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   1
      Left            =   9120
      Picture         =   "FormScan.frx":1D94D2
      Top             =   0
      Width           =   480
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   2
      Left            =   9105
      Picture         =   "FormScan.frx":1D9C34
      Top             =   0
      Width           =   480
   End
End
Attribute VB_Name = "FormScan"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'****************************************************************
'
' Ty2yɱ�����
' http://www.ty2y.com/
'
' ɨ�財��
'
'****************************************************************
Option Explicit

'API����
Private Declare Function GetLogicalDriveStrings Lib "kernel32" Alias "GetLogicalDriveStringsA" (ByVal nBufferLength As Long, ByVal lpBuffer As String) As Long
Private Declare Function GetDriveType Lib "kernel32" Alias "GetDriveTypeA" (ByVal nDrive As String) As Long
Private Declare Function FindFirstFile Lib "kernel32" Alias "FindFirstFileA" (ByVal lpFileName As String, lpFindFileData As WIN32_FIND_DATA) As Long
Private Declare Function FindNextFile Lib "kernel32" Alias "FindNextFileA" (ByVal hFindFile As Long, lpFindFileData As WIN32_FIND_DATA) As Long
Private Declare Function FindClose Lib "kernel32" (ByVal hFindFile As Long) As Long
Private Declare Function DeleteFile Lib "kernel32" Alias "DeleteFileA" (ByVal lpFileName As String) As Long
Private Declare Function CopyFile Lib "kernel32" Alias "CopyFileA" (ByVal lpExistingFileName As String, ByVal lpNewFileName As String, ByVal bFailIfExists As Long) As Long
Private Declare Function ReleaseCapture Lib "user32" () As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function Process32First Lib "kernel32" (ByVal hSnapshot As Long, lppe As PROCESSENTRY32) As Long
Private Declare Function Process32Next Lib "kernel32" (ByVal hSnapshot As Long, lppe As PROCESSENTRY32) As Long
Private Declare Function CreateToolhelp32Snapshot Lib "kernel32" (ByVal dwFlags As Long, ByVal th32ProcessID As Long) As Long
Private Declare Function Module32First Lib "kernel32" (ByVal hSnapshot As Long, lpme As MODULEENTRY32) As Long
Private Declare Function Module32Next Lib "kernel32" (ByVal hSnapshot As Long, lpme As MODULEENTRY32) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long
Private Declare Function SetForegroundWindow Lib "user32" (ByVal hWnd As Long) As Long
Private Declare Function RegisterWindowMessage Lib "user32" Alias "RegisterWindowMessageA" (ByVal lpString As String) As Long
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Declare Function FindWindow Lib "user32" Alias "FindWindowA" (ByVal lpClassName As String, ByVal lpWindowName As String) As Long
Private Declare Function GetLongPathName Lib "kernel32" Alias "GetLongPathNameA" (ByVal lpszShortPath As String, ByVal lpszLongPath As String, ByVal cchBuffer As Long) As Long
Private Declare Function GetShortPathName Lib "kernel32" (ByVal lpszLongPath As String, ByVal lpszShortPath As String, ByVal cchBuffer As Long) As Long

'��������
Private Const MAX_PATH As Long = 260
Private Const DRIVE_REMOVABLE As Long = 2
Private Const DRIVE_FIXED As Long = 3
Private Const DRIVE_REMOTE As Long = 4
Private Const DRIVE_CDROM As Long = 5
Private Const DRIVE_RAMDISK As Long = 6

Private Const TH32CS_SNAPPROCESS = &H2&
Private Const TH32CS_SNAPMODULE = &H8
Private Const TH32CS_SNAPHEAPLIST = &H1
Private Const TH32CS_SNAPTHREAD = &H4
Private Const TH32CS_SNAPALL = (TH32CS_SNAPHEAPLIST Or TH32CS_SNAPPROCESS Or TH32CS_SNAPTHREAD Or TH32CS_SNAPMODULE)

Private Const FILE_ATTRIBUTE_DIRECTORY = &H10

'�Զ�������
Private Type FILETIME
    dwLowDateTime As Long
    dwHighDateTime As Long
End Type
        
Private Type WIN32_FIND_DATA
    dwFileAttributes As Long
    ftCreationTime As FILETIME
    ftLastAccessTime As FILETIME
    ftLastWriteTime As FILETIME
    nFileSizeHigh As Long
    nFileSizeLow As Long
    dwReserved0 As Long
    dwReserved1 As Long
    cFileName As String * MAX_PATH
    cAlternate As String * 14
End Type

Private Type PROCESSENTRY32
   dwSize As Long
   cntUsage As Long
   th32ProcessID As Long
   th32DefaultHeapID As Long
   th32ModuleID As Long
   cntThreads As Long
   th32ParentProcessID As Long
   pcPriClassBase As Long
   dwFlags As Long
   szExeFile As String * 260
End Type

Private Type MODULEENTRY32
    dwSize As Long
    th32ModuleID As Long
    th32ProcessID As Long
    GlblcntUsage As Long
    ProccntUsage As Long
    modBaseAddr As Long
    modBaseSize As Long
    hModule As Long
    szModule  As String * 255
    szExePath As String * 255
End Type

Private Type COPYDATASTRUCT
    dwData As Long
    cbData As Long
    lpData As Long
End Type


'ֹͣɨ���־
Dim bStopScanFlag As Boolean
Dim lScanedFiles As Long
Dim lTrojanFiles As Long
Dim dScanStartTime As Date

Private Sub CommandStop_Click()
    'ֹͣɨ���־
    bStopScanFlag = True
    
End Sub


' ������������
Private Sub Form_Load()
   
    '����OLE�Ϸ�
    ImageCustomerScan(0).OLEDropMode = 0
    ImageCustomerScan(1).OLEDropMode = 0
        
    '��ֹ�ظ�����
    If App.PrevInstance Then
        End
    End If
                
    Dim sSettingsFile As String
    
    '������ü�¼�ļ�
    If Right(App.Path, 1) = "\" Then
        sSettingsFile = App.Path & "Settings.ini"
    Else
        sSettingsFile = App.Path & "\Settings.ini"
    End If
    
    DoEvents
    
    '�Ƿ�����ر�
    bEnableUnloadForm = False
    
    '��ȡƤ��
    sSkin = ReadIni(sSettingsFile, "Normal", "Skin")
    DoEvents
    
    '����Ƥ��
    ReSkinAll
    
    '����������
    Dim lAutorun As Long
    lAutorun = ReadIni(sSettingsFile, "Normal", "AutoRun")
    If lAutorun = 1 Then
        SetAutoRun
    Else
        StopAutoRun
    End If
    DoEvents
    
    '�����������Ӧ�ó����в��ɼ�
    App.TaskVisible = False
    
    
    '�������������Ϊ�������Զ�����
    FormUpdate.Hide
    
    '����Ȩ��
    GetMorePrivilege
    DoEvents
        
    '����ͼ��
    AddTrayIcon
    
    DoEvents
    
    '�ؽ�����ͼ����Ϣ
    WM_TASKBARCREATED = RegisterWindowMessage("TaskbarCreated")
    
    'ʹ���ʹ�������ڴ�
    MiniUseMemory
    DoEvents
    
    Dim I As Long
    For I = 0 To 2
        '��ʼ����С���ťλ��
        With ImageMin(I)
            .Left = 8640
            .Top = 0
        End With
        '��ʼ���ر��ťλ��
        With ImageExit(I)
            .Left = 9105
            .Top = 0
        End With
        '��ʼ����֫�ťλ��
        With ImageSkin(I)
            .Left = 8040
            .Top = 0
        End With
    Next
    
    ImageSecurityState(0).Visible = True
    ImageSecurityState(1).Visible = False
    ImageScanResult(0).Visible = False
    ImageScanResult(1).Visible = True
    ImageShield(0).Visible = False
    ImageShield(1).Visible = True

    
    ImageMemoryScan(0).Visible = True
    ImageMemoryScan(1).Visible = False
    ImageFullDiskScan(0).Visible = True
    ImageFullDiskScan(1).Visible = False
    ImageCustomerScan(0).Visible = True
    ImageCustomerScan(1).Visible = False
    
    '��С���ť
    ImageMin(0).Visible = True
    ImageMin(1).Visible = False
    ImageMin(2).Visible = False
    '�ر��ť
    ImageExit(0).Visible = True
    ImageExit(1).Visible = False
    ImageExit(2).Visible = False
    '�����ť
    ImageSkin(0).Visible = True
    ImageSkin(1).Visible = False
    ImageSkin(2).Visible = False
    
    'ɨ�谴ť��״̬�ɼ�״̬
    PictureScanBottoms.Visible = True
    PictureScanState.Visible = False
       
    '�ϴ�ɨ����
    
    Dim sLascScanUsedTime As String
    
    '�ϴ�ɨ����ʱ
    sLascScanUsedTime = ReadIni(sSettingsFile, "History", "LastScanUsedTime")
    
    '��ʾ
    LabelLastScanUsedTime.Caption = sLascScanUsedTime
    LabelLastScanFiles.Caption = ReadIni(sSettingsFile, "History", "LastScanFiles") & "��"
    LabelLastDetectedSpywares.Caption = ReadIni(sSettingsFile, "History", "LastDetectedSpywares") & "��"
    
    LabelLastScanUsedTimeTitle.Left = 120
    LabelLastScanUsedTime.Left = LabelLastScanUsedTimeTitle.Left + LabelLastScanUsedTimeTitle.Width + 20
    LabelLastScanFilesTitle.Left = LabelLastScanUsedTime.Left + LabelLastScanUsedTime.Width + 200
    LabelLastScanFiles.Left = LabelLastScanFilesTitle.Left + LabelLastScanFilesTitle.Width + 20
    LabelLastDetectedSpywaresTitle.Left = LabelLastScanFiles.Left + LabelLastScanFiles.Width + 200
    LabelLastDetectedSpywares.Left = LabelLastDetectedSpywaresTitle.Left + LabelLastDetectedSpywaresTitle.Width + 20
    
    '��ȡ��������
    Dim lAutoUpdate As Long
    lAutoUpdate = ReadIni(sSettingsFile, "Update", "AutoUpdate")
        
    '�Զ���������
    If lAutoUpdate = 1 Then
        LabelAutoUpdateState.Caption = "�Զ�������������"
        ImageAutoUpdate(0).Visible = False
        ImageAutoUpdate(1).Visible = True
    Else
        LabelAutoUpdateState.Caption = "�Զ��������ѽ���"
        ImageAutoUpdate(0).Visible = True
        ImageAutoUpdate(1).Visible = False
    End If
    
    '����״̬
    Dim lEnableShield As Long
    lEnableShield = ReadIni(sSettingsFile, "Shield", "EnableShield")
    If lEnableShield = 1 Then
        LabelEnableShield = "����״̬���ѿ���"
        ImageEnableShield(0).Visible = False
        ImageEnableShield(1).Visible = False
    
        OnTimeProtectON
    
    Else
        LabelEnableShield = "����״̬��δ����"
        ImageEnableShield(0).Visible = True
        ImageEnableShield(1).Visible = False
    
    End If
    
    '����������
    If lAutorun = 1 Then
        LabelAutorun.Caption = "������������������"
        ImageAutoRun(0).Visible = False
        ImageAutoRun(1).Visible = True
    Else
        LabelAutorun.Caption = "������������δ����"
        ImageAutoRun(0).Visible = True
        ImageAutoRun(1).Visible = False
    End If

    '�Զ���С��
    Dim lAutomin As Long
    lAutomin = ReadIni(sSettingsFile, "Normal", "AutoTray")
    If lAutomin = 1 Then
        LabelAutoMin.Caption = "������С����������"
        ImageAutoMin(0).Visible = False
        ImageAutoMin(1).Visible = True
    Else
        LabelAutoMin.Caption = "������С����δ����"
        ImageAutoMin(0).Visible = True
        ImageAutoMin(1).Visible = False
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
        LabelActionWhenDetectVirus.Caption = "ɨ�赽��������ʽ���Զ����"
    End If
    
    If bAlertVirus = True Then
        LabelActionWhenDetectVirus.Caption = "ɨ�赽��������ʽ��ѯ��"
    End If
    
    If bIgnoreVirus = True Then
        LabelActionWhenDetectVirus.Caption = "ɨ�赽��������ʽ������"
    End If
                        
    PictureScanResult.Left = PictureSecurityState.Left
    PictureScanResult.Top = PictureSecurityState.Top
    PictureShield.Left = PictureSecurityState.Left
    PictureShield.Top = PictureSecurityState.Top
    
    '��ȫ״̬
    PictureSecurityState.Visible = True
    'ɨ����
    PictureScanResult.Visible = False
    '������¼
    PictureShield.Visible = False

    
    
    '���໯������Ϣ
    lSubClassOldAddress = GetWindowLong(FormScan.hWnd, -4)
    SetWindowLong hWnd, -4, AddressOf SubClassMessage
    
    '�Զ���С��
    Dim lAutoTray As Long
    lAutoTray = ReadIni(sSettingsFile, "Normal", "AutoTray")
    
    If lAutoTray = 1 Then
        Me.Hide
    Else
        '��ʼ��λ��
        With Me
            .Top = (Screen.Height - .Height) / 2
            .Left = (Screen.Width - .Width) / 2
            .Show
        End With
    End If
    
    MousePointer = 11
    ImageMemoryScan(0).Enabled = False
    ImageMemoryScan(1).Enabled = False
    ImageFullDiskScan(0).Enabled = False
    ImageFullDiskScan(1).Enabled = False
    ImageCustomerScan(0).Enabled = False
    ImageCustomerScan(1).Enabled = False
    
    '����������
    LoadSignatures
    
    MousePointer = 0
    ImageMemoryScan(0).Enabled = True
    ImageMemoryScan(1).Enabled = True
    ImageFullDiskScan(0).Enabled = True
    ImageFullDiskScan(1).Enabled = True
    ImageCustomerScan(0).Enabled = True
    ImageCustomerScan(1).Enabled = True
    DoEvents
    
    '����OLE�Ϸ�
    ImageCustomerScan(0).OLEDropMode = 1
    ImageCustomerScan(1).OLEDropMode = 1
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
    '��С���ť
    ImageMin(0).Visible = True
    ImageMin(1).Visible = False
    ImageMin(2).Visible = False
    '�ر��ť
    ImageExit(0).Visible = True
    ImageExit(1).Visible = False
    ImageExit(2).Visible = False
    '�����ť
    ImageSkin(0).Visible = True
    ImageSkin(1).Visible = False
    ImageSkin(2).Visible = False
    
    ImageMemoryScan(0).Visible = True
    ImageMemoryScan(1).Visible = False
    ImageFullDiskScan(0).Visible = True
    ImageFullDiskScan(1).Visible = False
    ImageCustomerScan(0).Visible = True
    ImageCustomerScan(1).Visible = False
End Sub

Private Sub Form_Unload(Cancel As Integer)
    If bEnableUnloadForm = False Then
        Cancel = 1
        Me.Hide
    End If
End Sub

'�Զ���ɨ��
Private Sub ImageCustomerScan_Click(Index As Integer)
    
    '�˳��˵�������
    FormMenu.m_Exit.Enabled = False
    
    'ѡ��Ŀ¼���Ƿ����ɨ��
    bDoCustmerScan = True
    
    'ѡ��Ŀ¼
    FormSelectFolders.Show vbModal
    
    'ΪFalse��ʾ�û�ѡ��Ŀ¼ʱ�����˹رգ���ɨ�裬ֱ���˳�
    If bDoCustmerScan = False Then
    
        '�˳��˵�����
        FormMenu.m_Exit.Enabled = True
        
        Exit Sub
    End If
    
    '�����б���ʾ
    ImageScanResult_Click (0)
    
    'ɨ�谴ť��״̬�ɼ�״̬
    PictureScanBottoms.Visible = False
    PictureScanState.Visible = True
    
    
    Dim sSettingsFile As String
    '������ü�¼�ļ�
    If Right(App.Path, 1) = "\" Then
        sSettingsFile = App.Path & "Settings.ini"
    Else
        sSettingsFile = App.Path & "\Settings.ini"
    End If
    
    '��ȡɨ��ʱ����CPUռ������
    Dim lLowCPU As Long
    lLowCPU = ReadIni(sSettingsFile, "Scan", "CheckLowCPU")
    If lLowCPU = 1 Then
        '���õ�ǰ�������ȼ�Ϊ���ڱ�׼
        Call SetProcessPriority(16384)
    End If
    
    '���ǰ��ɨ����
    TextScanResult.Text = ""
    
    'ֹͣɨ���־
    bStopScanFlag = False
    'ɨ���ļ���
    lScanedFiles = 0
    '������
    lTrojanFiles = 0
    
    LabelScanedFileCount.Caption = 0
    LabelTrojanFileCount.Caption = 0
    
    ListFolders.Clear
    '�Զ���ɨ�裺���ɨ�����
    ListFolders.AddItem Left(FormSelectFolders.DriveScanTarget.Drive, 2) & "\"
    
    'ɨ�迪ʼʱ��
    dScanStartTime = Time
    
    Do While ListFolders.ListCount <> 0
        DoEvents
        
        '��ʼɨ��
        ScanFolder ListFolders.List(0)
        
        '��һ��������ɺ�ɾ����һ��
        ListFolders.RemoveItem 0
        
        '�û�ֹͣɨ��
        If bStopScanFlag = True Then
            Exit Do
        End If
    Loop
    
    'ɨ�����
    Call ShowAndRecordScanResult
    
    If bStopScanFlag = True Then
        With FormScanFinish
            .LabelTitle.Caption = "ɨ����ֹ"
            .LabelMessage.Caption = "��ɨ�� " & lScanedFiles & " ���ļ������� " & lTrojanFiles & " ��������"
            .Show vbModal
        End With
    Else
        With FormScanFinish
            .LabelTitle.Caption = "ɨ�����"
            .LabelMessage.Caption = "��ɨ�� " & lScanedFiles & " ���ļ������� " & lTrojanFiles & " ��������"
            .Show vbModal
        End With
    End If
    
    'ɨ�谴ť��״̬�ɼ�״̬
    PictureScanBottoms.Visible = True
    PictureScanState.Visible = False
    
    '���õ�ǰ�������ȼ�Ϊ��׼
    Call SetProcessPriority(32)

    LabelNowScaning.Caption = "ɨ�������"
    
    '�˳��˵�����
    FormMenu.m_Exit.Enabled = True
    
    'ʹ���ʹ�������ڴ�
    MiniUseMemory
End Sub

Private Sub ImageCustomerScan_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    ImageMemoryScan(0).Visible = True
    ImageMemoryScan(1).Visible = False
    ImageFullDiskScan(0).Visible = True
    ImageFullDiskScan(1).Visible = False
    ImageCustomerScan(0).Visible = False
    ImageCustomerScan(1).Visible = True
End Sub

Private Sub ImageCustomerScan_OLEDragDrop(Index As Integer, Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
     
    '�˳��˵�������
    FormMenu.m_Exit.Enabled = False
 
    '�����б���ʾ
    ImageScanResult_Click (0)
    
    'ɨ�谴ť��״̬�ɼ�״̬
    PictureScanBottoms.Visible = False
    PictureScanState.Visible = True
    
    Dim sSettingsFile As String
    '������ü�¼�ļ�
    If Right(App.Path, 1) = "\" Then
        sSettingsFile = App.Path & "Settings.ini"
    Else
        sSettingsFile = App.Path & "\Settings.ini"
    End If
    
    '��ȡɨ��ʱ����CPUռ������
    Dim lLowCPU As Long
    lLowCPU = ReadIni(sSettingsFile, "Scan", "CheckLowCPU")
    If lLowCPU = 1 Then
        '���õ�ǰ�������ȼ�Ϊ���ڱ�׼
        Call SetProcessPriority(16384)
    End If
    
    '���ǰ��ɨ����
    TextScanResult.Text = ""
    
    'ֹͣɨ���־
    bStopScanFlag = False
    'ɨ���ļ���
    lScanedFiles = 0
    '������
    lTrojanFiles = 0
    
    LabelScanedFileCount.Caption = 0
    LabelTrojanFileCount.Caption = 0
        
    'ɨ�迪ʼʱ��
    dScanStartTime = Time
    
    Dim sFilename
    For Each sFilename In Data.Files
        DoEvents
        If GetAttr(sFilename) And vbDirectory Then
            
            '���Ҫɨ���Ŀ¼
            If Right(sFilename, 1) = "\" Then
                'Ŀ¼
                ListFolders.AddItem sFilename
            Else
                'Ŀ¼
                ListFolders.AddItem sFilename & "\"
            End If
                    
            Do While ListFolders.ListCount <> 0
                DoEvents
                        
                '��ʼɨ��
                OleScanFolder ListFolders.List(0)
                        
                '��һ��������ɺ�ɾ����һ��
                ListFolders.RemoveItem 0
                        
                '�û�ֹͣɨ��
                If bStopScanFlag = True Then
                    Exit Do
                End If
            Loop
            
        Else
            DoEvents
            
            'ɨ���ļ�
            Call OleScanFile(sFilename)
        End If
        
    Next
    
    'ɨ�����
    Call ShowAndRecordScanResult
    
    If bStopScanFlag = True Then
        With FormScanFinish
            .LabelTitle.Caption = "ɨ����ֹ"
            .LabelMessage.Caption = "��ɨ�� " & lScanedFiles & " ���ļ������� " & lTrojanFiles & " ��������"
            .Show vbModal
        End With
    Else
        With FormScanFinish
            .LabelTitle.Caption = "ɨ�����"
            .LabelMessage.Caption = "��ɨ�� " & lScanedFiles & " ���ļ������� " & lTrojanFiles & " ��������"
            .Show vbModal
        End With
    End If
    
    'ɨ�谴ť��״̬�ɼ�״̬
    PictureScanBottoms.Visible = True
    PictureScanState.Visible = False
    
    '���õ�ǰ�������ȼ�Ϊ��׼
    Call SetProcessPriority(32)

    LabelNowScaning.Caption = "ɨ�������"
    
    '�˳��˵�����
    FormMenu.m_Exit.Enabled = True
    
    'ʹ���ʹ�������ڴ�
    MiniUseMemory
End Sub

Private Sub ImageExit_Click(Index As Integer)
   
    Me.Hide
End Sub

'ȫ��ɨ��
Private Sub ImageFullDiskScan_Click(Index As Integer)
    
    '�˳��˵�������
    FormMenu.m_Exit.Enabled = False
    
    '�����б���ʾ
    ImageScanResult_Click (0)
    
    'ɨ�谴ť��״̬�ɼ�״̬
    PictureScanBottoms.Visible = False
    PictureScanState.Visible = True
    
    
    Dim sSettingsFile As String
    '������ü�¼�ļ�
    If Right(App.Path, 1) = "\" Then
        sSettingsFile = App.Path & "Settings.ini"
    Else
        sSettingsFile = App.Path & "\Settings.ini"
    End If
    
    '��ȡɨ��ʱ����CPUռ������
    Dim lLowCPU As Long
    lLowCPU = ReadIni(sSettingsFile, "Scan", "CheckLowCPU")
    If lLowCPU = 1 Then
        '���õ�ǰ�������ȼ�Ϊ���ڱ�׼
        Call SetProcessPriority(16384)
    End If
    
    '���ǰ��ɨ����
    TextScanResult.Text = ""
    
    'ֹͣɨ���־
    bStopScanFlag = False
    'ɨ���ļ���
    lScanedFiles = 0
    '������
    lTrojanFiles = 0
    
    LabelScanedFileCount.Caption = 0
    LabelTrojanFileCount.Caption = 0
    
    '���ɨ���б�
    ListFolders.Clear
    
    Dim sDrive As String
    sDrive = String(256, Chr(0))
    
    Dim sDriveID As String
    
    'ȡ�ô��̴�
    Call GetLogicalDriveStrings(256, sDrive)
    
    '���ع����̷�������,ע������step��4
    Dim I As Long
    For I = 1 To 100 Step 4
        sDriveID = Mid(sDrive, I, 3)
        If sDriveID = Chr(0) & Chr(0) & Chr(0) Then
            'û���̷�,��ʱ�˳�ѭ��
            Exit For
        Else
            '����̷�
            ListFolders.AddItem Left(sDriveID, 2)
            
        End If
    Next I
    
    'ɨ�迪ʼʱ��
    dScanStartTime = Time
    
    Do While ListFolders.ListCount <> 0
        DoEvents
        
        '��ʼɨ��
        ScanFolder ListFolders.List(0) & "\"
        
        '��һ��������ɺ�ɾ����һ��
        ListFolders.RemoveItem 0
        
        '�û�ֹͣɨ��
        If bStopScanFlag = True Then
            Exit Do
        End If
    Loop
    
    'ɨ�����
    Call ShowAndRecordScanResult
    
    If bStopScanFlag = True Then
        With FormScanFinish
            .LabelTitle.Caption = "ɨ����ֹ"
            .LabelMessage.Caption = "��ɨ�� " & lScanedFiles & " ���ļ������� " & lTrojanFiles & " ��������"
            .Show vbModal
        End With
    Else
        With FormScanFinish
            .LabelTitle.Caption = "ɨ�����"
            .LabelMessage.Caption = "��ɨ�� " & lScanedFiles & " ���ļ������� " & lTrojanFiles & " ��������"
            .Show vbModal
        End With
    End If
    
    '���õ�ǰ�������ȼ�Ϊ��׼
    Call SetProcessPriority(32)

    'ɨ�谴ť��״̬�ɼ�״̬
    PictureScanBottoms.Visible = True
    PictureScanState.Visible = False
    
    LabelNowScaning.Caption = "ɨ�������"
    
    '�˳��˵�����
    FormMenu.m_Exit.Enabled = True
    
    'ʹ���ʹ�������ڴ�
    MiniUseMemory
End Sub

Private Sub ImageFullDiskScan_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    ImageMemoryScan(0).Visible = True
    ImageMemoryScan(1).Visible = False
    ImageFullDiskScan(0).Visible = False
    ImageFullDiskScan(1).Visible = True
    ImageCustomerScan(0).Visible = True
    ImageCustomerScan(1).Visible = False
End Sub

'�����Ҫ����
Private Sub ImageHomePage_Click()
    Call ShellExecute(Me.hWnd, "open", "http://www.ty2y.com/", 0, 0, 1)
End Sub

'����ɨ��
Private Sub ImageMemoryScan_Click(Index As Integer)
    
    '�˳��˵�������
    FormMenu.m_Exit.Enabled = False
    
    '�����б���ʾ
    ImageScanResult_Click (0)
    
    'ɨ�谴ť��״̬�ɼ�״̬
    PictureScanBottoms.Visible = False
    PictureScanState.Visible = True
    
    Dim sSettingsFile As String
    '������ü�¼�ļ�
    If Right(App.Path, 1) = "\" Then
        sSettingsFile = App.Path & "Settings.ini"
    Else
        sSettingsFile = App.Path & "\Settings.ini"
    End If
    
    '��ȡɨ��ʱ����CPUռ������
    Dim lLowCPU As Long
    lLowCPU = ReadIni(sSettingsFile, "Scan", "CheckLowCPU")
    If lLowCPU = 1 Then
        '���õ�ǰ�������ȼ�Ϊ���ڱ�׼
        Call SetProcessPriority(16384)
    End If
    
    '���ǰ��ɨ����
    TextScanResult.Text = ""
    
    'ֹͣɨ���־
    bStopScanFlag = False
    'ɨ���ļ���
    lScanedFiles = 0
    '������
    lTrojanFiles = 0
    
    LabelScanedFileCount.Caption = 0
    LabelTrojanFileCount.Caption = 0
    
    'ɨ�迪ʼʱ��
    dScanStartTime = Time
    
    
    Dim lProcess As Long
    'ȡ��ϵͳ����
    lProcess = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0)
    
    '���������˳�
    If lProcess = 0 Then
        MsgBox "�޷���ȡ�ڴ棬��ȷ�����㹻��Ȩ��", vbInformation
        Exit Sub
    End If
    
    Dim uProcess As PROCESSENTRY32
    uProcess.dwSize = Len(uProcess)
    
    'ö�ٽ����б�
    If Process32First(lProcess, uProcess) Then
        Do
            '�û�ֹͣɨ��
            If bStopScanFlag = True Then
                Exit Do
            End If
            
            'ö�ٽ���ģ��
            Dim lModule As Long
            lModule = CreateToolhelp32Snapshot(TH32CS_SNAPMODULE, uProcess.th32ProcessID)
            
            Dim fAlertForm As New FormAlertVirus
            
            If lModule <> -1 Then
                Dim ModEntry As MODULEENTRY32
                ModEntry.dwSize = LenB(ModEntry)
                ModEntry.szExePath = ""
                
                'ȡ��ģ��
                If Module32First(lModule, ModEntry) Then
                    
                    Do
                        '�û�ֹͣɨ��
                        If bStopScanFlag = True Then
                            Exit Do
                        End If
                        
                        DoEvents
                        Dim sFile As String
                        
                        '��ȡ�ļ�ȫ·��
                        sFile = TrimNull(ModEntry.szExePath)
                    
                        'ɨ��ȫ���ļ���PE�ļ�
                        Dim bScanAllFile As Boolean
                        bScanAllFile = ReadIni(sSettingsFile, "Scan", "ScanAllFiles")
                        
                        '���ֲ���ʱ�Զ����
                        Dim bClearVirus As Boolean
                        bClearVirus = ReadIni(sSettingsFile, "Scan", "ClearVirus")
                        
                        '���ֲ���ʱ��ʾ
                        Dim bAlertVirus As Boolean
                        bAlertVirus = ReadIni(sSettingsFile, "Scan", "AlertVirus")
                        
                        '���ֲ���ʱ����
                        Dim bIgnoreVirus As Boolean
                        bIgnoreVirus = ReadIni(sSettingsFile, "Scan", "IgnoreVirus ")
                        
                        If bScanAllFile = True Then
                        
                            'ɨ���ļ���
                            lScanedFiles = lScanedFiles + 1
                            LabelScanedFileCount.Caption = lScanedFiles
                            
                            'ɨ���ʱ
                            LabelTimeUsed.Caption = CDate(Time - dScanStartTime)
                            
                            '����ɨ����ļ�
                            If Len(sFile) > 60 Then
                                LabelNowScaning.Caption = Left(sFile, 47) & "..." & Right(sFile, 10)
                            Else
                                LabelNowScaning.Caption = sFile
                            End If
                            
                            'ɨ��
                            Dim sScanResult As String
                            sScanResult = ScanFile(sFile)
                            
                            '�����������ֵ
                            Dim lDeleteFileReturn As Long
                            
                            '��ǰ·��
                            Dim sTempAppPath As String
                            '�����ļ�
                            Dim sTargetFileName As String
                            '�����ļ�����
                            Dim lCopyFileReturn As Long
                            
                            '��鲢��ʾɨ����
                            If sScanResult <> "" Then
                                '���ֲ�����
                                lTrojanFiles = lTrojanFiles + 1
                                LabelTrojanFileCount.Caption = lTrojanFiles
                                '����
                                If bIgnoreVirus = True Then
                                    With TextScanResult
                                        .Text = .Text & sFile & " " & sScanResult & "" & "δ���" & vbCrLf
                                    End With
                                End If
                                
                                '�Զ����
                                If bClearVirus = True Then
                                    '�������
                                    lDeleteFileReturn = DeleteFile(sFile)
                                    If lDeleteFileReturn <> 0 Then
                                        With TextScanResult
                                            .Text = .Text & sFile & " " & sScanResult & "" & "�����" & vbCrLf
                                        End With
                                    Else
                                        With TextScanResult
                                            .Text = .Text & sFile & " " & sScanResult & "" & "���ʧ��" & vbCrLf
                                        End With
                                    End If
                                End If
                                
                               
                                '��ʾ
                                If bAlertVirus = True Then
                                    
                                    SetForegroundWindow FormScan.hWnd
                                    
                                    With fAlertForm
                                        .LabelFile = sFile
                                        .LabelVirusName = sScanResult
                                        .Show vbModal
                                    End With
                                End If
                                
                            End If
                        Else
                            '�ж��ļ�����
                            If UCase(Right(sFile, 4)) = UCase(".dll") _
                            Or UCase(Right(sFile, 4)) = UCase(".exe") _
                            Or UCase(Right(sFile, 4)) = UCase(".com") _
                            Or UCase(Right(sFile, 4)) = UCase(".ocx") _
                            Or UCase(Right(sFile, 4)) = UCase(".scr") _
                            Then
                            
                                'ɨ���ļ���
                                lScanedFiles = lScanedFiles + 1
                                LabelScanedFileCount.Caption = lScanedFiles
                                
                                'ɨ���ʱ
                                LabelTimeUsed.Caption = CDate(Time - dScanStartTime)
                                
                                '����ɨ����ļ�
                                If Len(sFile) > 60 Then
                                    LabelNowScaning.Caption = Left(sFile, 47) & "..." & Right(sFile, 10)
                                Else
                                    LabelNowScaning.Caption = sFile
                                End If
                                'ɨ��
                                sScanResult = ScanFile(sFile)
                                
                                '��鲢��ʾɨ����
                                If sScanResult <> "" Then
                                    '���ֲ�����
                                    lTrojanFiles = lTrojanFiles + 1
                                    LabelTrojanFileCount.Caption = lTrojanFiles
                                    '����
                                    If bIgnoreVirus = True Then
                                        With TextScanResult
                                            .Text = .Text & sFile & " " & sScanResult & "" & "δ���" & vbCrLf
                                        End With
                                    End If
                                    
                                    '�Զ����
                                    If bClearVirus = True Then
                                        '�������
                                        lDeleteFileReturn = DeleteFile(sFile)
                                        If lDeleteFileReturn <> 0 Then
                                            With TextScanResult
                                                .Text = .Text & sFile & " " & sScanResult & "" & "�����" & vbCrLf
                                            End With
                                        Else
                                            With TextScanResult
                                                .Text = .Text & sFile & " " & sScanResult & "" & "���ʧ��" & vbCrLf
                                            End With
                                        End If
                                    End If
                                    
                                    
                                    
                                    '��ʾ
                                    If bAlertVirus = True Then
                                    
                                        SetForegroundWindow FormScan.hWnd
                                    
                                        With fAlertForm
                                            .LabelFile = sFile
                                            .LabelVirusName = sScanResult
                                            .Show vbModal
                                        End With
                                    End If
                                End If
                                
                            End If
                        End If
                        
                    Loop While Module32Next(lModule, ModEntry)
                End If
                
                '�ر�ģ��ö�پ��
                CloseHandle lModule
                
            End If
        Loop While Process32Next(lProcess, uProcess)
        
        '�رս���ö�پ��
        CloseHandle lProcess
    End If
    
    'ɨ�����
    Call ShowAndRecordScanResult
    
    If bStopScanFlag = True Then
        
        With FormScanFinish
            .LabelTitle.Caption = "ɨ����ֹ"
            .LabelMessage.Caption = "��ɨ�� " & lScanedFiles & " ���ļ������� " & lTrojanFiles & " ��������"
            .Show vbModal
        End With
    Else
        With FormScanFinish
            .LabelTitle.Caption = "ɨ�����"
            .LabelMessage.Caption = "��ɨ�� " & lScanedFiles & " ���ļ������� " & lTrojanFiles & " ��������"
            .Show vbModal
        End With
    End If
    
    'ɨ�谴ť��״̬�ɼ�״̬
    PictureScanBottoms.Visible = True
    PictureScanState.Visible = False
    
    '���õ�ǰ�������ȼ�Ϊ��׼
    Call SetProcessPriority(32)
    
    LabelNowScaning.Caption = "ɨ�������"

    
    '�˳��˵�����
    FormMenu.m_Exit.Enabled = True
    
    'ʹ���ʹ�������ڴ�
    MiniUseMemory
    
End Sub

Private Sub ImageMemoryScan_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    ImageMemoryScan(0).Visible = False
    ImageMemoryScan(1).Visible = True
    ImageFullDiskScan(0).Visible = True
    ImageFullDiskScan(1).Visible = False
    ImageCustomerScan(0).Visible = True
    ImageCustomerScan(1).Visible = False
End Sub

Private Sub ImageMin_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    '��С���ť״̬
    ImageMin(0).Visible = False
    ImageMin(1).Visible = True
    ImageMin(2).Visible = False
End Sub

Private Sub ImageMin_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    '��С���ť״̬
    ImageMin(0).Visible = False
    ImageMin(1).Visible = False
    ImageMin(2).Visible = True
End Sub

Private Sub ImageMin_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    '��С������ť
    If ImageMin(2).Visible = True Then
        '������С����Ϣ
        SendMessage Me.hWnd, &H112, &HF020&, 0
    End If
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

'****************************************************************
'
' ɨ��Ŀ¼�������ļ������Ҳ���
' ������sFolder�ļ���·�����޷���ֵ
'
'****************************************************************
Public Sub ScanFolder(sFolder As String)
        
    '�������Զ���ṹ
    Dim uWFD As WIN32_FIND_DATA
    '�ļ�
    Dim sFile  As String
    'Ŀ¼
    Dim sDir As String
    '�������
    Dim lSerachHwnd As Long
    Dim lSerachNextHwnd As Long
    
    '������ɨ����
    Dim sScanResult As String
    
    lSerachHwnd = FindFirstFile(sFolder & "*.*", uWFD)
    
    '�����ļ���Ŀ¼
    Do
        DoEvents
        
        'ֹͣɨ��
        If bStopScanFlag = True Then
            Exit Do
        End If
        
        '�����Ŀ¼
        If uWFD.dwFileAttributes And FILE_ATTRIBUTE_DIRECTORY Then
            
            '�ж��Ƿ��Ǹ�Ŀ¼���ϼ�Ŀ¼��
            If Left(uWFD.cFileName, 1) <> "." And Left(uWFD.cFileName, 2) <> ".." Then
                
                'ȡ��·��
                sDir = sFolder & TrimNull(uWFD.cFileName)
                '��ӵ���ɨ��Ŀ¼
                If Right(sDir, 1) = "\" Then
                    ListFolders.AddItem sDir
                Else
                    ListFolders.AddItem sDir & "\"
                End If
            End If
            
        '������ļ�
        Else
            '��ȡ�ļ�ȫ·��
            sFile = sFolder & TrimNull(uWFD.cFileName)
            sFile = Replace(sFile, "\\", "\")
            
            '������ü�¼�ļ�
            Dim sSettingsFile As String
            If Right(App.Path, 1) = "\" Then
                sSettingsFile = App.Path & "Settings.ini"
            Else
                sSettingsFile = App.Path & "\Settings.ini"
            End If
            
            'ɨ��ȫ���ļ���PE�ļ�
            Dim bScanAllFile As Boolean
            bScanAllFile = ReadIni(sSettingsFile, "Scan", "ScanAllFiles")
            
            '���ֲ���ʱ�Զ����
            Dim bClearVirus As Boolean
            bClearVirus = ReadIni(sSettingsFile, "Scan", "ClearVirus")
            
            '���ֲ���ʱ��ʾ
            Dim bAlertVirus As Boolean
            bAlertVirus = ReadIni(sSettingsFile, "Scan", "AlertVirus")
            
            '���ֲ���ʱ����
            Dim bIgnoreVirus As Boolean
            bIgnoreVirus = ReadIni(sSettingsFile, "Scan", "IgnoreVirus ")
            
           
            Dim fAlertForm As New FormAlertVirus
            
            If bScanAllFile = True Then
            
                'ɨ���ļ���
                lScanedFiles = lScanedFiles + 1
                LabelScanedFileCount.Caption = lScanedFiles
                
                'ɨ���ʱ
                LabelTimeUsed.Caption = CDate(Time - dScanStartTime)
                
                '����ɨ����ļ�
                If Len(sFile) > 60 Then
                    LabelNowScaning.Caption = Left(sFile, 47) & "..." & Right(sFile, 10)
                Else
                    LabelNowScaning.Caption = sFile
                End If
                'ɨ��
                sScanResult = ScanFile(sFile)
                
                '�����������ֵ
                Dim lDeleteFileReturn As Long
                '��ǰ·��
                Dim sTempAppPath As String
                '�����ļ�
                Dim sTargetFileName As String
                '�����ļ�����
                Dim lCopyFileReturn As Long
                                        
                '��鲢��ʾɨ����
                If sScanResult <> "" Then
                    '���ֲ�����
                    lTrojanFiles = lTrojanFiles + 1
                    LabelTrojanFileCount.Caption = lTrojanFiles
                    '����
                    If bIgnoreVirus = True Then
                        With TextScanResult
                            .Text = .Text & sFile & " " & sScanResult & "" & "δ���" & vbCrLf
                        End With
                    End If
                    
                    '�Զ����
                    If bClearVirus = True Then
                        '�������
                        lDeleteFileReturn = DeleteFile(sFile)
                        If lDeleteFileReturn <> 0 Then
                            With TextScanResult
                                .Text = .Text & sFile & " " & sScanResult & "" & "�����" & vbCrLf
                            End With
                        Else
                            With TextScanResult
                                .Text = .Text & sFile & " " & sScanResult & "" & "���ʧ��" & vbCrLf
                            End With
                        End If
                    End If
                    
                    '��ʾ
                    If bAlertVirus = True Then
                        
                        SetForegroundWindow FormScan.hWnd
                        
                        With fAlertForm
                            .LabelFile = sFile
                            .LabelVirusName = sScanResult
                            .Show vbModal
                        End With
                    End If
                    
                End If
            Else
                '�ж��ļ�����
                If UCase(Right(sFile, 4)) = UCase(".dll") _
                Or UCase(Right(sFile, 4)) = UCase(".exe") _
                Or UCase(Right(sFile, 4)) = UCase(".com") _
                Or UCase(Right(sFile, 4)) = UCase(".ocx") _
                Or UCase(Right(sFile, 4)) = UCase(".scr") _
                Then
                
                    'ɨ���ļ���
                    lScanedFiles = lScanedFiles + 1
                    LabelScanedFileCount.Caption = lScanedFiles
                    
                    'ɨ���ʱ
                    LabelTimeUsed.Caption = CDate(Time - dScanStartTime)
                    
                    '����ɨ����ļ�
                    If Len(sFile) > 60 Then
                        LabelNowScaning.Caption = Left(sFile, 47) & "..." & Right(sFile, 10)
                    Else
                        LabelNowScaning.Caption = sFile
                    End If
                    'ɨ��
                    sScanResult = ScanFile(sFile)
                    
                    '��鲢��ʾɨ����
                    If sScanResult <> "" Then
                        '���ֲ�����
                        lTrojanFiles = lTrojanFiles + 1
                        LabelTrojanFileCount.Caption = lTrojanFiles
                        '����
                        If bIgnoreVirus = True Then
                            With TextScanResult
                                    .Text = .Text & sFile & " " & sScanResult & "" & "δ���" & vbCrLf
                            End With
                        End If
                        
                        '�Զ����
                        If bClearVirus = True Then
                            '�������
                            lDeleteFileReturn = DeleteFile(sFile)
                            If lDeleteFileReturn <> 0 Then
                                With TextScanResult
                                    .Text = .Text & sFile & " " & sScanResult & "" & "�����" & vbCrLf
                                End With
                            Else
                                With TextScanResult
                                    .Text = .Text & sFile & " " & sScanResult & "" & "���ʧ��" & vbCrLf
                                End With
                            End If
                        End If
                                            
                        '��ʾ
                        If bAlertVirus = True Then
                            
                            SetForegroundWindow FormScan.hWnd
                            
                            With fAlertForm
                                .LabelFile = sFile
                                .LabelVirusName = sScanResult
                                .Show vbModal
                            End With
                        End If
                    End If
                    
                End If
            End If
        End If
        '���������ļ�
        lSerachNextHwnd = FindNextFile(lSerachHwnd, uWFD)
    Loop While lSerachNextHwnd <> 0
    
    '�ر��������
    FindClose lSerachHwnd
End Sub

'Tab��ľ����
Private Sub ImageScanResult_Click(Index As Integer)
    ImageSecurityState(0).Visible = False
    ImageSecurityState(1).Visible = True
    ImageScanResult(0).Visible = True
    ImageScanResult(1).Visible = False
    ImageShield(0).Visible = False
    ImageShield(1).Visible = True
    
    PictureSecurityState.Visible = False
    PictureScanResult.Visible = True
    PictureShield.Visible = False

End Sub

'Tab����ȫ״̬
Private Sub ImageSecurityState_Click(Index As Integer)
    ImageSecurityState(0).Visible = True
    ImageSecurityState(1).Visible = False
    ImageScanResult(0).Visible = False
    ImageScanResult(1).Visible = True
    ImageShield(0).Visible = False
    ImageShield(1).Visible = True
    
    PictureSecurityState.Visible = True
    PictureScanResult.Visible = False
    PictureShield.Visible = False

End Sub

'����
Private Sub ImageSetting_Click()
    FormSetting.Show vbModal
End Sub

'Tab������״̬
Private Sub ImageShield_Click(Index As Integer)
    ImageSecurityState(0).Visible = False
    ImageSecurityState(1).Visible = True
    ImageScanResult(0).Visible = False
    ImageScanResult(1).Visible = True
    ImageShield(0).Visible = True
    ImageShield(1).Visible = False
    
    PictureSecurityState.Visible = False
    PictureScanResult.Visible = False
    PictureShield.Visible = True

End Sub

Private Sub ImageSkin_Click(Index As Integer)
    FormSkin.Show vbModal
End Sub

'��ʾ�ͼ�¼�ϴ�ɨ����
Private Function ShowAndRecordScanResult()
    
    Dim sSettingsFile As String
    
    '������ü�¼�ļ�
    If Right(App.Path, 1) = "\" Then
        sSettingsFile = App.Path & "Settings.ini"
    Else
        sSettingsFile = App.Path & "\Settings.ini"
    End If
    
    'ɨ����ʱ
    Call WriteIni(sSettingsFile, "History", "LastScanUsedTime", LabelTimeUsed.Caption)
    
    'ɨ���ļ���
    Call WriteIni(sSettingsFile, "History", "LastScanFiles", LabelScanedFileCount.Caption)
    
    '������
    Call WriteIni(sSettingsFile, "History", "LastDetectedSpywares", LabelTrojanFileCount.Caption)
    
    DoEvents
    
    Dim sLascScanUsedTime As String
    
    '�ϴ�ɨ����ʱ
    sLascScanUsedTime = ReadIni(sSettingsFile, "History", "LastScanUsedTime")
        
    '��ʾ
    LabelLastScanUsedTime.Caption = sLascScanUsedTime
    LabelLastScanFiles.Caption = ReadIni(sSettingsFile, "History", "LastScanFiles") & "��"
    LabelLastDetectedSpywares.Caption = ReadIni(sSettingsFile, "History", "LastDetectedSpywares") & "��"
    
    LabelLastScanUsedTimeTitle.Left = 120
    LabelLastScanUsedTime.Left = LabelLastScanUsedTimeTitle.Left + LabelLastScanUsedTimeTitle.Width + 20
    LabelLastScanFilesTitle.Left = LabelLastScanUsedTime.Left + LabelLastScanUsedTime.Width + 200
    LabelLastScanFiles.Left = LabelLastScanFilesTitle.Left + LabelLastScanFilesTitle.Width + 20
    LabelLastDetectedSpywaresTitle.Left = LabelLastScanFiles.Left + LabelLastScanFiles.Width + 200
    LabelLastDetectedSpywares.Left = LabelLastDetectedSpywaresTitle.Left + LabelLastDetectedSpywaresTitle.Width + 20
    
End Function

Private Sub ImageSkin_MouseMove(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    '��С���ť״̬
    ImageSkin(0).Visible = False
    ImageSkin(1).Visible = True
    ImageSkin(2).Visible = False
End Sub

Private Sub ImageSkin_MouseDown(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    '��С���ť״̬
    ImageSkin(0).Visible = False
    ImageSkin(1).Visible = False
    ImageSkin(2).Visible = True
End Sub

Private Sub ImageSkin_MouseUp(Index As Integer, Button As Integer, Shift As Integer, X As Single, Y As Single)
    '��С������ť
    If ImageSkin(2).Visible = True Then
        FormSkin.Show vbModal
    End If
End Sub

Private Sub ImageUpdate_Click()
    FormUpdate.Show vbModal
End Sub

Private Sub TimerUpdateRefresh_Timer()
    
    On Error GoTo ErrorExit
    
    '��ȡ����汾
    Dim sVersionFile As String
    If Right(App.Path, 1) = "\" Then
        sVersionFile = App.Path & "Version.ini"
    Else
        sVersionFile = App.Path & "\Version.ini"
    End If
    
    Dim sSoftwareVersion As String
    sSoftwareVersion = ReadIni(sVersionFile, "Version", "SoftwareVersion")
    
    '��ȡ������汾
    Dim lSignatureVersion
    lSignatureVersion = ReadIni(sVersionFile, "Version", "SignatureVersion")
    
    FormScan.LabelSoftwareVersion.Caption = sSoftwareVersion
    FormScan.LabelSignatureVersion.Caption = lSignatureVersion
    
    
    TimerUpdateRefresh.Enabled = False
ErrorExit:
    
End Sub


'ɨ���Ϸ��ļ�
Private Function OleScanFile(ByVal sFile As String) As String
    
    '������ü�¼�ļ�
    Dim sSettingsFile As String
    If Right(App.Path, 1) = "\" Then
        sSettingsFile = App.Path & "Settings.ini"
    Else
        sSettingsFile = App.Path & "\Settings.ini"
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
            
         
    Dim fAlertForm As New FormAlertVirus
            
    'ɨ���ļ���
    lScanedFiles = lScanedFiles + 1
    LabelScanedFileCount.Caption = lScanedFiles
                
    'ɨ���ʱ
    LabelTimeUsed.Caption = CDate(Time - dScanStartTime)
                
    '����ɨ����ļ�
    If Len(sFile) > 60 Then
        LabelNowScaning.Caption = Left(sFile, 47) & "..." & Right(sFile, 10)
    Else
        LabelNowScaning.Caption = sFile
    End If
                
    'ɨ����
    Dim sScanResult As String
     
    'ɨ��
    sScanResult = ScanFile(sFile)
                   
    '�����������ֵ
    Dim lDeleteFileReturn As Long
    '��ǰ·��
    Dim sTempAppPath As String
    '�����ļ�
    Dim sTargetFileName As String
    '�����ļ�����
    Dim lCopyFileReturn As Long
                                        
    '��鲢��ʾɨ����
    If sScanResult <> "" Then
        '���ֲ�����
        lTrojanFiles = lTrojanFiles + 1
        LabelTrojanFileCount.Caption = lTrojanFiles
        '����
        If bIgnoreVirus = True Then
            With TextScanResult
                .Text = .Text & sFile & " " & sScanResult & "" & "δ���" & vbCrLf
            End With
        End If
                    
        '�Զ����
        If bClearVirus = True Then
            '�������
            lDeleteFileReturn = DeleteFile(sFile)
            If lDeleteFileReturn <> 0 Then
                With TextScanResult
                    .Text = .Text & sFile & " " & sScanResult & "" & "�����" & vbCrLf
                End With
            Else
                With TextScanResult
                    .Text = .Text & sFile & " " & sScanResult & "" & "���ʧ��" & vbCrLf
                End With
            End If
        End If
                    
        '��ʾ
        If bAlertVirus = True Then
                        
            SetForegroundWindow FormScan.hWnd
                        
            With fAlertForm
                .LabelFile = sFile
                .LabelVirusName = sScanResult
                .Show vbModal
            End With
        End If
                    
    End If
    
    '����ɨ����
    OleScanFile = sScanResult
End Function

Public Sub OleScanFolder(sFolder As String)
        
        
    '�������Զ���ṹ
    Dim uWFD As WIN32_FIND_DATA
    '�ļ�
    Dim sFile  As String
    'Ŀ¼
    Dim sDir As String
    '�������
    Dim lSerachHwnd As Long
    Dim lSerachNextHwnd As Long
    
    '������ɨ����
    Dim sScanResult As String
    
    lSerachHwnd = FindFirstFile(sFolder & "*.*", uWFD)
    
    '�����ļ���Ŀ¼
    Do
        DoEvents
        
        'ֹͣɨ��
        If bStopScanFlag = True Then
            Exit Do
        End If
        
        '�����Ŀ¼
        If uWFD.dwFileAttributes And FILE_ATTRIBUTE_DIRECTORY Then
            
            '�ж��Ƿ��Ǹ�Ŀ¼���ϼ�Ŀ¼��
            If Left(uWFD.cFileName, 1) <> "." And Left(uWFD.cFileName, 2) <> ".." Then
                
                'ȡ��·��
                sDir = sFolder & TrimNull(uWFD.cFileName)
                '��ӵ���ɨ��Ŀ¼
                If Right(sDir, 1) = "\" Then
                    ListFolders.AddItem sDir
                Else
                    ListFolders.AddItem sDir & "\"
                End If
            End If
            
        '������ļ�
        Else
            '��ȡ�ļ�ȫ·��
            sFile = sFolder & TrimNull(uWFD.cFileName)
            sFile = Replace(sFile, "\\", "\")
            
            '������ü�¼�ļ�
            Dim sSettingsFile As String
            If Right(App.Path, 1) = "\" Then
                sSettingsFile = App.Path & "Settings.ini"
            Else
                sSettingsFile = App.Path & "\Settings.ini"
            End If
            
            'ɨ��ȫ���ļ���PE�ļ�
            Dim bScanAllFile As Boolean
            bScanAllFile = ReadIni(sSettingsFile, "Scan", "ScanAllFiles")
            
            '���ֲ���ʱ�Զ����
            Dim bClearVirus As Boolean
            bClearVirus = ReadIni(sSettingsFile, "Scan", "ClearVirus")
            
            '���ֲ���ʱ��ʾ
            Dim bAlertVirus As Boolean
            bAlertVirus = ReadIni(sSettingsFile, "Scan", "AlertVirus")
            
            '���ֲ���ʱ����
            Dim bIgnoreVirus As Boolean
            bIgnoreVirus = ReadIni(sSettingsFile, "Scan", "IgnoreVirus ")
            
           
            Dim fAlertForm As New FormAlertVirus
            
            If bScanAllFile = True Then
            
                'ɨ���ļ���
                lScanedFiles = lScanedFiles + 1
                LabelScanedFileCount.Caption = lScanedFiles
                
                'ɨ���ʱ
                LabelTimeUsed.Caption = CDate(Time - dScanStartTime)
                
                '����ɨ����ļ�
                If Len(sFile) > 60 Then
                    LabelNowScaning.Caption = Left(sFile, 47) & "..." & Right(sFile, 10)
                Else
                    LabelNowScaning.Caption = sFile
                End If
                'ɨ��
                sScanResult = ScanFile(sFile)
                
                '�����������ֵ
                Dim lDeleteFileReturn As Long
                '��ǰ·��
                Dim sTempAppPath As String
                '�����ļ�
                Dim sTargetFileName As String
                '�����ļ�����
                Dim lCopyFileReturn As Long
                                        
                
                '��鲢��ʾɨ����
                If sScanResult <> "" Then
                    '���ֲ�����
                    lTrojanFiles = lTrojanFiles + 1
                    LabelTrojanFileCount.Caption = lTrojanFiles
                    '����
                    If bIgnoreVirus = True Then
                        With TextScanResult
                            .Text = .Text & sFile & " " & sScanResult & "" & "δ���" & vbCrLf
                        End With
                    End If
                    
                    '�Զ����
                    If bClearVirus = True Then
                        '�������
                        lDeleteFileReturn = DeleteFile(sFile)
                        If lDeleteFileReturn <> 0 Then
                            With TextScanResult
                                .Text = .Text & sFile & " " & sScanResult & "" & "�����" & vbCrLf
                            End With
                        Else
                            With TextScanResult
                                .Text = .Text & sFile & " " & sScanResult & "" & "���ʧ��" & vbCrLf
                            End With
                        End If
                    End If
                    
                                       
                    '��ʾ
                    If bAlertVirus = True Then
                        
                        SetForegroundWindow FormScan.hWnd
                        
                        With fAlertForm
                            .LabelFile = sFile
                            .LabelVirusName = sScanResult
                            .Show vbModal
                        End With
                    End If
                    
                End If
            Else
                '�ж��ļ�����
                If UCase(Right(sFile, 4)) = UCase(".dll") _
                Or UCase(Right(sFile, 4)) = UCase(".exe") _
                Or UCase(Right(sFile, 4)) = UCase(".com") _
                Or UCase(Right(sFile, 4)) = UCase(".ocx") _
                Or UCase(Right(sFile, 4)) = UCase(".scr") _
                Then
                
                    'ɨ���ļ���
                    lScanedFiles = lScanedFiles + 1
                    LabelScanedFileCount.Caption = lScanedFiles
                    
                    'ɨ���ʱ
                    LabelTimeUsed.Caption = CDate(Time - dScanStartTime)
                    
                    '����ɨ����ļ�
                    If Len(sFile) > 60 Then
                        LabelNowScaning.Caption = Left(sFile, 47) & "..." & Right(sFile, 10)
                    Else
                        LabelNowScaning.Caption = sFile
                    End If
                    'ɨ��
                    sScanResult = ScanFile(sFile)
                    
                    '��鲢��ʾɨ����
                    If sScanResult <> "" Then
                        '���ֲ�����
                        lTrojanFiles = lTrojanFiles + 1
                        LabelTrojanFileCount.Caption = lTrojanFiles
                        '����
                        If bIgnoreVirus = True Then
                            With TextScanResult
                                .Text = .Text & sFile & " " & sScanResult & "" & "δ���" & vbCrLf
                            End With
                        End If
                        
                        '�Զ����
                        If bClearVirus = True Then
                            '�������
                            lDeleteFileReturn = DeleteFile(sFile)
                            If lDeleteFileReturn <> 0 Then
                                With TextScanResult
                                    .Text = .Text & sFile & " " & sScanResult & "" & "�����" & vbCrLf
                                End With
                            Else
                                With TextScanResult
                                    .Text = .Text & sFile & " " & sScanResult & "" & "���ʧ��" & vbCrLf
                                End With
                            End If
                        End If
                        
                    
                        '��ʾ
                        If bAlertVirus = True Then
                            
                            SetForegroundWindow FormScan.hWnd
                            
                            With fAlertForm
                                .LabelFile = sFile
                                .LabelVirusName = sScanResult
                                .Show vbModal
                            End With
                        End If
                    End If
                    
                End If
            End If
        End If
        '���������ļ�
        lSerachNextHwnd = FindNextFile(lSerachHwnd, uWFD)
    Loop While lSerachNextHwnd <> 0
    
    '�ر��������
    FindClose lSerachHwnd
End Sub

Public Function ReSkinMe()
    With Me
        .Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Scan.bmp")
        .ImageExit(0).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit0.bmp")
        .ImageExit(1).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit1.bmp")
        .ImageExit(2).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit2.bmp")
        .ImageMin(0).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Min0.bmp")
        .ImageMin(1).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Min1.bmp")
        .ImageMin(2).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Min2.bmp")
        .ImageSkin(0).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Skin0.bmp")
        .ImageSkin(1).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Skin1.bmp")
        .ImageSkin(2).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Skin2.bmp")
        .ImageMemoryScan(0) = LoadPicture(App.Path & "\Skin\" & sSkin & "\QuickScan0.bmp")
        .ImageMemoryScan(1) = LoadPicture(App.Path & "\Skin\" & sSkin & "\QuickScan1.bmp")
        .ImageFullDiskScan(0) = LoadPicture(App.Path & "\Skin\" & sSkin & "\FullScan0.bmp")
        .ImageFullDiskScan(1) = LoadPicture(App.Path & "\Skin\" & sSkin & "\FullScan1.bmp")
        .ImageCustomerScan(0) = LoadPicture(App.Path & "\Skin\" & sSkin & "\CustomerScan0.bmp")
        .ImageCustomerScan(1) = LoadPicture(App.Path & "\Skin\" & sSkin & "\CustomerScan1.bmp")
        .ImageSecurityState(0) = LoadPicture(App.Path & "\Skin\" & sSkin & "\SecurityState0.bmp")
        .ImageSecurityState(1) = LoadPicture(App.Path & "\Skin\" & sSkin & "\SecurityState1.bmp")
        .ImageScanResult(0) = LoadPicture(App.Path & "\Skin\" & sSkin & "\ScanResult0.bmp")
        .ImageScanResult(1) = LoadPicture(App.Path & "\Skin\" & sSkin & "\ScanResult1.bmp")
        .ImageShield(0) = LoadPicture(App.Path & "\Skin\" & sSkin & "\Shield0.bmp")
        .ImageShield(1) = LoadPicture(App.Path & "\Skin\" & sSkin & "\Shield1.bmp")
        .ImageUpdate = LoadPicture(App.Path & "\Skin\" & sSkin & "\Update.bmp")
        .ImageSetting = LoadPicture(App.Path & "\Skin\" & sSkin & "\Setting.bmp")
        .ImageHomePage = LoadPicture(App.Path & "\Skin\" & sSkin & "\HomePage.bmp")
    End With
End Function

