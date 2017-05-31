---
author: Justinha
Description: 'WinPE: Add drivers'
ms.assetid: 9eecfba3-2a0d-4c38-8cec-6d5e839ae8d4
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'WinPE: Add drivers'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WinPE: Add drivers


Add drivers to Windows PE, such as graphics drivers or network drivers.

Device drivers typically include a folder that contains multiple files. These folders include a file that has the `.inf` file name extension. This file manages the other files in the device driver package. Many boot-critical drivers can be used in both the Windows image and in Windows PE.

You can also update device drivers while you're running Windows PE. For more information, see [Drvload Command-Line Options](drvload-command-line-options.md).

**Get the Windows Assessment and Deployment Kit with Windows PE tools**

-   Install the [Windows Assessment and Deployment Kit (Windows ADK) Technical Reference](http://go.microsoft.com/fwlink/p/?LinkId=526803), including the Windows PE feature.

**Create a set of either 32-bit or 64-bit Windows PE files**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  In the **Deployment Tools and Imaging Environment**, copy the Windows PE files for the PCs you want to boot.

    -   The 64-bit version can boot 64-bit UEFI and 64-bit BIOS PCs.

        ``` syntax
        copype amd64 C:\WinPE_amd64
        ```

    -   The 32-bit version can boot 32-bit UEFI, 32-bit BIOS, and 64-bit BIOS PCs.

        ``` syntax
        copype x86 C:\WinPE_x86
        ```

**Mount the Windows PE boot image**

-   Mount the Windows PE image.

    ``` syntax
    Dism /Mount-Image /ImageFile:"C:\WinPE_amd64\media\sources\boot.wim" /index:1 /MountDir:"C:\WinPE_amd64\mount"
    ```

## <span id="Add_customizations"></span><span id="add_customizations"></span><span id="ADD_CUSTOMIZATIONS"></span>Add customizations


**Add device drivers (.inf files)**

1.  Add the device driver to the Windows PE image.

    ``` syntax
    Dism /Add-Driver /Image:"C:\WinPE_amd64\mount" /Driver:"C:\SampleDriver\driver.inf"
    ```

    **Note**  
    Although you can add multiple drivers to an image by using one command, it is often easier to troubleshoot problems by adding each driver package individually.

     

2.  Verify that the driver packages are part of the image:

    ``` syntax
    Dism /Get-Drivers /Image:"C:\WinPE_amd64\mount"
    ```

    Review the resulting list of drivers and verify that the list contains the driver package that you added.

**Video drivers: Change the display resolution**

-   For most graphics drivers, WinPE picks the maximum native resolution automatically.

    To manually adjust the size, use an answer file and include settings for Microsoft-Windows-Setup/[Display](https://msdn.microsoft.com/library/windows/hardware/dn915285). To learn more, see [Wpeinit and Startnet.cmd: Using WinPE Startup Scripts](wpeinit-and-startnetcmd-using-winpe-startup-scripts.md).

**Unmount the Windows PE image and create media**

1.  Unmount the Windows PE image.

    ``` syntax
    Dism /Unmount-Image /MountDir:"C:\WinPE_amd64\mount" /commit
    ```

2.  Create bootable media, such as a USB flash drive.

    ``` syntax
    MakeWinPEMedia /UFD C:\WinPE_amd64 F:
    ```

3.  Boot the media. Windows PE starts automatically. After the Windows PE window appears, the wpeinit command runs automatically. This may take a few minutes. Verify your customizations.

**Troubleshooting**

1.  Windows PE won’t boot? See the troubleshooting tips at the end of the topic: [Install Windows PE](http://go.microsoft.com/fwlink/?LinkId=526830).

2.  For tips on connecting to a network, see [WinPE Network Drivers: Initializing and adding drivers](winpe-network-drivers-initializing-and-adding-drivers.md).

## <span id="related_topics"></span>Related topics

[WinPE: Optimize and shrink the image](winpe-optimize.md)

[WinPE for Windows 10](winpe-intro.md)

[Install Windows PE](http://go.microsoft.com/fwlink/?LinkId=526830)

[WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md)

[WinPE: Create a Boot CD, DVD, ISO, or VHD](winpe-create-a-boot-cd-dvd-iso-or-vhd.md)

[WinPE: Install on a Hard Drive (Flat Boot or Non-RAM)](winpe-install-on-a-hard-drive--flat-boot-or-non-ram.md)

[WinPE: Boot in UEFI or legacy BIOS mode](winpe-boot-in-uefi-or-legacy-bios-mode.md)

[WinPE: Add packages (Optional Components Reference)](winpe-add-packages--optional-components-reference.md)

 

 






