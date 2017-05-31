---
author: Justinha
Description: 'Wpeutil Command-Line Options'
ms.assetid: 6537713a-510e-40cd-8518-d1150422bfe8
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Wpeutil Command-Line Options'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Wpeutil Command-Line Options


The Windows® PE utility (Wpeutil) is a command-line tool that enables you to run commands during a Windows PE session. For example, you can shut down or restart Windows PE, enable or disable a firewall, set language settings, and initialize a network.

## <span id="Wpeutil_Command-Line_Options"></span><span id="wpeutil_command-line_options"></span><span id="WPEUTIL_COMMAND-LINE_OPTIONS"></span>Wpeutil Command-Line Options


Wpeutil uses the following conventions.

**Wpeutil** {command} \[*argument*\]

For example:

``` syntax
Wpeutil Shutdown
Wpeutil Enablefirewall
Wpeutil SetMuiLanguage de-DE
```

**Note**  
Wpeutil can only accept one command per line.

 

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Command</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p><strong>CreatePageFile [/path=&lt;path&gt;] [/size=&lt;size&gt;]</strong></p></td>
<td align="left"><p>Creates a page file to a specified path and size. The default path is C:\pagefile.sys and default size is 64 megabytes. At least one option must be specified. For example:</p>
<pre class="syntax" space="preserve"><code>Wpeutil CreatePageFile /path=C:\pagefile.sys</code></pre>
<p>-or-</p>
<pre class="syntax" space="preserve"><code>Wpeutil CreatePageFile /path=C:\pagefile.sys /size=128</code></pre>
<div class="alert">
<strong>Important</strong>  
<p>If a page file exists, the <strong>/CreatePageFile</strong> option must be set equal to or greater than the current size of the page file or the command will fail.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="even">
<td align="left"><p><strong>DisableExtendedCharactersForVolume &lt;path_on_target_volume&gt;</strong></p></td>
<td align="left"><p>Disables extended character support for DOS-compatible file names (8.3 format) for the volume that contains <em>path on target volume</em>. This command only applies to NTFS volumes. The <em>path on target volume</em> must specify the root of the volume. For example:</p>
<pre class="syntax" space="preserve"><code>Wpeutil DisableExtendedCharactersForVolume C:\</code></pre>
<p>If disabled, all files that have been created with extended characters will be converted to a short file name.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>DisableFirewall</strong></p></td>
<td align="left"><p>Disables a firewall. For example:</p>
<pre class="syntax" space="preserve"><code>Wpeutil DisableFirewall</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p><strong>EnableExtendedCharactersForVolume</strong> <em>&lt;path_on_target_volume&gt;</em></p></td>
<td align="left"><p>Allows 8.3 format file names to contain extended characters on the volume that contains <em>path on target volume</em>. This command only applies to NTFS volumes. The <em>path on target volume</em> must specify the root of the volume. For example:</p>
<pre class="syntax" space="preserve"><code>Wpeutil EnableExtendedCharactersForVolume C:\</code></pre>
<div class="alert">
<strong>Note</strong>  
<p>If you are installing an operating system in a language that has extended characters that are enabled by default, such as ja-JP or ko-KR, or using a copy of Windows PE in a language that doesn't have extended characters enabled, such as en-US, the installation will cause a Chkdsk error during first boot. Enabling this option before you install to that volume will prevent Chkdsk command from running.</p>
</div>
<div>
 
