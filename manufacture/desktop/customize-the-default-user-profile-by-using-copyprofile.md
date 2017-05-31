---
author: Justinha
Description: Customize the Default User Profile by Using CopyProfile
ms.assetid: 4aa887d1-1ecb-4fad-9119-ac851c273ab3
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Customize the Default User Profile by Using CopyProfile
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Customize the Default User Profile by Using CopyProfile


You can use the `CopyProfile` setting to customize a user profile and then copy that profile to the default user profile. Windows® uses the default user profile as a template to assign a profile to each new user. By customizing the default user profile, you can configure settings for all user accounts that are created on the computer. By using `CopyProfile`, you can customize installed applications, drivers, desktop backgrounds, internet explorer settings, and other configurations. Note that some settings are not preserved by using `CopyProfile`.

Enterprise and IT Professionals can use `CopyProfile` to preserve the customized tile layout of groups on the **Start** screen.

## <span id="bkmk_preserve"></span><span id="BKMK_PRESERVE"></span>Creating an answer file with the CopyProfile setting


Use the following procedure to create an answer file to instruct **Sysprep** to copy user profile settings when you generalize the Windows image.

**To create a separate answer file for copying user profile settings**

1.  On your technician computer, open Windows System Image Manager (Windows SIM). Click **Start**, type **Windows System Image Manager**, and then select **Windows System Image Manager**. For more information about Windows SIM, see [Windows System Image Manager Technical Reference](https://msdn.microsoft.com/library/windows/hardware/dn922445).

2.  Create a new answer file to use with **Sysprep**:

    1.  Click **File**, and then click **New Answer File**. An empty answer file appears in the **Answer File** pane.

        **Note**  
        If the catalog file doesn't appear in the **Windows Image** pane, follow the instructions in [Open a Windows Image or Catalog File](https://msdn.microsoft.com/library/windows/hardware/dn915104).

         

    2.  In the **Windows Image** pane, expand **Components**, right-click **amd64\_Microsoft-Windows-Shell-Setup**, and then click **Add Setting to Pass 4 specialize**.

    3.  In the **Answer File** pane, select the **Components\\4\_specialize\\amd64-Microsoft-Windows-Shell-Setup\_neutral** folder.

    4.  In the **Microsoft-Windows-Shell-Setup Properties** pane, in the **Settings** section, type the value `CopyProfile = true`.

    5.  Save this new answer file to the root directory of the removable media or network location, and name it **CopyProfile**.

For more information, see [Best Practices for Authoring Answer Files](https://msdn.microsoft.com/library/windows/hardware/dn915073) and [Unattended Windows Setup Reference Guide](http://go.microsoft.com/fwlink/?LinkId=206281).

## <span id="bkmk_configure"></span><span id="BKMK_CONFIGURE"></span>Configuring Default User Profile Settings


Use the following procedure to configure user settings in audit mode and then generalize the Windows installation by using an answer file that contains the `CopyProfile` setting. If you install Windows with another answer file, that answer file should not contain the `CopyProfile` setting or any settings that create additional user accounts.

**To configure default user profile settings and generalize the image**

1.  Install Windows on a reference computer and boot in audit mode. For more information, see [Boot Windows to Audit Mode or OOBE](boot-windows-to-audit-mode-or-oobe.md).

    **Important**  
    Don't use a domain account, because the `CopyProfile` setting runs after the computer is removed from the domain when you run **Sysprep**. As a result, you'll lose any settings that you configured in a domain. If you change the default user profile and then join the computer to a domain, the customizations that you made to the default user profile will appear on new domain accounts.

     

2.  Customize the built-in administrator account by installing applications, desktop shortcuts, and other settings.

    **Important**  
    There is a limit to the number of provisioned Windows Runtime-based apps that you can install. However you can create scripts to install additional non-provisioned apps. For more information, see [Sideload Apps with DISM](sideload-apps-with-dism-s14.md).

     

3.  After your customizations are completed, insert the media that contains the CopyProfile answer file in the reference computer. For example, you can copy the answer file to a USB drive.

4.  On the reference computer, open an elevated command prompt, and then type this command:

    ``` syntax
    C:\Windows\System32\Sysprep\Sysprep /generalize /oobe /shutdown /unattend: F:\CopyProfile.xml
    ```

    where *F* is the letter of the USB flash drive or other removable media. The **Sysprep** tool removes computer-specific information from the image, while preserving the user profile settings that you configured. For more information, see [Sysprep (Generalize) a Windows installation](sysprep--generalize--a-windows-installation.md).

After the image is generalized, the computer shuts down, capture the image by booting to Windows PE and then capture the Windows installation by using DISM. For more information, see [WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md) and [Capture Images of Hard Disk Partitions Using DISM](capture-images-of-hard-disk-partitions-using-dism.md). After the image is captured, you can deploy it to a destination computer by using DISM. For more information, see [Apply Images Using DISM](apply-images-using-dism.md).

## <span id="Test_the_User_Profile_Customizations"></span><span id="test_the_user_profile_customizations"></span><span id="TEST_THE_USER_PROFILE_CUSTOMIZATIONS"></span>Test the User Profile Customizations


After the customized image is deployed to a destination computer, you can test the user profile customizations. You can go through Out-Of-Box Experience (OOBE) to test the end user experience, or you can test the user customizations in audit mode.

**Important**  
Apps based on the Windows Runtime won't start in audit mode because audit mode uses the built-in administrator account. To run Windows Runtime-based apps you must modify a registry key before you can validate your Windows installation in audit mode.

 

**To test the user profile customizations after OOBE**

1.  Install Windows to a test computer.

2.  After Windows is installed, go through OOBE and specify the computer name, user account name, and other items. After OOBE is complete, the Windows start screen appears.

3.  Log onto the computer with the user account specified during OOBE and verify that your apps and customizations appear.

**To test the user profile customizations in audit mode**

1.  Boot to audit mode by using an answer file or by pressing Ctrl+Shift+F3 when OOBE starts. For more information, see [Boot Windows to Audit Mode or OOBE](boot-windows-to-audit-mode-or-oobe.md).

2.  Verify that your customizations work as intended. To test Windows Runtime-based apps, modify the following registry key:

    1.  From an elevated command prompt, run Regedit.exe.

    2.  Browse to the **HKEY\_LOCAL\_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System\\FilterAdministratorToken** registry key.

    3.  Click **FilterAdministrationToken**, and then type **1** as the value data.

    4.  Log off from the computer.

    5.  Log back on to the computer, and start the Windows Runtime-based apps to verify that your customizations work as intended.

    6.  After you complete validation of your Windows Runtime-based apps, reset the **FilterAdministrationToken** registry key to **0**.

## <span id="bkmk_troubleshoot"></span><span id="BKMK_TROUBLESHOOT"></span>Troubleshooting CopyProfile


If the user profile settings aren't successfully copied:

1.  Make sure that you set the `CopyProfile` setting only once during the deployment process.

2.  When you customize user settings, only use only the built-in administrator account on the computer to avoid accidentally copying settings from the wrong profile.

3.  Confirm that you didn't use a domain account.

4.  Verify that there are no additional user accounts other than the built-in administrator account that you configured:

    1.  Click **Start**, and then type **Control Panel**.

    2.  Click **Control Panel**, and then click **Add or remove user accounts**.

    3.  Select any additional user account other than the built-in administrator account that you configured, and then delete it.

    **Note**  
    Delete all other user accounts on the computer before you customize the built-in administrator account.

     

5.  Make sure that non-provisioned Windows Runtime-based apps that are stored in the tile layout are installed within two hours of user logon to preserve the tile layout on the **Start** screen, when apps are registered after the new user first logs on.

6.  Some settings can be configured only by using the `CopyProfile` unattend setting, and other settings can be configured by using Group Policy.

    -   Use Group Policy to configure settings that are reset by the new user logon process. You can also create scripts to define these user settings.

        -or-

    -   Use the `CopyProfile` unattend setting instead. For more information, see [Unattended Windows Setup Reference](http://go.microsoft.com/fwlink/?LinkId=206281).

## <span id="related_topics"></span>Related topics


[Sysprep (System Preparation) Overview](sysprep--system-preparation--overview.md)

[Sysprep Process Overview](sysprep-process-overview.md)

[Sysprep Command-Line Options](sysprep-command-line-options.md)

 

 






