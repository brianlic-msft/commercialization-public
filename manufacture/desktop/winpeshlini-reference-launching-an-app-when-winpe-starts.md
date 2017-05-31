---
author: Justinha
Description: 'Winpeshl.ini Reference: Launching an app when WinPE starts'
ms.assetid: 107a3c05-791a-4daf-b188-b28dac96ef74
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Winpeshl.ini Reference: Launching an app when WinPE starts'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Winpeshl.ini Reference: Launching an app when WinPE starts


Use the **Winpeshl.ini** file in Windows Preinstallation Environment (Windows PE) to replace the default command prompt with a shell application or other app. For example, your shell app might provide a GUI for deployment engineers to choose a method of installing Windows.

To add a customized app, create a file named Winpeshl.ini and place it in %SYSTEMROOT%\\System32 a customized Windows PE image. For more information, see [WinPE: Mount and Customize](winpe-mount-and-customize.md).

## <span id="Example"></span><span id="example"></span><span id="EXAMPLE"></span>Example


``` syntax
[LaunchApp]
AppPath = %SYSTEMDRIVE%\Fabrikam\shell.exe
[LaunchApps]
%SYSTEMDRIVE%\Fabrikam\app1.exe
%SYSTEMDRIVE%\Fabrikam\app2.exe, /s "C:\Program Files\App3"
```

The Wpeshl.ini file may have either or both of the sections: \[LaunchApp\] and \[LaunchApps\]. The apps listed in \[LaunchApp\] and \[LaunchApps\] run in order of appearance, and don’t start until the previous app has terminated.

## <span id="LaunchApp"></span><span id="launchapp"></span><span id="LAUNCHAPP"></span>LaunchApp


Set the `AppPath` entry to the path to your app. You can use a fully qualified path, or you can include environment variables, such as `%SYSTEMDRIVE%` to describe the path.

**Note**  
-   The \[LaunchApp\] entry may only include one app.

-   You can’t specify a command that is greater than 250 characters.

-   You can’t specifiy any command-line options with LaunchApp.

 

## <span id="LaunchApps"></span><span id="launchapps"></span><span id="LAUNCHAPPS"></span>LaunchApps


Use the `[LaunchApps]` section to run apps with command-line options.

**Note**  
-   LaunchApps supports running apps, but does not support common scripting commands. To run commands, add a startup script instead (startnet.cmd). For more information, see [WinPE: Mount and Customize](winpe-mount-and-customize.md).

-   You can’t specify a command that is greater than 250 characters.

-   To add command-line options to an app: add a comma (,) after the app name: `%SYSTEMDRIVE%\Fabrikam\app2.exe,  <option>`

 

## <span id="related_topics"></span>Related topics


[WinPE for Windows 10](winpe-intro.md)

[WinPE: Debug Apps](winpe-debug-apps.md)

 

 






