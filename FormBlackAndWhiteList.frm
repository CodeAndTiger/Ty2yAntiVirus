VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form FormBlackAndWhiteList 
   BorderStyle     =   0  'None
   Caption         =   "�ڰ�����"
   ClientHeight    =   7410
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   9810
   Icon            =   "FormBlackAndWhiteList.frx":0000
   LinkTopic       =   "Form1"
   Picture         =   "FormBlackAndWhiteList.frx":57E2
   ScaleHeight     =   7410
   ScaleWidth      =   9810
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  '����������
   Begin Ty2yAntiVirus.Command CommandAddWhiteListFile 
      Height          =   375
      Left            =   8280
      TabIndex        =   10
      Top             =   1200
      Width           =   1215
      _extentx        =   2143
      _extenty        =   661
      font            =   "FormBlackAndWhiteList.frx":F260C
      xptype          =   3
      caption         =   "���"
   End
   Begin Ty2yAntiVirus.Command CommandClose 
      Height          =   375
      Left            =   8520
      TabIndex        =   9
      Top             =   6840
      Width           =   855
      _extentx        =   1508
      _extenty        =   661
      font            =   "FormBlackAndWhiteList.frx":F2630
      xptype          =   3
      caption         =   "�ر�"
   End
   Begin Ty2yAntiVirus.Command CommandRefreshBlackList 
      Height          =   375
      Left            =   8280
      TabIndex        =   0
      Top             =   4800
      Width           =   1215
      _extentx        =   2143
      _extenty        =   661
      font            =   "FormBlackAndWhiteList.frx":F2654
      xptype          =   3
      caption         =   "ˢ��"
   End
   Begin Ty2yAntiVirus.Command CommandDeleteBlackListFile 
      Height          =   375
      Left            =   8280
      TabIndex        =   1
      Top             =   4320
      Width           =   1215
      _extentx        =   2143
      _extenty        =   661
      font            =   "FormBlackAndWhiteList.frx":F2678
      xptype          =   3
      caption         =   "ɾ��"
   End
   Begin Ty2yAntiVirus.Command CommandRefreshWhiteList 
      Height          =   375
      Left            =   8280
      TabIndex        =   2
      Top             =   2160
      Width           =   1215
      _extentx        =   2143
      _extenty        =   661
      font            =   "FormBlackAndWhiteList.frx":F269C
      xptype          =   3
      caption         =   "ˢ��"
   End
   Begin Ty2yAntiVirus.Command CommandDeleteWhiteListFile 
      Height          =   375
      Left            =   8280
      TabIndex        =   3
      Top             =   1680
      Width           =   1215
      _extentx        =   2143
      _extenty        =   661
      font            =   "FormBlackAndWhiteList.frx":F26C0
      xptype          =   3
      caption         =   "ɾ��"
   End
   Begin MSComctlLib.ListView ListViewBlackList 
      Height          =   2535
      Left            =   615
      TabIndex        =   4
      Top             =   3840
      Width           =   7440
      _ExtentX        =   13123
      _ExtentY        =   4471
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
   Begin MSComctlLib.ListView ListViewWhiteList 
      Height          =   2175
      Left            =   615
      TabIndex        =   5
      Top             =   1200
      Width           =   7440
      _ExtentX        =   13123
      _ExtentY        =   3836
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
   Begin Ty2yAntiVirus.Command CommandAddBlackListFile 
      Height          =   375
      Left            =   8280
      TabIndex        =   11
      Top             =   3840
      Width           =   1215
      _extentx        =   2143
      _extenty        =   661
      font            =   "FormBlackAndWhiteList.frx":F26E4
      xptype          =   3
      caption         =   "���"
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   2
      Left            =   9240
      Picture         =   "FormBlackAndWhiteList.frx":F2708
      Top             =   0
      Width           =   465
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   1
      Left            =   9240
      Picture         =   "FormBlackAndWhiteList.frx":F2E6A
      Top             =   0
      Width           =   465
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   0
      Left            =   9240
      Picture         =   "FormBlackAndWhiteList.frx":F35CC
      Top             =   0
      Width           =   465
   End
   Begin VB.Label Label4 
      BackStyle       =   0  'Transparent
      Caption         =   "���ذ�ȫ�������ԣ�ͨ��ʹ�ú����������ܣ��Զ����л���ֹĳЩ������С�"
      Height          =   255
      Left            =   600
      TabIndex        =   8
      Top             =   600
      Width           =   6255
   End
   Begin VB.Shape Shape1 
      BorderColor     =   &H00E0E0E0&
      Height          =   2310
      Left            =   600
      Top             =   1185
      Width           =   7485
   End
   Begin VB.Shape Shape2 
      BorderColor     =   &H00E0E0E0&
      Height          =   2670
      Left            =   600
      Top             =   3825
      Width           =   7485
   End
   Begin VB.Label Label8 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "������"
      Height          =   180
      Left            =   600
      TabIndex        =   7
      Top             =   960
      Width           =   540
   End
   Begin VB.Label Label9 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "������"
      Height          =   180
      Left            =   600
      TabIndex        =   6
      Top             =   3600
      Width           =   540
   End
