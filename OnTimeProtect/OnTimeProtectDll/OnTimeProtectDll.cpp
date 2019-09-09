#include <Windows.h>
#include "MinHook.h"
#include <string>

//����lib
#if defined _M_X64
	#pragma comment(lib, "libMinHook.x64.lib")
#elif defined _M_IX86
	#pragma comment(lib, "libMinHook.x86.lib")
#endif

//MessageBoxW
typedef int(WINAPI *MESSAGEBOXW)(HWND , LPCSTR , LPCSTR , UINT );
MESSAGEBOXW fpMessageBoxW = NULL;

//MessageBoxExW
typedef int(WINAPI *MESSAGEBOXEXW)(HWND, LPCSTR, LPCSTR, UINT, WORD);
MESSAGEBOXEXW fpMessageBoxExW = NULL;

//CreateProcessW
typedef BOOL(WINAPI *CREATEPROCESSW)(LPCWSTR, LPWSTR, LPSECURITY_ATTRIBUTES, LPSECURITY_ATTRIBUTES,	BOOL , DWORD , LPVOID , LPCWSTR , LPSTARTUPINFOW , LPPROCESS_INFORMATION );
CREATEPROCESSW fpCreateProcessW = NULL;

/*
 * MessageBoxW�������
 */
int WINAPI DetourMessageBoxW(
	HWND hWnd, LPCSTR lpText, LPCSTR lpCaption, UINT uType
	)
{
	return 0;
}

/*
* MessageBoxExW�������
*/
int WINAPI DetourMessageBoxExW(
	HWND hWnd, LPCSTR lpText, LPCSTR lpCaption, UINT uType, WORD wLanguageId
	)
{
	return 0;
}

/*
 * LPCTSTR����LPCWSTRת����char*
 */
char* wtoc(LPCTSTR str)
{
	DWORD dwMinSize;
	//���㳤��
	dwMinSize = WideCharToMultiByte(CP_ACP, NULL, str, -1, NULL, 0, NULL, FALSE); 
	char *return_Str = new char[dwMinSize];
	WideCharToMultiByte(CP_OEMCP, NULL, str, -1, return_Str, dwMinSize, NULL, FALSE);
	return return_Str;
}
/*
 * char*ת����LPCTSTR����LPCWSTR
 */
wchar_t* ctow(const char *str)
{
	wchar_t* buffer;
	if (str)
	{
		size_t nu = strlen(str);
		size_t n = (size_t)MultiByteToWideChar(CP_ACP, 0, (const char *)str, int(nu), NULL, 0);
		buffer = 0;
		buffer = new wchar_t[n + 1];
		MultiByteToWideChar(CP_ACP, 0, (const char *)str, int(nu), buffer, int(n));
	}
	return buffer;
	delete buffer;
}

/*
 * CreateProcessW�������
 */
BOOL WINAPI DetourCreateProcessW(
	LPCWSTR lpApplicationName,
	LPWSTR lpCommandLine,
	LPSECURITY_ATTRIBUTES lpProcessAttributes,
	LPSECURITY_ATTRIBUTES lpThreadAttributes,
	BOOL bInheritHandles,
	DWORD dwCreationFlags,
	LPVOID lpEnvironment,
	LPCWSTR lpCurrentDirectory,
	LPSTARTUPINFOW lpStartupInfo,
	LPPROCESS_INFORMATION lpProcessInformation) {
	
		HWND hWnd = FindWindow(NULL, L"Ty2yɱ�����");
		if (hWnd != NULL)
		{
			//�����ĳ���
			char *AppName = wtoc(lpApplicationName);

			COPYDATASTRUCT cpd;
			cpd.dwData = 0;
			cpd.cbData = strlen(AppName);
			cpd.lpData = AppName;
			LRESULT ret = SendMessage(hWnd, WM_COPYDATA, (WPARAM)GetCurrentProcessId(), (LPARAM)&cpd);

			if (ret == 915)
			{
				//�����еı�ʶ��δ��⵽����
				return fpCreateProcessW(lpApplicationName,
					lpCommandLine,
					lpProcessAttributes,
					lpThreadAttributes,
					bInheritHandles,
					dwCreationFlags,
					lpEnvironment,
					lpCurrentDirectory,
					lpStartupInfo,
					lpProcessInformation);
			}else{
				return FALSE;
			}
		}else{
			//���û�м�⵽���մ��ڣ�������
			return fpCreateProcessW(lpApplicationName,
				lpCommandLine,
				lpProcessAttributes,
				lpThreadAttributes,
				bInheritHandles,
				dwCreationFlags,
				lpEnvironment,
				lpCurrentDirectory,
				lpStartupInfo,
				lpProcessInformation);
		}
}

