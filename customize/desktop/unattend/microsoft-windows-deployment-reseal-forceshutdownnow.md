---
title: ForceShutdownNow
description: ForceShutdownNow
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: a82db5df-747b-40f5-bf6b-257bf8f49f57
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ForceShutdownNow


`ForceShutdownNow` modifies the `Reseal` setting, and specifies whether the computer shuts down immediately after the setting is applied.

`Reseal` is a special-case setting. It is processed before any other setting in the configuration pass. In some scenarios, it instructs Windows Setup either to process or to ignore all other settings in that configuration pass before starting another configuration pass. The following table provides scenarios for each combination of configuration pass, mode, and forced-shutdown behavior. When a configuration pass has more than one result, the table lists the results in the order that they take place.

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<thead>
<tr class="header">
<th>Configuration pass</th>
<th>Mode value</th>
<th>ForceShutdownNow value</th>
<th>Result</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>auditSystem</strong></p></td>
<td><p><strong>Audit</strong></p></td>
<td><p><strong>false</strong></p></td>
<td><p>Starts the <strong>auditSystem</strong> configuration pass.</p></td>
</tr>
<tr class="even">
<td><p><strong>auditSystem</strong></p></td>
<td><p><strong>Audit</strong></p></td>
<td><p><strong>true</strong></p></td>
<td><div class="alert">
<strong>Caution</strong>  
<p>Unsupported, do not use. Sets the computer into a loop of reboots.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="odd">
<td><p><strong>auditSystem</strong></p></td>
<td><p><strong>OOBE</strong></p></td>
<td><p><strong>false</strong></p></td>
<td><ol>
<li><p>Ignores all other settings in the <strong>auditSystem</strong> configuration pass.</p></li>
<li><p>Starts the <strong>oobeSystem</strong> configuration pass.</p></li>
</ol></td>
</tr>
<tr class="even">
<td><p><strong>auditSystem</strong></p></td>
<td><p><strong>OOBE</strong></p></td>
<td><p><strong>true</strong></p></td>
<td><ol>
<li><p>Ignores all other settings in the <strong>auditSystem</strong> configuration pass.</p></li>
<li><p>Prepares Windows Setup to start the <strong>oobeSystem</strong> configuration pass.</p></li>
<li><p>Shuts the computer down immediately with no end-user interaction.</p></li>
</ol></td>
</tr>
<tr class="odd">
<td><p><strong>auditUser</strong></p></td>
<td><p><strong>Audit</strong></p></td>
<td><p><strong>false</strong></p></td>
<td><ol>
<li><p>Processes all other settings in the <strong>auditUser</strong> configuration pass.</p></li>
<li><p>Prepares Windows Setup to start the <strong>auditSystem</strong> configuration pass.</p></li>
<li><p>Restarts the computer.</p></li>
</ol></td>
</tr>
<tr class="even">
<td><p><strong>auditUser</strong></p></td>
<td><p><strong>Audit</strong></p></td>
<td><p><strong>true</strong></p></td>
<td><ol>
<li><p>Processes all other settings in the <strong>auditUser</strong> configuration pass.</p></li>
<li><p>Prepares Windows Setup to start the <strong>auditSystem</strong> configuration pass.</p></li>
<li><p>Shuts the computer down immediately with no end-user interaction.</p></li>
</ol></td>
</tr>
<tr class="odd">
<td><p><strong>auditUser</strong></p></td>
<td><p><strong>OOBE</strong></p></td>
<td><p><strong>false</strong></p></td>
<td><ol>
<li><p>Processes all other settings in the settings settings in the <strong>auditUser</strong> configuration pass.</p></li>
<li><p>Prepares Windows Setup to start the <strong>oobeSystem</strong> configuration pass.</p></li>
<li><p>Restarts the computer.</p></li>
</ol></td>
</tr>
<tr class="even">
<td><p><strong>auditUser</strong></p></td>
<td><p><strong>OOBE</strong></p></td>
<td><p><strong>true</strong></p></td>
<td><ol>
<li><p>Processes all other settings in the <strong>auditUser</strong> configuration pass.</p></li>
<li><p>Prepares Windows Setup to start the <strong>oobeSystem</strong> configuration pass.</p></li>
<li><p>Shuts the computer down immediately with no end-user interaction.</p></li>
</ol></td>
</tr>
<tr class="odd">
<td><p><strong>oobeSystem</strong></p></td>
<td><p><strong>Audit</strong></p></td>
<td><p><strong>false</strong></p></td>
<td><ol>
<li><p>Ignores all other settings in the <strong>oobeSystem</strong> configuration pass.</p></li>
<li><p>Starts the <strong>auditSystem</strong> configuration pass.</p></li>
</ol></td>
</tr>
<tr class="even">
<td><p><strong>oobeSystem</strong></p></td>
<td><p><strong>Audit</strong></p></td>
<td><p><strong>true</strong></p></td>
<td><ol>
<li><p>Ignores all other settings in the <strong>oobeSystem</strong> configuration pass.</p></li>
<li><p>Prepares Windows Setup to start the <strong>auditSystem</strong> configuration pass.</p></li>
<li><p>Shuts the computer down immediately with no end-user interaction.</p></li>
</ol></td>
</tr>
<tr class="odd">
<td><p><strong>oobeSystem</strong></p></td>
<td><p><strong>OOBE</strong></p></td>
<td><p><strong>false</strong></p></td>
<td><p>Starts the <strong>oobeSystem</strong> configuration pass.</p></td>
</tr>
<tr class="even">
<td><p><strong>oobeSystem</strong></p></td>
<td><p><strong>OOBE</strong></p></td>
<td><p><strong>true</strong></p></td>
<td><div class="alert">
<strong>Caution</strong>  
<p>Unsupported, do not use. Sets the computer into a loop of reboots.</p>
</div>
<div>
 
</div></td>
</tr>
</tbody>
</table>

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>true</strong></p></td>
<td><p>The computer shuts down immediately after the <code>Mode</code> setting is applied.</p></td>
</tr>
<tr class="even">
<td><p><strong>false</strong></p></td>
<td><p>The computer does not shut down immediately after the <code>Mode</code> setting is applied.</p>
<p>This is the default setting.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


auditSystem

auditUser

oobeSystem

## Parent Hierarchy


[Microsoft-Windows-Deployment](microsoft-windows-deployment.md) | [Reseal](microsoft-windows-deployment-reseal.md) | **ForceShutdownNow**

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
<Reseal>
   <ForceShutdownNow>true</ForceShutdownNow>
   <Mode>Audit</Mode>
</Reseal>
```

## Related topics


[Reseal](microsoft-windows-deployment-reseal.md)

[Mode](microsoft-windows-deployment-reseal-mode.md)

[Configuration Passes](http://go.microsoft.com/fwlink/?LinkId=268344)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20ForceShutdownNow%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





