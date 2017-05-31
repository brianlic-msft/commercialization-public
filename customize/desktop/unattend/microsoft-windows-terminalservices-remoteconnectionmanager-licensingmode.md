---
title: LicensingMode
description: LicensingMode
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 67efd87d-15da-49d5-ac05-20679fd6f8bf
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# LicensingMode


`LicensingMode` configures how Terminal Services manages Client Access Licenses (CALs). Two types of Terminal Server Client Access Licenses are available: TS Device CAL or TS User CAL:

-   A Terminal Services Device CAL permits one device (used by any user) to conduct Windows Sessions on any of your servers.

-   A Terminal Services User CAL permits one user (by using any device) to conduct Windows Sessions on any of your servers.

**Note**  
This setting is ignored unless the Windows Feature **AppServer** **(Terminal Services Application Server)** is enabled in the Windows image.

 

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><strong>2</strong></p></td>
<td><p>CALs are configured Per Device</p>
<p>Configures Terminal Server to require that each connected client computer has a valid Terminal Server Client Access License (CAL). If the client computer has a Terminal Server CAL, it can access more than one Terminal Server.</p></td>
</tr>
<tr class="even">
<td><p><strong>4</strong></p></td>
<td><p>CALs are configured Per Session</p>
<p>Configures Terminal Server to provide one Terminal Server CAL for each active client session.</p></td>
</tr>
<tr class="odd">
<td><p><strong>5</strong></p></td>
<td><p><code>LicensingMode</code> is not configured</p></td>
</tr>
</tbody>
</table>

 

**Important**  
LicensingMode is an integer. If you enter a value that is not supported, the Remote Connection Manager will not be configured properly. Ensure that the value for this setting matches one of the supported values.

 

## Valid Passes


generalize

offlineServicing

specialize

## Parent Hierarchy


[Microsoft-Windows-TerminalServices-RemoteConnectionManager](microsoft-windows-terminalservices-remoteconnectionmanager.md) | **LicensingMode**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-TerminalServices-RemoteConnectionManager](microsoft-windows-terminalservices-remoteconnectionmanager.md).

## XML Example


``` syntax
<LicensingMode>2</LicensingMode>
```

## Related topics


[Microsoft-Windows-TerminalServices-RemoteConnectionManager](microsoft-windows-terminalservices-remoteconnectionmanager.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20LicensingMode%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





