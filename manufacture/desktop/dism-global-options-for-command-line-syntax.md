---
author: Justinha
Description: 'DISM Global Options for Command-Line Syntax'
ms.assetid: b902ff42-6718-48ca-878b-f3824d3229d4
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'DISM Global Options for Command-Line Syntax'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# DISM Global Options for Command-Line Syntax


Global options can be added to most of the servicing and imaging options in the Deployment Image Servicing and Management (DISM) tool. These options can be used to access the command-line help, specify the location of files to use, and control logging.

## <span id="Basic_Syntax_for_Servicing_Commands"></span><span id="basic_syntax_for_servicing_commands"></span><span id="BASIC_SYNTAX_FOR_SERVICING_COMMANDS"></span>Basic Syntax for Servicing Commands


After you have mounted or applied a Windows® image so that it is available offline as a flat file structure, you can specify any DISM global options, the servicing option that will update your image, and the location of the offline image. You can use only one servicing option per command line.

If you are servicing a running computer, you can use the **/Online** option instead of specifying the location of the offline Windows image. The commands and options that are available for servicing an image depend on which Windows operating system you are servicing. They also depend on whether the image is offline or a running operating system. All commands work on an offline Windows image. Subsets of the commands are available for servicing a running operating system.

The base syntax for DISM servicing commands is:

**DISM.exe** {**/Image:**&lt;*path\_to\_image*&gt; | **/Online**} \[**dism\_global\_options**\] {**servicing\_option**} \[&lt;*servicing\_argument*&gt;\]

For more information about servicing commands, see [Deployment Image Servicing and Management (DISM) Command-Line Options](deployment-image-servicing-and-management--dism--command-line-options.md).

## <span id="Basic_Syntax_for_Imaging_Commands"></span><span id="basic_syntax_for_imaging_commands"></span><span id="BASIC_SYNTAX_FOR_IMAGING_COMMANDS"></span>Basic Syntax for Imaging Commands


Many of the global options are also available for imaging commands. The base syntax for DISM imaging commands is:

**DISM.exe** \[**dism\_global\_options**\] {**servicing\_option**} \[&lt;*servicing\_argument*&gt;\]

For more information about using DISM for image management, such as applying or mounting an image, see [DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md).

## <span id="Global_Options_for_Servicing_and_Imaging_Commands"></span><span id="global_options_for_servicing_and_imaging_commands"></span><span id="GLOBAL_OPTIONS_FOR_SERVICING_AND_IMAGING_COMMANDS"></span>Global Options for Servicing and Imaging Commands


The following DISM global options are available for an offline image.

**DISM.exe /image:**&lt;*path\_to\_offline\_image\_directory*&gt; \[**/WinDir:**&lt;*path\_to\_%WINDIR%*&gt;\] \[**/LogPath:**&lt;*path\_to\_log\_file.log*&gt;\] \[**/LogLevel:**&lt;n&gt;\] \[**/SysDriveDir:**&lt;*path\_to\_bootMgr\_file*&gt;\] \[**/Quiet**\] \[**/NoRestart**\] \[**/ScratchDir:**&lt;*path\_to\_scratch\_directory*&gt;\] \[**/English**\] \[**/Format:**&lt;*output\_format*&gt; \]

The following DISM global options are available for a running operating system.

**DISM.exe /online** \[**/LogPath:**&lt;*path\_to\_log\_file*&gt;\] \[**/LogLevel:**&lt;*n*&gt;\] \[**/SysDriveDir:**&lt;*path\_to\_bootMgr\_file*&gt;\] \[**/Quiet**\] \[**/NoRestart**\] \[**/ScratchDir:**&lt;*path\_to\_scratch\_directory*&gt;\] \[**/English**\] \[**/Format:**&lt;*output\_format*&gt; \]

