Attribute VB_Name = "ModulePeOperation"
'****************************************************************
'
' Ty2yɱ�����
' http://www.ty2y.com/
'
' PE�ļ�����,ɨ���ļ��Ƿ��ǲ���
'
'****************************************************************
Option Explicit

Private Declare Function GetFileSizeEx Lib "kernel32.dll" (ByVal hFile As Long, ByRef lpFileSize As LARGE_INTEGER) As Long

Private Type LARGE_INTEGER
    lowpart As Long
    highpart As Long
End Type

'****************************************************************
'
'PE�ļ��ṹ
'
'+---------------------+
'|   1 DOSͷ
'+---------------------+
'|   2 �ļ�ͷ
'+---------------------+
'|   3 ��ѡ�ļ�ͷ
'|--------------------
'|   |-----------------+
'|   | (����Ŀ¼)Data Directories
'|   | | (RVA,Size)
'+---------------------+
'|   4(��ͷ)Section-Headers
'+---------------------+
'|   5(��������)Section   Data
'+---------------------+
'****************************************************************

'****************************************************************
'(1)
'DOSͷ
'��������lfanew��e_magic���������������
'������֣����ǹ��ĵ�Ϊ lfanew,
'�õ�ַָ����PEͷ�ṹ���ļ��е�ƫ��.�����ǵ�����ļ���ֵΪ0x40,��0x40��ʼ����PEͷ�Ŀ�ʼ,��־Ϊ"PE"�����ַ�.
Private Type IMAGE_DOS_HEADER
    Magic As Integer
    cblp As Integer
    cp As Integer
    crlc As Integer
    cparhdr As Integer
    minalloc As Integer
    maxalloc As Integer
    ss As Integer
    sp As Integer
    csum As Integer
    ip As Integer
    cs As Integer
    lfarlc As Integer
    ovno As Integer
    res(3) As Integer
    oemid As Integer
    oeminfo As Integer
    res2(9) As Integer
    lfanew As Long
End Type

'(2)
'�ļ�ͷ
Private Type IMAGE_FILE_HEADER
    Machine As Integer
    NumberOfSections As Integer
    TimeDateStamp As Long
    PointerToSymbolTable As Long
    NumberOfSymbols As Long
    SizeOfOtionalHeader As Integer
    Characteristics As Integer
End Type

'(3)
'��ѡ�ļ�ͷ
Private Type IMAGE_DATA_DIRECTORY
    'ÿ����ַ����Virtual,���ǳ�����غ�õ�ַ���ڴ��������ImageBase��ƫ��,��virtual�ĵ�ַ������
    DataRVA As Long
    '���ļ��е�ƫ��Ϊ��Addr - ��ӦSection��VirtualAddress + ��ӦSection���ļ�����ʼƫ��
    DataSize As Long
End Type
Private Type IMAGE_OPTIONAL_HEADER
    Magic As Integer
    MajorLinkVer As Byte
    MinorLinkVer As Byte
    CodeSize As Long
    InitDataSize As Long
    unInitDataSize As Long
    '��ڵ�ַ,����Ҫ(����ڵĿ�ʼ��)
    EntryPoint As Long
    '�������ʼ��ַ(RVA)
    CodeBase As Long
    '���ݶ���ʼ��ַ(RVA)
    DataBase As Long
    'NT/2k/XP��������0x400000
    ImageBase As Long
    SectionAlignment As Long
    FileAlignment As Long
    MajorOSVer As Integer
    MinorOSVer As Integer
    MajorImageVer As Integer
    MinorImageVer As Integer
    MajorSSVer As Integer
    MinorSSVer As Integer
    Win32Ver As Long
    ImageSize As Long
    HeaderSize As Long
    Checksum As Long
    '���������,Ҫ��Ȼ�������ǷǷ�Win32����,MajorSubsystemVersionҲ��
    Subsystem As Integer
    DLLChars As Integer
    StackRes As Long
    StackCommit As Long
    HeapReserve As Long
    HeapCommit  As Long
    LoaderFlags As Long
    RVAsAndSizes As Long
    DataEntries(15) As IMAGE_DATA_DIRECTORY
End Type

'****************************************************************
'15������Ŀ¼��
'1   Export table address and size(�����)
'2   Import table address and size(�����)
'3   Resource table address and size
'4   Exception   table   address   and   size
'5   Certificate   table   address   and   size
'6   Base   relocation   table   address   and   size
'7   Debugging   information   starting   address   and   size
'8   Architecture-specific   data   address   and   size
'9   Global   pointer   register   relative   virtual   address
'10  Thread   local   storage   (TLS)   table   address   and   size
'11  Load   configuration   table   address   and   size
'12  Bound   import   table   address   and   size
'13  Import   address   table   address   and   size
'14  Delay   import   descriptor   address   and   size
'15  Reserved
'16  Reserved
'****************************************************************

