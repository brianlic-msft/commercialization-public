---
title: Microsoft-Windows-Printing-Spooler-Core
description: Microsoft-Windows-Printing-Spooler-Core
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 863542e6-f206-4421-b26a-b326d0d13954
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Microsoft-Windows-Printing-Spooler-Core


The Microsoft-Windows-Print-Spooler-Core is used to configure actions that the print spooler service performs when the computer starts. The print spooler actions will occur whenever the print spooler service is restarted. This includes system restart, user login, and manual restart of the print spooler service.

This setting has no effect on Server Core installations of Windows Server 2008, Windows Server 2008 R2, and Windows Server 2012.

## In This Section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[RemoveMPDW](microsoft-windows-printing-spooler-core-removempdw.md)</p></td>
<td><p>Specifies whether to remove the Microsoft Print to PDF print queue and driver package from a Windows installation.</p></td>
</tr>
<tr class="even">
<td><p>[RemoveMXDW](microsoft-windows-printing-spooler-core-removemxdw.md)</p></td>
<td><p>Specifies whether to remove the Microsoft XPS Document Writer (MXDW) print queue and driver package from a Windows installation.</p></td>
</tr>
<tr class="odd">
<td><p>[Start](microsoft-windows-printing-spooler-core-start.md)</p></td>
<td><p>Indicates whether the spooler autologger will start by default when the system boots.</p></td>
</tr>
</tbody>
</table>

 

## Applies To


To determine whether a component applies to the image you’re building, load your image into Windows SIM and search for the component or setting name. For information on how to view components and settings, see [Configure Components and Settings in an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915078).

## Related topics


[Components](components-b-unattend.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Microsoft-Windows-Printing-Spooler-Core%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





