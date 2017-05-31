---
author: Justinha
Description: 'Secure Boot isn''t configured correctly: troubleshooting'
ms.assetid: a2b9b89f-9d42-4537-a3f8-0403cd67df16
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Secure Boot isn''t configured correctly: troubleshooting'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Secure Boot isn't configured correctly: troubleshooting


The "Secure Boot isn't configured correctly" watermark appears on the Windows desktop when the PC is capable of using the Secure Boot security feature, but the feature is not activated or configured correctly.

This message may appear after updating your PC from Windows 8 to Windows 8.1.

## <span id="What_is_Secure_Boot_"></span><span id="what_is_secure_boot_"></span><span id="WHAT_IS_SECURE_BOOT_"></span>What is Secure Boot?


Secure Boot helps to make sure that your PC boots using only firmware that is trusted by the manufacturer. For more info on Secure Boot, see [Secure Boot Overview](secure-boot-overview.md).

## <span id="Is_my_PC_unsafe_"></span><span id="is_my_pc_unsafe_"></span><span id="IS_MY_PC_UNSAFE_"></span>Is my PC unsafe?


Your PC may be OK, but it's not as protected as it could be, because Secure Boot isn't running.

You may need to disable Secure Boot to run some hardware, graphics cards, or operating systems such as Linux or previous versions of Windows. For more info, see [Disabling Secure Boot](disabling-secure-boot.md).

You check the status of Secure Boot on your PC. click on `Start`, and type msinfo32 and press enter. Under System Summary, you can see your BIOS mode and Secure Boot State. If Bios Mode is UEFI, and Secure Boot State is Off, then Secure Boot is disabled.

## <span id="Can_I_just_dismiss_this_alert_or_remove_the_watermark_"></span><span id="can_i_just_dismiss_this_alert_or_remove_the_watermark_"></span><span id="CAN_I_JUST_DISMISS_THIS_ALERT_OR_REMOVE_THE_WATERMARK_"></span>Can I just dismiss this alert or remove the watermark?


Yes. Go to Windows Update for a patch that gets rid of the watermark.

-   Windows 8.1 and Windows Server 2012 R2 users can also download this patch manually: [Update removes the "Windows 8.1 SecureBoot isn't configured correctly" watermark in Windows 8.1 and Windows Server 2012 R2 (Microsoft Knowledge Base Article ID 2902864)](http://go.microsoft.com/fwlink/p/?linkid=329932)

-   Windows RT 8.1: Get this patch through Windows update.

## <span id="i_d_like_to_use_this_feature._how_can_i_enable_it_"></span><span id="I_D_LIKE_TO_USE_THIS_FEATURE._HOW_CAN_I_ENABLE_IT_"></span>I'd like to use this feature. How can I enable it?


Try enabling Secure Boot through using the PC BIOS menus.

**Warning**  
Be careful when changing BIOS settings. The BIOS menu is designed for advanced users, and it's possible to change a setting that could prevent your PC from starting correctly. Be sure to follow the manufacturer's instructions exactly.

 

**Enabling Secure Boot**

1.  Open the PC BIOS menu. You can often access this menu by pressing a key during the bootup sequence, such as F1, F2, F12, or Esc.

    Or, from Windows: go to **Settings charm &gt; Change PC settings &gt; Update and Recovery &gt; Recovery &gt; Advanced Startup: Restart now**. When the PC reboots, go to **Troubleshoot &gt; Advanced Options: UEFI Firmware Settings**.

2.  Find the **Secure Boot** setting, and if possible, set it to **Enabled**. This option is usually in either the **Security** tab, the **Boot** tab, or the **Authentication** tab.

    On some PCs, select **Custom**, and then load the Secure Boot keys that are built into the PC.

    If the PC does not allow you to enable Secure Boot, try resetting the BIOS back to the factory settings.

3.  Save changes and exit. The PC reboots.

4.  If the PC is not able to boot after enabling Secure Boot, go back into the BIOS menus, disable Secure Boot, and try to boot the PC again.

5.  In some cases, you may need to refresh or reset your PC to its original state before you can turn on Secure Boot. For more info, see [How to restore, refresh, or reset your PC](http://go.microsoft.com/fwlink/p/?linkid=279534).

6.  If the above steps don’t work, and you still want to use the Secure Boot feature, contact your manufacturer for help.

    For additional troubleshooting steps for PC manufacturers: see [Secure Boot isn't configured correctly: Determine if the PC is in a manufacturing mode (info for manufacturers)](secure-boot-isnt-configured-correctly-determine-if-the-pc-is-in-a-manufacturing-mode--info-for-manufacturers.md).

## <span id="related_topics"></span>Related topics


[Why is there a "SecureBoot isn't configured correctly" watermark on my desktop?](http://go.microsoft.com/fwlink/?LinkId=624321)

[Secure Boot Overview](secure-boot-overview.md)

[Microsoft Support KB article 2902864](http://support.microsoft.com/kb/2902864)

[Disabling Secure Boot](disabling-secure-boot.md)

 

 






