// TestDll.cpp : ���� DLL Ӧ�ó���ĵ���������
//

#include "stdafx.h"
#include "TestDll.h"


TESTDLL_API void __cdecl func_1(int i)
//TESTDLL_API void __stdcall func_1(int i)
{
}

TESTDLL_API void __stdcall func_2(int i)
{
}

TESTDLL_API void __fastcall func_3(int i)
//TESTDLL_API void __stdcall func_3(int i)
{
}