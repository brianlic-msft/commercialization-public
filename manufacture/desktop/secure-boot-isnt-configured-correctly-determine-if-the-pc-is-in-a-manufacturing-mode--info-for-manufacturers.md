---
author: Justinha
Description: 'Secure Boot isn''t configured correctly: Determine if the PC is in a manufacturing mode (info for manufacturers)'
ms.assetid: 68f143f8-c689-474f-a7b7-2f0fe7b0f1ec
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Secure Boot isn''t configured correctly: Determine if the PC is in a manufacturing mode (info for manufacturers)'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Secure Boot isn't configured correctly: Determine if the PC is in a manufacturing mode (info for manufacturers)


While manufacturing PCs, if the "Secure Boot isn't configured correctly" watermark appears on the Windows desktop, you may need to determine whether Secure Boot is disabled or if the PC is in a manufacturing/debugging mode. The PC is in a manufacturing/debugging mode whenever a non-production policy is installed. For details, see the whitepaper: **Windows 8.1 Secure Boot Key Creation and Management Guidance** on the [Microsoft Connect](http://go.microsoft.com/fwlink/p/?linkid=92770) website, or contact your Microsoft account manager.

**Note**  
**Did you see the "Secure Boot isn't configured correctly" watermark after upgrading to Windows 8.1, Windows Server 2012 R2, or Windows RT 8.1?**

We'll be releasing a patch soon that gets rid of the watermark.

Windows 8.1 and Windows Server 2012 R2 users can install a patch to remove the watermark immediately: [Microsoft Knowledge Base Article ID 2902864](http://go.microsoft.com/fwlink/p/?linkid=329932).

For more info, see [Secure Boot isn't configured correctly: troubleshooting](secure-boot-isnt-configured-correctly-troubleshooting.md).

 

## <span id="Determining_if_the_PC_is_in_a_manufacturing_mode"></span><span id="determining_if_the_pc_is_in_a_manufacturing_mode"></span><span id="DETERMINING_IF_THE_PC_IS_IN_A_MANUFACTURING_MODE"></span>Determining if the PC is in a manufacturing mode


You can use any of the following methods to determine whether Secure Boot has been disabled or if the PC is in a manufacturing / debugging mode.

-   **Use MSInfo32.** Click **Start**, type **msinfo32**. If **BIOS mode: UEFI** is **UEFI** and **Secure Boot State** is **OFF**, then Secure Boot is disabled.

-   **Check the event logs**. Go to **Start &gt; View Event Logs &gt; Applications and Services Logs &gt; Microsoft &gt; Windows &gt; VerifyHardwareSecurity &gt; Admin**, and look for either of these logged events:

    "Secure Boot is currently disabled. Please enable Secureboot through the system firmware." (The PC is in UEFI mode and Secure Boot is disabled.)

    "A non-production Secure Boot Policy was detected. Remove Debug/PreRelease policy through the system firmware." (The PC is in a manufacturing/debugging mode.)

-   **Use PowerShell commands.**

    Open a PowerShell window as an administrator, and use following commands:

    `Confirm-SecureBootUEFI`: checks to see if Secure Boot is disabled. Responses:

    -   "True": Secure Boot is enabled, and the watermark won't appear.

    -   "False": Secure Boot is disabled and watermark will appear.

    -   "Cmdlet not supported on this platform": The PC may not support Secure Boot, or the PC may be configured in legacy BIOS mode. The watermark won’t appear.

    -   "Unable to set proper privileges. Access was denied.": Close PowerShell and reopen it as an Administrator.

    "Get-SecureBootPolicy": checks to see if you have a non-production policy installed. Responses:

    -   "{77FA9ABD-0359-4D32-BD60-28F4E78F784B}": The correct Secure Boot policy is in place.

    -   Anything other GUID: The PC is in a manufacturing/debugging mode, and the GUID for the non-production Secure Boot policy is shown.

    -   "Secure Boot policy is not enabled on this machine": Either Secure Boot is disabled, or the PC is configured to boot to legacy BIOS mode. If the PC is in legacy BIOS mode, the watermark should not appear.

    -   "Incorrect authentication data": Close PowerShell and reopen it as an Administrator.

## <span id="How_do_I_fix_it_"></span><span id="how_do_i_fix_it_"></span><span id="HOW_DO_I_FIX_IT_"></span>How do I fix it?


**If Secure Boot is disabled**, re-enable it. For more info, see [Secure Boot isn't configured correctly: troubleshooting](secure-boot-isnt-configured-correctly-troubleshooting.md).

**If Secure Boot is enabled but the PC is in a manufacturing/debug mode**, you'll need to uninstall the non-production policy. For details, see the whitepaper: **Windows 8.1 Secure Boot Key Creation and Management Guidance** on the [Microsoft Connect](http://go.microsoft.com/fwlink/p/?linkid=92770) website, or contact your Microsoft account manager.

## <span id="related_topics"></span>Related topics


[Secure Boot isn't configured correctly: troubleshooting](secure-boot-isnt-configured-correctly-troubleshooting.md)

 

 