The following table provides a description of how each DISM global option can be used. These options are not case sensitive.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Global option</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p><strong>/Get-Help</strong></p>
<p><strong>/?</strong></p></td>
<td align="left"><p>Displays information about available DISM command-line options and arguments.</p>
<p>Use the <strong>/?</strong> or <strong>/Get-Help</strong> option without specifying an image file to get help on image management commands such as <strong>/Mount-Image</strong>.</p>
<p>Example:</p>
<p><strong>Dism /?</strong></p>
<p>Specify an image file with the <strong>/Image:</strong>&lt;<em>path_to_an_image</em>&gt; option or use the <strong>/Online</strong> option to get help on the servicing command in the image, such as <strong>/Get-Packages</strong>. The options that are available for servicing an image depend on the servicing technology that is available in your image.</p>
<p>Example:</p>
<p><strong>Dism /image:C:\test\offline /?</strong></p>
<p><strong>Dism /online /?</strong></p>
<p>You can display additional Help by specifying a command-line option.</p>
<p>Example:</p>
<p><strong>Dism /image:C:\test\offline /Add-Driver /?</strong></p>
<p><strong>Dism /image:C:\test\offline /Add-Package /?</strong></p>
<p><strong>Dism /online /Get-Drivers /?</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/LogPath:</strong>&lt;<em>path to log file.log</em>&gt;</p></td>
<td align="left"><p>Specifies the full path and file name to log to. If not set, the default is: <strong>%WINDIR%\Logs\Dism\dism.log</strong></p>
<div class="alert">
<strong>Important</strong>  
<p>In Windows PE, the default directory is the RAMDISK scratch space which can be as low as 32 MB.</p>
<p>The log file will automatically be archived. The archived log file will be saved with .bak appended to the file name and a new log file will be generated. Each time the log file is archived the .bak file will be overwritten.</p>
</div>
<div>
 
</div>
<p>When using a network share that is not joined to a domain, use the <strong>net use</strong> command together with domain credentials to set access permissions before you set the log path for the DISM log.</p>
<p>Example:</p>
<p><strong>Dism /image:C:\test\offline /LogPath:AddPackage.log /Add-Package /PackagePath:C:\packages\package.cab</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/LogLevel:</strong>&lt;<em>n</em>&gt;</p></td>
<td align="left"><p>Specifies the maximum output level shown in the logs. The default log level is 3. The accepted values are as follows:</p>
<p>1 = Errors only</p>
<p>2 = Errors and warnings</p>
<p>3 = Errors, warnings, and informational</p>
<p>4 = All of the information listed previously, plus debug output</p>
<p>Example:</p>
<p><strong>Dism /image:C:\test\offline /LogPath:AddPackage.log /LogLevel:1 /Add-Package /PackagePath:C:\packages\package.cab</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/Image:</strong>&lt;<em>path_to_offline_image_directory</em>&gt;</p></td>
<td align="left"><p>This is the full path to the root directory of the offline Windows image that you will service. If the directory named Windows is not a subdirectory of the root directory, <strong>/WinDir</strong> must be specified.</p>
<p>This option cannot be used with <strong>/Online</strong>.</p>
<p>Example:</p>
<p><strong>Dism /image:C:\test\offline /LogPath:AddPackage.log /LogLevel:1 /Add-Package /PackagePath:C:\packages\package.cab</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/WinDir:</strong>&lt;<em>path_to_%WINDIR%</em>&gt;</p></td>
<td align="left"><p>Used with the <strong>/Image</strong> option to specify the path to the Windows directory relative to the image path. This cannot be the full path to the Windows directory; it should be a relative path. If not specified, the default is the Windows directory in the root of the offline image directory.</p>
<p>This option cannot be used with the <strong>/Online</strong> option.</p>
<p>Example:</p>
<p><strong>Dism /image:C:\test\offline /WinDir:WinNT /Add-Package /PackagePath:C:\packages\package.cab</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/Online</strong></p></td>
<td align="left"><p>Specifies that the action is to be taken on the operating system that is currently running.</p>
<p>This option cannot be used with the <strong>/Image</strong> or the <strong>/WinDir</strong> option. When <strong>/Online</strong> is used the Windows directory for the online image is automatically detected.</p>
<p>Example:</p>
<p><strong>Dism /online /Get-Packages</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/SysDriveDir:</strong>&lt;<em>path_to_sysdrive_directory</em>&gt;</p></td>
<td align="left"><p>Use <strong>/SysDriveDir</strong> to service an installed Windows image from a Windows PE environment.</p>
<p>The <strong>/SysDriveDir</strong> option specifies the path to the location of the BootMgr files. This is necessary only when the BootMgr files are located on a partition other than the one that you are running the command from.</p>
<p>For example, at a Windows PE command prompt, type:</p>
<p><strong>Dism /image:C:\Windows /SysDriveDir:C:\</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/Quiet</strong></p></td>
<td align="left"><p>Turns off information and progress output to the console. Only error messages will be displayed.</p>
<p>To run in quiet mode, this option must be set every time that the command-line utility is run.</p>
<div class="alert">
<strong>Note</strong>  
<p>Do not use the <strong>/Quiet</strong> option with <strong>/Get</strong> commands. No information will be displayed.</p>
</div>
<div>
 
