Attribute VB_Name = "ModuleSubClass"
'****************************************************************
'
' Ty2yɱ�����
' http://www.ty2y.com/
'
' ���໯���ģ��
'
'****************************************************************
Option Explicit

'API����
Private Declare Function SetForegroundWindow Lib "user32" (ByVal hWnd As Long) As Long
Private Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" (ByVal lpPrevWndFunc As Long, ByVal hWnd As Long, ByVal Msg As Long, ByVal lParam As Long, ByVal lParam As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Private Declare Function WinExec Lib "kernel32" (ByVal lpCmdLine As String, ByVal nCmdShow As Long) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)
Private Declare Function GetFileSizeEx Lib "kernel32.dll" (ByVal hFile As Long, ByRef lpFileSize As LARGE_INTEGER) As Long
Private Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, lpSecurityAttributes As Any, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long

'�Զ�������
Private Type COPYDATASTRUCT
    dwData As Long
    cbData As Long
    lpData As Long
End Type

Private Type LARGE_INTEGER
    lowpart As Long
    highpart As Long
End Type

Private Const GENERIC_READ = &H80000000
Private Const FILE_SHARE_READ = &H1
Private Const OPEN_EXISTING = 3

Private Const WM_SYSCOMMAND = &H112
Private Const SC_RESTORE = &HF120&
'Explorer����ʱ���ؽ�����ͼ��
Public WM_TASKBARCREATED   As Long

'****************************************************************
'
' ����������Ϣ������
' ����Dll���ص��Ľ���������Ϣ�������д���
' DLL�������ݴ˲���������з��л��ֹ���в���
' ������������Զ������Ϣ���ͣ����������̸�����PID������·����
'
'****************************************************************
Public Function SubClassMessage(ByVal lHwnd As Long, ByVal lMessage As Long, ByVal lParentPID As Long, ByVal lParam As Long) As Long
    On Error Resume Next
    
    Dim sTemp As String
    Dim uCDS As COPYDATASTRUCT
    
    '˫����������
    If lParam = &H203 Then
        
        'ɨ�贰��
        With FormScan
            .Top = (Screen.Height - .Height) / 2
            .Left = (Screen.Width - .Width) / 2
            .Show
            Call SendMessage(.hWnd, WM_SYSCOMMAND, SC_RESTORE, 0)
        End With
        
        Exit Function
    End If
    
    '�Ҽ������˵�
    If lParam = &H204 Then
        
        SetForegroundWindow FormMenu.hWnd
        FormMenu.PopupMenu FormMenu.m_TrayMenu
        
        Exit Function
    End If
    
    '���Ƿ���DLL��������Ϣ
    If lMessage = &H4A Then
        
        'ʹ���ʹ�������ڴ�
        MiniUseMemory
    
        'ȡ�ô��������ݳ���
        CopyMemory uCDS, ByVal lParam, Len(uCDS)
        sTemp = Space(uCDS.cbData)
                
        'ȡ�ô���������
        CopyMemory ByVal sTemp, ByVal uCDS.lpData, uCDS.cbData
        
        '�����д������������ĳ���
        Dim sFile As String
        sFile = sTemp
                        
        '����ļ���Ϊ�գ������
        If TrimNull(sFile) = "" Then
            '�Զ�����
            SubClassMessage = 915
            Exit Function
            
        End If
        
        '����ļ������ڣ������
        If Len(Dir(sFile)) = 0 Then
            Exit Function
        End If

        '�ж��Ƿ��ǳ����Լ��������
        Dim sTrimFile As String
        sTrimFile = TrimNull(sFile)
        If InStr(1, LCase(sTrimFile), LCase(App.Path & "\" & App.EXEName)) Or InStr(1, LCase(App.Path & "\" & App.EXEName), LCase(sTrimFile)) Then
            '�Զ�����
            SubClassMessage = 915
            Exit Function
        End If
        
        If FormSetting.OptionHighShildLevel.value = True Then
            '��Ӽ�¼
            With FormScan
                    .TextShieldLog.Text = .TextShieldLog.Text & Date & " " & Time & " " & sFile & " " & "��ֹ" & vbCrLf
            End With
                                    
            SetForegroundWindow FormScan.hWnd
            
            '����������ʾ�û�
            Dim uAlertFormHighShield As New FormAlertMessage
            With uAlertFormHighShield
                '���ô���λ��
                .Top = Screen.Height - .Height - 300
                .Left = Screen.Width - .Width
                  
                '��ʾ����
                .LabelInfo.Caption = "�����ȼ����ϸ񡣽�ֹ" & sFile & "������"
                '��ʾ����
                .Show
            End With
                                   
            '�˳�����
            Exit Function
        End If
        
        '�ж��ļ���С������ļ�̫����ֱ�ӷ���
        Dim lFileSize As Long
        Dim uSize As LARGE_INTEGER
        '���ļ�
        lFileSize = CreateFile(sFile, GENERIC_READ, FILE_SHARE_READ, ByVal 0&, OPEN_EXISTING, ByVal 0&, ByVal 0&)
        '��ȡ�ļ���С
        GetFileSizeEx lFileSize, uSize
        '�ر��ļ�
        CloseHandle lFileSize
        If uSize.lowpart / 1024 / 1024 > 15 Then
            '�Զ�����
            SubClassMessage = 915
            '��Ӽ�¼
            With FormScan
                .TextShieldLog.Text = .TextShieldLog.Text & Date & " " & Time & " " & sFile & " " & "����" & " " & "��ȫ�ļ�" & vbCrLf
            End With
            '�˳�����
            Exit Function
        End If
                
        'ɨ���ļ����ж��Ƿ��ǲ���
        Dim sScanResult As String
        sScanResult = ScanFile(sFile)
        If sScanResult <> "" Then
            '��Ӽ�¼
            With FormScan
                    .TextShieldLog.Text = .TextShieldLog.Text & Date & " " & Time & " " & sFile & " " & "��ֹ" & vbCrLf
            End With
                                    
            SetForegroundWindow FormScan.hWnd
            
            '����������ʾ�û�
            Dim uAlertForm As New FormAlertMessage
            With uAlertForm
                '���ô���λ��
                .Top = Screen.Height - .Height - 300
                .Left = Screen.Width - .Width
                  
                '��ʾ����
                .LabelInfo.Caption = "���ֲ�����" & sFile & "(" & sScanResult & ")" & "�������ء�"
                '��ʾ����
                .Show
            End With
                                   
            '�˳�����
            Exit Function
        End If
        
        '�Զ�����
        SubClassMessage = 915
        '��Ӽ�¼
        With FormScan
            .TextShieldLog.Text = .TextShieldLog.Text & Date & " " & Time & " " & sFile & " " & "����" & " " & "δ��⵽����" & vbCrLf
        End With
            
        '�˳�����
        Exit Function
    End If
    
    '�ؽ�����ͼ��
    If lMessage = WM_TASKBARCREATED Then
        AddTrayIcon
    End If
    
    '��DLL���������ݣ�ִ����������Ϣ������
    SubClassMessage = CallWindowProc(lSubClassOldAddress, lHwnd, lMessage, lParentPID, lParam)
End Function

