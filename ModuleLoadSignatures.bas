Attribute VB_Name = "ModuleLoadSignatures"
'****************************************************************
'
' Ty2yɱ�����
' http://www.ty2y.com/
'
' У��ͼ��ز�����
'
'****************************************************************

Option Explicit
'****************************************************************
'
' �Զ��岡�����ʽ
' ������(32λhashֵ) + ������(32λ��) + �س�����(chr(13)chr(10))
'
'****************************************************************
Private Type Signature
    'Section hash
    sHash As String * 32
    '����
    sName As String * 32
    '�س�����
    sVbCrlf As String * 2
End Type


'****************************************************************
'
' �������������
' �������ļ���0~9��A~F 16���ļ���ɣ�ÿ���������洢һ���������ļ�
'
'****************************************************************

Public uSignature0() As Signature
Public uSignature1() As Signature
Public uSignature2() As Signature
Public uSignature3() As Signature
Public uSignature4() As Signature
Public uSignature5() As Signature
Public uSignature6() As Signature
Public uSignature7() As Signature
Public uSignature8() As Signature
Public uSignature9() As Signature

Public uSignatureA() As Signature
Public uSignatureB() As Signature
Public uSignatureC() As Signature
Public uSignatureD() As Signature
Public uSignatureE() As Signature
Public uSignatureF() As Signature
Public uSignatureG() As Signature


'****************************************************************
'
' ��鲡�����ļ�������
' ����ֵ���������������� True�����򷵻� False
'
'****************************************************************
Public Function CheckSignatureFile() As Boolean

    '�����ǰ·��
    Dim sAppPath As String
    sAppPath = App.Path
    
    '���·��������
    If Right(sAppPath, 1) <> "\" Then
        sAppPath = sAppPath & "\"
    End If
    
    Dim sSignatureFile As String
    
    '���0~9�������ļ��Ƿ����
    Dim I As Long
    For I = 0 To 9
        '�������ļ�
        sSignatureFile = sAppPath & I & ".sig"
        If Dir(sSignatureFile) = "" Then
            CheckSignatureFile = False
            Exit Function
        End If
    Next
    
    '���A~Z�������ļ��Ƿ����
    Dim j As Long
    For j = 65 To 71
        '�������ļ�
        sSignatureFile = sAppPath & Chr(j) & ".sig"
        If Dir(sSignatureFile) = "" Then
            CheckSignatureFile = False
            Exit Function
        End If
    Next
    
    CheckSignatureFile = True
    
End Function

