---
author: kpacquer
Description: 'Lab 9: Make changes from Windows (audit mode)'
ms.assetid: 142bc507-64db-43dd-8432-4a19af3c568c
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Lab 9: Make changes from Windows (audit mode)'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Lab 9: Make changes from Windows (audit mode)

You can use audit mode to customize Windows using the familiar Windows environment. In audit mode, you can add Windows desktop applications, change system settings, add data, and run scripts.  

To make sure your audit mode changes are included in the recovery image, you'll need to capture these changes into a provisioning package using ScanState. This image gets used by the system recovery tools to restore your changes if things go wrong. You can optionally save drive space by running the applications directly from the compressed recovery files; this is known as single-instancing.

If you want to capture the changes in an image and apply it to other devices, you'll need to use the Sysprep tool to generalize the image.


## <span id="Prepare_a_copy_of_the_Deployment_and_Imaging_Tools"></span><span id="prepare_a_copy_of_the_deployment_and_imaging Tools"></span><span id="PREPARE_A_COPY_OF_THE_DEPLOYMENT_AND_IMAGING_TOOLS"></span>Step 1: Prepare a copy of the Deployment and Imaging Tools

You'll the Windows 10, version 1607 or later version of the Deployment and Imaging Tools from the ADK. This includes the ScanState tool and the latest version of DISM.

**Important**   Don't overwrite the existing DISM files on the WinPE image.

1.  From the technician PC, copy the Deployment and Imaging Tools from the Windows ADK to external storage (for example, a storage USB key with drive letter D:).

    ``` syntax
    CopyDandI.cmd amd64 D:\ADKTools\amd64
	```
	
## <span id="Get_into_audit_mode"></span>Step 2: Get into audit mode

1.  Boot up the reference device, if it's not already booted.

2.  If the device boots to the **Languages** or the **Get going fast** screen, press **Ctrl+Shift+F3** to enter Audit mode.

3.  In audit mode, the device reboots to the Desktop, and the System Preparation Tool (Sysprep) appears. Ignore Sysprep for now.

## <span id="Customize_the_PC"></span>Step 3: Customize the PC in audit mode.

-   Install a Windows desktop application. Change system settings. Add data. Run scripts.

## <span id="Office_2016"></span>Example: Add Microsoft Office 2016

1.	On your technician PC, prepare a USB key with the Office Deployment Tool:

    a.  Mount the ISO for the deployment tool from "X21-20432 Office v16.2 Deployment Tool for OEM OPK\Software - DVD\X21-20474 SW DVD5 Office 2016 v16.2.1 Deployment Tool for OEM\X21-20474.img" 
    
    b.  Copy files from the mounted drive to the USB-B key, for example, (where E:\ is driver letter for USB-B) E:\OfficeV16.2.1

2.	On your reference PC, open the Office Deployment Tool, for example: E:\Officev16.2.1\officedeploymenttool.exe

3.  Provide folder path to extract files E:\Officev16.2.1.  Setup.exe and configuration.xml are extracted to E:\Officev16.2.1
    
    Obtain: Office v16.2.1 in desired language, this sample uses English X21-20393 Office 2016 v16.2.1 English OPK

4.  Mount "X21-20393 Office v16.2.1  English OPK\Software - DVD\X21-20435 SW DVD5 Office Pro 2016 32 64-bit English C2ROPK Pro HS HB OEM v16.2.1\X21-20435.img"

5.  Copy the Office folder to USB-B (where E:\ is drive letter for USB-B) E:\OfficeV16.2.1
 
    [Optional] if you applied a language pack to your Windows image, you may want to add the language pack for Office 2016 as well for better end user experience. The below samples will show with the Language pack applied

6.	Mount “x21-20487 Office v16.2.1 German OPK”

7.	Copy the office folder to E:\OfficeV16.2.1

8.	Skip replacing duplicate files in the copy so that only the German languages are copied.

### <span id="Update_the_installer"></span>Microsoft Office 2016: Install the Home and Student edition

The current OEM recommendation is to install Office Home and Student 2016, rather than Office Home Premium. To do this, you'll need to edit the configuration.xml file used to install Office v16.2.1. To learn more, see  [Office 16.2.1 communication](https://myoem.microsoft.com/oem/myoem/en/product/office/Pages/COMM-Offv16-2-OPK.aspx).

