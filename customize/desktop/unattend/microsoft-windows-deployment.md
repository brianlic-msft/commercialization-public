---
title: Microsoft-Windows-Deployment
description: Microsoft-Windows-Deployment
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c1fa294c-b5f8-4ffd-9dbb-4f39f6b4ee9e
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Microsoft-Windows-Deployment


The Microsoft-Windows-Deployment component specifies settings related to auditing a computer.

## In This Section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[AuditComputerName](microsoft-windows-deployment-auditcomputername.md)</p></td>
<td><p>Specifies the name of the computer being audited, and whether to restart the computer immediately after you specify this name.</p></td>
</tr>
<tr class="even">
<td><p>[DeviceForm](microsoft-windows-deployment-deviceform.md)</p></td>
<td><p>Specifies the device form factor running the OS.</p></td>
</tr>
<tr class="odd">
<td><p>[DuplicatorDescription](microsoft-windows-deployment-duplicatordescription.md)</p></td>
<td><p>Specifies a description of the duplication tool used, as well as any other information that an OEM or an administrator stores in the registry.</p></td>
</tr>
<tr class="even">
<td><p>[ExtendOSPartition](microsoft-windows-deployment-extendospartition.md)</p></td>
<td><p>Specifies whether to extend the partition on which you are installing Windows.</p></td>
</tr>
<tr class="odd">
<td><p>[Generalize](microsoft-windows-deployment-generalize.md)</p></td>
<td><p>Instructs Windows Setup to shut down the system after other answer-file settings are processed, and then to start the <strong>generalize</strong> configuration pass.</p></td>
</tr>
<tr class="even">
<td><p>[Reseal](microsoft-windows-deployment-reseal.md)</p></td>
<td><p>Specifies whether the computer runs in audit mode or in Out-of-Box Experience (OOBE) when it next starts.</p></td>
</tr>
<tr class="odd">
<td><p>[RunAsynchronous](microsoft-windows-deployment-runasynchronous.md)</p></td>
<td><p>Specifies one or more commands to run asynchronously on the operating system during the specified configuration pass.</p></td>
</tr>
<tr class="even">
<td><p>[RunSynchronous](microsoft-windows-deployment-runsynchronous.md)</p></td>
<td><p>Specifies one or more commands to run synchronously on the operating system during the specified configuration pass.</p></td>
</tr>
</tbody>
</table>

 

## Applies To


To determine whether a component applies to the image you’re building, load your image into Windows SIM and search for the component or setting name. For information on how to view components and settings, see [Configure Components and Settings in an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915078).

## Related topics


[Components](components-b-unattend.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Microsoft-Windows-Deployment%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





