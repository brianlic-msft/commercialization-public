---
author: kpacquer
Description: Develop MMOS test applications
ms.assetid: 1149e3d6-79d9-443e-9561-c030069eb79a
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Develop MMOS test applications
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Develop MMOS test applications


Developing user-mode tests in MMOS is very similar to developing user-mode applications.

## <span id="Test_development_in_MMOS"></span><span id="test_development_in_mmos"></span><span id="TEST_DEVELOPMENT_IN_MMOS"></span>Test development in MMOS


Use the following steps to create, deploy, and test a MMOS test application.

1.  Create an app.

2.  Add code to test the desired component and display or send those results as desired. For example, this sample code can be used to display a console message in MMOS.

    ``` syntax
#include <stdio.h>
#include <Windows.h>

    int main()
    {
        int i = 0;
        for(;;)
        {    
            wprintf(L"Test");
            Sleep(500);
            if (i == 12)
            {
                wprintf(L"Done");
                break;
            }
            i++;
        }
        return 0;
    }
    ```

3.  Build the test application in Visual Studio.

4.  Locate the binaries generated when you built the app. Typically they are in a subdirectory of the projects folder, such as *\\MyProject\\arm\\debug\\*.

5.  Sign the executable by using the sign.cmd script in the “%WPDKCONTENTROOT%\\Tools\\bin\\i386” folder, as shown in the example below.

    ``` syntax
    sign.cmd ApplicationForDrivers.exe
    ```

6.  To test your app, copy it to the device in the C:\\Data\\test directory by using FTP and run it via Telnet. For more info, see [Deploy and test a user-mode test application in MMOS](deploy-and-test-a-user-mode-test-application-in-mmos.md).

## <span id="Libraries_in_MMOS"></span><span id="libraries_in_mmos"></span><span id="LIBRARIES_IN_MMOS"></span>Libraries in MMOS


Adding a lib in MMOS is similar to adding a lib in the production OS. Currently, this default lib location for the kit is configured in Visual Studio.

``` syntax
$(WPDKInstallDir)lib\$(KitOs)\wp_um\$(Platform)
$(WPDKInstallDir)Tools\WPE\CRT\lib\$(Platform)
```

To add a lib in Visual Studio, select **Project** &gt; **Properties** &gt; **Configuration Properties** &gt; **VC++ Directories** &gt; **Include Directories**. To use the MMOS libraries, append the following directory to the path.

``` syntax
$(WPDKContentRoot)include\mmos
```

Add the arm directory. In Visual Studio, select **Project** &gt; **Properties** &gt; **Configuration Properties** &gt; **Linker** &gt; **General** &gt; **Additional Library Directories**. To use the MMOS libraries, append the following directories to the path.

``` syntax
$(WPDKContentRoot)lib\win8\mmos\arm
```

## <span id="Security_in_MMOS"></span><span id="security_in_mmos"></span><span id="SECURITY_IN_MMOS"></span>Security in MMOS


In development environments, user-mode test binaries can be test signed (not production signed). Use the process described in [Sign binaries and packages](https://msdn.microsoft.com/library/windows/hardware/dn789217) to test sign the binaries.

If the test binaries are not signed and code integrity checking is active as it normally is, you will receive an error message similar to the following in the debug window.

``` syntax
* This is not a failure in CI, but a problem with the failing binary.
* Please contact the binary owner for getting the binary correctly signed.
```

 

 





