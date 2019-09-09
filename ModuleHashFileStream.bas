Attribute VB_Name = "ModuleHashFileStream"
'****************************************************************
'
' Ty2yɱ�����
' http://www.ty2y.com/
'
' ȡ���ļ���(section)�Ĺ�ϣֵ(hash)
'
'****************************************************************

Option Explicit

'API����
Private Declare Function CryptAcquireContext Lib "advapi32.dll" Alias "CryptAcquireContextA" (ByRef phProv As Long, ByVal pszContainer As String, ByVal pszProvider As String, ByVal dwProvType As Long, ByVal dwFlags As Long) As Long
Private Declare Function CryptReleaseContext Lib "advapi32.dll" (ByVal hProv As Long, ByVal dwFlags As Long) As Long
Private Declare Function CryptCreateHash Lib "advapi32.dll" (ByVal hProv As Long, ByVal Algid As Long, ByVal hKey As Long, ByVal dwFlags As Long, ByRef phHash As Long) As Long
Private Declare Function CryptDestroyHash Lib "advapi32.dll" (ByVal lHash As Long) As Long
Private Declare Function CryptHashData Lib "advapi32.dll" (ByVal lHash As Long, pbData As Any, ByVal dwDataLen As Long, ByVal dwFlags As Long) As Long
Private Declare Function CryptGetHashParam Lib "advapi32.dll" (ByVal lHash As Long, ByVal dwParam As Long, pbData As Any, pdwDataLen As Long, ByVal dwFlags As Long) As Long
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)

'��������
Private Const PROV_RSA_FULL = 1
Private Const CRYPT_NEWKEYSET = &H8
Private Const ALG_CLASS_HASH = 32768
Private Const ALG_TYPE_ANY = 0
Private Const ALG_SID_MD5 = 3
Private Const ALGORITHM = ALG_CLASS_HASH Or ALG_TYPE_ANY Or ALG_SID_MD5
Private Const HP_HASHVAL = 2
Private Const HP_HASHSIZE = 4

'****************************************************************
'
' ����ļ���hash,�ļ��в������ݵ�hash��������ȡsection
' ������ByteStream ��(Byte����)
' �ɹ���������hash��ʧ�ܷ��ؿ�
'
'****************************************************************
Public Function HashFileStream(ByteStream() As Byte) As String
    
    '��ʼ����������ֵ
    HashFileStream = ""
    
    Dim lCtx As Long
    Dim lHash As Long
    Dim lFile As Long
    Dim lRes As Long
    Dim lLen As Long
    Dim lIdx As Long
    Dim bHash() As Byte
    Dim bBlock() As Byte
    
    Dim bStream() As Byte
    ReDim bStream(1 To UBound(ByteStream)) As Byte
    
    CopyMemory bStream(1), ByteStream(1), UBound(ByteStream)
    
    'API���ܣ��õ�CS������������
    '����˵����
    '����1 lCtx : ����CSP���
    '����2 : ����������,Ϊ������ȱʡ��CSP
    '����3 : Ϊ��ʱʹ��Ĭ��CSP��(΢��RSA Base Provider)
    '����4 PROV_RSA_FULLCSP : ����
    lRes = CryptAcquireContext(lCtx, vbNullString, vbNullString, PROV_RSA_FULL, 0)
    
    If lRes <> 0 Then
        
        'API���ܣ���hash����
        '����˵����
        '����1: CSP���
        '����2: ѡ��hash�㷨������CALG_MD5��
        '����3: HMAC ��MAC�㷨ʱ����
        '����4: ����������0����
        '����5:����hash���
        lRes = CryptCreateHash(lCtx, ALGORITHM, 0, 0, lHash)
            
        If lRes <> 0 Then
            
            '32K ���ֺ��&����˼��ϵͳĬ��������Integer�ͣ�����&��ǿ�ư������ת����Long��
            Const BLOCK_SIZE As Long = 32 * 1024&
            ReDim bBlock(1 To BLOCK_SIZE) As Byte
            
            Dim lCount As Long
            Dim lBlocks As Long
            Dim lLastBlock As Long
                
            '�����
            lBlocks = UBound(ByteStream) \ BLOCK_SIZE
            '���һ����
            lLastBlock = UBound(ByteStream) - lBlocks * BLOCK_SIZE
        
            For lCount = 0 To lBlocks - 1
                CopyMemory bBlock(1), bStream(1 + lCount * BLOCK_SIZE), BLOCK_SIZE
                
                'API���ܣ�hash����
                '����˵����
                '����1: hash����
                '����2: ��hash������
                '����3: ���ݵĳ���
                '����4: ΢���CSP���ֵ�ᱻ����
                lRes = CryptHashData(lHash, bBlock(1), BLOCK_SIZE, 0)
            Next
                
            If lLastBlock > 0 And lRes <> 0 Then
                ReDim bBlock(1 To lLastBlock) As Byte
                CopyMemory bBlock(1), bStream(1 + lCount * BLOCK_SIZE), lLastBlock
                lRes = CryptHashData(lHash, bBlock(1), lLastBlock, 0)
            End If
            
            If lRes <> 0 Then
            
                'API���ܣ�ȡhash���ݴ�С
                '����˵����
                '����1��hash����
                '����2��ȡhash���ݴ�С(HP_HASHSIZE)
                '����3������hash���ݳ���
                lRes = CryptGetHashParam(lHash, HP_HASHSIZE, lLen, 4, 0)
                
                If lRes <> 0 Then
                    ReDim bHash(0 To lLen - 1)
                    
                    'API���ܣ�ȡ��hash����
                    '����˵����
                    '����1��hash����
                    '����2��ȡhash����(ֵ)(HP_HASHVAL)
                    '����3��hash����
                    lRes = CryptGetHashParam(lHash, HP_HASHVAL, bHash(0), lLen, 0)
                    If lRes <> 0 Then
                        For lIdx = 0 To UBound(bHash)
                            '����hashֵ��2λһ�飬���㲹0
                            HashFileStream = HashFileStream & Right("0" & Hex(bHash(lIdx)), 2)
                        Next
                    End If
                End If
            End If
    
            CryptDestroyHash lHash
        End If
    End If
    CryptReleaseContext lCtx, 0

