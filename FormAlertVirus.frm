VERSION 5.00
Begin VB.Form FormAlertVirus 
   BorderStyle     =   0  'None
   Caption         =   "���ֲ���"
   ClientHeight    =   3630
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   7710
   Icon            =   "FormAlertVirus.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "FormAlertVirus.frx":57E2
   ScaleHeight     =   3630
   ScaleWidth      =   7710
   ShowInTaskbar   =   0   'False
   StartUpPosition =   2  '��Ļ����
   Begin Ty2yAntiVirus.Command CommandIgnore 
      Height          =   375
      Left            =   5640
      TabIndex        =   2
      Top             =   3000
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
      Caption         =   "����"
   End
   Begin Ty2yAntiVirus.Command CommandClear 
      Height          =   375
      Left            =   4200
      TabIndex        =   1
      Top             =   3000
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
      Caption         =   "���"
      Percent         =   53
      MidColor        =   16755580
      EndColor        =   16765887
      MouseMoveMidColor=   16763805
      MouseMoveEndColor=   16771025
      MouseDownMidColor=   16750948
      MouseDownEndColor=   16765887
   End
   Begin VB.Label Label3 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "·����"
      BeginProperty Font 
         Name            =   "����"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404040&
      Height          =   180
      Left            =   480
      TabIndex        =   6
      Top             =   1560
      Width           =   585
   End
   Begin VB.Label Label2 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "���ƣ�"
      BeginProperty Font 
         Name            =   "����"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00404040&
      Height          =   180
      Left            =   480
      TabIndex        =   5
      Top             =   1200
      Width           =   585
   End
   Begin VB.Label Label1 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "���ֲ���"
      BeginProperty Font 
         Name            =   "����"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H000000C0&
      Height          =   180
      Left            =   960
      TabIndex        =   4
      Top             =   840
      Width           =   780
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   2
      Left            =   7080
      Picture         =   "FormAlertVirus.frx":60BB4
      Top             =   0
      Width           =   465
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   1
      Left            =   7080
      Picture         =   "FormAlertVirus.frx":61316
      Top             =   0
      Width           =   465
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   0
      Left            =   7080
      Picture         =   "FormAlertVirus.frx":61A78
      Top             =   0
      Width           =   465
   End
   Begin VB.Label LabelVirusName 
      BackStyle       =   0  'Transparent
      Caption         =   "virus name"
      ForeColor       =   &H000000C0&
      Height          =   255
      Left            =   1080
      TabIndex        =   3
      Top             =   1200
      Width           =   3015
   End
   Begin VB.Label LabelFile 
      BackStyle       =   0  'Transparent
      Caption         =   "file"
      ForeColor       =   &H000080FF&
      Height          =   975
      Left            =   1080
      TabIndex        =   0
      Top             =   1560
      Width           =   6135
   End
End
Attribute VB_Name = "FormAlertVirus"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'****************************************************************
'
' Ty2yɱ�����
' http://www.ty2y.com/
'
' ɨ��ʱ��⵽��������ʾ����
'
'****************************************************************
Option Explicit

'api����
Private Declare Function DeleteFile Lib "kernel32" Alias "DeleteFileA" (ByVal lpFileName As String) As Long
Private Declare Function CopyFile Lib "kernel32" Alias "CopyFileA" (ByVal lpExistingFileName As String, ByVal lpNewFileName As String, ByVal bFailIfExists As Long) As Long
Private Declare Function ReleaseCapture Lib "user32" () As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function ShellExecute Lib "shell32.dll" Alias "ShellExecuteA" (ByVal hWnd As Long, ByVal lpOperation As String, ByVal lpFile As String, ByVal lpParameters As String, ByVal lpDirectory As String, ByVal nShowCmd As Long) As Long

'��������ť
Private Sub CommandClear_Click()
    '�������
    Dim lDeleteFileReturn As Long
    lDeleteFileReturn = DeleteFile(LabelFile.Caption)
    If lDeleteFileReturn <> 0 Then
        '����ɹ�
        With FormScan.TextScanResult
            .Text = .Text & LabelFile.Caption & " " & LabelVirusName.Caption & " " & "�����"
        End With
    Else
        '���ʧ��
        With FormScan.TextScanResult
            .Text = .Text & LabelFile.Caption & " " & LabelVirusName.Caption & " " & "���ʧ��"
        End With
    End If
    Unload Me
End Sub

'��������ť
Private Sub CommandIgnore_Click()
    With FormScan.TextScanResult
        .Text = .Text & LabelFile.Caption & " " & LabelVirusName.Caption & " " & "δ���"
    End With
    Unload Me
End Sub

'������������
Private Sub Form_Load()
    ReSkinMe
    Dim I As Long
    For I = 0 To 2
        '��ʼ���ر��ťλ��
        With ImageExit(I)
            .Left = 7080
            .Top = 0
        End With
    Next
    '�ر��ť
    ImageExit(0).Visible = True
    ImageExit(1).Visible = False
    ImageExit(2).Visible = False
    
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

Private Sub ImageExit_Click(Index As Integer)
    CommandIgnore_Click
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
    CommandIgnore_Click
End Sub

Public Function ReSkinMe()
    With Me
        .Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\AlertVirus.bmp")
        .ImageExit(0).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit0.bmp")
        .ImageExit(1).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit1.bmp")
        .ImageExit(2).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit2.bmp")
    End With
End Function
