VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form FormQuarantine 
   BorderStyle     =   0  'None
   Caption         =   "������"
   ClientHeight    =   7410
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   9810
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "FormQuarantine.frx":0000
   ScaleHeight     =   7410
   ScaleWidth      =   9810
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  '����������
   Begin Ty2yAntiVirus.Command CommandRestore 
      Height          =   375
      Left            =   8280
      TabIndex        =   3
      Top             =   1440
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
      Caption         =   "�ָ�"
   End
   Begin Ty2yAntiVirus.Command CommandClose 
      Height          =   375
      Left            =   8400
      TabIndex        =   0
      Top             =   6840
      Width           =   855
      _ExtentX        =   1508
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
      Caption         =   "�ر�"
   End
   Begin Ty2yAntiVirus.Command CommandRefresh 
      Height          =   375
      Left            =   8280
      TabIndex        =   4
      Top             =   1920
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
      Caption         =   "ˢ��"
   End
   Begin Ty2yAntiVirus.Command CommandDelete 
      Height          =   375
      Left            =   8280
      TabIndex        =   2
      Top             =   960
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
      Caption         =   "ɾ��"
   End
   Begin MSComctlLib.ListView ListViewQuarantine 
      Height          =   5280
      Left            =   615
      TabIndex        =   1
      Top             =   960
      Width           =   7440
      _ExtentX        =   13123
      _ExtentY        =   9313
      View            =   3
      LabelEdit       =   1
      LabelWrap       =   -1  'True
      HideSelection   =   -1  'True
      FullRowSelect   =   -1  'True
      _Version        =   393217
      ForeColor       =   -2147483640
      BackColor       =   -2147483643
      Appearance      =   0
      NumItems        =   3
      BeginProperty ColumnHeader(1) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         Text            =   "ID"
         Object.Width           =   1411
      EndProperty
      BeginProperty ColumnHeader(2) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   1
         Text            =   "����"
         Object.Width           =   8819
      EndProperty
      BeginProperty ColumnHeader(3) {BDD1F052-858B-11D1-B16A-00C0F0283628} 
         SubItemIndex    =   2
         Text            =   "����"
         Object.Width           =   2540
      EndProperty
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   0
      Left            =   9240
      Picture         =   "FormQuarantine.frx":ECE2A
      Top             =   0
      Width           =   465
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   1
      Left            =   9240
      Picture         =   "FormQuarantine.frx":ED58C
      Top             =   0
      Width           =   465
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   2
      Left            =   9240
      Picture         =   "FormQuarantine.frx":EDCEE
      Top             =   0
      Width           =   465
   End
   Begin VB.Label Label9 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "�����ļ�"
      Height          =   180
      Left            =   600
      TabIndex        =   5
      Top             =   720
      Width           =   720
   End
   Begin VB.Shape Shape2 
      BorderColor     =   &H00E0E0E0&
      Height          =   5310
      Left            =   600
      Top             =   945
      Width           =   7485
   End
End
Attribute VB_Name = "FormQuarantine"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'****************************************************************
'
' �ڰ�����������
'
'****************************************************************
Option Explicit

'api����
Private Declare Function ReleaseCapture Lib "user32" () As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function DeleteFile Lib "kernel32" Alias "DeleteFileA" (ByVal lpFileName As String) As Long
Private Declare Function CopyFile Lib "kernel32" Alias "CopyFileA" (ByVal lpExistingFileName As String, ByVal lpNewFileName As String, ByVal bFailIfExists As Long) As Long

'����ر��ť
Private Sub CommandClose_Click()
    Unload Me
End Sub

