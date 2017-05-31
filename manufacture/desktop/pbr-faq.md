---
author: Justinha
Description: 'Push-button reset frequently-asked questions (FAQ)'
ms.assetid: 80a313e3-6c2e-4768-9fec-78dd2876f024
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Push-button reset frequently-asked questions (FAQ)'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Push-button reset frequently-asked questions (FAQ)


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Question</th>
<th align="left">Answer</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">Is Window RE required for a user to run the Push-button reset features?</td>
<td align="left">Yes. To run a Push-button reset feature, you must make the Windows RE boot image (Winre.wim) available on the local hard drive, and register its location by using the Reagentc tool. You can use the default Winre.wim (available at C:\Windows\System32\Recovery), or a custom Winre.wim image. If Windows RE is not enabled on the local hard drive, users will have to boot Windows RE from media to access Push-button reset features.</td>
</tr>
<tr class="even">
<td align="left">What is Compact OS?</td>
<td align="left">Compact OS is a collection of features which allow Windows 10 to be deployed on PCs with storage capacity as low as 16GB. The two primary technologies include:
<ul>
<li>Compression of the runtime system files</li>
<li>Single-instancing of installed customizations with the customizations package used by Push-button reset features</li>
</ul></td>
</tr>
<tr class="odd">
<td align="left">When should I use Compact OS?</td>
<td align="left">Both the compression of system files and single-instancing of customizations have similar characteristics as the WIMBoot technology from Windows 8.1. While Compact OS is supported on all hardware configurations, it is only recommended to be used on PCs with flash-based storage.</td>
</tr>
<tr class="even">
<td align="left">How do I know if the OS is compressed?</td>
<td align="left">Compact.exe can be used to query the current compression state.</td>
</tr>
<tr class="odd">
<td align="left">How can I tell if a .ppkg is single-instanced?</td>
<td align="left">Run Fsutil.exe and specify the drive where the .ppkg is stored. For example: <code>fsutil.exe wim enumwims c:</code></td>
</tr>
<tr class="even">
<td align="left">Are there any formatting requirements for the ResetConfig.xml file?</td>
<td align="left">Yes. Always use UTF-8 encoding, and do not use Unicode or ANSI. Add the following declaration in the ResetConfig.xml file, and in other .xml files: <code>&lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;</code>.</td>
</tr>
<tr class="odd">
<td align="left">What types of removable media are supported for manufacturer-created recovery media?</td>
<td align="left">DVDs or USB flash drives can be used as recovery media. Note that Push-button reset features requires all recovery resources to be located on the same piece of media.</td>
</tr>
<tr class="even">
<td align="left">Is recimg.exe supported in Windows 10?</td>
<td align="left">No recimg.exe is deprecated in Windows 10.</td>
</tr>
<tr class="odd">
<td align="left">Is Push-button reset supported on Windows Server ?</td>
<td align="left">No, this functionality is not supported on Windows Server 2016 Technical Preview.</td>
</tr>
<tr class="even">
<td align="left">Can custom recovery solutions (i.e. not Push-button reset) restore the provisioning packages created using either Windows ICD or USMT’s ScanState tool.</td>
<td align="left">Provisioning packages can only be applied by Push-button reset or deployment media created using Windows Imaging and Configuration Designer (ICD). Application of these packages by custom recovery solutions is not supported.</td>
</tr>
<tr class="odd">
<td align="left">If the provisioning package created using USMT’s ScanState tool is larger than 4GB, will the “Create a recovery drive” utility allow customers to create USB recovery media?</td>
<td align="left">Yes, the <strong>Create a recovery drive</strong> utility will split the provisioning package into smaller pieces before copying them to the USB flash drive. During recovery, the pieces will be reassembled into the original provisioning package.</td>
</tr>
<tr class="even">
<td align="left">I’ve preinstalled OS updates on the PC, how can I ensure that they are restored during recovery?</td>
<td align="left">DISM.exe’s /Cleanup-Image command with the /StartComponentCleanup and /ResetBase options marks all installed OS updates as permanent. Permanent updates are always restored during recovery.</td>
</tr>
<tr class="odd">
<td align="left">How can I determine when the /ResetBase option was last run?</td>
<td align="left"><p>Check the <strong>LastResetBase_UTC</strong> registry entry under the registry path:</p>
<p>HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing</p></td>
</tr>
<tr class="even">
<td align="left">I have files that need to be persisted/restored when Reset your PC and Refresh your PC are performed, but I don’t want to capture them using ScanState. Where should I put these files?</td>
<td align="left">All contents under C:\Recovery\OEM are left unmodified during Reset your PC and Refresh your PC. However, it should be noted that these contents will also be backed up onto the USB recovery media when using the Create a recovery drive utility.</td>
</tr>
<tr class="odd">
<td align="left">I can’t find the Refresh your PC option in Settings or Windows RE anymore. Where did the feature go?</td>
<td align="left">Both Refresh your PC and Reset your PC are now part of the same user experience, under the Reset this PC option in Settings and in Windows RE. When you launch the Reset this PC experience, you’ll see additional options:
<ul>
<li><strong>Keep my files</strong> – This initiates the Refresh your PC feature.</li>
<li><strong>Remove everything</strong> – This initiates the Reset your PC feature.</li>
<li><strong>Restore factory settings</strong> – On PCs upgraded from Windows 8/8.1, this initiates factory recovery using the existing recovery image.</li>
</ul></td>
</tr>
<tr class="even">
<td align="left">Should I specify the /drivers option when using ScanState to capture customizations?</td>
<td align="left">The /drivers option is not required if the provisioning package being created is to be used for Push-button reset features. Push-button reset features persist the drivers which are already installed, making it unnecessary to reapply the factory-preinstalled drivers. Note: Driver applets installed outside of the driver INF package are captured using ScanState’s /apps option.</td>
</tr>
<tr class="odd">
<td align="left">How much available disk space is required in order for the Refresh your PC feature to run successfully?</td>
<td align="left">If you have converted the installed customizations into file pointers referencing the customizations package created using ScanState, the required disk space is: 4GB + size_of_ppkg*0.2
<p>Otherwise, the required disk space is: 4GB + size_of_ppkg*2</p></td>
</tr>
<tr class="even">
<td align="left">Am I required to reduce the size of the MSR partition from 128MB to 16MB based on the updated partition layout recommendations?</td>
<td align="left">No. Windows continues to support 128MB MSR partitions. However, on PCs with limited storage capacity, a 16MB MSR partition is recommended to give end users as much available storage as possible.</td>
</tr>
<tr class="odd">
<td align="left">Is there any known issue with using Reset your PC to restore PCs back to factory condition after going through factory floor testing?</td>
<td align="left">Although PBR features are not intended to be used on factory floors, there’s no technical limitation which prevents it. However, keep the following in mind when using Reset your PC on the factory floor:
<ul>
<li>If your factory floor testing includes activating Windows, Reset your PC will not revert the unit back to an non-activated state</li>
<li>Preinstalled RDX contents will be removed</li>
<li>If the unit is not reset for multiple days after factory validation but remains powered on, the preinstalled languages except for the one selected during OOBE will be removed during maintenance</li>
<li>End users will be able to tell that a unit has been reset during factory by looking for the PBR logs under C:\Windows\Logs\PBR</li>
</ul></td>
</tr>
</tbody>
</table>

 

 

 