End
Attribute VB_Name = "FormBlackAndWhiteList"
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

Private Declare Function GetOpenFileName Lib "comdlg32.dll" Alias "GetOpenFileNameA" (pOpenfilename As OPENFILENAME) As Long
Private Const OFN_PATHMUSTEXIST = &H800
Private Const OFN_FILEMUSTEXIST = &H1000
Private Const OFN_HIDEREADONLY = &H4 '����ֻ����ѡ��
  
Private Type OPENFILENAME
    lStructSize As Long
    
    'ӵ�жԻ���Ĵ���
    hwndOwner As Long
    hInstance As Long
    
    'װ���ļ��������Ļ�����
    lpstrFilter As String
    lpstrCustomFilter As String
    nMaxCustFilter As Long
    nFilterIndex As Long
    lpstrFile As String
    nMaxFile As Long
    lpstrFileTitle As String
    nMaxFileTitle As Long
    lpstrInitialDir As String
    
    '�Ի���ı���
    lpstrTitle As String
    flags As Long
    nFileOffset As Integer
    nFileExtension As Integer
    lpstrDefExt As String
    lCustData As Long
    lpfnHook As Long
    lpTemplateName As String
End Type


Private Sub CommandAddBlackListFile_Click()

    Dim OFileBox As OPENFILENAME
    
    With OFileBox
        .lStructSize = Len(OFileBox)
        .hwndOwner = Me.hWnd
        .flags = OFN_PATHMUSTEXIST Or OFN_FILEMUSTEXIST Or OFN_HIDEREADONLY
        .lpstrFilter = "(*.exe)" & vbNullChar & "*.exe"
        .lpstrFile = String(255, 0)
        .nMaxFile = 255
    End With
    
    Dim lResult As Long
    lResult = GetOpenFileName(OFileBox)
    
    Dim sFileName As String
    sFileName = Trim(OFileBox.lpstrFile)
    
    If lResult <> 0 Then
        '�������������ļ�
        Dim sDefenseRuleFile As String
        If Right(App.Path, 1) = "\" Then
            sDefenseRuleFile = App.Path & "ActiveDefense.ini"
        Else
            sDefenseRuleFile = App.Path & "\ActiveDefense.ini"
        End If
            
        '��ȡ��������������
        Dim lMaxID As Long
        lMaxID = ReadIni(sDefenseRuleFile, "Count", "MaxID")
            
        '��ini�ļ���д�����������ļ�����
            
        '�������IDֵ
        Call WriteIni(sDefenseRuleFile, "Count", "MaxID", lMaxID + 1)
        'д�ļ�·��
        Call WriteIni(sDefenseRuleFile, "File", Format(lMaxID + 1, "00000"), sFileName)
        'д�ļ�������(�ļ�hash��õ�md5ֵ)
        Call WriteIni(sDefenseRuleFile, "Signature", Format(lMaxID + 1, "00000"), HashFile(sFileName))
        '�ļ�����
        Call WriteIni(sDefenseRuleFile, "Description", Format(lMaxID + 1, "00000"), "")
        '������־(���л�����ֹ)
        Call WriteIni(sDefenseRuleFile, "DefenseFlag", Format(lMaxID + 1, "00000"), 0)
    End If
    
    CommandRefreshBlackList_Click
