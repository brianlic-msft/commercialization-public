---
title: Update packages on a device and get package update logs
description: Update packages on a device and get package update logs
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d0594281-56f4-4676-9d00-19b6910ab50f
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Update packages on a device and get package update logs


The Windows Driver Kit (WDK) includes a tool for updating packages on a device (IUTool.exe) and a tool for getting package update logs from a device (GetDULogs.exe). These tools are available under %WPDKCONTENTROOT%\\Tools\\bin\\i386.

## Using IUTool.exe to update packages on a device


IUTool.exe is a command-line tool that can be used to update an existing package on a device or to add a new package to a device. IUTool.exe must be used in a command-line window that is opened as an administrator. The command-line syntax for IUTool.exe is the following.

``` syntax
IUTool -p <path to packages>
```

The following table describes the command-line parameters for IUTool.exe.

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
<td><p><strong>-p</strong><em>path to packages</em></p></td>
<td><p>Specifies one or more packages to update on the device or to add to the device. The <em>path to packages</em> parameter can have the following formats:</p>
<ul>
<li><p>To update or add a single package, specify the full path to the package on the development computer.</p></li>
<li><p>To update or add multiple packages, specify a semicolon-delimited list of packages on the development computer. For example:</p>
<pre class="syntax" space="preserve"><code>IUTool -p C:\ContosoPackages\Contoso.Device.SampleDriver.spkg;C:\ContosoPackages\Contoso.Device.SampleApplication.spkg</code></pre></li>
<li><p>To update or add an entire directory of packages, specify the path to the directory. For example:</p>
<pre class="syntax" space="preserve"><code>IUTool -p C:\ContosoPackages</code></pre></li>
</ul>
<p></p></td>
</tr>
</tbody>
</table>

 

### Package versioning

If the specified package already exists on the device, the new version of the package must have a higher version than the package currently on the device or the update will fail. To specify the version for a package, use the **/version** command-line parameter for PkgGen.exe when generating the package. For more information, see [Command-line arguments for package generator](https://msdn.microsoft.com/library/windows/hardware/dn756636).

## Using GetDULogs.exe to get package update logs from a device


GetDULogs.exe is a command-line tool that can be used to get package update logs from a device. GetDULogs.exe must be used in a command-line window that is opened as an administrator. The command-line syntax for GetDULogs.exe is the following.

``` syntax
GetDULogs -o <output file path>
```

The following table describes the command-line parameters for GetDULogs.exe.

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
<td><p><strong>-o</strong><em>output file path</em></p></td>
<td><p>The full path of the file on the development computer to write the log information to.</p></td>
</tr>
</tbody>
</table>

 

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phFlashing\p_phFlashing%5D:%20Update%20packages%20on%20a%20device%20and%20get%20package%20update%20logs%20%20RELEASE:%20%2810/4/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




