---
title: Networking-MPSSVC-Svc
description: Networking-MPSSVC-Svc
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 23c81eaa-23a9-465d-b92c-71fb9588b58d
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Networking-MPSSVC-Svc


The Networking-MPSSVC-Svc component is part of Windows Firewall, which protects computers by preventing unauthorized users from gaining access through the Internet or a network.

## In This Section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[DisableStatefulFTP](networking-mpssvc-svcdisablestatefulftp.md)</p></td>
<td><p>Disables the Windows Firewall File Transfer Protocol (FTP)-connection, inspection engine.</p></td>
</tr>
<tr class="even">
<td><p>[DisableStatefulPPTP](networking-mpssvc-svcdisablestatefulpptp.md)</p></td>
<td><p>Disables the Windows Firewall Point-to-Point Tunneling Protocol (PPTP) connection inspection engine.</p></td>
</tr>
<tr class="odd">
<td><p>[DomainProfile_DisableNotifications](networking-mpssvc-svcdomainprofile-disablenotifications.md)</p></td>
<td><p>Disables Windows Firewall notifications for the domain profile.</p></td>
</tr>
<tr class="even">
<td><p>[DomainProfile_EnableFirewall](networking-mpssvc-svcdomainprofile-enablefirewall.md)</p></td>
<td><p>Enables Windows Firewall for the domain profile.</p></td>
</tr>
<tr class="odd">
<td><p>[DomainProfile_LogDroppedPackets](networking-mpssvc-svcdomainprofile-logdroppedpackets.md)</p></td>
<td><p>Specifies whether dropped packets are logged for Windows Firewall for the domain profile.</p></td>
</tr>
<tr class="even">
<td><p>[DomainProfile_LogFile](networking-mpssvc-svcdomainprofile-logfile.md)</p></td>
<td><p>Specifies the default log file for Windows Firewall for the domain profile.</p></td>
</tr>
<tr class="odd">
<td><p>[DomainProfile_LogFileSize](networking-mpssvc-svcdomainprofile-logfilesize.md)</p></td>
<td><p>Specifies the default log file size for Windows Firewall for the domain profile.</p></td>
</tr>
<tr class="even">
<td><p>[DomainProfile_LogSuccessfulConnections](networking-mpssvc-svcdomainprofile-logsuccessfulconnections.md)</p></td>
<td><p>Specifies whether successful connections are logged for Windows Firewall for the domain profile.</p></td>
</tr>
<tr class="odd">
<td><p>[FirewallGroups](networking-mpssvc-svcfirewallgroups.md)</p></td>
<td><p>Specifies Windows Firewall groups.</p></td>
</tr>
<tr class="even">
<td><p>[PrivateProfile_DisableNotifications](networking-mpssvc-svcprivateprofile-disablenotifications.md)</p></td>
<td><p>Specifies whether Windows Firewall notifications are disabled for the standard profile.</p></td>
</tr>
<tr class="odd">
<td><p>[PrivateProfile_EnableFirewall](networking-mpssvc-svcprivateprofile-enablefirewall.md)</p></td>
<td><p>Enables Windows Firewall for the standard profile.</p></td>
</tr>
<tr class="even">
<td><p>[PrivateProfile_LogDroppedPackets](networking-mpssvc-svcprivateprofile-logdroppedpackets.md)</p></td>
<td><p>Specifies whether dropped packets are logged for Windows Firewall for the standard profile.</p></td>
</tr>
<tr class="odd">
<td><p>[PrivateProfile_LogFile](networking-mpssvc-svcprivateprofile-logfile.md)</p></td>
<td><p>Specifies the default log file for Windows Firewall for the standard profile.</p></td>
</tr>
<tr class="even">
<td><p>[PrivateProfile_LogFileSize](networking-mpssvc-svcprivateprofile-logfilesize.md)</p></td>
<td><p>Specifies the default log file size for Windows Firewall for the standard profile.</p></td>
</tr>
<tr class="odd">
<td><p>[PrivateProfile_LogSuccessfulConnections](networking-mpssvc-svcprivateprofile-logsuccessfulconnections.md)</p></td>
<td><p>Specifies whether successful connections are logged for Windows Firewall for the standard profile.</p></td>
</tr>
<tr class="even">
<td><p>[PublicProfile_DisableNotifications](networking-mpssvc-svcpublicprofile-disablenotifications.md)</p></td>
<td><p>Disables Windows Firewall notifications for the public profile.</p></td>
</tr>
<tr class="odd">
<td><p>[PublicProfile_EnableFirewall](networking-mpssvc-svcpublicprofile-enablefirewall.md)</p></td>
<td><p>Enables Windows Firewall for the public profile.</p></td>
</tr>
<tr class="even">
<td><p>[PublicProfile_LogDroppedPackets](networking-mpssvc-svcpublicprofile-logdroppedpackets.md)</p></td>
<td><p>Specifies whether dropped packets are logged for Windows Firewall for the public profile.</p></td>
</tr>
<tr class="odd">
<td><p>[PublicProfile_LogFile](networking-mpssvc-svcpublicprofile-logfile.md)</p></td>
<td><p>Specifies the default log file for Windows Firewall for the public profile.</p></td>
</tr>
<tr class="even">
<td><p>[PublicProfile_LogFileSize](networking-mpssvc-svcpublicprofile-logfilesize.md)</p></td>
<td><p>Specifies the default log file size for Windows Firewall for the public profile.</p></td>
</tr>
<tr class="odd">
<td><p>[PublicProfile_LogSuccessfulConnections](networking-mpssvc-svcpublicprofile-logsuccessfulconnections.md)</p></td>
<td><p>Specifies whether successful connections are logged for Windows Firewall for the public profile.</p></td>
</tr>
</tbody>
</table>

 

## Applies To


To determine whether a component applies to the image you’re building, load your image into Windows SIM and search for the component or setting name. For information on how to view components and settings, see [Configure Components and Settings in an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915078).

## Related topics


[Components](components-b-unattend.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Networking-MPSSVC-Svc%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