</div></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>EnableFirewall</strong></p></td>
<td align="left"><p>Enables a firewall. For example:</p>
<pre class="syntax" space="preserve"><code>Wpeutil EnableFirewall</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p><strong>InitializeNetwork</strong></p></td>
<td align="left"><p>Initializes network components and drivers, and sets the computer name to a randomly-chosen value. For example:</p>
<pre class="syntax" space="preserve"><code>Wpeutil InitializeNetwork</code></pre></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>ListKeyboardLayouts</strong> <em>&lt;LCID&gt;</em></p></td>
<td align="left"><p>Lists the supported keyboard layouts (Name and ID) for a given Locale ID (LCID) value. The keyboard layouts will also be updated in the registry under the key: <strong>HKEY_LOCAL_MACHINE \SOFTWARE\Microsoft\Windows NT\CurrentVersion\WinPE\KeyboardLayouts</strong>. For example:</p>
<pre class="syntax" space="preserve"><code>Wpeutil ListKeyboardLayouts 0x0409</code></pre>
<p>-or-</p>
<pre class="syntax" space="preserve"><code>Wpeutil ListKeyboardLayouts 1033</code></pre>
<p>For a list of valid Locale IDs, see [Locale ID (LCID) Chart](http://go.microsoft.com/fwlink/?LinkId=209839).</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>Reboot</strong></p></td>
<td align="left"><p>Restarts the current Windows PE session. For example:</p>
<pre class="syntax" space="preserve"><code>Wpeutil Reboot</code></pre></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>SaveProfile</strong></p></td>
<td align="left"><p>Stops logging and saves the custom profile to the location the user specified earlier with the <strong>Dism /enable-profiling</strong> command. For more information about the <strong>/enable-profiling</strong> command-line option, see [DISM Windows PE Servicing Command-Line Options](dism-windows-pe-servicing-command-line-options.md). For example:</p>
<pre class="syntax" space="preserve"><code>Wpeutil SaveProfile profile_file_name &quot;short description&quot;</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p><strong>SetKeyboardLayout</strong> <em>&lt;keyboard_layout_ID&gt;</em></p></td>
<td align="left"><p>Sets the keyboard layout in the current Windows PE session. This will take effect for processes after the command succeeds. To obtain a list of supported keyboard layouts, enter:</p>
<pre class="syntax" space="preserve"><code>ListKeyboardLayouts LCID</code></pre>
<p>To set the keyboard for en-US, for example:</p>
<pre class="syntax" space="preserve"><code>Wpeutil SetKeyboardLayout 0409:00000409</code></pre></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>SetMuiLanguage</strong> <em>&lt;language-name&gt;</em>[<strong>;</strong><em>&lt;language-name&gt;</em>]</p></td>
<td align="left"><p>Sets the language. <em>&lt;language-name&gt;</em> uses the international language code format (for example, en-US for the U.S. English language). You can specify multiple languages in priority order, by separating them with a semicolon. For example:</p>
<pre class="syntax" space="preserve"><code>Wpeutil SetMuiLanguage de-DE;en-US</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p><strong>SetUserLocale</strong> <em>&lt;language-name&gt;</em>[<strong>;</strong><em>&lt;language-name&gt;</em>]</p></td>
<td align="left"><p>Sets the user locale. <em>&lt;language-name&gt;</em> uses the international language code format (for example, en-US for the U.S. English language). You can specify multiple languages in priority order, by separating them with a semicolon. For example:</p>
<pre class="syntax" space="preserve"><code>Wpeutil SetUserLocale de-DE;en-US</code></pre></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>Shutdown</strong></p></td>
<td align="left"><p>Shuts down the current Windows PE session. For example:</p>
<pre class="syntax" space="preserve"><code>Wpeutil Shutdown</code></pre>
<div class="alert">
<strong>Note</strong>  
<p>You can also do the following in the Command Prompt window:</p>
<ul>
<li><p>Click the <strong>Close</strong> button</p></li>
<li><p>Type EXIT</p></li>
</ul>
</div>
<div>
 
</div></td>
</tr>
<tr class="even">
<td align="left"><p><strong>UpdateBootInfo</strong></p></td>
<td align="left"><p>Populates the registry with information about how Windows PE boots.</p>
<p>After you run this command, query the registry. For example:</p>
<pre class="syntax" space="preserve"><code>wpeutil UpdateBootInfo
reg query HKLM\System\CurrentControlSet\Control /v PEBootType</code></pre>
<p>The results of this operation might change after loading additional driver support.</p>
<p>To determine where Windows PE is booted from, examine the following:</p>
<ul>
<li><strong>PEBootType</strong>: Error, Flat, Remote, Ramdisk:SourceIdentified Ramdisk:SourceUnidentified, Ramdisk:OpticalDrive</li>
<li><strong>PEBootTypeErrorCode</strong>: HRESULT code</li>
<li><strong>PEBootServerName</strong>: Windows Deployment Services server name</li>
<li><strong>PEBootServerAddr</strong>: Windows Deployment Services server IP address</li>
<li><strong>PEBootRamdiskSourceDrive</strong>: Source drive letter, if available.</li>
<li><strong>PEFirmwareType</strong>: Firmware boot mode: 0x1 for BIOS, 0x2 for UEFI.</li>
</ul>
<p>If you are not booting Windows Deployment Services, the best way to determine where Windows PE booted from is to first check for PEBootRamdiskSourceDrive registry key. If it is not present, scan the drives of the correct PEBootType and look for some kind of tag file that identifies the boot drive.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>WaitForNetwork</strong></p></td>
<td align="left"><p>Waits for the network card to be initialized. Use this command when creating scripts to make sure that the network card has been fully initialized before continuing.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>WaitForRemovableStorage</strong></p></td>
<td align="left"><p>During the Windows PE startup sequence, this command will block startup until the removable storage devices, such as USB hard drives, are initialized. For example:</p>
<pre class="syntax" space="preserve"><code>Wpeutil WaitForRemovableStorage</code></pre>
<div class="alert">
<strong>Note</strong>  
<p>This spelling of <strong>WaitForRemovableStorage</strong> is correct.</p>
</div>
<div>
 
</div></td>
</tr>
</tbody>
</table>

 

## <span id="related_topics"></span>Related topics


[WinPE for Windows 10](winpe-intro.md)

[WinPE: Mount and Customize](winpe-mount-and-customize.md)

[DISM Windows PE Servicing Command-Line Options](dism-windows-pe-servicing-command-line-options.md)

 

 






