---
author: Justinha
Description: Sysprep Support for Server Roles
ms.assetid: ed484189-a2a7-423e-b191-202559efa81f
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Sysprep Support for Server Roles
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Sysprep Support for Server Roles


Many common server roles support the System Preparation tool (Sysprep). However, if you run the **Sysprep** command together with the **/generalize** option against an installation of a server, and you are using an unsupported server role, those roles may not function after the imaging and deployment process is completed. Therefore, you must enable and configure any server roles that do not support Sysprep after you have performed the imaging and deployment process.

The following table lists server roles and specifies whether the roles support Sysprep.

<table>
<colgroup>
<col width="25%" />
<col width="25%" />
<col width="25%" />
<col width="25%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Server role</th>
<th align="left">Sysprep support in Windows Server 2008</th>
<th align="left">Sysprep support in Windows Server 2008 R2</th>
<th align="left">Sysprep support in Windows Server® 2012</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Active Directory Certificate Services (AD CS)</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
</tr>
<tr class="even">
<td align="left"><p>Active Directory Domain Services (AD DS)</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Active Directory Federation Services (AD FS)</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
</tr>
<tr class="even">
<td align="left"><p>Active Directory Lightweight Directory Services (AD LDS)</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Active Directory Rights Management Services (AD RMS)</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
</tr>
<tr class="even">
<td align="left"><p>Application Server</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>Yes</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Dynamic Host Configuration Protocol (DHCP) Server</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
</tr>
<tr class="even">
<td align="left"><p>Domain Name System (DNS) Server</p></td>
<td align="left"><p>Not applicable</p></td>
<td align="left"><p>Not applicable</p></td>
<td align="left"><p>Not applicable</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Fax Server</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
</tr>
<tr class="even">
<td align="left"><p>File and Storage Services</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>Yes</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Hyper-V™</p></td>
<td align="left"><p>Not applicable</p></td>
<td align="left"><p>Yes</p>
<p>Not supported for a virtual network on Hyper-V™. You must delete any virtual networks before you run the Sysprep tool.</p></td>
<td align="left"><p>Yes</p>
<p>Not supported for a virtual network on Hyper-V™. You must delete any virtual networks before you run the Sysprep tool.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Network Policy and Access Services (NPAS) ¹</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Network Policy Routing and Remote Access Services</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>Not applicable</p></td>
<td align="left"><p>Not applicable</p></td>
</tr>
<tr class="even">
<td align="left"><p>Printing and Document Services (Print Services) ²</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>Yes</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Remote Desktop Services ³</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>Yes</p></td>
<td align="left"><p>Yes</p></td>
</tr>
<tr class="even">
<td align="left"><p>Streaming Media Services (available as a download)</p></td>
<td align="left"><p>Not applicable</p></td>
<td align="left"><p>Not applicable</p></td>
<td align="left"><p>Not applicable</p></td>
</tr>
<tr class="odd">
<td align="left"><p>UDDI Services ⁴</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>Not applicable</p></td>
<td align="left"><p>Not applicable</p></td>
</tr>
<tr class="even">
<td align="left"><p>Volume Activation Services ⁵</p></td>
<td align="left"><p>Not applicable</p></td>
<td align="left"><p>Not applicable</p></td>
<td align="left"><p>Not applicable</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Web Server (Internet Information Services)</p></td>
<td align="left"><p>Yes</p>
<p>Not supported with encrypted credentials in the Applicationhost.config file.</p></td>
<td align="left"><p>Yes</p>
<p>Not supported with encrypted credentials in the Applicationhost.config file.</p></td>
<td align="left"><p>Yes</p>
<p>Not supported with encrypted credentials in the Applicationhost.config file.</p></td>
</tr>
<tr class="even">
<td align="left"><p>Windows Deployment Services</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>Yes</p>
<p>Not supported if Windows Deployment Services is initialized.⁶</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Windows Server Update Services (WSUS)</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>No</p></td>
</tr>
</tbody>
</table>

 

⁽¹⁾ NPAS includes Health Registration Authority (HRA), Network Policy Server (NPS), and Host Credential Authorization Protocol (HCAP).

⁽²⁾ In Windows Server 2008 R2, Print Services was renamed Printing and Document Services.

⁽³⁾ In Windows Server 2008 R2, Terminal Services was renamed Remote Desktop Services, which is also known as Remote Desktop Session Host.

⁽⁴⁾ UDDI Services was not included in Windows Server 2008 R2.

⁽⁵⁾ Volume Activation Services is new for Windows Server 2012.

⁽⁶⁾ You must uninitialize the server that has the Windows Deployment Services role installed before you run Sysprep. You can uninitialize a server by using the **wdsutil /uninitialize-server** command.

## <span id="related_topics"></span>Related topics


[Sysprep (System Preparation) Overview](sysprep--system-preparation--overview.md)

[Sysprep Process Overview](sysprep-process-overview.md)

[Sysprep Command-Line Options](sysprep-command-line-options.md)

[Sysprep (Generalize) a Windows installation](sysprep--generalize--a-windows-installation.md)

 

 






