Attribute VB_Name = "ModuleIniFileOperation"
'****************************************************************
'
' Ty2yɱ�����
' http://www.ty2y.com/
'
' ��дini�ļ�
'
'****************************************************************
Option Explicit

'API����
Private Declare Function GetPrivateProfileString Lib "kernel32" Alias "GetPrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpDefault As String, ByVal lpReturnedString As String, ByVal nSize As Long, ByVal lpFileName As String) As Long
Private Declare Function WritePrivateProfileString Lib "kernel32" Alias "WritePrivateProfileStringA" (ByVal lpApplicationName As String, ByVal lpKeyName As Any, ByVal lpString As Any, ByVal lpFileName As String) As Long

'****************************************************************
'
' Ini�ļ�д����
' ������
' sFile - Ini�ļ���
' sSection - ��
' sKeyName - ����
' sKeyValue - д���ֵ
' ����ֵ��
' �ɹ�����True��ʧ�ܷ���False
'
'****************************************************************
Public Function WriteIni(ByVal sFile As String, ByVal sSection As String, ByVal sKeyName As String, ByVal sKeyValue As String) As Boolean
    
    'APIִ�з���ֵ
    Dim lRet As Long
      
    'д����
    lRet = WritePrivateProfileString(sSection, sKeyName, sKeyValue, sFile)
    
    If lRet = 0 Then
        'д�ļ�ʧ�ܣ�����
        WriteIni = False
        Exit Function
    Else
        '�ɹ�������
        WriteIni = True
        Exit Function
    End If
    
End Function

'****************************************************************
'
' Ini�ļ�������
' ������
' sFile - Ini�ļ���
' sSection - ��
' sKeyName - ��ֵ
' ����ֵ��
' ��ȡ�����ַ���
'
'****************************************************************
Public Function ReadIni(ByVal sFile As String, ByVal sSection As String, ByVal sKeyName As String) As String

    'API����ֵ
    Dim lRet As Long

    Dim sTemp As String * 255
       
    '������
    lRet = GetPrivateProfileString(sSection, sKeyName, "", sTemp, 255, sFile)
    
    If lRet = 0 Then
        '���ؿ�
        ReadIni = ""
        Exit Function
    Else
        'ȥ�����ɼ��ַ�
        ReadIni = TrimNull(sTemp)
    End If
    
End Function

