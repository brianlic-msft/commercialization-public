---
author: themar
Description: 'Windows Setup Command-Line Options'
ms.assetid: 16001d04-db9f-4953-abc7-37903ef47fd1
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Windows Setup Command-Line Options'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows Setup Command-Line Options


The following command-line options are available for Windows Setup. Beginning with Windows 10, version 1607, you can use a setupconfig file as an alternative to passing paramters to Windows Setup on a command line. For more information, see [Windows Setup Automation Overview](windows-setup-automation-overview.md).

**setup.exe** \[**/1394debug:***&lt;channel&gt;* \[**baudrate:***&lt;baudrate&gt;*\]\]

\[**/addbootmgrlast**\]

\[**/Auto** {**Clean** | **DataOnly** | **Upgrade**}\]

\[**/busparams:***&lt;bus.device.function&gt;*\]

\[**/CompactOS** {**Enable** | **Disable**}\]

\[**/Compat** {**IgnoreWarning** | **ScanOnly**}\]

\[**/CopyLogs***&lt;location&gt;*\]

\[**/debug:***&lt;channel&gt;* \[**baudrate:***&lt;baudrate&gt;*\]\]

\[**/DiagnosticPrompt** {**Enable** | **Disable**}\]

\[**/DynamicUpdate** {**enable** | **disable**}\]

\[**/emsport:** {**COM1** | **COM2** | **usebiossettings** | **off**} \[**/emsbaudrate:***&lt;baudrate&gt;*\]\]

\[**/InstallDrivers***&lt;location&gt;*\]

\[**/installfrom** *&lt;path&gt;*\]

\[**/InstallLangPacks***&lt;location&gt;*\]

\[**/m:***&lt;folder\_name&gt;*\] \[**/noreboot**\] 

\[**/MigrateDrivers** {**all** | **none**}\]

\[**/netdebug:**hostip=&lt;*w.x.y.z*&gt;,port=&lt;*n*&gt;,key=&lt;*q.r.s.t*&gt;\[,nodhcp\]\[,busparams=*n.o.p*\]\]

\[**/NoReboot**\]

\[**/PKey** *&lt;product key&gt;*\]

\[**/PostOOBE***&lt;location&gt;*\[**\\setupcomplete.cmd**\]\]

\[**/PostRollback***&lt;location&gt;*\[**\\setuprollback.cmd**\]\]

\[**/Quiet** \]

\[**/ReflectDrivers***&lt;location&gt;*\]

\[**/ResizeRecoveryPartition** {**Enable** | **Disable**}\]

\[**/ShowOOBE** {**full** | **none**}\]

\[**/Telemetry** {**Enable** | **Disable**}\]

\[**/TempDrive** *&lt;drive_letter&gt;*\]

\[**/unattend:***&lt;answer\_file&gt;*\]

\[**/Uninstall** {**enable** | **disable**}\]

\[**/usbdebug:***&lt;hostname&gt;*\]

\[**/wdsdiscover**\]

\[**/wdsserver:***&lt;servername&gt;*\]

## <span id="Setup_Command-Line_Options"></span><span id="setup_command-line_options"></span><span id="SETUP_COMMAND-LINE_OPTIONS"></span>Setup Command-Line Options


The following table lists Setup command-line options:

