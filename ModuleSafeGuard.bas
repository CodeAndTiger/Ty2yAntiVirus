Attribute VB_Name = "ModuleSafeGuard"
'****************************************************************
'
' ���ұ���
'
'****************************************************************
Option Explicit

'API����
Private Declare Function SafeGuardON Lib "SafeGuard.dll" (ByVal TargetHwnd As Long) As Boolean
Private Declare Function SafeGuardOFF Lib "SafeGuard.dll" () As Boolean
Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long

'****************************************************************
'
' ������ر����ұ�������ֹ���̱��Ƿ�����
' ������Boolean�ͣ�����Trueʱ�������ұ���������Falseʱ�ر����ұ���
' ����ֵ��True��ʾ�ɹ���False��ʾʧ��
'
'****************************************************************
Public Function SafeGuard(ByVal bOperation As Boolean) As Boolean

    Dim lHwnd As Long
    'ȡ�õ�ǰ����Pidֵ
    lHwnd = GetCurrentProcessId
    
    Dim bRet As Boolean
    '�жϲ�����Ϊ��ִ�б�����ֹͣ����
    If bOperation = True Then
    
        bRet = SafeGuardON(lHwnd)
        '���ؽ��
        'ע��VC��return true���ص�trueֵ����VB��trueֵ��ͬ�������´��벻��ʹ��bret=true���бȽϡ�
        'VC True=1
        'VB true=0ffffff
        If bRet Then
            SafeGuard = True
        Else
            SafeGuard = False
        End If
    Else
        SafeGuardOFF
        SafeGuard = True
    End If
    
End Function

