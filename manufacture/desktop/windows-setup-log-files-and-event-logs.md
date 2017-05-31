---
author: Justinha
Description: Windows Setup Log Files and Event Logs
ms.assetid: f3f32c6c-c1f9-4b85-ba0f-1e2a0b07c50f
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Windows Setup Log Files and Event Logs
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows Setup Log Files and Event Logs


Windows® Setup creates log files for all actions that occur during installation. If you are experiencing problems installing Windows, consult the log files to troubleshoot the installation.

Windows Setup log files are available in the following directories:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Log file location</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>$windows.~bt\Sources\Panther</p></td>
<td align="left"><p>Log location before Setup can access the drive.</p></td>
</tr>
<tr class="even">
<td align="left"><p>$windows.~bt\Sources\Rollback</p></td>
<td align="left"><p>Log location when Setup rolls back in the event of a fatal error.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>%WINDIR%\Panther</p></td>
<td align="left"><p>Log location of Setup actions after disk configuration.</p></td>
</tr>
<tr class="even">
<td align="left"><p>%WINDIR%\Inf\Setupapi*.log</p></td>
<td align="left"><p>Used to log Plug and Play device installations.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>%WINDIR%\Memory.dmp</p></td>
<td align="left"><p>Location of memory dump from bug checks.</p></td>
</tr>
<tr class="even">
<td align="left"><p>%WINDIR%\Minidump\*.dmp</p></td>
<td align="left"><p>Location of log minidumps from bug checks.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>%WINDIR%\System32\Sysprep\Panther</p></td>
<td align="left"><p>Location of Sysprep logs.</p></td>
</tr>
</tbody>
</table>

 

## <span id="Windows_Setup_Event_Logs"></span><span id="windows_setup_event_logs"></span><span id="WINDOWS_SETUP_EVENT_LOGS"></span>Windows Setup Event Logs


Windows Setup includes the ability to review the Windows Setup performance events in the Windows Event Log viewer. This enables you to more easily review the actions that occurred during Windows Setup and to review the performance statistics for different parts of Windows Setup. You can filter the log so as to view only relevant items that you are interested in. The Windows Setup performance events are saved into a log file that is named Setup.etl, which is available in the %WINDIR%\\Panther directory of all installations. To view the logs, you must use the Event Viewer included with the Windows media that corresponds to the version of the customized image that you are building.

To view the logs on a computer that does not include the corresponding kit, you must run a script from the root of the media that installs the Event Trace for Windows (ETW) provider. From the command line, type:

``` syntax
Cscript D:\sources\etwproviders\etwproviderinstall.vbs install D:\sources\etwproviders
```

where *D* is the drive letter of the Windows DVD media.

### <span id="To_view_the_Windows_Setup_event_logs"></span><span id="to_view_the_windows_setup_event_logs"></span><span id="TO_VIEW_THE_WINDOWS_SETUP_EVENT_LOGS"></span>To view the Windows Setup event logs

1.  Start the Event Viewer, expand the Windows Logs node, and then click **System**.

2.  In the **Actions** pane, click **Open Saved Log** and then locate the Setup.etl file. By default, this file is available in the %WINDIR%\\Panther directory.

3.  The log file contents appear in the Event Viewer.

### <span id="To_Export_the_log_to_a_file"></span><span id="to_export_the_log_to_a_file"></span><span id="TO_EXPORT_THE_LOG_TO_A_FILE"></span>To Export the log to a file

From the command line, use the **Wevtutil** or **Tracerpt** commands to save the log to an .xml or text file. For information about how to use these tools, see the command-line Help. The following commands show examples of how to use the tools:

``` syntax
Wevtutil qe /lf C:\windows\panther\setup.etl 
```

-or-

``` syntax
Tracerpt /l C:\windows\panther\setup.etl
```

## <span id="related_topics"></span>Related topics


[Windows Setup Command-Line Options](windows-setup-command-line-options.md)

[Windows Setup States](windows-setup-states.md)

[Windows Setup Edition Configuration and Product ID Files (EI.cfg and PID.txt)](windows-setup-edition-configuration-and-product-id-files--eicfg-and-pidtxt.md)

 

 