<table>
<thead>
<tr class="header">
<th align="left"><strong>Option</strong></th>
<th align="left"><strong>Description</strong></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p><strong>/1394Debug:</strong><em>&lt;channel&gt;</em> [<strong>BaudRate:</strong><em>&lt;baudrate&gt;</em>]</p></td>
<td align="left"><p>Enables kernel debugging over an IEEE 1394 (FireWire) port while Windows is running and during the [windowsPE](windowspe.md) configuration pass of Windows Setup.</p>
<p><em>&lt;channel&gt;</em> specifies the debugging channel. The default value for <em>&lt;channel&gt;</em> is <strong>1</strong>.</p>
<p>[<strong>baudrate:</strong><em>&lt;baudrate&gt;</em>] specifies the baud to use when Windows transfers data during debugging. The default setting is <strong>19200</strong>. You can also set the <em>&lt;baudrate&gt;</em> setting to <strong>57600</strong> or <strong>115200</strong>. For example:</p>
<pre class="syntax" space="preserve"><code>Setup /1394debug:1 /baudrate:115200</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/AddBootMgrLast</strong></p></td>
<td align="left"><p>Instructs Windows Setup to add the Windows Boot Manager as the last entry in the UEFI firmware boot order. This option is only supported on UEFI PCs running Windows PE 4.0 or later.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/Auto</strong> {<strong>Clean</strong> | <strong>DataOnly</strong> | <strong>Upgrade</strong>}</p></td>
<td align="left"><p>Performs an automated upgrade to Windows 10 or Windows 8.1 volume license editions only.</p>
<p>When /auto is used, an unattend file cannot be used.</p>
<p>When /auto is used, Windows Setup consumes ei.cfg, an checks compatibility issues before starting the installation. If ei.cfg is malformed, setup exits silently and logs an exit code.</p>
<p><strong>Clean</strong>: Performs an clean install of Windows.</p>
<p><strong>DataOnly</strong>: Performs an upgrade of Windows, saving only data (and not apps.) If the data-only installation option is not available due to compatibility checks, Windows Setup will exit silently and log an exit code.</p>
<p><strong>Upgrade</strong>: Performs an upgrade of Windows saving apps and data. If the upgrade installation option is not available, or the user needs to resolve an app compatibility issue, Windows Setup will exit silently and log an exit code.</p>
<p><strong>Setup.exe exit codes:</strong> [ See table below](#setup_exe_exit_codes)</p>
<strong>Clean</strong>
<p><strong>/noautoexit</strong>: Not used in Windows 10. In Windows 8.1, if an error is found, Windows Setup does not exit, but instead stops and stays on the setup screen until the user addresses the issue. The installation from that point on is attended.</p>
<p><strong>/performDU</strong>: Not used in Windows 10. In Windows 8.1, Windows Setup checks for Dynamic Updates for Windows Setup.</p>
<p><strong>Examples:</strong></p>
<pre class="syntax" space="preserve"><code>Setup /auto clean 
Setup /auto dataonly 
Setup /auto upgrade</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/BusParams:</strong><em>&lt;bus.device.function&gt;</em></p></td>
<td align="left"><p>Specifies the PCI address of a 1394, USB, or NET debug port. The bus, device, and function numbers must be in decimal format. Example:</p>
<pre class="syntax" space="preserve"><code>Setup /busparams:0.29.7 </code></pre>
<p>For more info, see [Setting Up Kernel Debugging with USB 2.0](http://go.microsoft.com/fwlink/?LinkId=317360).</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/CompactOS</strong> {<strong>Enable</strong> | <strong>Disable</strong>}</p></td>
<td align="left"><p>Specifies whether to use the Compact OS feature to save hard drive space. By default, Windows Setup determines whether to use this feature automatically.</p>
<p><strong>Enable</strong>: Setup installs Windows using compressed system files.</p>
<p><strong>Disable</strong>: Setup installs Windows using uncompressed system files</p>
<p>To learn more about Compact OS, see [Compact OS, single-instancing, and image optimization](compact-os.md).</p>
<pre class="syntax" space="preserve"><code>Setup /compactos enable</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/Compat</strong> {<strong>IgnoreWarning</strong> | <strong>ScanOnly</strong>}</p></td>
<td align="left"><p><strong>IgnoreWarning</strong>: Setup completes installation, ignoring any dismissible compatibility messages</p>
<p><strong>ScanOnly</strong>: Windows Setup runs through compatibility scans, and then exits (without completing the installation) with an exit code to indicate if any compatibility concerns are present. Setup will return 0xC1900210 if no concerns are found. Setup will return 0xC1900208 if compatibility concerns are found.</p>
<p>Example:</p>
<pre class="syntax" space="preserve"><code>Setup /compat /IgnoreWarning</code></pre>
<p>If you launch Setup with <code>/Compat ScanOnly</code>:</p>
<ul>
<li>If it does not find any compat issue, it will return MOSETUP_E_COMPAT_SCANONLY (0xC1900210)</li>
<li>If it finds Actionable compat issues, like Apps, it will return MOSETUP_E_COMPAT_INSTALLREQ_BLOCK (0xC1900208)</li>
<li>If it finds that the Mig-Choice selected is not available, it will return MOSETUP_E_COMPAT_MIGCHOICE_BLOCK (0xC1900204)</li>
<li>If it finds that machine is not eligible for Windows 10, it will return MOSETUP_E_COMPAT_SYSREQ_BLOCK (0xC1900200)</li>
<li>If it finds that machine does not have enough free space to install, it will return MOSETUP_E_INSTALLDISKSPACE_BLOCK (0xC190020E)</li>
</ul>
<p>This command works with other switches. For example, to run Setup in the background without any UI:</p>
<pre class="syntax" space="preserve"><code>Setup /Auto Upgrade /Quiet /Compat ScanOnly</code></pre>
<p>To ignore common disclaimers in the UI, for example, language changes:</p>
<pre class="syntax" space="preserve"><code>Setup /Auto Upgrade /Quiet /Compat ScanOnly /Compat IgnoreWarning</code></pre>
<p>Most of the time, an Admin would like to look at the compat XML if Setup found compat issues. For that the admin can even use copy logs flag to collect Setup logs:</p>
<pre class="syntax" space="preserve"><code>Setup /Auto Upgrade /Quiet /Compat ScanOnly /Compat IgnoreWarning /CopyLogs &lt;folder_path&gt; </code></pre>
<p>This setting is new for Windows 10.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/CopyLogs</strong><em>&lt;location&gt;</em></p></td>
<td align="left"><p>Setup will copy or upload logs(compressed) upon failure to the specified location (assuming machine/user has permission and network access to location).</p>
<p>Accepted parameters are local file paths and UNC network paths.</p>
<div class="alert">
<strong>Note</strong>  This runs in the system context, so it may not have permissions to copy to locations that require user permissions.
</div>
<div>
 
</div>
<p>Example:</p>
<pre class="syntax" space="preserve"><code>Setup /copylogs \\server\share\ </code></pre>
<p>This setting is new for Windows 10.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/Debug:</strong><em>&lt;port&gt;</em> [<strong>BaudRate:</strong><em>&lt;baudrate&gt;</em>]</p></td>
<td align="left"><p>Enables kernel debugging over a communications (COM) port when Windows is running, and during the [windowsPE](windowspe.md) configuration pass of Windows Setup.</p>
<p><em>&lt;port&gt;</em> specifies the debugging port. The default value for <em>&lt;port&gt;</em> is <strong>1</strong>.</p>
<p>[<strong>baudrate:</strong><em>&lt;baudrate&gt;</em> specifies the baud to use when Windows transfers data during debugging. The default setting is <strong>19200</strong>. You can also set the <em>&lt;baudrate&gt;</em> setting to <strong>57600</strong> or <strong>115200</strong>. For example:</p>
<pre class="syntax" space="preserve"><code>Setup /1394debug:1 /baudrate:115200</code></pre></td>
</tr>
<td align="left"><p><strong>/DiagnosticPrompt</strong> {<strong>enable</strong> | <strong> disable</strong>}</p></td> 
<td align="left"><p>Specifies that the Command Prompt is available during Windows Setup.</p>
<p> <strong>Enable:</strong> The Command Prompt can be accessed by pressing Shift+F10 during Windows setup.</p>
<p><strong>Disable:</Strong> The Command Prompt is not available during Windows setup. The Command Prompt wil not be available while offline and OOBE phases are running. This is the default setting.</p> Example:</p> <pre class="syntax" space="preserve"><code>setup /DiagnosticPrompt enable </code></pre>
<p>This setting is new for Windows 10, Version 1703.</p> </td> </tr> </tr>
<tr class="odd">
<td align="left"><p><strong>/DynamicUpdate</strong> {<strong>enable</strong> | <strong>disable</strong>}</p></td>
<td align="left"><p>Specifies whether setup will perform Dynamic Update operations (search, download, and install updates). Example:</p>
<pre class="syntax" space="preserve"><code>setup /auto upgrade /DynamicUpdate disable </code></pre>
<p>This setting is new for Windows 10.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/EMSPort:</strong> {<strong>COM1</strong> | <strong>COM2</strong> | | <strong>off</strong>} [<strong>/emsbaudrate:</strong><em>&lt;baudrate&gt;</em>]</p></td>
<td align="left"><p>Enables or disables Emergency Management Services (EMS) during Windows Setup and after the server operating system has been installed. The following arguments are used to specify the behavior of EMS during Windows Setup.</p>
<p><strong>COM1</strong> enables EMS over COM1. Supported for x86 systems only.</p>
<p><strong>COM2</strong> enables EMS over COM2. Supported for x86 systems only.</p>
<p><strong>usebiossettings</strong> uses the setting that the BIOS specifies. For x86 systems, Windows uses the value from the Serial Port Console Redirection (SPCR) table. If no SPCR table or EFI console device path is specified in the BIOS, Windows disables <strong>usebiossettings</strong>.<strong>usebiossettings</strong></p>
<p><strong>off</strong> disables EMS. If EMS is disabled in Windows Setup, you can later enable EMS by modifying the boot settings.</p>
<p></p>
<p>[<strong>/emsbaudrate:</strong><em>&lt;baudrate&gt;</em>] specifies the baud to use when Windows transfers data during debugging. The default is <strong>19200</strong>. You can also set the <em>&lt;baudrate&gt;</em> setting can also be set to <strong>57600</strong> or <strong>115200</strong>. For example:</p>
<pre class="syntax" space="preserve"><code>Setup /emsport:COM1 /emsbaudrate:115200</code></pre></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/InstallDrivers</strong><em>&lt;location&gt;</em></p></td>
<td align="left"><p>Adds .inf-style drivers to the new Windows 10 installation. The driver .inf can be in a folder within the specified location. The command will recurse through the specified location. Example:</p>
<p>Accepted parameters are a local file path or UNC network path to a folder that contains .inf files.</p>
<pre class="syntax" space="preserve"><code>setup.exe /auto upgrade /installdrivers C:\Fabrikam\drivers /noreboot </code></pre>
<p>This setting is new for Windows 10.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/InstallFrom</strong> <em>&lt;path&gt;</em></p></td>
<td align="left"><p>Specifies a different Install.wim file to use during Windows Setup. This enables you to use a single preinstallation environment to install multiple versions of Windows images. For example, you can use a 32-bit version of Windows Setup to deploy a 64-bit Windows image. You can also use an answer file for cross-platform deployments. For more information, see “Creating a WIM for Multiple Architecture Types” in [Windows Setup Supported Platforms and Cross-Platform Deployments](windows-setup-supported-platforms-and-cross-platform-deployments.md).</p>
<p><em>&lt;path&gt;</em> specifies the path of the .wim file to install. For example:</p>
<pre class="syntax" space="preserve"><code>Setup /installfrom D:\custom.wim</code></pre></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/InstallLangPacks</strong><em>&lt;location&gt;</em></p></td>
<td align="left"><p>Adds language packs (lp.cab) to the new Windows 10 installation.</p>
<p>The language packs can be in a folder within the specified location. The command installs all lp.cab files and language capabilities such as text-to-speech recognition, in the folder and subfolders at the specified location.</p>
<p>Accepted parameters are a local file path or UNC network path to a folder that contains .inf files.</p>
<pre class="syntax" space="preserve"><code>setup /auto upgrade /installlangpacks C:\Fabrikam\Languages\French /noreboot</code></pre>
<p>This setting is new for Windows 10.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/m:</strong><em>&lt;folder_name&gt;</em></p></td>
<td align="left"><p>Instructs Setup to copy alternate files from an alternate location. This option instructs Setup to look in the alternate location first, and, if files are present, to use them instead of the files from the default location.</p>
<p><em>&lt;folder_name&gt;</em> specifies the name and the location of the folder that contains the replacement files and can be any local drive location. UNC paths are not supported.</p>
<p>You must know where the files will be installed on the Windows installation. All the additional files must be copied to an $OEM$ folder in your installation sources or in the <em>&lt;folder_name&gt;</em>. The $OEM$ structure provides a representation of the destination installation disk. For example:</p>
<pre class="syntax" space="preserve"><code>$OEM$\$1</code></pre>
<p>maps to %SYSTEMDRIVE%, which could be drive C.</p>
<pre class="syntax" space="preserve"><code>$OEM$\$$</code></pre>
<p>maps to %WINDIR%, which could be C:\windows\.</p>
<pre class="syntax" space="preserve"><code>$OEM$\$progs</code></pre>
<p>maps to the program files directory.</p>
<pre class="syntax" space="preserve"><code>$OEM$\$docs</code></pre>
<p>maps to the user's My Documents folder.</p>
<p>For example, to copy an updated C:\Program Files\Messenger\Msmsgs.exe file into the Windows installation, create the following folder structure on the Pro\Sources\$OEM$\$Progs\Messenger\Msmsgs.exe installation source by using the <strong>Setup</strong> command:</p>
<pre class="syntax" space="preserve"><code>Pro\sources\setup.exe /m</code></pre>
<p>If you replace a file that Windows file protection protects, you must also copy the updated file to the local sources to be installed with Windows. For example, you may copy the file to the C:\Windows\i386 folder. The file name must be the same as the name that is used in Windows Setup. For example, add the following file and folder structure to your $OEM$ directory:</p>
<pre class="syntax" space="preserve"><code>Pro\sources\$OEM$\$$\i386\msmsgs.ex_</code></pre>
<p>If you use files that are not on an installation share, you must specify the folder name. In this example the <em>&lt;folder_name&gt;</em> is C:\additional_files:</p>
<pre class="syntax" space="preserve"><code>Setup /m:C:\additional_files</code></pre>
<p>where C:\additional_files is your customized $OEM$ directory. For example:</p>
<pre class="syntax" space="preserve"><code>C:\additional_files\$$\i386\msmsgs.ex_</code></pre>
<p>If you change resources in your replacement files, you must add the updated Multilanguage User Interface (MUI) files to the installation.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/MigrateDrivers</strong> {<strong>all</strong> | <strong>none</strong>}</p></td>
<td align="left"><p>Instructs Setup whether to migrate the drivers from the existing installation during the upgrade. You can specify <strong>All</strong> or <strong>None</strong>. By default, Setup decides which is best for each individual driver based on the install choice.</p>
<p>You can use this switch with <strong>/installdrivers</strong>, though it's not required.</p>
<pre class="syntax" space="preserve"><code>Setup /auto upgrade /migratedrivers all 
Setup /auto upgrade /migratedrivers none /installdrivers N:\NewDrivers</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/NetDebug:</strong>hostip=&lt;<em>w.x.y.z</em>&gt;,port=&lt;<em>n</em>&gt;,key=&lt;<em>q.r.s.t</em>&gt;[,nodhcp][,busparams=<em>n.o.p</em>]</p></td>
<td align="left"><p>Enables kernel debugging over the network.</p>
<p>Use hostip to identify the IP address of the host computer.</p>
<p>Use port to identify the port. The default start port is 49152, and the default end port is 65535. </p>
<p>Use key to provide a password to set up a secure connection.</p>
<p>Use nodhcp to avoid using a DHCP connection. (optional)</p>
<p>Use busparams to select the bus number, device number, and function number of an adapter for a specific PCI bus device. (optional)</p>
<p>Examples:</p>
<pre class="syntax" space="preserve"><code>setup /netdebug:hostip=10.125.4.86,port=50000,key=0.0.0.0 
setup /netdebug:hostip=10.125.4.86,port=50000,key=abcdefg.123.hijklmnop.456,nodhcp 
setup /netdebug:hostip=10.125.4.86,port=50000,key=dont.use.previous.keys,busparams=1.5.0</code></pre>
<p>For details, see [Setting Up Kernel-Mode Debugging over a Network Cable Manually](http://go.microsoft.com/fwlink/p/?linkid=317384).</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/NoReboot</strong></p></td>
<td align="left"><p>Instructs Windows Setup not to restart the computer after the down-level phase of Windows Setup completes. The <strong>/noreboot</strong> option enables you to execute additional commands before Windows restarts. This option suppresses only the first reboot. The option does not suppress subsequent reboots. For example:</p>
<pre class="syntax" space="preserve"><code>Setup /noreboot</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/PKey</strong> <em>&lt;product key&gt;</em></p></td>
<td align="left"><p>Supplies Setup with the specific product key. Example:</p>
<pre class="syntax" space="preserve"><code>setup.exe /auto upgrade /pkey xxxxx-xxxxx-xxxxx-xxxxx-xxxxx </code></pre>
<p>This setting is new for Windows 10.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/PostOOBE</strong><em>&lt;location&gt;</em>[<strong>\setupcomplete.cmd</strong>]</p></td>
<td align="left"><p>After Setup is complete, run a script.</p>
<p>Accepted parameters are a local file path or UNC network path to a file named setupcomplete.cmd or to a folder that contains setupcomplete.cmd.</p>
<pre class="syntax" space="preserve"><code>setup.exe /auto upgrade /postoobe c:\Fabrikam\setupcomplete.cmd</code></pre>
<p>Path to folder that contains a script with the name: <strong>setupcomplete.cmd</strong>: Copies setupcomplete.cmd to $Windows.~BT to be run after OOBE.</p>
<pre class="syntax" space="preserve"><code>setup.exe /auto upgrade /postoobe c:\Fabrikam\ </code></pre>
<p>This setting is new for Windows 10.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/PostRollback</strong><em>&lt;location&gt;</em>[<strong>\setuprollback.cmd</strong>]</p></td>
<td align="left"><p>If the user rolls back their version of Windows, run a script.</p>
<p>Accepted parameters are a local file path or UNC network path to a file named setuprollback.cmd or to a folder that contains setuprollback.cmd.</p>
<pre class="syntax" space="preserve"><code>setup.exe /auto upgrade /postrollback c:\Fabrikam\setuprollback.cmd</code></pre>
<p>Path to folder that contains a script with the name: <strong>setuprollback.cmd</strong>: Copies setuprollback.cmd to $Windows.~BT to be run after OOBE.</p>
<pre class="syntax" space="preserve"><code>setup.exe /auto upgrade /postrollback \\server\share</code></pre>
<p>This setting is new for Windows 10.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/Quiet</strong></p></td>
<td align="left"><p>This will suppress any Setup user experience including the rollback user experience. Example:</p>
<pre class="syntax" space="preserve"><code>setup /auto upgrade /quiet</code></pre>
<p>This setting is new for Windows 10.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/ReflectDrivers</strong><em>&lt;location&gt;</em></p></td>
<td align="left"><p>Specifies the path to a folder that contains encryption drivers for a computer that has third-party encryption enabled.</p>
<pre class="syntax" space="preserve"><code>Setup /ReflectDrivers &lt;folder_path&gt; </code></pre>
<p>Make sure that \<folder_path> contains only a minimal set of encryption drivers. Having more drivers than necessary in \<folder_path> can negatively impact upgrade scenarios.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/ResizeRecoveryPartition</strong> {<strong>Enable</strong> | <strong>Disable</strong>}</p></td>
<td align="left"><p>Specifies whether it's OK to resize the existing Windows Recovery Environment (Windows RE) partition or create a new one during installation.</p>
<p><strong>Enable</strong>: During installation, Windows can resize the existing Windows RE tools partition or create a new one if needed.</p>
<p><strong>Disable</strong>: Windows does not resize the existing Windows RE tools partition or create a new one during installation.</p>
<p>To learn more about Windows RE partitions, see [UEFI/GPT-based hard drive partitions](configure-uefigpt-based-hard-drive-partitions.md) and [BIOS/MBR-based hard drive partitions](configure-biosmbr-based-hard-drive-partitions.md).</p>
<pre class="syntax" space="preserve"><code>Setup /resizerecoverypartition disable</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/ShowOOBE</strong> {<strong>full</strong> | <strong>none</strong>}</p></td>
<td align="left"><p><strong>full</strong>: Requires the user to interactively complete the out of box experience (OOBE).</p>
<p><strong>none</strong>: Skips OOBE and selects the default settings.</p>
<p>Example:</p>
<pre class="syntax" space="preserve"><code>setup.exe /auto upgrade /showoobe full</code></pre>
<p>This setting is new for Windows 10.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/Telemetry</strong> {<strong>Enable</strong> | <strong>Disable</strong>}</p></td>
<td align="left"><p>Specifies whether Windows Setup should capture and report installation data.</p>
<p><strong>Enable</strong>: Setup captures and reports installation data.</p>
<p><strong>Disable</strong>: Setup does not capture and report installation data.</p>
<pre class="syntax" space="preserve"><code>Setup /telemetry disable</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/TempDrive</strong><em> &lt;drive_letter&gt;</em></p></td>
<td align="left"><p>Instructs Windows Setup to put temporary installation files on the specified partition. For an upgrade, the <strong>/tempdrive</strong> option affects only the placement of temporary files. The operating system is upgraded in the partition from which you run the Setup.exe file.</p><p>The /tempdrive parameter is available in Windows 10, version 1607, but it is not available in earlier versions of Windows 10.</p>
<p><em>&lt;drive_letter&gt;</em> specifies the partition to copy installation files to during Windows Setup. For example:</p>
<pre class="syntax" space="preserve"><code>Setup /tempdrive H</code></pre></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/Unattend:</strong><em>&lt;answer_file</em>&gt;</p></td>
<td align="left"><p>Enables you to use an answer file with Windows Setup. This is known as an unattended installation. You must specify a value for <em>&lt;answer_file&gt;</em>. Windows Setup applies the values in the answer file during installation.</p>
<p><em>&lt;answer_file&gt;</em> specifies the file path and file name of the unattended Windows Setup answer file.</p>
<pre class="syntax" space="preserve"><code>Setup /unattend:\\server\share\unattend.xml</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/Uninstall</strong> {<strong>enable</strong> | <strong>disable</strong>}</p></td>
<td align="left"><p>Determines whether Windows will include controls that allow the user to go back to the previous operating system.</p>
<p>This setting is new for Windows 10.</p>
<pre class="syntax" space="preserve"><code>Setup /uninstall disable</code></pre></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/USBDebug:</strong><em>&lt;hostname&gt;</em></p></td>
<td align="left"><p>Sets up debugging on a USB port. Debug data is effective on the next reboot.</p>
<p><em>&lt;hostname&gt;</em> specifies the name of the computer to debug. For example:</p>
<pre class="syntax" space="preserve"><code>Setup /usbdebug:testmachine01</code></pre></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/WDSDiscover</strong></p></td>
<td align="left"><p>Specifies that the Windows Deployment Services (WDS) client should be in discover mode.</p>
<p>If you do not specify <strong>/wdsserver</strong> with this option, WDS searches for a server. For example, to start the WDS client in this dynamic discover mode, run the following command:</p>
<pre class="syntax" space="preserve"><code>Setup /wds /wdsdiscover</code></pre></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/WDSServer:</strong><em>&lt;servername&gt;</em></p></td>
<td align="left"><p>Specifies the name of the Windows Deployment Services server that the client should connect to.</p>
<p>To use this setting, you must also use the <code>/wdsdiscover</code> option.</p>
<p><em>&lt;servername&gt;</em> can be an IP address, a NetBIOS name, or a fully qualified domain name (FQDN). For example, to start the Windows Deployment Services client in this static discover mode, run the following command:</p>
<pre class="syntax" space="preserve"><code>Setup /wds /wdsdiscover /wdsserver:MyWDSServer</code></pre></td>
</tr>
</tbody>
</table>

### <span id="setup_exe_exit_codes"></span>Setup.exe exit codes

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Exit code name</th>
<th align="left">Exit code</th>
<th align="left">Cause</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>CONX_SETUP_EXITCODE_CONTINUE_REBOOT</p></td>
<td align="left"><p>0x3</p></td>
<td align="left"><p>This upgrade was successful.</p></td>
</tr>
<tr class="even">
<td align="left"><p>CONX_SETUP_EXITCODE_RESUME_AT_COMPAT_REPORT</p></td>
<td align="left"><p>0x5</p></td>
<td align="left"><p>The compatibility check detected issues that require resolution before the upgrade can continue.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>CONX_SETUP_EXITCODE_AUTO_INSTALL_FAIL</p></td>
<td align="left"><p>0x7</p></td>
<td align="left"><p>The installation option (upgrade or data only) was not available.</p></td>
</tr>
</tbody>
</table>

## <span id="related_topics"></span>Related topics


[Windows Setup States](windows-setup-states.md)

[Windows Setup Edition Configuration and Product ID Files (EI.cfg and PID.txt)](windows-setup-edition-configuration-and-product-id-files--eicfg-and-pidtxt.md)

[Windows Setup Log Files and Event Logs](windows-setup-log-files-and-event-logs.md)

 

 
