---
title: LogPath
description: LogPath
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4c9ea64e-a02d-4066-bc4c-5c5b9a8a9056
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# LogPath


`LogPath` specifies the path of the log file to use during the Windows Preinstallation Environment (Windows PE) phase of installation. This log file is used only to log the events related to configuring Windows PE and not a regular operating system. (Windows PE is a minimal operating system designed to prepare a computer for Windows installation.) The log files used to configure a regular operating system, available in the %WINDIR%\\panther or $windows.~bt\\sources\\panther directories, cannot be changed.

The `LogPath` setting must be the fully qualified, non-UNC path to a directory on a fixed disk of the local computer.

This setting refers to a directory where the log files are written, rather than an individual log file. These log files contain details for settings related to the windowsPE configuration pass.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Path_to_log_file</em></p></td>
<td><p>Specifies the fully qualified, non-UNC path to a directory on a fixed disk of the local computer.</p>
<p>For example, to create log files in a Log folder at the root of the C drive, set this value to <strong>C:\Log</strong>.</p>
<p><em>Path_to_log_file</em> is a string, with a maximum length of 259 characters.</p></td>
</tr>
</tbody>
</table>

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Valid Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | **LogPath**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Example


The following XML output shows how to set the log path.

``` syntax
<LogPath>C:\Log</LogPath>
```

## Related topics


[microsoft-windows-setup-](microsoft-windows-setup.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20LogPath%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





