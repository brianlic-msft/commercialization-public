---
author: Justinha
Description: Boot Windows to Audit Mode or OOBE
ms.assetid: a928dea9-52b1-42b9-bee1-cbe9c8c0b07b
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Boot Windows to Audit Mode or OOBE
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Boot Windows to Audit Mode or OOBE


You can use audit mode to customize your computer, add applications and device drivers, and test your computer in a Windows environment. Booting to audit mode starts the computer in the built-in administrator account. Windows® removes this account automatically during the [generalize](generalize.md) configuration pass. After you configure a computer to boot to audit mode, the computer will continue to boot to audit mode by default until you configure the computer to boot to Out-Of-Box Experience (OOBE) when the computer ships to the user.

If a password-protected screen saver starts when you are in audit mode, you cannot log back on to the system. The built-in administrator account that is used to log on to audit mode is immediately disabled after logon. To disable the screen saver, either change the power plan through Windows Control Panel or configure and deploy a custom plan. For more information, see [Create a Custom Power Plan](create-a-custom-power-plan-technicalreference.md).


## <span id="bkmk_1"></span><span id="BKMK_1"></span>Boot to audit mode automatically on a new installation


-   To configure Windows to boot to audit mode, add the **Microsoft-Windows-Deployment | Reseal | Mode = audit** answer file setting.

    When Windows completes the installation process, the computer boots into audit mode automatically, and the System Preparation (**Sysprep**) Tool appears. For more information about using the Sysprep tool in audit mode, see [Sysprep (Generalize) a Windows installation](sysprep--generalize--a-windows-installation.md).

    **Note**  
    Settings in an answer file from the **oobeSystem** configuration pass do not appear in audit mode. For more information about which answer file settings are processed when you boot to audit mode or OOBE, see [How Configuration Passes Work](how-configuration-passes-work.md).

     

## <span id="bkmk_2"></span><span id="BKMK_2"></span>Boot to audit mode manually (on a new or existing installation)


-   At the OOBE screen, press **CTRL**+**SHIFT**+**F3**.

    Windows reboots the computer into audit mode, and the System Preparation (**Sysprep**) Tool appears.

    **Note**  
    The **CTRL**+**SHIFT**+**F3** keyboard shortcut does not bypass all parts of the OOBE process, such as running scripts and applying answer file settings in the **oobeSystem** configuration pass.

     

## <span id="bkmk_3"></span><span id="BKMK_3"></span>Boot to OOBE automatically on a new installation


