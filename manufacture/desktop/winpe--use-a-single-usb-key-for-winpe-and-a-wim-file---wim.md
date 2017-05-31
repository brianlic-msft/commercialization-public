---
author: themar
Description: 'WinPE: Store or split images to deploy Windows using a single USB drive'
ms.assetid: 66036c4e-f64c-4175-b4fe-15e4cc1fc600
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'WinPE: Store or split images to deploy Windows using a single USB drive'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WinPE: Store or split images to deploy Windows using a single USB drive

How can you deploy Windows to PCs with just one USB port?

The default Windows Preinstallation Environment (WinPE) drive format, FAT32, is used to boot UEFI-based PCs, but that's too small to store most Windows images:

-   FAT32 has a maximum file size of 4GB in size. Most customized Windows images are over 4GB.
-   FAT32 has a maximum partition size of 32GB. Some Windows images are larger than 32GB.

    (You can still use a 64GB or 128GB USB key, but you have to format it to use only uses 32GB of its space.)

Here's a few ways around these limitations:

## <span id="Create_a_multiple_partition_USB_drive"></span>Option 1: Create a multiple partition USB drive

Starting with Windows 10, Version 1703, you can create multiple partitions on USB drives. To work with a USB drive with multiple partitions, both your technician PC and WinPE have to be Windows 10, Version 1703.

**Create a USB drive with WinPE and data partitions**

1.  Start the **Deployment and Imaging Tools Environment** as an administrator.

2.  Type **diskpart** and press Enter.

3.  Use Diskpart to reformat the drive and create two new partitions for WinPE and for your images:

    ``` syntax
    List disk
    select disk X    (where X is your USB drive)
    clean
    create partition primary size=2048
    active
    format fs=FAT32 quick label="WinPE"
    assign letter=P
    create partition primary
    format fs=NTFS quick label="Images"
    assign letter=I  
    Exit
    ```

4.  Copy the WinPE files to the WinPE partition:

    ``` syntax
    copype amd64 C:\WinPE_amd64
    xcopy C:\WinPE_amd64\media P:\ /s
    ```

5.  Copy the Windows image file to the Images partition:

    ``` syntax
    xcopy C:\Images\install.wim I:\install.wim
    ```

## <span id="Option_1__Store_the_image_on_a_separate_USB_drive"></span><span id="option_1__store_the_image_on_a_separate_usb_drive"></span><span id="OPTION_1__STORE_THE_IMAGE_ON_A_SEPARATE_USB_DRIVE"></span>Option 2: Store the image on a separate USB drive


If you are using Windows 10, Version 1607 or earlier and your PC only has one USB port, you can still deploy Windows using two separate USB keys.

1.  Boot to WinPE.
2.  Remove the WinPE drive. (After booting, WinPE runs in memory.)
3.  Plug in a separate storage drive with your image and apply it to the device.

## <span id="Option_2__Store_the_image_on_a_network_location"></span><span id="option_2__store_the_image_on_a_network_location"></span><span id="OPTION_2__STORE_THE_IMAGE_ON_A_NETWORK_LOCATION"></span>Option 3: Store the image on a network location


1.  Copy the image to a server on your network, for example, \\\\server\\share\\install.wim

2.  Boot to WinPE.

3.  Connect a network drive using a drive letter, for example, N.

    ``` syntax
    net use N: \\server\share
    ```

4.  Apply the image from the network.
    ```
    Dism /apply-image /imagefile:N:\install.wim /index:1 /applydir:D:\
    ```

## <span id="Option_3__Split_the_image"></span><span id="option_3__split_the_image"></span><span id="OPTION_3__SPLIT_THE_IMAGE"></span>Option 4: Split the image


**Limitations:**

-   Windows Setup doesn't support installing from a split .wim file for Windows 10. 
-   You can't modify a split .wim file.
-   To use a 64GB or 128GB key, format it to only use 32GB of space.
-   For images larger than 32GB, you need a second USB key because of the FAT32 partition size limitation.

1.  From your technician PC, create your WinPE key. See [WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md).

2.  Open the **Deployment and Imaging Tools Environment** as an adminstrator.

3.  Split the Windows image into files smaller than 4GB each:

    ``` syntax
    Dism /Split-Image /ImageFile:C:\install.wim /SWMFile:C:\images\install.swm /FileSize:4000
    ```

    where:

    -   `C:\images\install.wim` is the name and the location of the image file that you want to split.

    -   `D:\images\install.swm` is the destination name and the location for the split .wim files.

    -   `4000` is the maximum size in MB for each of the split .wim files to be created.

    In this example, the */split* option creates an install.swm file, an install2.swm file, an install3.swm file, and so on, in the D:\\Images directory.

4.  Copy the files to the WinPE key.

5.  On the destination PC, boot to WinPE, and then apply an image using DISM /Apply-Image /SWMFile command.
    ```
    Dism /apply-image /imagefile:install.swm /swmfile:install*.swm /index:1 /applydir:D:\
    ```


## <span id="related_topics"></span>Related topics

[WinPE: Identify drive letters with a script](winpe-identify-drive-letters.md)

[Split a Windows image file (.wim) for FAT32 media or to span across multiple DVDs](split-a-windows-image--wim--file-to-span-across-multiple-dvds.md)

[DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md)