'(4)
'��ͷ
Private Type IMAGE_SECTION_HEADER
    '����(8 byte)
    SectionName(7) As Byte
    VirtualSize As Long
    '�ڵ�RVA
    VirtualAddress As Long
    '�ڴ�С Raw Data
    SizeOfRawData As Long
    '�ڵ��ļ�ƫ����
    PointerToRawData As Long
    PointerToRelocations As Long
    PLineNums As Long
    RelocCount As Integer
    LineCount As Integer
    '�ڵ�����,��ɶ���д
    Characteristics As Long
End Type

'(5)
'������

Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (Destination As Any, Source As Any, ByVal Length As Long)
Private Declare Function CreateFile Lib "kernel32" Alias "CreateFileA" (ByVal lpFileName As String, ByVal dwDesiredAccess As Long, ByVal dwShareMode As Long, lpSecurityAttributes As Any, ByVal dwCreationDisposition As Long, ByVal dwFlagsAndAttributes As Long, ByVal hTemplateFile As Long) As Long
Private Declare Function ReadFile Lib "kernel32" (ByVal hFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToRead As Long, lpNumberOfBytesRead As Long, lpOverlapped As Any) As Long
Private Declare Function WriteFile Lib "kernel32" (ByVal hFile As Long, lpBuffer As Any, ByVal nNumberOfBytesToWrite As Long, lpNumberOfBytesWritten As Long, lpOverlapped As Any) As Long
Private Declare Function SetFilePointer Lib "kernel32" (ByVal hFile As Long, ByVal lDistanceToMove As Long, lpDistanceToMoveHigh As Long, ByVal dwMoveMethod As Long) As Long
Private Declare Function CloseHandle Lib "kernel32" (ByVal hObject As Long) As Long

Private Const GENERIC_READ = &H80000000
Private Const FILE_SHARE_READ = &H1
Private Const OPEN_EXISTING = 3

'****************************************************************
'
' ɨ���ļ�Section����hash(�ڴ�С+��hash)����������ƥ���ⲡ��
' �ر�˵����ɨ���ļ���ڵ�ַ���ڽ�
' ������hFile �ļ����,����ǰ���Ϸ���
' ����ֵ����⵽���ز����������򷵻ؿ�
'
'****************************************************************
Private Function ScanSections(hFile As Long) As String
    
    '��ʼ������
    ScanSections = ""
    
    'DOSͷ
    Dim uDos          As IMAGE_DOS_HEADER
    '�ļ�ͷ
    Dim uFile         As IMAGE_FILE_HEADER
    '��ѡͷ
    Dim uOptional     As IMAGE_OPTIONAL_HEADER
    '��ͷ
    Dim uSections()   As IMAGE_SECTION_HEADER
    
    Dim lBytesRead As Long
    Dim I As Long
    Dim bTempMemory() As Byte
    

    '��ָ���ƶ����ļ�ͷ
    SetFilePointer hFile, 0, 0, 0
    
    '��ȡDOSͷ
    ReadFile hFile, uDos, Len(uDos), lBytesRead, ByVal 0&
    
    '����DOSͷ��lfanew��ָ��PEͷ+4�ĵط�(���ļ�ͷ��ʼ��ַ)
    SetFilePointer hFile, ByVal uDos.lfanew + 4, 0, 0
    
    '��ȡ�ļ�ͷ
    ReadFile hFile, uFile, Len(uFile), lBytesRead, ByVal 0&
        
    '��ȡ��ѡͷ
    ReadFile hFile, uOptional, Len(uOptional), lBytesRead, ByVal 0&
    
    '�жϽ����Ƿ���ȷ
    If uFile.NumberOfSections < 1 Or uFile.NumberOfSections > 99 Then
        Exit Function
    End If
    
    '��д�����(uFile.NumberOfSections�ǽڸ���)
    ReDim uSections(uFile.NumberOfSections - 1) As IMAGE_SECTION_HEADER
    
    '��ȡ��ͷ
    ReadFile hFile, uSections(0), Len(uSections(0)) * uFile.NumberOfSections, lBytesRead, ByVal 0&
    
    'ɨ��ÿ����
    For I = 0 To UBound(uSections)
    
        '��ֹCPUռ�ù��߼���������Ӧ
        DoEvents
            
        'SizeOfRawData��Ϊ0��ʱ��,���Ϊ0��Ҫ����
        If uSections(I).SizeOfRawData > 0 Then
            
            '���β�����10MB
            If (uSections(I).SizeOfRawData / 1024 / 1024) <= 10 Then
    
                ReDim bTempMemory(1 To uSections(I).SizeOfRawData) As Byte
                    
                '����ָ�뵽�ڵ���ʼ��
                SetFilePointer hFile, ByVal uSections(I).PointerToRawData, 0, 0
                    
                '��ȡ��������,��ȡ��TemoMemory���ŵ���Ҫhash�����ݣ�������section
                ReadFile hFile, bTempMemory(1), uSections(I).SizeOfRawData, lBytesRead, ByVal 0&
                    
                Dim sTargetStr As String
                    
                '���������룺�ڴ�С+�ڵ�hashֵ
                sTargetStr = uSections(I).SizeOfRawData & ":" & LCase(HashFileStream(bTempMemory))
                    
                Dim bTempStrByte() As Byte
                bTempStrByte = sTargetStr
                    
                '�ù�ϣ�㷨����������(hash)
                sTargetStr = HashFileStream(bTempStrByte)
                    
                '������ƥ����
                Dim sMatchResult As String
                sMatchResult = MatchSignature(sTargetStr)
                    
                '�����Ϊ�ձ�ʾ��⵽�ǲ���������
                If sMatchResult <> "" Then
                    ScanSections = Trim(sMatchResult)
                    Exit Function
                End If

            End If
        End If
    Next I
    
