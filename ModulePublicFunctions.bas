Attribute VB_Name = "ModulePublicFunctions"
'****************************************************************
'
' Ty2yɱ�����
' http://www.ty2y.com/
'
' ��������
'
'****************************************************************

Option Explicit
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function HookMsgOFF Lib "MsgCallBack.dll" () As Boolean
Private Declare Function SetProcessWorkingSetSize Lib "kernel32" (ByVal hProcess As Long, ByVal dwMinimumWorkingSetSize As Long, ByVal dwMaximumWorkingSetSize As Long) As Long
Private Declare Function GetCurrentProcess Lib "kernel32" () As Long

'****************************************************************
'
' ��չ���ܵ�Trim����ȥ���ַ����е�chr(0)�������ɼ��ַ����س�\����
' �������ַ���
' ����ֵ��ȥ��chr(0)����ַ���
'
'****************************************************************
Public Function TrimNull(sStr As String) As String
    If InStr(1, sStr, Chr(0)) Then
        TrimNull = Trim(Left(sStr, InStr(1, sStr, Chr(0)) - 1))
    Else
        TrimNull = Trim(sStr)
    End If
End Function

'****************************************************************
'
' �˳�����
' �ָ����໯��ֹͣHook�������˳�����
'
'****************************************************************
Public Function TrueEnd()
  
    '�ָ�������Ϣ����
    SetWindowLong FormScan.hWnd, -4, lSubClassOldAddress
    
    '�Ƴ�����ͼ��
    RemoveTrayIcon
    
    '�ı䴰��ж�ر�־
    bEnableUnloadForm = True
    'ж�ش���
    
    Unload FormSetting
    Unload FormUpdate
    Unload FormSelectFolders
    Unload FormMenu
    Unload FormScan
    Unload FormSkin
    Unload FormAlertMessage
    Unload FormScanFinish
    Unload FormAlertVirus
    Unload FormAbout
    
End Function

'****************************************************************
'
' ʹ���ʹ�������ڴ�
'
'****************************************************************
Public Function MiniUseMemory()
    SetProcessWorkingSetSize GetCurrentProcess(), -1&, -1&
End Function

'****************************************************************
'
'�������������
'
'****************************************************************
Public Function RndChr(Numbers As Long) As String
    Dim I As Long
    Dim sAscii As String
    For I = 1 To Numbers
        '�����������������ʼ���Ķ�����
        Randomize
        '����65-90֮��������ֵ��
        sAscii = Int((90 - 65) * Rnd + 65)
        RndChr = RndChr + Chr(sAscii)
    Next I
    RndChr = UCase(RndChr)
End Function

Public Function ReSkinAll()
    FormAlertMessage.ReSkinMe
    DoEvents
    FormAlertVirus.ReSkinMe
    DoEvents
    FormScan.ReSkinMe
    DoEvents
    FormScanFinish.ReSkinMe
    DoEvents
    FormSelectFolders.ReSkinMe
    DoEvents
    FormSetting.ReSkinMe
    DoEvents
    FormSkin.ReSkinMe
    DoEvents
    FormUpdate.ReSkinMe
    DoEvents
    FormAbout.ReSkinMe
    DoEvents
End Function
