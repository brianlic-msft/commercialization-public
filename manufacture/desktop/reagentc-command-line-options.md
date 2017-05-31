---
author: Justinha
Description: 'REAgentC command-line options'
ms.assetid: da498872-1c26-4cb8-a5da-80a0d45200f3
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'REAgentC command-line options'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# REAgentC command-line options


You can use the REAgentC.exe tool to configure a Windows Recovery Environment (Windows RE) boot image and a push-button reset recovery image, and to administer recovery options and customizations. You can run the **REAgentC** command on an offline Windows image or on a running Windows operating system.

**Note**  
If you are using Windows PE 2.X, 3.X, or 4.X to configure recovery on an offline Windows 10 installation, you must use the Winrecfg.exe file from the Recovery folder of the Windows Assessment and Deployment Kit (Windows ADK). Winrecfg.exe supports only the offline operations that REAgentC.exe supports.

 

## <span id="REAgentC_Commands"></span><span id="reagentc_commands"></span><span id="REAGENTC_COMMANDS"></span>REAgentC Commands


The following command-line options are available for Windows RE:

**reagentc.exe** &lt;command&gt; &lt;arguments&gt;

The following table describes these command-line options:

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Option</th>
<th align="left">Online/Offline</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p><strong>/setreimage /path</strong> <em>&lt;path_to_Windows_RE_image&gt;</em> [<strong>/target</strong> <em>&lt;path_to_offline_image&gt;</em>]</p>
<p></p></td>
<td align="left"><p>Both</p></td>
<td align="left"><p>Sets the location of a Windows RE boot image. In Windows 10, Windows 8.1, Windows 8 , Windows Server 2016 Technical Preview, Windows Server 2012 R2, and Windows Server 2012, <strong>/path</strong> supports UNC paths to locations on the local disk. For example:</p>
<pre class="syntax" space="preserve"><code>Reagentc /setreimage /path S:\Recovery\WindowsRE</code></pre>
<p>Use the <strong>/target</strong> option to specify the location of the Windows image when you apply the setting offline. For example:</p>
<pre class="syntax" space="preserve"><code>Reagentc /setreimage /path T:\Recovery\WindowsRE /target W:\Windows</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/enable</strong> [<strong>/auditmode</strong>] [<strong>/osguid</strong> &lt;bcd_guid&gt;]</p></td>
<td align="left"><p>Online</p></td>
<td align="left"><p>Enables a custom Windows RE boot image.</p>
<p>The <strong>/enable</strong> option runs automatically during the specialize configuration pass. If you don't specify a Windows RE boot image, the computer attempts to enable Windows RE by using the default Winre.wim file from the \Windows\System32\Recovery folder.</p>
<ul>
<li><p><strong>/auditmode</strong>:</p>
<p>By default, the <strong>/enable</strong> option doesn't perform any actions when Windows is in audit mode. To override the default behavior and enable Windows RE from audit mode, specify the <strong>/auditmode</strong> option. For example:</p>
<pre class="syntax" space="preserve"><code>Reagentc /enable /auditmode</code></pre>
<p>If you generalize the image after you use the <strong>/enable</strong> option in audit mode, Windows RE is disabled until you use the <strong>/enable</strong> option again or until after the specialize configuration pass runs.</p></li>
<li><p><strong>/osguid</strong> &lt;bcd_guid&gt;:</p>
<p>This option allows you to enable your custom Windows RE boot image from Windows PE. It can only be used after bcdboot.exe has been run. &lt;bcd_guid&gt; is the Boot Configuration Data (BCD) identifier of the target Windows installation, obtained by running <code>bcdedit -enum -v</code>.</p>
<pre class="syntax" space="preserve"><code>Reagentc /enable /osguid {00000000-0000-0000-0000-000000000000}</code></pre></li>
</ul></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/disable</strong></p></td>
<td align="left"><p>Online</p></td>
<td align="left"><p>Disables any active Windows RE image that is mapped to the online image. For example:</p>
<pre class="syntax" space="preserve"><code>Reagentc /disable</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/boottore</strong></p></td>
<td align="left"><p>Online</p></td>
<td align="left"><p>Specifies that Windows RE starts automatically the next time the system starts. For example:</p>
<pre class="syntax" space="preserve"><code>Reagentc /boottore</code></pre></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/setosimage /path</strong> <em>&lt;path_to_recovery_image&gt;</em> <strong>/index</strong> <em>&lt;image_index&gt;</em> [<strong>/target</strong> <em>&lt;path_to_offline_image&gt;</em>]</p></td>
<td align="left"><p>Both</p></td>
<td align="left"><p>This setting is not used in Windows 10.</p>
<p>Registers the location of a push-button reset image in an online or offline image. The recovery image must be in the Windows image (.wim) format.</p>
<p>The <strong>/index</strong> option specifies the index number of the recovery image to use from within a .wim file. For example:</p>
<pre class="syntax" space="preserve"><code>Reagentc /setosimage /path R:\RecoveryImage /index 1</code></pre>
<p>Use the <strong>/target</strong> option to specify the location of the offline Windows image. For example:</p>
<pre class="syntax" space="preserve"><code>Reagentc /setosimage /path R:\RecoveryImage /index 1 /target W:\Windows</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/info</strong> [<strong>/target</strong> <em>&lt;path_to_offline_image&gt;</em>]</p></td>
<td align="left"><p>Both</p></td>
<td align="left"><p>Displays the current status of Windows RE and any available recovery image on an online or offline image. For example, the following command returns the status of the online operating system:</p>
<pre class="syntax" space="preserve"><code>Reagentc /info</code></pre>
<p>Use the <strong>/target</strong> option to obtain configuration information about an offline image. For example:</p>
<pre class="syntax" space="preserve"><code>Reagentc /info /target W:\Windows</code></pre></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/setbootshelllink</strong> [<strong>/configfile</strong> <em>&lt;path_to_BootShellXML&gt;</em>] [<strong>/target</strong> <em>&lt;path_to_offline_image&gt;</em>]</p></td>
<td align="left"><p>Both</p></td>
<td align="left"><p>Registers the link to a custom tool that appears in the Windows boot options menu. For example:</p>
<pre class="syntax" space="preserve"><code>Reagentc /setbootshelllink /configfile F:\BootMenu\AddDiagnosticsToolToBootMenu.xml</code></pre>
<p>The BootShellXML file is an.xml file that contains the <em>&lt;BootShell&gt;</em> element and the <em>&lt;Name&gt;</em> and <em>&lt;Description&gt;</em> attributes that you want to appear in the link. For more information, see [Customize Windows RE](customize-windows-re.md).</p>
<p>Use the <strong>/target</strong> option to specify the location of the offline Windows image. If this argument is not used, the running operating system is used. For example:</p>
<pre class="syntax" space="preserve"><code>Reagentc /setbootshelllink /target W:\Windows</code></pre></td>
</tr>
</tbody>
</table>

 

## <span id="related_topics"></span>Related topics


[Windows RE Troubleshooting Features](windows-re-troubleshooting-features.md)

 

 