End Function

'****************************************************************
'
' ����ļ�hashֵ
' �������ļ���
' �ɹ������ļ���hash��ʧ�ܷ��ؿ�
' ������HashFileStream���ƣ�ע�Ϳɲμ�HashFileStream
'
'****************************************************************
Function HashFile(ByVal sFilename As String) As String
    
    HashFile = ""
    
    Dim lCtx As Long
    Dim lHash As Long
    Dim lFile As Long
    Dim lRes As Long
    Dim lLen As Long
    Dim lIdx As Long
    Dim bHash() As Byte
    
    If Len(Dir(sFilename)) = 0 Then
        Exit Function
    End If
    lRes = CryptAcquireContext(lCtx, vbNullString, vbNullString, PROV_RSA_FULL, 0)
    If lRes <> 0 Then
        lRes = CryptCreateHash(lCtx, ALGORITHM, 0, 0, lHash)
        If lRes <> 0 Then
            lFile = FreeFile
            Open sFilename For Binary As #lFile
                Const BLOCK_SIZE As Long = 32 * 1024&
                ReDim bBlock(1 To BLOCK_SIZE) As Byte
                Dim lCount As Long
                Dim lBlocks As Long
                Dim lLastBlock As Long
                lBlocks = LOF(lFile) \ BLOCK_SIZE
                lLastBlock = LOF(lFile) - lBlocks * BLOCK_SIZE
                For lCount = 1 To lBlocks
                    Get lFile, , bBlock
                    lRes = CryptHashData(lHash, bBlock(1), BLOCK_SIZE, 0)
                Next
                If lLastBlock > 0 And lRes <> 0 Then
                    ReDim bBlock(1 To lLastBlock) As Byte
                    Get lFile, , bBlock
                    lRes = CryptHashData(lHash, bBlock(1), lLastBlock, 0)
                End If
            Close lFile
            If lRes <> 0 Then
                lRes = CryptGetHashParam(lHash, HP_HASHSIZE, lLen, 4, 0)
                If lRes <> 0 Then
                    ReDim bHash(0 To lLen - 1)
                    lRes = CryptGetHashParam(lHash, HP_HASHVAL, bHash(0), lLen, 0)
                    If lRes <> 0 Then
                        For lIdx = 0 To UBound(bHash)
                            HashFile = HashFile & Right("0" & Hex(bHash(lIdx)), 2)
                        Next
                    End If
                End If
            End If
            CryptDestroyHash lHash
        End If
    End If
    CryptReleaseContext lCtx, 0
End Function
