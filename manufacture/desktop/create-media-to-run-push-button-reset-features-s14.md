---
author: Justinha
Description: 'Bare metal reset/recovery: create recovery media while deploying new devices'
ms.assetid: 2244bddf-8f49-41db-949a-2fbe9e224003
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Bare metal reset/recovery: create recovery media while deploying new devices'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Bare metal reset/recovery: create recovery media while deploying new devices


Recovery media (bare metal recovery) helps restore a Windows device to the factory state, even if the user needs to replace the hard drive or completely wipe the drive clean.

You can include this media with new devices that you provide to your customers using the same Windows images used to deploy the devices.

**Note**  
-   The PC firmware/BIOS must be configured so that the PC can boot from the media (USB drive or DVD drive).
-   The USB flash drive or DVD recovery media must have enough space for the Windows image.
-   If the Windows images are larger than 32GB or are larger the media you're using (for example, 4.7GB DVDs), you'll need to [split the Windows image file to span across multiple DVDs](split-a-windows-image--wim--file-to-span-across-multiple-dvds.md).

 

To create a bootable USB recovery drive for a personal device, see [Create a USB recovery drive](http://go.microsoft.com/fwlink/p/?linkid=296450).

## <span id="CreateMedia"></span><span id="createmedia"></span><span id="CREATEMEDIA"></span>Create a bootable Windows RE image


To create the recovery media that you can include with the PC, you must have the following:

-   A Windows image (Install.wim). You can either use the base Windows image or a customized recovery image.
-   A Windows RE tools image (Winre.wim). You can either extract the base Windows RE tools image from the Windows image, or use a [customized Windows RE image](customize-windows-re.md).

**Step 1: Open the Deployment and Imaging Tools Environment**

1.  Download and install the [Windows Assessment and Deployment Kit (ADK)](http://go.microsoft.com/fwlink/?LinkId=526803).
2.  On your technician PC: Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

**Step 2: Extract the Windows RE image from the Windows image**

1.  Mount the Windows image:

    ``` syntax
    md c:\mount\Windows

    Dism /Mount-Image /ImageFile:D:\sources\install.wim /Index:1 /MountDir:C:\mount
    ```

2.  Copy the Windows RE image.

    ``` syntax
    md C:\Images

    xcopy C:\mount\Windows\System32\Recovery\winre.wim C:\Images\winre.wim /h
    ```

3.  Unmount the Windows image:

    ``` syntax
    Dism /Unmount-Image /MountDir:C:\mount\winre /Discard
    ```

**Step 3: Create a working folder for Windows RE files**

1.  Create a folder structure for Windows RE, which is based on Windows PE:

    ``` syntax
    copype amd64 C:\resetmedia_amd64
    ```

    where *amd64* is the architecture of the system you are creating media for.

2.  Replace the default Windows PE boot image (Boot.wim) with a Windows RE tools image.

    ``` syntax
    xcopy C:\MyImages\winre.wim C:\resetmedia_amd64\media\sources\boot.wim /h
    ```

**Step 4: Add the Windows image**

-   Copy the Windows image to the working folder.

    ``` syntax
    copy D:\sources\install.wim C:\resetmedia_amd64\media\sources\install.wim
    ```

    where *D:\\sources\\install.wim* is either the base Windows image or a customized push-button reset recovery image.

**Step 5: Optional: Add bare metal recovery configuration scripts**

-   If you're using a customized partition layout, add bare metal recovery configuration scripts to the working folder, under \\sources. For more info, see [Bare Metal Reset/Recovery: Enable Your Users to Create Media](bare-metal-resetrecovery-enable-your-users-to-create-media-and-to-recover-hard-drive-space.md).

    ``` syntax
    copy E:\Recovery\RecoveryImage\ResetConfig.xml C:\resetmedia_amd64\media\sources\ResetConfig.xml

    copy E:\Recovery\RecoveryImage\ResetPartitions-UEFI.txt C:\resetmedia_amd64\media\sources\ResetPartitions-UEFI.txt
    ```

## <span id="Create_bootable_media"></span><span id="create_bootable_media"></span><span id="CREATE_BOOTABLE_MEDIA"></span>Create bootable media


**To create a bootable USB flash drive:**

1.  Install Windows RE to a USB flash drive:

    ``` syntax
    Makewinpemedia /ufd C:\resetmedia_amd64 F:
    ```

    where *F* is the drive letter of the USB flash drive.

2.  Label the USB flash drive with a descriptive name:

    In File Explorer, right-click the drive, and select **Rename**, and type **Full-PC Recovery**.

**To create a bootable DVD:**

1.  Create a DVD image file:

    ``` syntax
    Makewinpemedia /iso C:\resetmedia_amd64 C:\resetmedia_amd64\RecoveryImage.iso
    ```

2.  Insert a DVD.
3.  In File Explorer, navigate to `C:\resetmedia_amd64`, right-click `RecoveryImage.iso`, and then click **Burn disc image**.

## <span id="Test_the_bare_metal_recovery_features"></span><span id="test_the_bare_metal_recovery_features"></span><span id="TEST_THE_BARE_METAL_RECOVERY_FEATURES"></span>Test the bare metal recovery features


1.  On a PC with an empty hard drive, insert your new recovery media.
2.  Start the PC, press a key to open the firmware boot menus, and then select the appropriate boot device.
3.  At the **Windows RE Tools** menus, select a keyboard layout, for example, **US**.
4.  Click **Troubleshoot** &gt; **Reset your PC** &gt; **Next**

    **Note**  
    If you are testing on the same PC, and you have not cleaned the hard drive, you may be prompted to select a drive. Select Windows 10.

     

    Select **Yes, repartition the drives** &gt; **Just remove my files** &gt; **Reset**.

    Windows resets the computer to its original state by using the recovery image.

## <span id="Large-Scale_Deployment"></span><span id="large-scale_deployment"></span><span id="LARGE-SCALE_DEPLOYMENT"></span>Large-Scale Deployment


If you are deploying USB keys with your computers, you can create a basic copy of the Windows recovery media on USB by using the steps above. After you have performed final customization of the image, you can boot the computer to Windows PE, and update the install.wim image on the USB recovery media.

You can potentially save manufacturing time by appending the Windows image on the USB flash drive, rather than recapturing the entire Windows image. If you do this, you must also update the ResetConfig.xml configuration file element: `RestoreFromIndex` to the appropriate index number. For more information, see [Append a Volume Image to an Existing Image Using DISM](append-a-volume-image-to-an-existing-image-using-dism--s14.md) and [ResetConfig XML Reference](resetconfig-xml-reference-s14.md).

## <span id="related_topics"></span>Related topics


[Bare Metal Reset/Recovery: Enable Your Users to Create Media](bare-metal-resetrecovery-enable-your-users-to-create-media-and-to-recover-hard-drive-space.md)

[Push-Button Reset Overview](push-button-reset-overview.md)

[ResetConfig XML Reference](resetconfig-xml-reference-s14.md)

[REAgentC Command-Line Options](reagentc-command-line-options.md)

 

 






