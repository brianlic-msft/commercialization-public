---
author: Justinha
Description: 'Sysprep Command-Line Options'
ms.assetid: b20ee6ea-b1c4-4cd2-91ea-52f667a704bb
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Sysprep Command-Line Options'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Sysprep Command-Line Options


Run **Sysprep** to prepare a Windows installation to be captured. This topic describes the command-line syntax for the System Preparation (Sysprep) tool.

If you intend to create an image of an installation for deployment to a different computer, you must run the **Sysprep** command together with the **/generalize** option, even if the other computer has the same hardware configuration. The **Sysprep /generalize** command removes unique information from your Windows installation so that you can safely reuse that image on a different computer. The next time that you boot the Windows image, the [specialize](specialize.md) configuration pass runs.

## <span id="Sysprep_Command-Line_Options"></span><span id="sysprep_command-line_options"></span><span id="SYSPREP_COMMAND-LINE_OPTIONS"></span>Sysprep Command-Line Options


The following command-line options are available for Sysprep:

**Sysprep.exe** \[**/oobe** | **/audit**\]

\[**/generalize**\]

\[**/mode:vm**\]

\[**/reboot** | **/shutdown** | **/quit**\]

\[**/quiet**\]

\[**/unattend:***&lt;answerfile&gt;*\]

The following table lists Sysprep command-line options:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Option</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p><strong>/audit</strong></p></td>
<td align="left"><p>Restarts the computer into audit mode. Audit mode enables you to add additional drivers or applications to Windows. You can also test an installation of Windows before you send the installation to an end user. For example:</p>
<pre class="syntax" space="preserve"><code>Sysprep /audit</code></pre>
<p>If you specify an answer file, the audit mode of Windows Setup runs the [auditSystem](auditsystem.md) and [auditUser](audituser.md) configuration passes.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/generalize</strong></p></td>
<td align="left"><p>Prepares the Windows installation to be imaged. Sysprep removes all unique system information from the Windows installation. Sysprep resets the security ID (SID), clears any system restore points, and deletes event logs. For example:</p>
<pre class="syntax" space="preserve"><code>Sysprep /generalize /shutdown</code></pre>
<p>The next time that the computer starts, the [specialize](specialize.md) configuration pass runs. The configuration pass creates a new security ID (SID).</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/oobe</strong></p></td>
<td align="left"><p>Restarts the computer into OOBE mode. For example:</p>
<pre class="syntax" space="preserve"><code>Sysprep /generalize /shutdown /oobe</code></pre>
<p>OOBE enables end users to customize their Windows operating system, create user accounts, name the computer, and perform other tasks. Sysprep processes any settings in the [oobeSystem](oobesystem.md) configuration pass in an answer file before OOBE starts.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/mode:vm</strong></p></td>
<td align="left"><p>Generalizes a Virtual Hard Disk (VHD) so that you can deploy the VHD as a VHD on the same Virtual Machine (VM) or hypervisor. After the VM restarts, the VM can boot to OOBE. For example:</p>
<pre class="syntax" space="preserve"><code>Sysprep /generalize /oobe /mode:vm</code></pre>
<p>The only additional switches that apply to VM mode are <strong>/reboot</strong>, <strong>/shutdown</strong>, and <strong>/quit</strong>.You must deploy the VHD on a Virtual Machine (VM) or hypervisor with the same hardware profile. For example, if you created VHD in Microsoft Hyper-V, you can only deploy your VHD to Microsoft Hyper-V VMs with a matching hardware profile. Deploying the VHD to a different VM with a different hardware profile might cause unexpected issues.</p>
<div class="alert">
<strong>Important</strong>  
<p>You can only run VM mode from inside a VM.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/reboot</strong></p></td>
<td align="left"><p>Restarts the computer. You can use this option to audit the computer and to verify that the first-run experience operates correctly.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/shutdown</strong></p></td>
<td align="left"><p>Shuts down the computer after the <strong>Sysprep</strong> command finishes running.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/quiet</strong></p></td>
<td align="left"><p>Runs the Sysprep tool without displaying on-screen confirmation messages. You can use this option if you automate the Sysprep tool.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/quit</strong></p></td>
<td align="left"><p>Closes the Sysprep tool without rebooting or shutting down the computer after Sysprep runs the specified commands.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/unattend:</strong><em>&lt;answerfile&gt;</em></p></td>
<td align="left"><p>Applies settings in an answer file to Windows during an unattended installation, where <em>&lt;answerfile&gt;</em> specifies the path and file name of the answer file to use. For example:</p>
<pre class="syntax" space="preserve"><code>Sysprep /audit /reboot /unattend:F:\Unattend.xml</code></pre>
<p>where <em>F</em> is the drive letter of the portable storage device on which the answer file (Unattend.xml) is located.</p></td>
</tr>
</tbody>
</table>

 

**Important**  
You must use the **Sysprep /generalize** command to generalize a complete Windows installation before you can use the installation for deployment to a new computer, whether you use imaging, hard disk duplication, or another method. Moving or copying a Windows image to a different computer without running the **Sysprep /generalize** command is not supported.

 

## <span id="related_topics"></span>Related topics


[Sysprep (System Preparation) Overview](sysprep--system-preparation--overview.md)

[Sysprep Process Overview](sysprep-process-overview.md)

[Sysprep (Generalize) a Windows installation](sysprep--generalize--a-windows-installation.md)

[Sysprep Support for Server Roles](sysprep-support-for-server-roles.md)

[Use Answer Files with Sysprep](use-answer-files-with-sysprep.md)

 

 