'****************************************************************
'
' �Ӳ������ļ�����������
'
'****************************************************************
Public Function LoadSignatures() As Long
    
    '�����ǰ·��
    Dim sAppPath As String
    sAppPath = App.Path
    
    '���·��������
    If Right(sAppPath, 1) <> "\" Then
        sAppPath = sAppPath & "\"
    End If
    
    '�������ļ�
    Dim sSignatureFile As String
    '�ļ����
    Dim lFile As Long
    '�ļ�����
    Dim lFileLen As Long
    '���������
    Dim lSignatureCount As Long
    
    lSignatureCount = 0
    
    '����0~9�������ļ�
    Dim I As Long
    For I = 0 To 9
        DoEvents
        '�������ļ�
        sSignatureFile = sAppPath & I & ".sig"
        
        '�Ӳ������ļ�����������
        Select Case I
        Case "0"
            lFile = FreeFile
            Open sSignatureFile For Binary As #lFile
            lFileLen = LOF(lFile)
            '�ж��ļ��Ƿ�Ϊ��
            If lFileLen <> 0 Then
                ReDim uSignature0(1 To lFileLen / 66) As Signature
                Get lFile, , uSignature0
                lSignatureCount = lSignatureCount + (lFileLen / 66)
            End If
            Close lFile
        Case "1"
            lFile = FreeFile
            Open sSignatureFile For Binary As #lFile
            lFileLen = LOF(lFile)
            '�ж��ļ��Ƿ�Ϊ��
            If lFileLen <> 0 Then
                ReDim uSignature1(1 To lFileLen / 66) As Signature
                Get lFile, , uSignature1
                lSignatureCount = lSignatureCount + (lFileLen / 66)
            End If
            Close lFile
        Case "2"
            lFile = FreeFile
            Open sSignatureFile For Binary As #lFile
            lFileLen = LOF(lFile)
            '�ж��ļ��Ƿ�Ϊ��
            If lFileLen <> 0 Then
                ReDim uSignature2(1 To lFileLen / 66) As Signature
                Get lFile, , uSignature2
                lSignatureCount = lSignatureCount + (lFileLen / 66)
            End If
            Close lFile
        Case "3"
            lFile = FreeFile
            Open sSignatureFile For Binary As #lFile
            lFileLen = LOF(lFile)
            '�ж��ļ��Ƿ�Ϊ��
            If lFileLen <> 0 Then
                ReDim uSignature3(1 To lFileLen / 66) As Signature
                Get lFile, , uSignature3
                lSignatureCount = lSignatureCount + (lFileLen / 66)
            End If
            Close lFile
        Case "4"
            lFile = FreeFile
            Open sSignatureFile For Binary As #lFile
            lFileLen = LOF(lFile)
            '�ж��ļ��Ƿ�Ϊ��
            If lFileLen <> 0 Then
                ReDim uSignature4(1 To lFileLen / 66) As Signature
                Get lFile, , uSignature4
                lSignatureCount = lSignatureCount + (lFileLen / 66)
            End If
            Close lFile
        Case "5"
            lFile = FreeFile
            Open sSignatureFile For Binary As #lFile
            lFileLen = LOF(lFile)
            '�ж��ļ��Ƿ�Ϊ��
            If lFileLen <> 0 Then
                ReDim uSignature5(1 To lFileLen / 66) As Signature
                Get lFile, , uSignature5
                lSignatureCount = lSignatureCount + (lFileLen / 66)
            End If
            Close lFile
        Case "6"
            lFile = FreeFile
            Open sSignatureFile For Binary As #lFile
            lFileLen = LOF(lFile)
            '�ж��ļ��Ƿ�Ϊ��
            If lFileLen <> 0 Then
                ReDim uSignature6(1 To lFileLen / 66) As Signature
                Get lFile, , uSignature6
                lSignatureCount = lSignatureCount + (lFileLen / 66)
            End If
            Close lFile
        Case "7"
            lFile = FreeFile
            Open sSignatureFile For Binary As #lFile
            lFileLen = LOF(lFile)
            '�ж��ļ��Ƿ�Ϊ��
            If lFileLen <> 0 Then
                ReDim uSignature7(1 To lFileLen / 66) As Signature
                Get lFile, , uSignature7
                lSignatureCount = lSignatureCount + (lFileLen / 66)
            End If
            Close lFile
        Case "8"
            lFile = FreeFile
            Open sSignatureFile For Binary As #lFile
            lFileLen = LOF(lFile)
            '�ж��ļ��Ƿ�Ϊ��
            If lFileLen <> 0 Then
                ReDim uSignature8(1 To lFileLen / 66) As Signature
                Get lFile, , uSignature8
                lSignatureCount = lSignatureCount + (lFileLen / 66)
            End If
            Close lFile
        Case "9"
            lFile = FreeFile
            Open sSignatureFile For Binary As #lFile
            lFileLen = LOF(lFile)
            '�ж��ļ��Ƿ�Ϊ��
            If lFileLen <> 0 Then
                ReDim uSignature9(1 To lFileLen / 66) As Signature
                Get lFile, , uSignature9
                lSignatureCount = lSignatureCount + (lFileLen / 66)
            End If
            Close lFile
        End Select
        
    Next
    
    '����A~F�������ļ�
    Dim j As Long
    For j = 65 To 70
    
        DoEvents
        '�������ļ�
        sSignatureFile = sAppPath & Chr(j) & ".sig"
        '�Ӳ������ļ�����������
        Select Case UCase(Chr(j))
        Case "A"
            lFile = FreeFile
            Open sSignatureFile For Binary As #lFile
            lFileLen = LOF(lFile)
            '�ж��ļ��Ƿ�Ϊ��
            If lFileLen <> 0 Then
                ReDim uSignatureA(1 To lFileLen / 66) As Signature
                Get lFile, , uSignatureA
                lSignatureCount = lSignatureCount + (lFileLen / 66)
            End If
            Close lFile
        Case "B"
            lFile = FreeFile
            Open sSignatureFile For Binary As #lFile
            lFileLen = LOF(lFile)
            '�ж��ļ��Ƿ�Ϊ��
            If lFileLen <> 0 Then
                ReDim uSignatureB(1 To lFileLen / 66) As Signature
                Get lFile, , uSignatureB
                lSignatureCount = lSignatureCount + (lFileLen / 66)
            End If
            Close lFile
        Case "C"
            lFile = FreeFile
            Open sSignatureFile For Binary As #lFile
            lFileLen = LOF(lFile)
            '�ж��ļ��Ƿ�Ϊ��
            If lFileLen <> 0 Then
                ReDim uSignatureC(1 To lFileLen / 66) As Signature
                Get lFile, , uSignatureC
                lSignatureCount = lSignatureCount + (lFileLen / 66)
            End If
            Close lFile
        Case "D"
            lFile = FreeFile
            Open sSignatureFile For Binary As #lFile
            lFileLen = LOF(lFile)
            '�ж��ļ��Ƿ�Ϊ��
            If lFileLen <> 0 Then
                ReDim uSignatureD(1 To lFileLen / 66) As Signature
                Get lFile, , uSignatureD
                lSignatureCount = lSignatureCount + (lFileLen / 66)
            End If
            Close lFile
        Case "E"
            lFile = FreeFile
            Open sSignatureFile For Binary As #lFile
            lFileLen = LOF(lFile)
            '�ж��ļ��Ƿ�Ϊ��
            If lFileLen <> 0 Then
                ReDim uSignatureE(1 To lFileLen / 66) As Signature
                Get lFile, , uSignatureE
                lSignatureCount = lSignatureCount + (lFileLen / 66)
            End If
            Close lFile
        Case "F"
            lFile = FreeFile
            Open sSignatureFile For Binary As #lFile
            lFileLen = LOF(lFile)
            '�ж��ļ��Ƿ�Ϊ��
            If lFileLen <> 0 Then
                ReDim uSignatureF(1 To lFileLen / 66) As Signature
                Get lFile, , uSignatureF
                lSignatureCount = lSignatureCount + (lFileLen / 66)
            End If
            Close lFile
        End Select
    Next
    
    '"G"
    lFile = FreeFile
    Open sAppPath & "G.sig" For Binary As #lFile
    lFileLen = LOF(lFile)
    
    '�ж��ļ��Ƿ�Ϊ��
    If lFileLen <> 0 Then
        ReDim uSignatureG(1 To lFileLen / 66) As Signature
        Get lFile, , uSignatureG
        lSignatureCount = lSignatureCount + (lFileLen / 66)
    End If
    Close lFile

    
    '�����������ܼ�����
    LoadSignatures = lSignatureCount
    
    
End Function
