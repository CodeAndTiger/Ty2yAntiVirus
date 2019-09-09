Attribute VB_Name = "ModuleProcessPriority"
Private Declare Function OpenProcess Lib "kernel32" (ByVal dwDesiredAccess As Long, ByVal bInheritHandle As Long, ByVal dwProcessID As Long) As Long
Private Declare Function SetPriorityClass Lib "kernel32" (ByVal hProcess As Long, ByVal dwPriorityClass As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long
Private Declare Function GetCurrentProcessId Lib "kernel32" () As Long

'�򿪽��̳���
Private Const PROCESS_QUERY_INFORMATION As Long = &H400
Private Const PROCESS_SET_INFORMATION As Long = &H200

'�������ȼ�=32�������������ȼ�=16384
Public Function SetProcessPriority(ByVal Priority As Long) As Boolean
    
    Dim lProcessID As Long
    'ȡ�õ�ǰ����ID
    lProcessID = GetCurrentProcessId()
    
    
    '�򿪽���
    Dim lOpenProcessReturn As Long
    lOpenProcessReturn = OpenProcess(PROCESS_QUERY_INFORMATION Or PROCESS_SET_INFORMATION, 0, lProcessID)
    
    If lOpenProcessReturn Then
        '�������ȼ�
        Call SetPriorityClass(lOpenProcessReturn, Priority)
        '���ú�������ֵ
        SetProcessPriority = True
    Else
        '���ú�������ֵ
        SetProcessPriority = False
    End If
   
    '�رվ��
    Call CloseHandle(lOpenProcessReturn)
End Function

