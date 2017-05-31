---
author: Justinha
Description: 'Wpeinit and Startnet.cmd: Using WinPE Startup Scripts'
ms.assetid: d43621bb-b9ab-4e19-8fb4-8d05d5ee3d07
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Wpeinit and Startnet.cmd: Using WinPE Startup Scripts'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Wpeinit and Startnet.cmd: Using WinPE Startup Scripts


Use Wpeinit and Startnet.cmd to run startup scripts when Windows PE (WinPE) first runs.

Wpeinit outputs log messages to **C:\\Windows\\system32\\wpeinit.log**.

## <span id="startnet.cmd"></span><span id="STARTNET.CMD"></span>Startnet.cmd


You can add customized command-line scripts in Windows PE by using Startnet.cmd. By default, Windows PE includes a Startnet.cmd script located at %SYSTEMROOT%\\System32 of your customized Windows PE image.

Startnet.cmd starts Wpeinit.exe. Wpeinit.exe installs Plug and Play devices, processes Unattend.xml settings, and loads network resources.

For more info, see [WinPE: Mount and Customize](winpe-mount-and-customize.md).

## <span id="Wpeinit_Command-Line_Options"></span><span id="wpeinit_command-line_options"></span><span id="WPEINIT_COMMAND-LINE_OPTIONS"></span>Wpeinit Command-Line Options


The following command-line option is available for Wpeinit:

**Wpeinit** \[-unattend:*&lt;path\_to\_answer\_file&gt;*\]

Example:

``` syntax
Wpeinit -unattend:"C:\Unattend-PE.xml"
```

## <span id="Supported_Unattend_settings"></span><span id="supported_unattend_settings"></span><span id="SUPPORTED_UNATTEND_SETTINGS"></span>Supported Unattend settings


You can create an answer file and include any of the following settings for use with Windows PE:

-   Microsoft-Windows-Setup/[Display](https://msdn.microsoft.com/library/windows/hardware/dn915285)

-   Microsoft-Windows-Setup/[EnableFirewall](https://msdn.microsoft.com/library/windows/hardware/dn915375)

-   Microsoft-Windows-Setup/[EnableNetwork](https://msdn.microsoft.com/library/windows/hardware/dn915383)

-   Microsoft-Windows-Setup/[LogPath](https://msdn.microsoft.com/library/windows/hardware/dn915490)

-   Microsoft-Windows-Setup/[PageFile](https://msdn.microsoft.com/library/windows/hardware/dn915671)

-   Microsoft-Windows-Setup/[Restart](https://msdn.microsoft.com/library/windows/hardware/dn915783)

-   Microsoft-Windows-Setup/[RunAsynchronous](https://msdn.microsoft.com/library/windows/hardware/dn915800)

-   Microsoft-Windows-Setup/[RunSynchronous](https://msdn.microsoft.com/library/windows/hardware/dn915804)

## <span id="related_topics"></span>Related topics

[WinPE: Identify drive letters with a script](winpe-identify-drive-letters.md)

[WinPE for Windows 10](winpe-intro.md)

[Winpeshl.ini Reference: Launching an app when WinPE starts](winpeshlini-reference-launching-an-app-when-winpe-starts.md)

[WinPE: Mount and Customize](winpe-mount-and-customize.md)

[Unattended Windows Setup Reference](http://go.microsoft.com/fwlink/?LinkId=206281)

 

 






