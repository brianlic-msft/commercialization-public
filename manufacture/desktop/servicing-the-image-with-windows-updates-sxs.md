---
author: KPacquer
Description: 'Add updates, and upgrade the edition.'
ms.assetid: 9a8f525c-bb8f-492c-a555-0b512e44bcd1
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Lab 5: Add updates and upgrade the edition'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Lab 5: Add updates and upgrade the edition

For many customizations, like adding .inf-style drivers, Windows updates or upgrading the edition, you can mount and edit the Windows image. Mounting an image maps the contents of a file to a temporary location where you can edit the files or use DISM to perform common deployment tasks.

**Notes** 

-  **Add languages before major updates.** Major updates include hotfixes, general distribution releases, or service packs. If you add a language later, you'll need to re-add the updates.

-  **Add major updates before apps**. Thes apps include universal Windows apps and desktop applications. If you add an update later, you'll need to re-add the apps.

-  **For major updates, update the recovery image too**: These may include hotfixes, general distribution releases, service packs, or other pre-release updates. We'll show you how to update these later in [Lab 12: Update the recovery image](update-the-recovery-image.md).

-  **If a Servicing Stack Update (SSU) is available, you must install it** before applying the most recent General Distribution Release (GDR, currently KB4016871) or any future GDRs.

![image: copying image files and deployment scripts](images/dep-win8-sxs-createmodelspecificfiles.jpg)

Note: To add drivers that include an installation package, see [Lab 10: Add desktop applications and settings with siloed provisioning packages (SPPs)](add-desktop-apps-with-spps-sxs.md)

## <span id="Mount_the_image"></span>Mount the image

**Step 1: Mount the image**

Use the steps from [Lab 3: Add device drivers (.inf-style)](add-device-drivers.md) to mount the image. The short version:

1.  Open the command line as an administrator (**Start** > type **deployment** > right-click **Deployment and Imaging Tools Environment** > **Run as administrator**.)

2.  Make a backup of the file (`copy "C:\Images\Win10_x64\sources\install.wim" C:\Images\install-backup.wim`)

3.  Mount the image (`md C:\mount\windows`, then `Dism /Mount-Image /ImageFile:"C:\Images\install.wim" /Index:1 /MountDir:"C:\mount\windows" /Optimize`)

## <span id="Add_customizations_to_the_image"></span>Add customizations to the image
	
**Step 2: Upgrade the edition from Home to Pro**

Use this procedure to upgrade the edition. You cannot set a Windows image to a lower edition. You should not use this procedure on an image that has already been changed to a higher edition.

1.  Determine what images you can upgrade the image to: Note the edition IDs available.

    ``` syntax
    Dism /Get-TargetEditions /Image:C:\mount\windows
    ```

2.  Upgrade the edition.

    ``` syntax
    Dism /Set-Edition:Professional /Image:C:\mount\windows
    ```
	
**Step 3: Add a Windows update package**

1.  Get a Windows update package. For example, grab the latest cumulative update listed in [Windows 10 update history](https://support.microsoft.com/en-us/help/12387/windows-10-update-history) from the [Microsoft Update catalog](http://www.catalog.update.microsoft.com). Extract the .msu file update to a folder, for example, C:\\WindowsUpdates\\windows10.0-kb4016871-x64_27dfce9dbd92670711822de2f5f5ce0151551b7d.msu.

    To learn more, see [https://myoem.microsoft.com/oem/myoem/en/product/winemb/pages/comm-ms-updt-ctlg-trnstn.aspx](https://myoem.microsoft.com/oem/myoem/en/product/winemb/pages/comm-ms-updt-ctlg-trnstn.aspx).    

2.  Add the updates to the image. For packages with dependencies, make sure you install the packages in order. If you’re not sure of the dependencies, it’s OK to put them all in the same folder, and then add them all using the same DISM /Add-Package command by adding multiple /PackagePath items.

    Example: adding a cumulative update:

    ``` syntax
    Dism /Add-Package /Image:"C:\mount\windows" /PackagePath="windows10.0-kb4016871-x64_27dfce9dbd92670711822de2f5f5ce0151551b7d.msu"  /LogPath=C:\mount\dism.log
    ```

    Example: adding multiple updates:

    ``` syntax
    Dism /Add-Package /Image:"C:\mount\windows" /PackagePath="C:\WindowsUpdates\windows10.0-kb00001-x64.msu" /PackagePath="C:\WindowsUpdates\windows10.0-kb00002-x64.msu" /PackagePath="C:\WindowsUpdates\windows10.0-kb00003-x64.msu" /LogPath=C:\mount\dism.log
    ```

3.  Lock in the updates, so that they are restored during a recovery. 

    ``` syntax
    DISM /Cleanup-Image /Image=C:\ /StartComponentCleanup /ResetBase /ScratchDir:C:\Temp
    ```

## <span id="Unmount_the_image"></span>Unmount the image
	
**Step 4: Unmount the images**

1.  Close all applications that might access files from the image.

2.  Commit the changes and unmount the Windows image:

    ``` syntax
    Dism /Unmount-Image /MountDir:"C:\mount\windows" /Commit
    ```

## <span id="Try_it_out"></span>Try it out

**Step 5: Apply the image to a new PC**

Use the steps from [Lab 2: Deploy Windows using a script](deploy-windows-with-a-script-sxs.md) to copy the image to the storage USB drive, apply the image, and boot it up. The short version:

1.  Copy the image file to the storage drive.
2.  [Boot the reference device to Windows PE using the Windows PE USB key](install-windows-pe-sxs.md).
3.  Find the drive letter of the storage drive (`diskpart, list volume, exit`).
4.  Apply the image: `D:\ApplyImage.bat D:\Images\install.wim`.
5.  Disconnect the drives, then reboot (`exit`).

**Step 6: Verify updates**
1.  After the PC boots, either create a new user account, or else press Ctrl+Shift+F3 to reboot into the built-in administrator account (This is also known as audit mode).

2.  Right-click the **Start** button, and select **Command Prompt (Admin)**.

3.  Verify that the edition is correct:

    ``` syntax
    dism /online /get-currentedition
    ```

    Make sure it's the right edition. For example:

    ``` syntax
    Current edition is:

    Current Edition : Professional

    The operation completed successfully.
    ```

4.  Verify that the packages appear correctly:

    ``` syntax
    Dism /Get-Packages /Online
    ```

    Review the resulting list of packages and verify that the list contains the package. For example:

    ``` syntax
    Package Identity : Package_for_RollupFix~31bf3856ad364e35~amd64~~15063.250.1.1
    State : Installed
    Release Type : Security Update
    Install Time : 04/29/2017 6:26 PM

    The operation completed successfully.
    ```

5.   Each package will usually be a new KB, and will increase the build revision number of Windows on the device. The revision number of windows a device can be found in the following registry key: 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\UBR'.

Next step: [Lab 6: Add universal Windows apps](add-universal-apps-sxs.md)