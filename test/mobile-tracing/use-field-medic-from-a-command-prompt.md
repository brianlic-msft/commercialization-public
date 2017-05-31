---
title: Use Field Medic from a command prompt
description: Use Field Medic from a command prompt
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: CFC32516-C794-40D8-BFED-6C607E85E6CD
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Use Field Medic from a command prompt


To use Field Medic from a command prompt (Field Medic Helper), you can install the Microsoft.Phone.Test.Tools.FieldMedicHelper package.

You must use IUTool to install it on your device.

``` syntax
%WPDKCONTENTROOT%\tools\bin\i386\IUTool.exe -p Microsoft.Phone.Test.Tools.FieldMedicHelper.spkg
```

Field Medic Helper includes the following modules:

-   **FileMedicHelper.exe** The Field Medic Helper executable file

-   **DiagnosticSvcRPC.dll** The diagnostic service RPC wrapper

-   **DICData.dll** The device information library

## Syntax


``` syntax
FieldMedicHelper parameter <options>
```

## Parameters


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Parameter</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>-netlog</p></td>
<td><p><strong>start</strong> - Start NETLOG logging.</p>
<p><strong>stop</strong> - Stop NETLOG logging.</p></td>
</tr>
<tr class="even">
<td><p>-qxdm</p></td>
<td><p><strong>start</strong> - Start QXDM logging.</p>
<p><strong>stop</strong> - Stop QXDM logging.</p></td>
</tr>
<tr class="odd">
<td><p>-etw</p></td>
<td><p><strong>start</strong> - Start ETW logging.</p>
<p><strong>stop</strong> - Stop ETW logging.</p></td>
</tr>
<tr class="even">
<td><p>-userdump</p></td>
<td><p>Start a user-mode dump.</p></td>
</tr>
<tr class="odd">
<td><p>-kerneldump</p></td>
<td><p>Start a kernel-mode dump.</p></td>
</tr>
</tbody>
</table>

 

## Options


The following options can be used with the parameters:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Option</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>-mode</p></td>
<td><p>Dump mode for user-mode or kernel mode dump.</p>
<p><strong>Default</strong> Use the default dump mode.</p>
<p><strong>Full</strong> Use the full dump mode.</p></td>
</tr>
<tr class="even">
<td><p>-storage</p></td>
<td><p>The storage type. This cannot be used with the path parameter.</p>
<p><strong>SD</strong> Use the SD card for storage.</p>
<p><strong>Phone</strong> se the device for storage. Default value.</p></td>
</tr>
<tr class="odd">
<td><p>-path</p></td>
<td><p>The MTP path to store the report. This cannot be used with the storage parameter.</p></td>
</tr>
<tr class="even">
<td><p>-timeoutduration</p></td>
<td><p>The duration that the logging should occur in hours. By default, this is 48 hours.</p>
<div class="alert">
<strong>Caution</strong>  
<p>If you specify a value larger than 48 hours, make sure you have enough buffer allocation and memory.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="odd">
<td><p>-dmcinputpath</p></td>
<td><p>Path to the custom DMCFile for QXDM.</p></td>
</tr>
<tr class="even">
<td><p>-custominputpath</p></td>
<td><p>Path to the custom profile XML file for ETW or QXDM.</p></td>
</tr>
</tbody>
</table>

 

## Examples


Use the following examples to run Field Medic Helper from a command prompt. You should use Cmd-device in TShell to run these commands from a PC.

Start QXDM, store the log on the SD card, and stop after 48 hours:

``` syntax
FieldMedicHelper -qxdm start -storage SD -timeoutduration 48
```

Start QXDM and store the log in C:\\data\\test\\bin\\logs:

``` syntax
FieldMedicHelper -qxdm start -path C:\data\test\bin\logs
```

Stop QXDM:

``` syntax
FieldMediaHelper -qxdm stop
```

Start Netlog, store the log on the SD card, and stop after 10 hours:

``` syntax
FieldMedicHelper -netlog start -storage SD -timeoutduration 10
```

Start Netlog with default values:

``` syntax
FieldMedicHelper -netlog start
```

Start Netlog, store the log on the device, and stop after 10 hours:

``` syntax
FieldMedicHelper -netlog start -timeoutduration 10
```

or

``` syntax
FieldMedicHelper -netlog start -storage Phone -timeoutduration 10
```

Stop Netlog:

``` syntax
FieldMedicHelper -netlog stop
```

To start ETW with a custom provider:

``` syntax
FieldMedicHelper -etw start -custominputpath c:\data\test\bin\FieldMedicHelper\mycustomprofile.xml
```

To start QXDM with a custom provider in a custom path:

``` syntax
FieldMedicHelper -qxdm start -dmcinputpath c:\data\test\MyDMCFile.dmc -custominputpath c:\data\test\mycustomprofile.xml -path C:\data\test\bin\logs
```

 

 






