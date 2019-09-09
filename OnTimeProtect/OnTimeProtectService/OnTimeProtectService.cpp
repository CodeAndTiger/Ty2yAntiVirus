
#include <Windows.h>
#include <direct.h>  
#include <stdio.h>  
#include <iostream>
#include <string>
#include <assert.h>

//�޸��������ã�ʹ����ʱ�����������д���
#pragma comment(linker, "/subsystem:\"windows\" /entry:\"mainCRTStartup\"")  

typedef BOOL(*OnTimeProtectON)(void);
typedef BOOL(*OnTimeProtectOFF)(void);

void ON(void){
	//����dll
	#if defined _M_X64
		HINSTANCE hInstLibrary = LoadLibrary(TEXT("OnTimeProtectDll64.dll"));
	#elif defined _M_IX86
		HINSTANCE hInstLibrary = LoadLibrary(TEXT("OnTimeProtectDll32.dll"));
	#endif

	if (hInstLibrary == NULL)
	{
		MessageBox(NULL, L"Dll����ʧ�ܣ�", L"����", MB_ICONERROR);
		FreeLibrary(hInstLibrary);
		return;
	}
	else {

		//��ȡAPI������ַ
		OnTimeProtectON MyOnTimeProtectON = (OnTimeProtectON)GetProcAddress(hInstLibrary, "OnTimeProtectON");
		if (MyOnTimeProtectON)
		{
			//����API HOOK
			bool bHook = MyOnTimeProtectON();
			if (bHook = false)
			{
				MessageBox(NULL, L"OnTimeProtectON��������ʧ�ܣ�", L"����", MB_ICONERROR);
				return;
			}
		}
		else {
			MessageBox(NULL, L"��ȡOnTimeProtectOFF������ַʧ�ܣ�", L"����", MB_ICONERROR);
			return;
		}
	}
}

void OFF(void) {
	//����dll
	#if defined _M_X64
		HINSTANCE hInstLibrary = LoadLibrary(TEXT("OnTimeProtectDll64.dll"));
	#elif defined _M_IX86
		HINSTANCE hInstLibrary = LoadLibrary(TEXT("OnTimeProtectDll32.dll"));
	#endif

	if (hInstLibrary == NULL)
	{
		MessageBox(NULL, L"Dll����ʧ�ܣ�", L"����", MB_ICONERROR);
		FreeLibrary(hInstLibrary);
		return;
	}
	else {

		//��ȡAPI������ַ
		OnTimeProtectOFF MyOnTimeProtectOFF = (OnTimeProtectOFF)GetProcAddress(hInstLibrary, "OnTimeProtectOFF");
		if (MyOnTimeProtectOFF)
		{
			//ֹͣAPI HOOK
			bool bHook = MyOnTimeProtectOFF();
			if (bHook = false)
			{
				MessageBox(NULL, L"OnTimeProtectOFF��������ʧ�ܣ�", L"����", MB_ICONERROR);
				return;
			}
		}
		else {
			MessageBox(NULL, L"��ȡOnTimeProtectOFF������ַʧ�ܣ�", L"����", MB_ICONERROR);
			return;
		}
	}
}

/*
 * ��ȡIni�ļ�����
 */
char* getKeyValue(char *filename, char *section, char *key)
{
	char line[255];
	char sectname[255];
	char *skey, *valu;
	char seps[] = "=";
	bool flag = false;
	FILE *fp = fopen(filename, "r");
	assert(fp != NULL);

	memset(line, 0, 255);
	if (!strchr(section, '['))
	{
		strcpy(sectname, "[");
		strcat(sectname, section);
		strcat(sectname, "]");
	}
	else
	{
		strcpy(sectname, section);
	}


	while (fgets(line, 255, fp) != NULL)
	{
		//delete the  newline
		valu = strchr(line, '\n');
		*valu = 0;

		if (flag)
		{
			skey = strtok(line, seps);
			if (strcmp(skey, key) == 0)
			{
				//һ��Ҫ�ر��ļ������˳������������ڴ�й©
				fclose(fp);
				return strtok(NULL, seps);
			}
		}
		else
		{
			if (strcmp(sectname, line) == 0)
			{
				flag = true;
			}

		}
	}
	//һ��Ҫ�ر��ļ������˳������������ڴ�й©
	fclose(fp);
	return NULL;
}

/*
 * ��ȡ����ֵ
 */
char* getShieldValue(void) {
	char szModuleFilePath[MAX_PATH];
	char SaveResult[MAX_PATH];
	//��õ�ǰִ���ļ�·��
	int n = GetModuleFileNameA(0, szModuleFilePath, MAX_PATH);
	//�����һ��"\\"����ַ���Ϊ0  
	szModuleFilePath[strrchr(szModuleFilePath, '\\') - szModuleFilePath + 1] = 0;
	strcpy(SaveResult, szModuleFilePath);
	//�ڵ�ǰ·��������ļ���
	strcat(SaveResult, "\\settings.ini");
	//��ȡֵ
	char * sShieldValue = getKeyValue(SaveResult, "Shield", "EnableShield");
	return sShieldValue;
}

HANDLE hMutex;
void main(void)
{
	hMutex = CreateMutex(NULL, FALSE, L"OnTimeProtectDll");
	if (GetLastError() == ERROR_ALREADY_EXISTS) {
		CloseHandle(hMutex);
		return;
	}

	//����API HOOK
	ON();

	char* shieldValue;

	//ѭ��
	while(1){
		//��ͣ0.1��
		Sleep(100);

		shieldValue = getShieldValue();

		//�����ļ��д���ĿΪ0��ʾ�ر��˷������ܣ�ֹͣ API HOOK
		if (strcmp(shieldValue, "0") == 0) {

			//ֹͣAPI HOOK
			OFF();

			Sleep(100);

			//�˳�����
			return;
		}

		//������δ�������Ѿ��˳���ֹͣAPI HOOK
		HWND hWnd = FindWindow(NULL, L"Ty2yɱ�����");
		if (hWnd == NULL)
		{
			//ֹͣAPI HOOK
			OFF();

			Sleep(100);

			//�˳�����
			return;
		}
	}

	return;
}