1.  Use Notepad to create a configuration file with the edition info: E:\Officev16.2\ConfigureO365Home.xml

    Make sure the ProductID is HomeStudentRetail, as follows: 

    ```syntax
    <?xml version="1.0"?> 
    <Configuration> 
      <Add OfficeClientEdition="32" SourcePath="\\Server\Share\">
        <Product ID="HomeStudentRetail">
          <Language ID="en-us"/>
        </Product>
      </Add>
      <Display Level="None"/>
    </Configuration> 
    ```

2.  On the reference computer, install Office 2016 using the configuration file:

    ```syntax
    D:\Officev16.2\Setup.exe /configure D:\Officev16.2\ConfigureO365Home.xml
    ```

### <span id="Pin_tiles"></span>Microsoft Office 2016: Pin tiles to the Start Menu layout

You must pin the Office tiles to the Start menu. Not doing so Windows will remove the Office files during OOBE boot phase. To learn more, see [Lab 11: Add Start tiles and taskbar pins](add-start-tiles-sxs.md#AppendOfficeSuite).

### <span id="Configure_setup"></span>Microsoft Office 2016: Configure setup experience for the user

After you install Office on the device, you also need to configure the setup experience for the user. This is the experience the user sees when they open an Office app for the first time on the device. This also is intended to ensure that Office is properly licensed and activated.

| Setup mode | Description |
| -----------|----------------- |
| OEM |	In this mode, a customer can choose to try, buy, or activate Office with an existing account, PIN, or product key. This mode doesn’t support Activation for Office (AFO) or AFO late binding. Therefore, if you choose this mode, you need to provide the customer with an Activation Card (formerly called a product key card or a Microsoft Product Identifier (MPI) card). |
| OEMTA |	This mode supports the try, buy, or activate experience of the OEM mode as well as supporting AFO and AFO late binding. This mode supports Office activation through the device’s Windows product key, which means the customer wouldn’t need to enter a 5x5 product key code. |

OEM Mode – Provide user with activation card

1.	In command prompt go to drive letter for USB-B\Officev16.2

2.	Type and run oemsetup.cmd Mode=OEM Referral=####

OEMTA Mode – Activation is done through the device’s Windows product key

Type and run oemsetup.cmd Mode=OEMTA Referral=####

NOTE: “Referral”   switch is optional,  If OEM partner is  participating in  office Incentive program For OEM referral ID information please refer to [Office Incentive Program Operations Guide 2017](https://myoem.microsoft.com/oem/myoem/en/programs/mktg/ofcprog/Pages/rc-office-program.aspx).




## <span id="Capture_your_changes"></span>Step 4: Capture your changes for the recovery tools

1.  Connect to your external storage (for example, a storage USB key with the drive letter D:)

2.  Capture the changes into a provisioning package. This creates a compressed copy of the desktop applications and drivers that you added in audit mode that can be used by the recovery tools.

    ``` syntax
    D:\ADKTools\amd64\scanstate.exe /apps /ppkg C:\Recovery\Customizations\usmt.ppkg /o /c /v:13 /l:C:\Recovery\ScanState.log
    ```

    **Note**  Optional: Delete the ScanState logfile: `del C:\Recovery\Scanstate.log`.

## <span id="Prepare_for_image_capture"></span>Step 5: Prepare for image capture

This step is required when you're capturing images to apply to other PCs.
	
1.  Prepare the device for the end user: Right-click **Start**, select **Command Prompt (Admin)**, and from the command prompt, run the following command:

    ``` syntax
    C:\Windows\System32\Sysprep\sysprep /oobe /generalize /shutdown
    ```

    The Sysprep tool reseals the device. This process can take several minutes. After the process completes, the device shuts down automatically.

    **Warning**: If you're using [siloed provisioning packages (SPPs)](add-desktop-apps-with-spps-sxs.md), do not set the image to boot to audit mode again (sysprep /audit). There's a known bug in Windows 10, version 1607 that makes the image unbootable if you do this. Instead, set it to boot to OOBE, and if you need to boot to audit again, [add an answer file with the Mode:Audit setting](update-windows-settings-and-scripts-create-your-own-answer-file-sxs.md). This will be fixed in future versions.

2.  Boot the device into Windows PE. To do this, you may need to press the key that opens the boot-device selection menu for the device (for example, the **Esc** key or **Volume Up** key).

    Select the option in the firmware menus to boot to the USB flash drive.

    **Warning**   If Windows begins booting instead of Windows PE, you must generalize the device again before capturing the image: After Windows boots, press **Ctrl+Shift+F3** to enter audit mode. The device will reboot. Generalize the device again: `C:\Windows\System32\Sysprep\sysprep /oobe /generalize /shutdown`.

3.  Optional: speed up the optimization and image capture processes by setting the power scheme to High performance:

    ``` syntax
    powercfg /s 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c
    ```

4.  Find the drive letters by using DiskPart:

    ``` syntax
    diskpart
    DISKPART> list volume
    DISKPART> exit
    ```

    For example, the drives can be lettered like this: *C* = Windows; *D* is the lab USB key, and *E* is an external hard drive.

    Note that some partitions might not receive a drive letter.

## <span id="Optimize_the_image"></span>Step 6: Optimize the image to take up less drive space (optional)

1.  Save space by single-instancing the image. This removes the original copy of the desktop applications, and adds pointer files so that these applications can run from the recovery provisioning package you created earlier.

    ``` syntax
    DISM /Apply-CustomDataImage /CustomDataImage:C:\Recovery\Customizations\USMT.ppkg /ImagePath:C:\ /SingleInstance
    ```

    where *C* is the drive letter of the Windows partition.

    **Warning**  Do not put quotes with the /ImagePath:C:\\ option.

2.  Cleanup the Windows files:

    ``` syntax
    md temp

    DISM /Cleanup-Image /Image=C:\ /StartComponentCleanup /ResetBase /ScratchDir:C:\Temp
    ```

    where *C* is the drive letter of the Windows partition. Beginning with Windows 10, version 1607, you can specify the /Defer parameter with /Resetbase to defer any long-running cleanup operations to the next automatic maintenance. But we highly recommend you **only** use /Defer as an option in the factory where DISM /Resetbase requires more than 30 minutes to complete.

### <span id="Capture_the_image"></span><span id="capture_the_image"></span><span id="CAPTURE_THE_IMAGE"></span>Step 7: Capture the image

-   Capture the image of the Windows partition.

    ``` syntax
    dism /Capture-Image /CaptureDir:C:\ /ImageFile:"C:\WindowsWithFinalChanges.wim" /Name:"Final changes"
    ```

    where *C* is the drive letter of the Windows partition and *Final changes* is the image name.

    The DISM tool captures the Windows partition into a new image file. This process can take several minutes.

    **Troubleshooting**: If you receive an: "A parameter is incorrect" error message when you try to capture or copy the file to the USB key, the file might be too large for the destination file system. Copy the file to a different drive that is formatted as NTFS.

	2.  Copy the image to a network share. Example: 
    ```syntax
	net use N: \\server\share
	copy C:\WindowsWithFinalChanges.wim N:\Images\WindowsWithFinalChanges.wim
	```

## <span id="Try_it_out"></span>Try it out

**Step 6: Apply the image to a new PC**
Use the steps from [Lab 2: Deploy Windows using a script](deploy-windows-with-a-script-sxs.md) to copy the image to the storage USB drive, apply the Windows image and the recovery image, and boot it up. The short version:

1.  Copy the image file to the storage drive.
2.  [Boot the reference device to Windows PE using the Windows PE USB key](install-windows-pe-sxs.md).
3.  Find the drive letter of the storage drive (`diskpart, list volume, exit`).
4.  Apply the image: `D:\ApplyImage.bat D:\Images\install.wim`.
5.  Disconnect the drives, then reboot (`exit`).
	
**Step 7: Verify customizations**

1.  After the PC boots, either create a new user account, or else press Ctrl+Shift+F3 to reboot into the built-in administrator account (This is also known as audit mode).

2.  See that the changes you made in audit mode are there.

Next steps: [Lab 10: Add desktop apps with siloed provisioning packages](add-desktop-apps-with-spps-sxs.md)