-   To configure Windows to boot to OOBE, add the **Microsoft-Windows-Deployment | Reseal |** **Mode** **= oobe** answer file setting.

    If you have configured your Windows image to boot to OOBE, but then you need to make further configurations to your image in audit mode, see [Modify an existing image that is configured to boot to OOBE](#bkmk_4).

## <span id="bkmk_4"></span><span id="BKMK_4"></span>Modify an existing image that is configured to boot to OOBE


-   If you have configured your Windows image to boot to OOBE, but then need to make further configurations to your image in audit mode, you can do one of the following:

    1.  Use the **CTRL**+**SHIFT**+**F3** keyboard shortcut. The computer will reboot into audit mode.

        This option may trigger any scripts that you have configured to launch in OOBE.

        -or-

    2.  Mount the image, add an answer file with the **audit** setting, and save it as **C:\\test\\offline\\Windows\\Panther\\Unattend\\Unattend.xml**. This may require overwriting an existing answer file at this location.

        On the next boot, Windows will boot directly into audit mode.

## <span id="bkmk_5"></span><span id="BKMK_5"></span>Boot to audit mode automatically from an existing image


1.  Create a new answer file, and then add the **Microsoft-Windows-Deployment | Reseal | Mode = audit** setting. Save the answer file as **Unattend.xml**.

2.  At an elevated command prompt, mount the Windows image. For example:

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\test\images\MyImage.wim /index:<image_index> /MountDir:C:\test\offline
    ```

    where *&lt;image\_index&gt;* is the number of the selected image on the .wim file.

3.  Copy the new answer file to the **C:\\test\\offline\\Windows\\Panther\\Unattend folder**.

4.  Commit the changes, and then unmount the image. For example:

    ``` syntax
    Dism /Unmount-Image /MountDir:C:\test\offline /commit
    ```

    When the image is applied to the destination computer and Windows is booted, the computer boots into audit mode automatically, and the **Sysprep** tool appears. For sample procedures, see Step 1: Transfer an image to a different computer and Step 2: Prepare the computer for a customer in [Deployment examples](#bkmk_6).

Options for applying an image also include using answer file settings, such as specifying the image to install and the disk configurations to make on the destination computer. For more information, see the [Unattended Windows Setup Reference Guide](http://go.microsoft.com/fwlink/?linkid=206281).

## <span id="bkmk_6"></span><span id="BKMK_6"></span>Deployment examples


To transfer an image to a different computer, you must first remove the computer-specific information from the configured computer by generalizing the image with the **Sysprep** tool. To prepare a computer for the customer, you must generalize the computer, and then set it to boot to OOBE when a customer starts the computer for the first time. In the following examples we create and transfer a reference image to a different computer, and then create a model-specific image that ships to a customer.

**Step 1: Transfer an image to a different computer**

1.  Install Windows on a reference computer.

2.  After the installation is complete, boot the computer and install any additional device drivers or applications.

3.  After you update the Windows installation, run **Sysprep**:

    -   At the command line, run the **Sysprep /generalize /shutdown** command.

        -or-

    -   In the System Preparation Tool window, select the **Generalize** check box under the **System Cleanup Action** box on the **Shutdown Options** box, select **Shutdown**, and then click **OK**.

    **Sysprep** removes system-specific data from the Windows installation. System-specific information includes event logs, unique security IDs (SIDs), and other unique information. After **Sysprep** removes the unique system information, the computer shuts down.

4.  After the computer shuts down, insert the Windows PE USB flash drive or other bootable media, and reboot into Windows PE.

5.  In the Windows PE session, capture the reference image by using the **Dism /capture-image** command.

6.  Proceed to the next step to create a model-specific reference image.

**Step 2: Prepare the computer for a customer**

1.  Install the reference image you created in Step 1 that is destined for your customer.

2.  After you update the Windows installation, at the command line run the **Sysprep /audit /generalize /shutdown** command to configure Windows to boot the computer to audit mode. You can then capture the Windows image by booting to another partition or by using Windows PE.

3.  Use the new model-specific reference image to install Windows on a new computer. The Windows image is applied to the computer, and Windows boots to audit mode.

4.  (Optional) You can install additional applications and other updates based on a customer's order. You can also test the computer to verify that all components are working correctly.

5.  After you update the Windows installation, run the **Sysprep /oobe /shutdown command**.

    **Note**  
    If you install Windows images by using the **Sysprep /generalize /oobe** command, the user experience will not be ideal. On the next reboot after you run the **Sysprep /generalize /oobe** command, Windows runs the **specialize** configuration pass, Plug and Play, and other Setup tasks before Windows starts OOBE. This process can take additional time and can delay a customer's first logon.

     

6.  Package and deliver the computer to your customer.

    When the customer starts the computer, OOBE runs.

## <span id="related_topics"></span>Related topics


[Windows Setup Technical Reference](windows-setup-technical-reference.md)

[DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md)

[Audit Mode Overview](audit-mode-overview.md)

[Add a Driver Online in Audit Mode](add-a-driver-online-in-audit-mode.md)

[Enable and Disable the Built-in Administrator Account](enable-and-disable-the-built-in-administrator-account.md)

[Boot from a DVD](boot-from-a-dvd.md)

[Use a Configuration Set with Windows Setup](use-a-configuration-set-with-windows-setup.md)

[Deploy a Custom Image](deploy-a-custom-image.md)

[Add Device Drivers to Windows During Windows Setup](add-device-drivers-to-windows-during-windows-setup.md)

[Add a Custom Script to Windows Setup](add-a-custom-script-to-windows-setup.md)

 

 