</div>
<p>Example:</p>
<p><strong>Dism /image:C:\test\offline /Add-Package /PackagePath:C:\packages\package.cab /quiet</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/NoRestart</strong></p></td>
<td align="left"><p>Suppresses reboot. If a reboot is not required, this command does nothing. This option will keep the application from prompting for a restart (or keep it from restarting automatically if the <strong>/Quiet</strong> option is used).</p>
<p>Example:</p>
<p><strong>Dism /online /Add-Package /PackagePath:C:\packages\package.cab /NoRestart /quiet</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/ScratchDir:</strong>&lt;<em>path_to_scratchdirectory</em>&gt;</p></td>
<td align="left"><p>Specifies a temporary directory that will be used when extracting files for temporary use during servicing. The directory must exist locally. If not specified, the \Windows\<em>%Temp%</em> directory will be used, with a subdirectory name of randomly generated hexadecimal value for each run of DISM. Items in the scratch directory are deleted after each operation.</p>
<p>You should not use a network share location as a scratch directory to expand a package (.cab or .msu file) for installation. The directory used for extracting files for temporary usage during servicing should be a local directory.</p>
<p>Example:</p>
<p><strong>Dism /image:C:\test\offline /ScratchDir:C:\Scratch /Add-Package /PackagePath:C:\packages\package.cab</strong></p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>/English</strong></p></td>
<td align="left"><p>Displays command-line output in English.</p>
<div class="alert">
<strong>Note</strong>  
<p>Some resources cannot be displayed in English.</p>
<p>This option is not supported when you use the <strong>DISM /?</strong> command.</p>
</div>
<div>
 
</div>
<p>Example:</p>
<p><strong>Dism /Get-ImageInfo /ImageFile:C:\test\offline\install.wim /index:1 /English</strong></p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>/Format:{Table | List}</strong></p></td>
<td align="left"><p>Specifies the report output format.</p>
<p>Example:</p>
<p><strong>Dism /Image:C:\test\offline /Get-Apps /Format:table</strong></p></td>
</tr>
</tbody>
</table>

 

## <span id="related_topics"></span>Related topics


[Deployment Image Servicing and Management (DISM) Command-Line Options](deployment-image-servicing-and-management--dism--command-line-options.md)

[DISM Application Servicing Command-Line Options](dism-application-servicing-command-line-options.md)

[DISM Windows Edition-Servicing Command-Line Options](dism-windows-edition-servicing-command-line-options.md)

[DISM Languages and International Servicing Command-Line Options](dism-languages-and-international-servicing-command-line-options.md)

[DISM Operating System Package Servicing Command-Line Options](dism-operating-system-package-servicing-command-line-options.md)

[DISM Driver Servicing Command-Line Options](dism-driver-servicing-command-line-options-s14.md)

[DISM Unattended Servicing Command-Line Options](dism-unattended-servicing-command-line-options.md)

[DISM Windows PE Servicing Command-Line Options](dism-windows-pe-servicing-command-line-options.md)

 

 






