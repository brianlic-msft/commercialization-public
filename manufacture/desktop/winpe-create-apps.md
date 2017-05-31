---
author: Justinha
Description: 'WinPE: Create Apps'
ms.assetid: 93848579-fd6d-4d51-bb51-f5f412833ad8
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'WinPE: Create Apps'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WinPE: Create Apps


Windows PE (WinPE) is licensed to independent software vendors (ISVs) and original equipment manufacturers (OEMs) to create customized deployment and recovery utilities. This topic provides guidelines for ISVs and OEMs to develop deployment and recovery apps that run in Windows PE.

**Note**  
Windows PE is not a general-purpose operating system. It may not be used for any purpose other than deployment and recovery. It should not be used as a thin client or an embedded operating system. There are other Microsoft® products, such as Windows Embedded CE, which may be used for these purposes.

 

## <span id="Extensibility"></span><span id="extensibility"></span><span id="EXTENSIBILITY"></span>Extensibility


The majority of Windows PE apps are fixed-function shell apps that provide their own GUI. Two examples are the Windows Setup app and the Windows Recovery Environment (Windows RE).

-   If it is acceptable to show a command prompt, then modify Startnet.cmd – this is the most convenient way to automatically start an app. See [WinPE: Mount and Customize](winpe-mount-and-customize.md).

-   To have your app bypass the command line and start in your GUI, use Winpeshl.exe, Wpeinit.exe, wpeutil.exe, and wpeutil.dll.

## <span id="Winpeshl.exe__Wpeinit.exe__wpeutil.exe__and_wpeutil.dll"></span><span id="winpeshl.exe__wpeinit.exe__wpeutil.exe__and_wpeutil.dll"></span><span id="WINPESHL.EXE__WPEINIT.EXE__WPEUTIL.EXE__AND_WPEUTIL.DLL"></span>Winpeshl.exe, Wpeinit.exe, wpeutil.exe, and wpeutil.dll


By default, Winpeshl.exe is the first process run when Windows PE is booted. This is specified by the following registry value of type REG\_SZ.

``` syntax
HKEY_LOCAL_MACHINE
   System
      Setup
         CmdLine
```

Winpeshl.exe searches for a file called Winpeshl.ini. If the file does not exist, Winpeshl.exe starts a Cmd.exe process that executes the Startnet.cmd script. If Winpeshl.ini does exist and it contains apps to launch, these apps are executed instead of Cmd.exe.

Wpeinit.exe installs Plug and Play (PnP) devices, starting the networking stack, and processing Unattend.xml settings when Windows PE starts. For more information, see [Wpeinit and Startnet.cmd: Using WinPE Startup Scripts](wpeinit-and-startnetcmd-using-winpe-startup-scripts.md).

Networking can be started at any time by running either by allowing Wpeinit.exe to run when Windows PE starts, or by running the [Wpeutil Command-Line Options](wpeutil-command-line-options.md) command.

