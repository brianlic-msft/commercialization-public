---
title: Mode
description: Mode
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 469ea416-b9fb-45e2-b083-d305ada47b6a
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Mode


`Mode` indicates whether, after completing other tasks, the computer returns to audit mode, or is set to start the Windows Out-of-Box Experience (OOBE). For more information about modes, see [Windows Setup Configuration Passes](http://go.microsoft.com/fwlink/?LinkId=268344).

`Generalize` is a special-case setting. It is processed after all other settings in that configuration pass.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>Audit</strong></p></td>
<td><p>Specifies that the computer starts in audit mode.</p></td>
</tr>
<tr class="even">
<td><p><strong>OOBE</strong></p></td>
<td><p>Specifies that the computer starts the Windows Out-of-Box Experience (OOBE).</p>
<p>This is the default value.</p></td>
</tr>
</tbody>
</table>

 

The default value for `Mode` is **OOBE**.

## Valid Configuration Passes


auditUser

## Parent Hierarchy


[Microsoft-Windows-Deployment](microsoft-windows-deployment.md) | [Generalize](microsoft-windows-deployment-generalize.md) | **Mode**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Deployment](microsoft-windows-deployment.md).

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
<Generalize>
   <ForceShutdownNow>true</ForceShutdownNow>
   <Mode>Audit</Mode>
</Generalize>
```

## Related topics


[Reseal](microsoft-windows-deployment-reseal.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Mode%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





