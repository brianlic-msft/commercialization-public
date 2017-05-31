---
title: Name
description: Name
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 741c0f2e-c55b-477c-a870-58b6aab2029d
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Name


`Name` specifies the computer name to use during audit mode.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>name</em></p></td>
<td><p>Specifies the name of the computer. If you do not specify a name and the [MustReboot](microsoft-windows-deployment-auditcomputername-mustreboot.md) setting is present, this setting is ignored. The <em>name</em> value is a string with a maximum length of 15 characters.</p></td>
</tr>
</tbody>
</table>

 

**Note**  
If you do not specify this setting, the existing computer name is preserved.

If you specify a new computer name, you might have to restart the computer for it to take effect. If additional processing is dependent on the new computer name, set the [MustReboot](microsoft-windows-deployment-auditcomputername-mustreboot.md) value to **true** to restart the computer immediately.

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Valid Configuration Passes


auditSystem

## Parent Hierarchy


[Microsoft-Windows-Deployment](microsoft-windows-deployment.md) | [AuditComputerName](microsoft-windows-deployment-auditcomputername.md) | **Name**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-Deployment](microsoft-windows-deployment.md).

## XML Example


The following XML output shows a deployment with no asynchronous or synchronous commands.

``` syntax
<AuditComputerName>
   <MustReboot>true</MustReboot>
   <Name>MyComputer</Name>
</AuditComputerName>
<ExtendOSPartition>
   <Extend>true</Extend>
</ExtendOSPartition>
<Reseal>
   <ForceShutdownNow>true</ForceShutdownNow>
   <Mode>Audit</Mode>
</Reseal>
```

## Related topics


[AuditComputerName](microsoft-windows-deployment-auditcomputername.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Name%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





