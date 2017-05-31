---
title: RemoveMXDW
description: RemoveMXDW
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9ea5a109-d6df-4bcc-b695-c0f4645e8236
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# RemoveMXDW


The `RemoveMXDW` setting is used to remove the Microsoft XPS Document Writer (MXDW) print queue and driver package from a Windows installation.

**To create a Windows image without the MXDW print queue and driver package**

1.  In your answer file, set `RemoveMXDW` to **1**.

2.  In your answer file, remove the MXDW print queue and driver package installation files. To do this, add the Microsoft-Windows-Printing-XPSServices-Package package. In the **Actions** field, select **Remove**. 

3.  Install Windows using your answer file.

4.  After installation, open the Printers folder to completely remove the files.

5.  Run the Sysprep tool, and then recapture the Windows image.

This setting has no effect on Server Core installations of Windows Server 2008, Windows Server 2008 R2, and Windows Server 2012.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>0</strong></p></td>
<td><p>The MXDW print queue and driver packages are not removed during Windows installation.</p></td>
</tr>
<tr class="even">
<td><p><strong>1</strong></p></td>
<td><p>The MXDW print queue and driver packages are removed during Windows installation.</p>
<p>After the files are removed, you will be unable to reinstall the Microsoft XPS Document Writer print queue.</p>
<p></p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-Printing-Spooler-Core](microsoft-windows-printing-spooler-core.md) | **RemoveMXDW**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Printing-Spooler-Core](microsoft-windows-printing-spooler-core.md).

## XML Example


The following XML output shows how to remove the XPS Document Writer print queue and driver package.

``` syntax
<RemoveMXDW>1</RemoveMXDW>
```

## Related topics


[Microsoft-Windows-Printing-Spooler-Core](microsoft-windows-printing-spooler-core.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20RemoveMXDW%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





