Attribute VB_Name = "ModuleRightClickMenu"
Option Explicit

Private Declare Function RegCloseKey Lib "advapi32.dll" (ByVal hKey As Long) As Long
'������
Private Declare Function RegCreateKey Lib "advapi32.dll" Alias "RegCreateKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long
'д������ֵ
Private Declare Function RegSetValueEx Lib "advapi32" Alias "RegSetValueExA" (ByVal hKey As Long, ByVal lpValueName As String, ByVal Reserved As Long, ByVal dwType As Long, ByVal lpData As String, ByVal cbData As Long) As Long
'ɾ����Ŀ
Private Declare Function RegDeleteKey Lib "advapi32.dll" Alias "RegDeleteKeyA" (ByVal hKey As Long, ByVal lpSubKey As String) As Long
'��ע���subkey��hkey
Private Declare Function RegOpenKey Lib "advapi32.dll" Alias "RegOpenKeyA" (ByVal hKey As Long, ByVal lpSubKey As String, phkResult As Long) As Long

Private Const HKEY_CLASSES_ROOT = &H80000000
Private Const REG_SZ = 1


Public Function AddFileRightClickMenu() As Boolean
    
    Dim hKey As Long, ret As Long
    
    '����ע�����
    RegCreateKey HKEY_CLASSES_ROOT, "*\shell\����ɱ��\command", hKey
    
    '�����Ҽ��˵���Ŀ
    ret = RegSetValueEx(hKey, "", 0, REG_SZ, ByVal App.Path & "\" & App.EXEName & ".exe %1", ByVal LenB(StrConv(App.Path & "\" & App.EXEName & ".exe %1", vbFromUnicode)) + 1)
    
    If ret = 0 Then
    
        '�ɹ�
        AddFileRightClickMenu = True
    Else
        'ʧ��
        AddFileRightClickMenu = False
    End If
    
    RegCloseKey hKey
    
End Function

'ɾ���Ҽ��˵�
Public Function DeleteRightClickMenu() As Boolean

    '�������ֲ�ִ�У���ͬɾ���ļ���һ��������ɾ���ǿյ��ļ���
    DeleteKey HKEY_CLASSES_ROOT, "*\shell\����ɱ��", "command"
    DoEvents
    DeleteKey HKEY_CLASSES_ROOT, "*\shell", "����ɱ��"
    DoEvents
    DeleteKey HKEY_CLASSES_ROOT, "Directory\shell\����ɱ��", "command"
    DoEvents
    DeleteKey HKEY_CLASSES_ROOT, "Directory\shell", "����ɱ��"
    DoEvents
    DeleteRightClickMenu = True
End Function

'ɾ��ע��������
Function DeleteKey(RootKey As Long, ParentKeyName As String, SubKeyName As String)

    Dim hKey As Long
    RegOpenKey RootKey, ParentKeyName, hKey
    RegDeleteKey hKey, SubKeyName
    RegCloseKey hKey
End Function


'�⺯��������������ӵ�Ŀ¼��
Public Function AddFolderRightClickMenu() As Boolean

    '��Ӧ�ó�������Ҽ��˵�
    Dim hKey As Long, ret As Long
    
    '����ע�����
    RegCreateKey HKEY_CLASSES_ROOT, "Directory\shell\����ɱ��\command", hKey
    
    '�����Ҽ��˵���Ŀ
    ret = RegSetValueEx(hKey, "", 0, REG_SZ, ByVal App.Path & "\" & App.EXEName & ".exe %1", ByVal LenB(StrConv(App.Path & "\" & App.EXEName & ".exe %1", vbFromUnicode)) + 1)
    If ret = 0 Then
           AddFolderRightClickMenu = True
    Else
           AddFolderRightClickMenu = False
    End If
    
    RegCloseKey hKey '�ر�ע�����
End Function


