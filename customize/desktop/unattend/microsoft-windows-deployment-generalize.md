---
title: Generalize
description: Generalize
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 59d05509-75e6-404d-b3dd-139c78353cad
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Generalize


`Generalize` prepares the computer to be captured as a reference image immediately after other answer-file settings are processed. For more information about configuration passes, see [Windows Setup Configuration Passes](http://go.microsoft.com/fwlink/?LinkId=268344).

When `Generalize` is set, Windows Setup will:

1.  Complete all of the other unattend settings in the configuration pass.

2.  Run the **generalize** configuration pass.

3.  Prepare the computer for imaging.

    The following table provides scenarios for each combination of [Mode](microsoft-windows-deployment-generalize-mode.md) and [ForceShutdownNow](microsoft-windows-deployment-generalize-forceshutdownnow.md).

    <table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Mode value</th>
    <th>ForceShutdownNow value</th>
    <th>Result</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>Audit</p></td>
    <td><p>false</p></td>
    <td><p>Prepares the operating system to start in the <strong>auditSystem</strong> configuration pass, and then restarts the computer.</p></td>
    </tr>
    <tr class="even">
    <td><p>Audit</p></td>
    <td><p>true</p></td>
    <td><p>Prepares the operating system to start in the <strong>auditSystem</strong> configuration pass, and then shuts the computer down immediately with no user interaction.</p></td>
    </tr>
    <tr class="odd">
    <td><p>OOBE</p></td>
    <td><p>false</p></td>
    <td><p>Prepares the operating system to start in the <strong>oobeSystem</strong> configuration pass, and then restarts the computer.</p></td>
    </tr>
    <tr class="even">
    <td><p>OOBE</p></td>
    <td><p>true</p></td>
    <td><p>Prepares the operating system to start in the <strong>oobeSystem</strong> configuration pass, and then shuts the computer down immediately with no user interaction.</p></td>
    </tr>
    </tbody>
    </table>

     

**Note**  
Do not use this setting in conjunction with the [Reseal](microsoft-windows-deployment-reseal.md) setting. If you use both settings, the **Reseal** setting is ignored.

 

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[ForceShutdownNow](microsoft-windows-deployment-generalize-forceshutdownnow.md)</p></td>
<td><p>Specifies whether the computer shuts down immediately after the <code>Mode</code> setting is applied.</p></td>
</tr>
<tr class="even">
<td><p>[Mode](microsoft-windows-deployment-generalize-mode.md)</p></td>
<td><p>Specifies which configuration pass the computer start after the <strong>generalize</strong> configuration pass is complete. The options include: <strong>Audit</strong> or <strong>OOBE</strong>.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


auditUser

## Parent Hierarchy


[Microsoft-Windows-Deployment](microsoft-windows-deployment.md) | **Generalize**

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


[Microsoft-Windows-Deployment](microsoft-windows-deployment.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Generalize%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