Private Sub CommandDelete_Click()
    If ListViewQuarantine.ListItems.Count = 0 Then
        Exit Sub
    End If
    
    '�����¼�ļ�
    Dim sQuarantineIniFile As String
    
    If Right(App.Path, 1) = "\" Then
        sQuarantineIniFile = App.Path & "Quarantine.ini"
    Else
        sQuarantineIniFile = App.Path & "\Quarantine.ini"
    End If
    
    '����ȷ�϶Ի���
    If MsgBox("ȷ��Ҫɾ����" & ListViewQuarantine.SelectedItem.SubItems(1) & "��", vbYesNo) = vbYes Then
    
        '�������ļ�
        Dim sQuarantineFile As String
        sQuarantineFile = ReadIni(sQuarantineIniFile, "QuarantineFile", Format(ListViewQuarantine.SelectedItem.Text, "00000"))
        
        '�Ӹ�����ɾ���ļ�
        Call DeleteFile(sQuarantineFile)
        
        '����ļ�ԭλ�ü�¼
        Call WriteIni(sQuarantineIniFile, "SourceFile", ListViewQuarantine.SelectedItem.Text, "")
        
        '��ո����ļ�λ�ü�¼
        Call WriteIni(sQuarantineIniFile, "QuarantineFile", ListViewQuarantine.SelectedItem.Text, "")
    End If
    
    'ˢ��
    CommandRefresh_Click
End Sub

Private Sub CommandRefresh_Click()
    ListViewQuarantine.ListItems.Clear
    
    '�����¼�ļ�
    Dim sQuarantineIniFile As String
    
    If Right(App.Path, 1) = "\" Then
        sQuarantineIniFile = App.Path & "Quarantine.ini"
    Else
        sQuarantineIniFile = App.Path & "\Quarantine.ini"
    End If
        
    '�����ļ���
    Dim lMaxID As Long
    lMaxID = ReadIni(sQuarantineIniFile, "Count", "MaxID")
        
    '����ǰ���ļ���ַ
    Dim sSourceFile As String
    
    Dim i As Long
    For i = 1 To lMaxID
        '�ļ�
        sSourceFile = ReadIni(sQuarantineIniFile, "SourceFile", Format(i, "00000"))
        
        If Trim(sSourceFile) <> "" Then
                '��Ӽ�¼
                With ListViewQuarantine
                    .ListItems.Add , , Format(i, "00000")
                    .ListItems(.ListItems.Count).SubItems(1) = sSourceFile
                End With
        End If
    Next
End Sub

Private Sub CommandRestore_Click()
    If ListViewQuarantine.ListItems.Count = 0 Then
        Exit Sub
    End If
    
    '�����¼�ļ�
    Dim sQuarantineIniFile As String
    
    If Right(App.Path, 1) = "\" Then
        sQuarantineIniFile = App.Path & "Quarantine.ini"
    Else
        sQuarantineIniFile = App.Path & "\Quarantine.ini"
    End If
    
    '����ȷ�϶Ի���
    If MsgBox("ȷ��Ҫ�ָ���" & ListViewQuarantine.SelectedItem.SubItems(1) & "��", vbYesNo) = vbYes Then
    
        
        '�������ļ�
        Dim sQuarantineFile As String
        sQuarantineFile = ReadIni(sQuarantineIniFile, "QuarantineFile", Format(ListViewQuarantine.SelectedItem.Text, "00000"))
        
        '�ָ��ļ�
        Call CopyFile(sQuarantineFile, ListViewQuarantine.SelectedItem.SubItems(1), 0)
        DoEvents
        
        '�Ӹ�����ɾ���ļ�
        Call DeleteFile(sQuarantineFile)
        
        '����ļ�ԭλ�ü�¼
        Call WriteIni(sQuarantineIniFile, "SourceFile", ListViewQuarantine.SelectedItem.Text, "")
        
        '��ո����ļ�λ�ü�¼
        Call WriteIni(sQuarantineIniFile, "QuarantineFile", ListViewQuarantine.SelectedItem.Text, "")
    End If
    
    'ˢ��
    CommandRefresh_Click
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
            .Left = 9240
            .Top = 0
        End With
    Next
    '�ر��ť
    ImageExit(0).Visible = True
    ImageExit(1).Visible = False
    ImageExit(2).Visible = False
    
    '��ʾ��������
    CommandRefresh_Click
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

Public Function ReSkinMe()
    With Me
        .Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Quarantine.bmp")
        .ImageExit(0).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit0.bmp")
        .ImageExit(1).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit1.bmp")
        .ImageExit(2).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit2.bmp")
    End With
End Function

