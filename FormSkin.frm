VERSION 5.00
Begin VB.Form FormSkin 
   BorderStyle     =   0  'None
   Caption         =   "��ѡ��Ƥ��"
   ClientHeight    =   2970
   ClientLeft      =   4560
   ClientTop       =   0
   ClientWidth     =   5115
   LinkTopic       =   "Form1"
   Picture         =   "FormSkin.frx":0000
   ScaleHeight     =   2970
   ScaleWidth      =   5115
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  '����������
   Begin VB.ComboBox ComboSkin 
      Height          =   300
      Left            =   960
      Style           =   2  'Dropdown List
      TabIndex        =   1
      Top             =   1320
      Width           =   2655
   End
   Begin Ty2yAntiVirus.Command CommandOK 
      Height          =   375
      Left            =   3480
      TabIndex        =   0
      Top             =   2400
      Width           =   975
      _ExtentX        =   1720
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
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "Ƥ���б�"
      Height          =   180
      Left            =   960
      TabIndex        =   2
      Top             =   960
      Width           =   900
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   2
      Left            =   4560
      Picture         =   "FormSkin.frx":31842
      Top             =   0
      Width           =   465
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   1
      Left            =   4560
      Picture         =   "FormSkin.frx":31FA4
      Top             =   0
      Width           =   465
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   0
      Left            =   4560
      Picture         =   "FormSkin.frx":32706
      Top             =   0
      Width           =   465
   End
End
Attribute VB_Name = "FormSkin"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'****************************************************************
'
' Ty2yɱ�����
' http://www.ty2y.com/
'
' Ƥ��ѡ��
'
'****************************************************************
Option Explicit

'api����
Private Declare Function ReleaseCapture Lib "user32" () As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function FindFirstFile Lib "kernel32" Alias "FindFirstFileA" (ByVal lpFileName As String, lpFindFileData As WIN32_FIND_DATA) As Long
Private Declare Function FindNextFile Lib "kernel32" Alias "FindNextFileA" (ByVal hFindFile As Long, lpFindFileData As WIN32_FIND_DATA) As Long
Private Declare Function FindClose Lib "kernel32" (ByVal hFindFile As Long) As Long

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
        cFileName As String * 1024
        cAlternate As String * 256
End Type

Private Const FILE_ATTRIBUTE_DIRECTORY = &H10

Private Sub CommandOK_Click()

    '�ı�Ƥ��
    sSkin = ComboSkin.Text
    '����Ƥ��
    ReSkinAll
    DoEvents
    
    Dim sSettingsFile As String
    
    '������ü�¼�ļ�
    If Right(App.Path, 1) = "\" Then
        sSettingsFile = App.Path & "Settings.ini"
    Else
        sSettingsFile = App.Path & "\Settings.ini"
    End If
    
    'д�������ļ�
    Call WriteIni(sSettingsFile, "Normal", "Skin", sSkin)
    
    Unload Me
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

'������������
Private Sub Form_Load()
    ReSkinMe
    Dim j As Long
    For j = 0 To 2
        '��ʼ���ر��ťλ��
        With ImageExit(j)
            .Left = 4560
            .Top = 0
        End With
    Next
    '�ر��ť
    ImageExit(0).Visible = True
    ImageExit(1).Visible = False
    ImageExit(2).Visible = False
    
    '��ʼ��Ƥ���б�
    ComboSkin.Clear
    
    Dim sSkinPath As String
    sSkinPath = App.Path
    If Right(sSkinPath, 1) <> "\" Then
        sSkinPath = sSkinPath & "\"
    End If
    sSkinPath = sSkinPath & "Skin\"
    InitSkins sSkinPath, "*.*"
    
    '��ǰƤ��
    ComboSkin.Text = sSkin
End Sub

Private Sub Form_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
    '�ر��ť
    ImageExit(0).Visible = True
    ImageExit(1).Visible = False
    ImageExit(2).Visible = False
End Sub

Private Sub ImageExit_Click(Index As Integer)
    Unload Me
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
    Unload Me
End Sub

'----------------------------------------------------------------#
'
' ��������InitSkins
' ���ܣ�����Ƥ��
' ����ֵ����
'
'----------------------------------------------------------------#
Public Sub InitSkins(DirPath As String, FileSpec As String)
    'API���Զ���ṹ��
    Dim FindData As WIN32_FIND_DATA
    
    'Ҫ������Ŀ¼
    DirPath = Trim(DirPath)
    '��������Ŀ¼��ʽ
    If Right(DirPath, 1) <> "\" Then
        DirPath = DirPath & "\"
    End If
    
    'FindFirstfile���صľ��
    Dim FindHandle As Long
    
    '��Ŀ��Ŀ¼��ȡ�õ�һ���ļ���
    FindHandle = FindFirstFile(DirPath & FileSpec, FindData)
    
    '���û��ʧ��(˵�����ļ�)
    If FindHandle <> 0 Then
        If FindData.dwFileAttributes And FILE_ATTRIBUTE_DIRECTORY Then
      
             '�����һ��Ŀ¼
            If Left(FindData.cFileName, 1) <> "." And Left(FindData.cFileName, 2) <> ".." Then
                
                '��ӵ�Ŀ¼����
                ComboSkin.AddItem Trim(FindData.cFileName)
                
            End If
            
        End If
    End If
    
    '���ڿ�ʼ�������ļ�
    If FindHandle <> 0 Then
        
        Dim sFullName As String
        
        'FindNextFile���صľ��
        Dim FindNextHandle As Long
        
        Do
           
            DoEvents
                            
            '����һ���ļ�
            FindNextHandle = FindNextFile(FindHandle, FindData)
            If FindNextHandle <> 0 Then
                    
                If FindData.dwFileAttributes And FILE_ATTRIBUTE_DIRECTORY Then
                        
                    '��Ŀ¼�Ļ�,�ͼӵ�Ŀ¼�б�
                    If Left(FindData.cFileName, 1) <> "." And Left(FindData.cFileName, 2) <> ".." Then
                        
                        ComboSkin.AddItem Trim(FindData.cFileName)
                    End If
                End If
            Else
                Exit Do
            End If
        Loop
    End If
    
    '�رվ��
    Call FindClose(FindHandle)
    
End Sub

Public Function ReSkinMe()
    With Me
        .Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Skin.bmp")
        .ImageExit(0).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit0.bmp")
        .ImageExit(1).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit1.bmp")
        .ImageExit(2).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit2.bmp")
    End With
End Function