End Function

'****************************************************************
'
' ɨ��PE�ļ�
' ������sFile �ļ�(��ȫ·��)
' ����ֵ��ɨ�赽�������ز�������ûɨ�����ؿ�
'
'****************************************************************
Public Function ScanFile(sFile As String) As String
    
    '��ʼ������ֵ
    ScanFile = ""
    
    
    '�ж��ļ���С������ļ�̫���򲻿����ǲ�����ֱ�ӷ���
    Dim lFileSize As Long
    Dim uSize As LARGE_INTEGER
    
    '���ļ�
    lFileSize = CreateFile(sFile, GENERIC_READ, FILE_SHARE_READ, ByVal 0&, OPEN_EXISTING, ByVal 0&, ByVal 0&)
    '��ȡ�ļ���С
    GetFileSizeEx lFileSize, uSize
    '�ر��ļ�
    CloseHandle lFileSize
    If uSize.lowpart / 1024 / 1024 > 15 Then
        Exit Function
    End If
        
    '���ļ�
    Dim lFileHwnd As Long
    lFileHwnd = CreateFile(sFile, ByVal &H80000000, 0, ByVal 0&, 3, 0, ByVal 0)
    
    If lFileHwnd Then
            
        '���ļ�������Ƿ���PE�ļ�
        Dim bBuffer(12) As Byte
        Dim lBytesRead As Long
        Dim uDosHeader As IMAGE_DOS_HEADER
    
        ReadFile lFileHwnd, uDosHeader, ByVal Len(uDosHeader), lBytesRead, ByVal 0&
        CopyMemory bBuffer(0), uDosHeader.Magic, 2
        
        '��һ������
        If (Chr(bBuffer(0)) & Chr(bBuffer(1)) = "MZ") Then
                    
            '��ָ�����õ�PEͷ�ṹƫ�ƴ�
            SetFilePointer lFileHwnd, uDosHeader.lfanew, 0, 0
            
            '��ȡ4byte
            ReadFile lFileHwnd, bBuffer(0), 4, lBytesRead, ByVal 0&
            '����Ƿ���PE(�س�)(�س�)
            If (Chr(bBuffer(0)) = "P") And (Chr(bBuffer(1)) = "E") And (bBuffer(2) = 0) And (bBuffer(3) = 0) Then
                
                '��Section��ʽɨ���ļ�,�ɹ����ز�������ʧ�ܷ��ؿ�
                Dim sScanSectionResult As String
                sScanSectionResult = ScanSections(lFileHwnd)
                
                '������ز�Ϊ�գ���ʾ��⵽�ǲ�������ر��ļ�������
                If sScanSectionResult <> "" Then
                    ScanFile = sScanSectionResult
                    CloseHandle lFileHwnd
                    Exit Function
                End If
            End If
        End If
    End If
    CloseHandle lFileHwnd
    
End Function

