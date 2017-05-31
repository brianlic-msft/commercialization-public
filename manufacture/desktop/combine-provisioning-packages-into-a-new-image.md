---
author: Justinha
Description: 'How to add Windows desktop applications and other data by using audit mode.'
ms.assetid: 61e94d42-5d12-4c54-9efc-1e38ea94f750
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Create a provisioning package with Windows desktop applications'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Create a provisioning package with Windows desktop applications


Here's how to add Windows desktop applications and other data by using audit mode. You'll recapture these Windows desktop applications and data into a provisioning package by using the ScanState tool. As new builds of Windows are released, and as you prepare for different markets, you can mix and match the Windows images and provisioning packages, rather than rebuilding and customizing the images each time.

Once you’ve captured the provisioning package, you can add it to your image by using Windows ICD.

The recovery tools also use this provisioning package. When your users refresh the device (often used in case of device failure) or reset the device (often used to clean a device for a new user), the device keeps their installed Windows updates, plus the updates in this provisioning package.

## <span id="Step_1__Prepare_a_copy_of_ScanState"></span><span id="step_1__prepare_a_copy_of_scanstate"></span><span id="STEP_1__PREPARE_A_COPY_OF_SCANSTATE"></span>Step 1: Prepare a copy of ScanState


1.  On your technician PC, plug in another USB key or drive.
2.  In File Explorer, create a new folder on the USB key, for example: **D:\\ScanState x64**.
3.  Copy the files from **"C:\\Program Files (x86)\\Windows Kits\\10\\Assessment and Deployment Kit\\User State Migration Tool\\amd64"** into **D:\\ScanState x64**. You don't need to copy the subfolders.
4.  Copy the files from **"C:\\Program Files (x86)\\Windows Kits\\10\\Assessment and Deployment Kit\\Windows Setup\\amd64\\Sources"** into **D:\\ScanState x64**. There will be duplicate files, it's OK to skip copying these files. You don't need to copy the subfolders.

## <span id="installDesktopApp"></span><span id="installdesktopapp"></span><span id="INSTALLDESKTOPAPP"></span>Step 2: Install a Windows desktop application in audit mode


Use this method to install Windows desktop applications and any drivers that require installation (as opposed to .inf-style drivers.)

1.  On the reference device, install the image that was created in Lab 1a. If the image is already installed, start the reference device. Either the **Languages** or the **Hi there** screen appears.
2.  Press **Ctrl+Shift+F3** to enter Audit mode. The device reboots to the desktop, and the System Preparation Tool (Sysprep) appears. You can close Sysprep.
3.  Ensure that your customizations from [Lab 1a](install-windows-automatically-from-a-usb-drive-sxs.md) are available. To do this, in **Settings** under **System &gt; About**, you should see the technical support info that you entered earlier appear (company name, support phone number, and support website).

4.  Install a Windows desktop application application. For example, to install Office 2013, put in a USB key with the Office installation program, open File Explorer and navigate to `oemsetup.en-us.com`. To learn more, download the Office OPK Update image from the Office OPK Connect site.

## <span id="saveWithUSMT"></span><span id="savewithusmt"></span><span id="SAVEWITHUSMT"></span>Step 3: Save your updates to a provisioning package


**Capture your updates into a provisioning package**

First, plug the USB key with ScanState into the reference device.

-   **If you'd like to keep a copy of this provisioning package and deploy it to other devices**, save the file to a USB drive.

    Capture the changes into the provisioning package, and save it on the USB key.

    ``` syntax
    D:\ScanState_x64\scanstate.exe /apps /ppkg D:\Provisioning\ClassicApps.ppkg /o /c /v:13 /l:D:\ScanState.log
    ```

    where *D* is the letter of the drive with ScanState.

   
-   **For build-to-order devices**, you can wrap up these changes and prepare the device for immediate delivery. Capture the changes to provisioning package, and save it as C:\\Recovery\\Customizations\\usmt.ppkg:

    ``` syntax
    D:\ScanState_x64\scanstate.exe /apps /ppkg C:\Recovery\Customizations\usmt.ppkg /o /c /v:13 /l:D:\ScanState.log
    ```

## <span id="Step_4__Prepare_the_device_for_an_end_user"></span><span id="step_4__prepare_the_device_for_an_end_user"></span><span id="STEP_4__PREPARE_THE_DEVICE_FOR_AN_END_USER"></span>Step 4: Prepare the device for an end user


-   **For build-to-order devices**, prepare the device for the end user: Right-click **Start**, select **Command Prompt (Admin)**, and run the following command:

    ``` syntax
     
    C:\Windows\System32\Sysprep\sysprep /oobe /shutdown
    ```

    The Sysprep tool reseals the device. This process can take several minutes. After the process completes, the device shuts down automatically. You can now send the device to the customer.

 

 