End Sub

Private Sub CommandAddWhiteListFile_Click()

    Dim OFileBox As OPENFILENAME
    
    With OFileBox
        .lStructSize = Len(OFileBox)
        .hwndOwner = Me.hWnd
        .flags = OFN_PATHMUSTEXIST Or OFN_FILEMUSTEXIST Or OFN_HIDEREADONLY
        .lpstrFilter = "(*.exe)" & vbNullChar & "*.exe"
        .lpstrFile = String(255, 0)
        .nMaxFile = 255
    End With
    
    Dim lResult As Long
    lResult = GetOpenFileName(OFileBox)
    
    Dim sFileName As String
    sFileName = Trim(OFileBox.lpstrFile)
    
    If lResult <> 0 Then
        '�������������ļ�
        Dim sDefenseRuleFile As String
        If Right(App.Path, 1) = "\" Then
            sDefenseRuleFile = App.Path & "ActiveDefense.ini"
        Else
            sDefenseRuleFile = App.Path & "\ActiveDefense.ini"
        End If
            
        '��ȡ��������������
        Dim lMaxID As Long
        lMaxID = ReadIni(sDefenseRuleFile, "Count", "MaxID")
            
        '��ini�ļ���д�����������ļ�����
            
        '�������IDֵ
        Call WriteIni(sDefenseRuleFile, "Count", "MaxID", lMaxID + 1)
        'д�ļ�·��
        Call WriteIni(sDefenseRuleFile, "File", Format(lMaxID + 1, "00000"), sFileName)
        'д�ļ�������(�ļ�hash��õ�md5ֵ)
        Call WriteIni(sDefenseRuleFile, "Signature", Format(lMaxID + 1, "00000"), HashFile(sFileName))
        '�ļ�����
        Call WriteIni(sDefenseRuleFile, "Description", Format(lMaxID + 1, "00000"), "")
        '������־(���л�����ֹ)
        Call WriteIni(sDefenseRuleFile, "DefenseFlag", Format(lMaxID + 1, "00000"), 1)
    End If
    
    
    'ˢ�°������б�
    CommandRefreshWhiteList_Click
    
End Sub

'����ر��ť
Private Sub CommandClose_Click()
    Unload Me
End Sub

'���ˢ�������ť
Private Sub CommandRefreshWhiteList_Click()
    ListViewWhiteList.ListItems.Clear
    '�������������¼�ļ�
    Dim sDefenseIniFile As String
    
    If Right(App.Path, 1) = "\" Then
        sDefenseIniFile = App.Path & "ActiveDefense.ini"
    Else
        sDefenseIniFile = App.Path & "\ActiveDefense.ini"
    End If
        
    '��ȡ��������������
    Dim lMaxID As Long
    lMaxID = ReadIni(sDefenseIniFile, "Count", "MaxID")
        
    '�����Ӧ�ļ�
    Dim sDefenseRuleFile As String
    
    '�����־��1Ϊ���У�0Ϊ��ֹ
    Dim sDefenseRuleFileFlag As String
    
    Dim i As Long
    For i = 1 To lMaxID
        '�ļ�
        sDefenseRuleFile = ReadIni(sDefenseIniFile, "File", Format(i, "00000"))
        '��־
        sDefenseRuleFileFlag = ReadIni(sDefenseIniFile, "DefenseFlag", Format(i, "00000"))
                    
        'ȡ�÷����ļ�����������
        If CLng(sDefenseRuleFileFlag) = 1 Then
                                    
            If Trim(sDefenseRuleFile) <> "" Then
                '��Ӽ�¼
                With FormBlackAndWhiteList
                    .ListViewWhiteList.ListItems.Add , , Format(i, "00000")
                    .ListViewWhiteList.ListItems(.ListViewWhiteList.ListItems.Count).SubItems(1) = sDefenseRuleFile
                End With
            End If
        End If
        
    Next
