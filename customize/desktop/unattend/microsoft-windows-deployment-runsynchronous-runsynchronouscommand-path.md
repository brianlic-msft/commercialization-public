---
title: Path
description: Path
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1ad8938e-24f1-4532-85a3-099c2361c724
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Path


`Path` specifies the path and the name of the command to run. [RunSynchronous](microsoft-windows-deployment-runsynchronous.md) commands run in the user context in the auditUser configuration pass and in the system context in the specialize configuration pass.

**Warning**  
Do not add commands that shut down or reboot the computer; instead, use the setting: Microsoft-Windows-Deployment\\RunSynchronous\\RunSynchronousCommand\\[WillReboot](microsoft-windows-deployment-runsynchronous-runsynchronouscommand-willreboot.md).

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Path</em></p></td>
<td><p>Specifies the path and the file name of the command to run synchronously. The path can be a local path or a UNC path. If the path is a UNC path, the [Credentials](microsoft-windows-deployment-runsynchronous-runsynchronouscommand-credentials.md) must be specified. <em>Path</em> is a string with a maximum length of 259 characters.</p></td>
</tr>
</tbody>
</table>

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Valid Configuration Passes


auditUser

specialize

## Parent Hierarchy


[Microsoft-Windows-Deployment](microsoft-windows-deployment.md) | [RunSynchronous](microsoft-windows-deployment-runsynchronous.md) | [RunSynchronousCommand](microsoft-windows-deployment-runsynchronous-runsynchronouscommand.md) | **Path**

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Deployment](microsoft-windows-deployment.md).

## XML Example


The following XML output shows how to set synchronous commands.

The first command runs an application on the local hard drive. The command includes the environment variable %ProgramFiles%. The second command runs a command from the network.

``` syntax
<RunSynchronous>
   <RunSynchronousCommand wcm:action="add">
      <Description>Command1-Local</Description>
      <Order>1</Order>
      <Path>%ProgramFiles%\FabriKam\FabriKam First Run Application.exe</Path>
      <WillReboot>OnRequest</WillReboot>
   </RunSynchronousCommand>
   <RunSynchronousCommand wcm:action="add">
      <Credentials>
         <Domain>MyDomain</Domain>
         <Password>MyPassword</Password>
         <Username>MyUsername</Username>
      </Credentials>
      <Description>Command2-Network</Description>
      <Order>2</Order>
      <Path>\\network\server\share\filename</Path>
      <WillReboot>OnRequest</WillReboot>
   </RunSynchronousCommand>
</RunSynchronous>
```

## Related topics


[RunSynchronousCommand](microsoft-windows-deployment-runsynchronous-runsynchronouscommand.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Path%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