/*
 * ����API HOOK
 */
int StartHook()
{
	//MinHook��ʼ��
	if (MH_Initialize() != MH_OK)
	{
		return 1;
	}
	
	/*
	//Hook MessageBoxW����
	if (MH_CreateHook(&MessageBoxW, &DetourMessageBoxW, reinterpret_cast<LPVOID*>(&fpMessageBoxW)) != MH_OK)
	{
		return 1;
	}
	if (MH_EnableHook(&MessageBoxW) != MH_OK)
	{
		return 1;
	}

	//Hook MessageBoxExW����
	if (MH_CreateHook(&MessageBoxExW, &DetourMessageBoxExW, reinterpret_cast<LPVOID*>(&fpMessageBoxExW)) != MH_OK)
	{
		return 1;
	}
	if (MH_EnableHook(&MessageBoxExW) != MH_OK)
	{
		return 1;
	}
	*/

	//Hook CreateProcessW����
	if (MH_CreateHook(&CreateProcessW, &DetourCreateProcessW, reinterpret_cast<LPVOID*>(&fpCreateProcessW)) != MH_OK)
	{
		return 1;
	}
	if (MH_EnableHook(&CreateProcessW) != MH_OK)
	{
		return 1;
	}
	
	return 0;
}

/*
* ֹͣAPI HOOK
*/
int StopHook(void) {
	/*
	//ֹͣHook MessageBoxW
	if (MH_DisableHook(&MessageBoxW) != MH_OK)
	{
		return 1;
	}
	//ֹͣHook MessageBoxExW
	if (MH_DisableHook(&MessageBoxExW) != MH_OK)
	{
		return 1;
	}
	*/

	//ֹͣHook CreateProcessW
	if (MH_DisableHook(&CreateProcessW) != MH_OK)
	{
		return 1;
	}

	//ж��MinHook
	if (MH_Uninitialize() != MH_OK)
	{
		return 1;
	}
}

HHOOK hHook = 0;
HINSTANCE hMod = 0;

LRESULT CALLBACK HookProc(int nCode, WPARAM wParam, LPARAM lParam) {
	return(CallNextHookEx(hHook, nCode, wParam, lParam));
}

/*
 * ��������������API HOOK
 */
BOOL WINAPI OnTimeProtectON() {

	hHook = SetWindowsHookEx(WH_GETMESSAGE, (HOOKPROC)HookProc, hMod, 0);
	if (hHook)
	{
		return TRUE;
	}
	else {
		return FALSE;
	}
}

/*
 * ����������ֹͣAPI HOOK
 */
BOOL WINAPI OnTimeProtectOFF() {
	return(UnhookWindowsHookEx(hHook));
}

/*
 *	Dll��ں���
 */
BOOL APIENTRY DllMain(HANDLE hModule, DWORD  ul_reason_for_call, LPVOID lpReserved)
{
	hMod = (HINSTANCE)hModule;

	//DLL�����¼�
	if (ul_reason_for_call == DLL_PROCESS_ATTACH)
	{
		StartHook();
	}

	//Dllж���¼�
	if (ul_reason_for_call == DLL_PROCESS_DETACH)
	{
		StopHook();
	}

	return TRUE;
}