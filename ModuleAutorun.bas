Attribute VB_Name = "ModuleAutorun"
'****************************************************************
'
' Ty2yɱ�����
' http://www.ty2y.com/
'
' ���򿪻�������������
'
'****************************************************************
Option Explicit

'api����
Private Declare Function RegCreateKey Lib "advapi32.dll" Alias "RegCreateKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, ByRef phkResult As Long) As Long                    '����һ���µ�����
Private Declare Function RegSetValueExString Lib "advapi32.dll" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpData As Any, ByVal cbData As Long) As Long '������ı�һ����ֵ,��ʱ lpData Ӧ��ȱʡ�� ByRef �͸�Ϊ ByVal ��
Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
Private Declare Function RegDeleteValue Lib "advapi32.dll" Alias "RegDeleteValueA" (ByVal hKey As Long, ByVal lpValueName As String) As Long

'��������
Private Const REG_SZ = 1
Private Const HKEY_LOCAL_MACHINE = &H80000002

'���ÿ�������
Public Function SetAutoRun()
    On Error Resume Next
    Dim sAddAutoRunReg As String
    sAddAutoRunReg = "HQ"
    Dim nKeyHandle As Long
    Call RegCreateKey(HKEY_LOCAL_MACHINE, "Software\Microsoft\Windows\CurrentVersion\Run", nKeyHandle)
    
    If Right(App.Path, 1) = "\" Then
        Call RegSetValueExString(nKeyHandle, sAddAutoRunReg, 0, REG_SZ, App.Path & App.EXEName & ".exe", 255)
    Else
        Call RegSetValueExString(nKeyHandle, sAddAutoRunReg, 0, REG_SZ, App.Path & "\" & App.EXEName & ".exe", 255)
    End If
    
    Call RegCloseKey(nKeyHandle)
End Function

'ȡ����������
Public Function StopAutoRun()
    On Error Resume Next
    Dim Ret As Long, hKey As Long
    Call RegCreateKey(HKEY_LOCAL_MACHINE, "Software\Microsoft\Windows\CurrentVersion\Run", hKey)
    Call RegDeleteValue(hKey, "HQ")
    Call RegCloseKey(hKey)
End Function