End Sub

'���ˢ�º������ť
Private Sub CommandRefreshBlackList_Click()

    ListViewBlackList.ListItems.Clear
    '�������������¼�ļ�
    Dim sDefenseIniFile As String
    
    If Right(App.Path, 1) = "\" Then
        sDefenseIniFile = App.Path & "ActiveDefense.ini"
    Else
        sDefenseIniFile = App.Path & "\ActiveDefense.ini"
    End If
        
    '��ȡ��������������
    Dim lMaxID As Long
    lMaxID = ReadIni(sDefenseIniFile, "Count", "MaxID")
        
    '�����Ӧ�ļ�
    Dim sDefenseRuleFile As String
    
    '�����־��1Ϊ���У�0Ϊ��ֹ
    Dim sDefenseRuleFileFlag As String
    
    Dim i As Long
    For i = 1 To lMaxID
        '�ļ�
        sDefenseRuleFile = ReadIni(sDefenseIniFile, "File", Format(i, "00000"))
        '��־
        sDefenseRuleFileFlag = ReadIni(sDefenseIniFile, "DefenseFlag", Format(i, "00000"))
                    
        'ȡ�÷����ļ�����������
        If CLng(sDefenseRuleFileFlag) = 0 Then
            
            If Trim(sDefenseRuleFile) <> "" Then
                '��Ӽ�¼
                With FormBlackAndWhiteList
                    .ListViewBlackList.ListItems.Add , , Format(i, "00000")
                    .ListViewBlackList.ListItems(.ListViewBlackList.ListItems.Count).SubItems(1) = sDefenseRuleFile
                End With
            End If
        End If
        
    Next
End Sub

'���ɾ���������ļ��ť
Private Sub CommandDeleteBlackListFile_Click()

    If ListViewBlackList.ListItems.Count = 0 Then
        Exit Sub
    End If
    
    '�������������¼�ļ�
    Dim sDefenseIniFile As String
    
    If Right(App.Path, 1) = "\" Then
        sDefenseIniFile = App.Path & "ActiveDefense.ini"
    Else
        sDefenseIniFile = App.Path & "\ActiveDefense.ini"
    End If
    
    '����ȷ�϶Ի���
    If MsgBox("ȷ��Ҫɾ����" & ListViewBlackList.SelectedItem.SubItems(1) & "��", vbYesNo) = vbYes Then
        Call WriteIni(sDefenseIniFile, "File", ListViewBlackList.SelectedItem.Text, "")
        Call WriteIni(sDefenseIniFile, "Signature", ListViewBlackList.SelectedItem.Text, "")
    End If
    
    'ˢ��
    CommandRefreshBlackList_Click
End Sub

'���ɾ���������ļ��ť
Private Sub CommandDeleteWhiteListFile_Click()

    If ListViewWhiteList.ListItems.Count = 0 Then
        Exit Sub
    End If
    
    '�������������¼�ļ�
    Dim sDefenseIniFile As String
    
    If Right(App.Path, 1) = "\" Then
        sDefenseIniFile = App.Path & "ActiveDefense.ini"
    Else
        sDefenseIniFile = App.Path & "\ActiveDefense.ini"
    End If
    
    '����ȷ�϶Ի���
    If MsgBox("ȷ��Ҫɾ����" & ListViewWhiteList.SelectedItem.SubItems(1) & "��", vbYesNo) = vbYes Then
        Call WriteIni(sDefenseIniFile, "File", ListViewWhiteList.SelectedItem.Text, "")
        Call WriteIni(sDefenseIniFile, "Signature", ListViewWhiteList.SelectedItem.Text, "")
    End If
    
    'ˢ��
    CommandRefreshWhiteList_Click
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
    
    '��ʾ�ڰ�����
    CommandRefreshWhiteList_Click
    CommandRefreshBlackList_Click
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
        .Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\BlackAndWhiteList.bmp")
        .ImageExit(0).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit0.bmp")
        .ImageExit(1).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit1.bmp")
        .ImageExit(2).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit2.bmp")
    End With
End Function

