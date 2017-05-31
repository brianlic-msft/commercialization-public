---
author: Justinha
Description: Capture Images of Hard Disk Partitions Using DISM
ms.assetid: 164b9185-402f-4afb-bcf5-ef2f37077ed6
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Capture Images of Hard Disk Partitions Using DISM
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Capture Images of Hard Disk Partitions Using DISM


You can use the Deployment Image Servicing and Management (DISM) tool to capture an image of your hard disk for deployment and save it as a Windows® image (.wim) file. To see how this information applies to Windows, system, and recovery partitions, see [Capture and Apply Windows, System, and Recovery Partitions](capture-and-apply-windows-system-and-recovery-partitions.md).

## <span id="Prerequisites"></span><span id="prerequisites"></span><span id="PREREQUISITES"></span>Prerequisites


1.  Windows PE. See [WinPE: Create USB Bootable drive](winpe-create-usb-bootable-drive.md).

2.  A reference computer. You can create a reference computer by deploying Windows, and then removing the computer-specific information from the system. For more information, see [Sysprep (Generalize) a Windows installation](sysprep--generalize--a-windows-installation.md).

## <span id="Step_1__Determining_Which_Partitions_to_Capture"></span><span id="step_1__determining_which_partitions_to_capture"></span><span id="STEP_1__DETERMINING_WHICH_PARTITIONS_TO_CAPTURE"></span>Step 1: Determining Which Partitions to Capture


This table shows the types of partitions that you must capture and those that are managed automatically.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Partition type</th>
<th align="left">Should you capture this partition?</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p><strong>System partition</strong> (BIOS system partition or EFI System Partition)</p></td>
<td align="left"><p>Optional.</p>
<p>If only a simple set of partition files is required, you don’t have to capture this partition.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>Microsoft Reserved partition (MSR)</strong></p></td>
<td align="left"><p>No.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>Primary partitions</strong> (Windows partitions, utility partitions)</p></td>
<td align="left"><p>Yes.</p></td>
</tr>
<tr class="even">
<td align="left"><p><strong>Extended partition</strong></p></td>
<td align="left"><p>No.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>Logical partitions</strong> (Windows partitions, utility partitions)</p></td>
<td align="left"><p>Yes.</p></td>
</tr>
</tbody>
</table>

 

You can capture and apply images between partitions on BIOS-based and UEFI-based computers, because the Windows image isn’t affected by the firmware. For more information, see [Capture and Apply Windows, System, and Recovery Partitions](capture-and-apply-windows-system-and-recovery-partitions.md).

## <span id="Step_2__Assign_Drive_Letters_to_Partitions"></span><span id="step_2__assign_drive_letters_to_partitions"></span><span id="STEP_2__ASSIGN_DRIVE_LETTERS_TO_PARTITIONS"></span>Step 2: Assign Drive Letters to Partitions


If any of the partitions you want to capture don’t already have a drive letter assigned, assign a letter using the **DiskPart** tool.

1.  Start your reference computer by using Windows PE.

2.  At the Windows PE command prompt, type `diskpart` to open the DiskPart tool.

    ``` syntax
    X:> diskpart
    DISKPART>
    ```

3.  Select the hard disk with the `select disk` command. For example,

    ``` syntax
    DISKPART> select disk 0
    ```

4.  View the partitions with the `list partition` command. For example,

    ``` syntax
    DISKPART> list partition

    DISKPART> list partition

      Partition ###  Type              Size     Offset
      -------------  ----------------  -------  -------
      Partition 1    Primary            300 MB  1024 KB
      Partition 2    Primary            200 GB   301 MB
    ```

5.  Select the partition with the `select partition` command. For example,

    ``` syntax
    DISKPART> select partition=1
    ```

6.  Assign a letter to the partition with the `assign letter` command. For example,

    ``` syntax
    DISKPART> assign letter=S
    ```

7.  Type `exit` to return to the Windows PE command prompt.

    ``` syntax
    DISKPART> exit
    X:\>
    ```

For more information, see the DiskPart Help from the command line, or [Diskpart Command line syntax](http://go.microsoft.com/fwlink/?LinkId=128458).

## <span id="Step_3__Capture_Partition_Images_using_DISM"></span><span id="step_3__capture_partition_images_using_dism"></span><span id="STEP_3__CAPTURE_PARTITION_IMAGES_USING_DISM"></span>Step 3: Capture Partition Images using DISM


Capture images for each customized partition.

-   At the Windows PE command prompt, capture the images by using the **DISM** command together with the **/captureImage** option. For example,

    ``` syntax
    Dism /Capture-Image /ImageFile:c:\my-windows-partition.wim /CaptureDir:C:\ /Name:"My Windows partition"
    Dism /Capture-Image /ImageFile:s:\my-system-partition.wim /CaptureDir:S:\ /Name:"My system partition"
    ```

    For more information about using the DISM tool to capture an image, see [DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md).

## <span id="Step_4__Save_Images_to_the_Network"></span><span id="step_4__save_images_to_the_network"></span><span id="STEP_4__SAVE_IMAGES_TO_THE_NETWORK"></span>Step 4: Save Images to the Network


Save your .wim files to your network or another safe location.

1.  Connect to your distribution share by using the **net use** command. For example,

    ``` syntax
    net use n: \\Server\Share
    ```

    If prompted, provide your network credentials.

2.  Copy the partitions to your network share. For example,

    ``` syntax
    md N:\Images\
    copy C:\my-windows-partition.wim N:\Images\
    copy c:\my-system-partition.wim N:\Images\
    ```

## <span id="Next_Steps"></span><span id="next_steps"></span><span id="NEXT_STEPS"></span>Next Steps


After the image is captured and stored, you can:

-   Mount it to your reference computer for modification. For more information, see [Mount and Modify a Windows Image Using DISM](mount-and-modify-a-windows-image-using-dism.md).

-   Split the file into smaller files. For more information, see [Split a Windows Image (WIM) File to Span Across Multiple DVDs](split-a-windows-image--wim--file-to-span-across-multiple-dvds.md).

-   Apply the images to a destination computer. For more information, see [Apply Images Using DISM](apply-images-using-dism.md).

-   Service the image. For more information, see [Service a Windows Image Using DISM](service-a-windows-image-using-dism.md).

## <span id="related_topics"></span>Related topics


[Deployment Image Servicing and Management (DISM) Command-Line Options](deployment-image-servicing-and-management--dism--command-line-options.md)

[BCDboot Command-Line Options](bcdboot-command-line-options-techref-di.md)

[Capture and Apply Windows, System, and Recovery Partitions](capture-and-apply-windows-system-and-recovery-partitions.md)

[Boot to VHD (Native Boot): Add a Virtual Hard Disk to the Boot Menu](boot-to-vhd--native-boot--add-a-virtual-hard-disk-to-the-boot-menu.md)

 

 