Customized shell apps can call directly into Wpeutil.dll with the [LoadLibrary](http://go.microsoft.com/fwlink/?LinkId=203026) and [GetProcAddress](http://go.microsoft.com/fwlink/?LinkId=203027) functions. For related information, see [INFO: Alternatives to Using GetProcAddress() With LoadLibrary()](http://go.microsoft.com/fwlink/?LinkId=203028).

Each of the functions exported by Wpeutil.dll has the same function signature as [WinMain Function](http://go.microsoft.com/fwlink/?LinkId=203029), as illustrated in the following code sample.

``` syntax
int InitializeNetworkingW(
HINSTANCE hInstance,
HINSTANCE hPrevInstance,
LPSTR lpCmdLine,
int nCmdShow
);
```

The following code sample illustrates how to initialize networking.

``` syntax
#include <windows.h>
#include <tchar.h>
#include <stdio.h>
typedef int (*WpeutilFunction)( 
HINSTANCE hInst, 
HINSTANCE hPrev, 
LPTSTR lpszCmdLine, 
int nCmdShow 
);
int __cdecl _tmain( int argc, TCHAR *argv[] )
{
    
HMODULE         hWpeutil          = NULL;
    
WpeutilFunction InitializeNetwork = NULL;
    
int             result            = 0;
    
TCHAR           szCmdLine[]       = _T("");
    
hWpeutil = LoadLibrary( _T("wpeutil") );
    
if( NULL == hWpeutil )
    
{
        _tprintf( _T("Unable to load wpeutil.dll \ n") );
        
return GetLastError();
}
    
InitializeNetwork = (WpeutilFunction)GetProcAddress( 
hWpeutil, 
"InitializeNetworkW" 
);
    
if( NULL == InitializeNetwork )
    
{
        
FreeLibrary( hWpeutil );
        
return GetLastError();
    
}
    
result = InitializeNetwork( NULL, NULL, szCmdLine, SW_SHOW );
    
if( ERROR_SUCCESS == result )
    
{
        _tprintf( _T("Network initialized. \ n") );
    
}
  
else
    
{
        _tprintf( _T("Initialize failed: 0x%08x"), result );
    
}
    
FreeLibrary( hWpeutil );

return result;}
```

For a complete list of Wpeutil.dll exports, see [Wpeutil Command-Line Options](wpeutil-command-line-options.md).

## <span id="Visual_Studio_project_settings"></span><span id="visual_studio_project_settings"></span><span id="VISUAL_STUDIO_PROJECT_SETTINGS"></span>Visual Studio project settings


Some basic Visual Studio project settings may be different from the defaults created by the Visual Studio Project Wizard. Ensure that you set up your project’s build settings to produce apps and DLLs that are compatible with Windows PE, as follows:

1.  You must develop Windows PE apps with native C or C++ code that does not use MFC or ATL. Therefore, if you use the Visual Studio Project Wizard, choose a Win32 project and make sure that neither MFC nor ATL are checked.

2.  Set your project options to link to the static C/C++ runtime libraries, not the .dll version of Msvcrt.dll.

3.  Open your project properties and set **Configuration Properties \\ C/C++ RunTime Library** to **Multi-threaded** or **Multi-threaded debug**, not one of the .dll versions. If you do not perform this step, your app might not run on Windows PE.

4.  If you plan to host your app on the 64-bit version of Windows PE, set the project build options to compile all binaries with the x64 compiler in Visual Studio.

5.  If you plan to host your app on the 32-bit version of Windows PE, set the project options to compile with the x86 compiler.

6.  Ensure that your project does not have the /clr: compiler option set. This option produces managed C++ code, which will not run on Windows PE.

**Warning**  
Your app can use customized .dll files that you write or license from a third party. Add these .dll files to your app for Windows PE. However, do not use Msvcrt.dll and do not include additional Windows .dll files that are not part of Windows PE.

 

## <span id="API_Compatibility_reference"></span><span id="api_compatibility_reference"></span><span id="API_COMPATIBILITY_REFERENCE"></span>API Compatibility reference


Windows PE is a lightweight, bootstrap operating system based on a subset of components from the Windows operating system. It is designed to host deployment and recovery apps. As such, it contains many Windows binaries that are needed to host the APIs that are most important to these classes of app. Due to size and other design constraints, not all Windows binaries are present in Windows PE, and therefore not all Windows APIs are present or usable.

### <span id="Supported_APIs_in_Windows_PE"></span><span id="supported_apis_in_windows_pe"></span><span id="SUPPORTED_APIS_IN_WINDOWS_PE"></span>Supported APIs in Windows PE

The following APIs are supported in Windows PE:

1.  [Windows API sets (Mincore.lib)](http://go.microsoft.com/fwlink/?LinkId=330240).

2.  [Deployment Image Servicing and Management (DISM) API (Dismapi.lib)](http://go.microsoft.com/fwlink/?LinkId=330239).

3.  [Imaging APIs for Windows (Wimgapi.lib)](http://go.microsoft.com/fwlink/?LinkId=330241).

If an API behaves the same as it does on the full Windows operating system and as documented in the Windows SDK for Windows operating system, it will be considered supported and can be used by apps unless otherwise noted. Because Windows PE is based on components from Windows, it contains a significant subset of Windows APIs that are published in the Windows SDK for Windows operating system. The parameters, calling conventions, and behaviors of these supported APIs will be the same or nearly the same as on the full Windows operating system, unless they are affected by the unique Windows PE environment. Apps using only these APIs should be portable between the full Windows operating system and Windows PE.

In some cases, a subset of the possible parameter values will be usable on Windows PE. This may be due to conditions unique to the runtime environment, such as running on a read-only medium, not having access to persistent state, or other design limitations. In this case, the API may not be supported, but may still be used to accomplish a specific task if there is no other alternative.

In general, if an API works incorrectly or not at all on Windows PE, it is not supported and must not be used, even if it resides in a binary that is included in Windows PE. The API may be failing because Windows PE is a subset of the Windows operating system, or because of the runtime design considerations unique to Windows PE. Such failures are not considered bugs in Windows PE.

Because many Windows components are not present in Windows PE, many APIs are not available. They may be completely missing because the Windows binary in which they reside is not present. Alternatively, they may be only partially present because although the Windows binary in which they reside is present, one or more binaries they depend on are not. In addition, some APIs that are present in Windows PE do not work correctly and behave differently than they do in Windows. These APIs are unsupported and must not be used, because their behavior on Windows PE is undefined.

Sometimes, there may be no suitable API to accomplish a specific task. To find an alternate solution, you would require different app logic, different algorithm design, or redefinition of the underlying problem.

## <span id="related_topics"></span>Related topics


[WinPE for Windows 10](winpe-intro.md)

[WinPE: Debug Apps](winpe-debug-apps.md)

 

 






