---
author: Justinha
Description: 'Sysprep (Generalize) a Windows installation'
ms.assetid: 455fa70e-6c13-45ae-ad4f-5d12e3b844e5
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Sysprep (Generalize) a Windows installation'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Sysprep (Generalize) a Windows installation


Use **Sysprep** to generalize a Windows installation. To deploy a Windows image to different PCs, you must first prepare the image. You can either use the System Preparation (Sysprep) tool or you can specify a setting in an answer file to prepare the image as part of an unattended installation. To prepare the image, you must remove the computer-specific information from the image. This process is called *generalizing* the image.

In most deployment scenarios, you no longer have to use the `SkipRearm` answer file setting to reset the Windows Product Activation clock when you run the **Sysprep** command multiple times on a computer. The `SkipRearm` setting is used to specify the Windows licensing state. If you specify a retail product key or volume license product key, Windows is automatically activated. You can run the **Sysprep** command up to 8 additional times on a single Windows image. After running Sysprep 8 times, you must recreate your Windows image. For more information about Windows components and settings that you can add to an answer file, see the [Unattended Windows Setup Reference](http://go.microsoft.com/fwlink/?LinkId=206281).

**Caution**  
Don't use the Windows Store to update your Windows Store apps before running **sysprep /generalize**. **Sysprep** fails to generalize the image in this scenario. This issue also applies to the Windows Store apps (for example, Mail, Maps, Bing Finance, Bing News, and others). This can occur when you are customizing your installation in audit mode as the built in administrator, or when using a specific user account. The following error appears in the sysprep log files (%WINDIR%\\System32\\Sysprep\\Panther):

`<package name> was installed for a user, but not provisioned for all users. This package will not function properly in the sysprep image.`

**Sysprep /generalize** requires that all apps are provisioned for all users. However, when you update an app from the Windows Store, that app becomes non-provisioned and is tied that user account.

Instead of using the Windows Store to update your apps, you should sideload updates to your line-of-business apps, or have end-users update their apps by using the Windows Store on their destination PCs. In managed environments, if Windows Store access is disabled by an IT administrator, you will not be able to update the Windows Store apps.

For more information about sideloading line-of-business Windows Store apps, see [Sideload Apps with DISM](sideload-apps-with-dism-s14.md) and [Customize the Start Screen](customize-the-start-screen.md).

 

If your server has Remote Authentication Dial-In User Service (RADIUS) clients or remote RADIUS server groups defined in the Network Policy Server (NPS) configuration, you should remove this information before you deploy it to a different computer. For more information, see [Prepare a Network Policy Server (NPS) for Imaging](prepare-a-network-policy-server--nps--for-imaging.md).

## <span id="bkmk_1"></span><span id="BKMK_1"></span>Generalizing an Image


When you generalize a Windows image, Windows Setup processes settings in the [generalize](generalize.md) configuration pass. You must run the **Sysprep** command together with the **/generalize** option, even if the technician computer and the reference computer have the same hardware configuration. The **Sysprep /generalize** command removes unique information from a Windows installation so that you can safely reuse that image on a different computer. But, you can persist drivers during the generalize configuration pass.

**Important**  
When you set up your reference computer, Windows Setup installs drivers for any detected devices. By default, Windows Setup removes these drivers when you generalize the system. If you're deploying the image to computers that have the same hardware and devices, you'll want Windows Setup to reinstall these same drivers. To keep these drivers on the computer during system generalization, set the Microsoft-Windows-PnPSysprep | `PersistAllDeviceInstalls` setting to **true**. For more information about **Sysprep**-related Windows components that you can add to an answer file, see the [Unattended Windows Setup Reference](http://go.microsoft.com/fwlink/?LinkId=206281).

 

Windows replaces only the computer security identifier (SID) on the operating system volume when you run **Sysprep**. When **Sysprep** generalizes an image, it generalizes only the general partition. So if a single computer has multiple operating systems, you must run **Sysprep** on each image individually.

**To generalize your image**

1.  Add one of these settings to your answer file:

    -   Use the Microsoft-Windows-Deployment | `Generalize` setting. Set `Mode` to **OOBE** or **Audit**, and set `ForceShutdownNow` to **true**. The computer automatically generalizes the image and shuts down.

        -or-

    -   Add the Microsoft-Windows-Deployment | `Reseal` setting to the [oobeSystem](oobesystem.md) configuration pass. Set `Mode` to **Audit**. After the computer boots in audit mode and displays the **System Preparation Tool** window, use one of these methods:

        -   In the **System Preparation Tool** window, click **Generalize**, click **Shutdown**, and then click **OK**. The computer generalizes the image and shuts down.

            -or-

        -   Close the **System Preparation Tool** window, open a Command Prompt window as an administrator, and then move to the **%WINDIR%\\system32\\sysprep** directory. Use the **Sysprep** command together with the **/generalize**, **/shutdown**, and **/oobe** options. For example:

            ``` syntax
            Sysprep /generalize /shutdown /oobe
            ```

            The computer generalizes the image and shuts down.

2.  After the computer shuts down, use an image-capturing tool to capture your image. You can use the **Dism /capture-image** command in the Deployment Image Servicing and Management (**DISM**) tool for this purpose.

3.  Deploy this image to a reference computer. When the reference computer boots, it displays the Out-Of-Box Experience (OOBE) screen.

For more information, see [Settings for Automating OOBE](settings-for-automating-oobe.md) and[Configure Oobe.xml](configure-oobexml.md).

If you have additional customizations, you can enter audit mode manually and make those customizations before you generalize and deploy your image.

**Optional: To enter audit mode manually before you generalize your image**

1.  At the OOBE screen, press Ctrl+Shift+F3. Windows reboots the computer in audit mode, and the **System Preparation Tool** window appears.

    **Caution**  
    The Ctrl+Shift+F3 keyboard shortcut doesn't bypass all parts of the OOBE process, such as running scripts and applying answer-file settings in the [oobeSystem](oobesystem.md) configuration pass.

     

2.  Add the customizations that you want to include.

3.  In the **System Preparation Tool** window, click **Generalize**, click **Shutdown**, and then click **OK**. The computer generalizes the image and shuts down.

     -or-

    Close the **System Preparation Tool** window, open a Command Prompt window as an administrator, and then move to the **%WINDIR%\\system32\\sysprep** directory. Use the **Sysprep** command together with the **/generalize**, **/shutdown**, and **/oobe** options. For example:

    ``` syntax
    Sysprep /generalize /shutdown /oobe
    ```

    The computer generalizes the image and shuts down.

4.  After the computer shuts down, use an image-capturing tool to capture your image. You can use the **Dism /capture-image** command in the **DISM** tool for this purpose.

5.  Deploy this image to a reference computer. When the reference computer boots, it displays the OOBE screen.

For more information about audit mode, see:

-   [Audit Mode Overview](audit-mode-overview.md)

-   [Boot Windows to Audit Mode or OOBE](boot-windows-to-audit-mode-or-oobe.md)

-   [Add a Driver Online in Audit Mode](add-a-driver-online-in-audit-mode.md)

-   [Enable and Disable the Built-in Administrator Account](enable-and-disable-the-built-in-administrator-account.md)

## <span id="bkmk_2"></span><span id="BKMK_2"></span>Generalizing a Virtual Hard Disk


You can use **Sysprep** VM mode to generalize a VHD that you want to deploy as a VHD on the same virtual machine or hypervisor. VM mode supports rapid deployment of virtual machines. VM mode is supported only when you run it from inside a virtual machine. Additionally, VM mode is available only through the command line. You can't use VM mode to prepare a VHD for deployment to any computer.

**To generalize a VHD**

1.  In audit mode, open a Command Prompt window as an administrator, and then move to the **%WINDIR%\\system32\\sysprep** directory.

2.  Use the **Sysprep** command together with the **/generalize**, **/oobe**, and **/mode:vm** options. For example:

    ``` syntax
    Sysprep /generalize /oobe /mode:vm
    ```

    The computer generalizes the VHD image.

3.  Deploy the generalized VHD image on the same virtual machine. When the virtual machine reboots, it displays the OOBE screen.

The only additional options that apply to VM mode are **/reboot**, **/shutdown**, and **/quit**.

## <span id="related_topics"></span>Related topics


[Sysprep Process Overview](sysprep-process-overview.md)

[Sysprep Command-Line Options](sysprep-command-line-options.md)

[Sysprep Support for Server Roles](sysprep-support-for-server-roles.md)

[Work with Product Keys and Activation](work-with-product-keys-and-activation-auth-phases.md)

 

 






