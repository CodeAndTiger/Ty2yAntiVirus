VERSION 5.00
Begin VB.Form FormScanFinish 
   BorderStyle     =   0  'None
   Caption         =   "ɨ�����"
   ClientHeight    =   4185
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   6075
   Icon            =   "FormScanFinish.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "FormScanFinish.frx":57E2
   ScaleHeight     =   4185
   ScaleWidth      =   6075
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  '����������
   Begin Ty2yAntiVirus.Command CommandClose 
      Height          =   375
      Left            =   3600
      TabIndex        =   0
      Top             =   3600
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
      Caption         =   "�ر�"
   End
   Begin VB.Label LabelScanResult 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "ɨ����"
      ForeColor       =   &H00404040&
      Height          =   180
      Left            =   480
      TabIndex        =   3
      Top             =   160
      Width           =   720
   End
   Begin VB.Label LabelMessage 
      BackStyle       =   0  'Transparent
      Caption         =   "��Ϣ"
      Height          =   1695
      Left            =   840
      TabIndex        =   2
      Top             =   1080
      Width           =   4215
   End
   Begin VB.Label LabelTitle 
      AutoSize        =   -1  'True
      BackStyle       =   0  'Transparent
      Caption         =   "ɨ�����"
      BeginProperty Font 
         Name            =   "����"
         Size            =   9
         Charset         =   134
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00008000&
      Height          =   180
      Left            =   840
      TabIndex        =   1
      Top             =   720
      Width           =   780
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   0
      Left            =   5520
      Picture         =   "FormScanFinish.frx":58564
      Top             =   0
      Width           =   465
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   1
      Left            =   5520
      Picture         =   "FormScanFinish.frx":58CC6
      Top             =   0
      Width           =   465
   End
   Begin VB.Image ImageExit 
      Height          =   285
      Index           =   2
      Left            =   5520
      Picture         =   "FormScanFinish.frx":59428
      Top             =   0
      Width           =   465
   End
End
Attribute VB_Name = "FormScanFinish"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'****************************************************************
'
' Ty2yɱ�����
' http://www.ty2y.com/
'
' ɨ��ʱ�����ʾ����
'
'****************************************************************
Option Explicit

'api����
Private Declare Function ReleaseCapture Lib "user32" () As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long

'����ر��ť
Private Sub CommandClose_Click()
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
            .Left = 5520
            .Top = 0
        End With
    Next
    '�ر��ť
    ImageExit(0).Visible = True
    ImageExit(1).Visible = False
    ImageExit(2).Visible = False
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
        .Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\ScanResult.bmp")
        .ImageExit(0).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit0.bmp")
        .ImageExit(1).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit1.bmp")
        .ImageExit(2).Picture = LoadPicture(App.Path & "\Skin\" & sSkin & "\Exit2.bmp")
    End With
End Function
