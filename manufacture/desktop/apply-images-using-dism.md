---
author: Justinha
Description: Apply Images Using DISM
ms.assetid: f9e0727d-a210-4efa-85af-5b222c53624e
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Apply Images Using DISM
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Apply Images Using DISM


This topic describes how to deploy images captured from your reference computer to one or more destination computers using the Deployment Image Servicing and Management (DISM) tool. For more information about configuring recommended hard drive partitions, see [Configure UEFI/GPT-Based Hard Drive Partitions](configure-uefigpt-based-hard-drive-partitions.md) and [Configure BIOS/MBR-Based Hard Drive Partitions](configure-biosmbr-based-hard-drive-partitions.md).

## <span id="BootUsingWindowsPE"></span><span id="bootusingwindowspe"></span><span id="BOOTUSINGWINDOWSPE"></span>Apply a Windows Image


On the destination computer, you will create a structure for the partitions where you apply your images. The partition structure on the destination computer must match the partition structure of the reference computer.

If you apply an image to a volume with an existing Windows installation, files from the previous installation may not be deleted. Format the volume by using a tool such as DiskPart before applying the new image.

**To partition the hard drive and apply an image**

1.  Boot the destination computer to Windows PE. For more information, see [Windows PE (WinPE) Technical Reference](winpe-intro.md).

2.  Connect to the network distribution share where your Windows image is stored. For example, you can use the **net use** command to do this:

    ``` syntax
    net use n: \\server\share
    ```

    If prompted, provide your network credentials.

3.  At the Windows PE command prompt, type `diskpart` to start the **Diskpart** tool.

4.  Create your partition structure using the **Diskpart** tool. For example:

    ``` syntax
    select disk 0
    clean
    create partition primary size=3000 id=27
    format quick fs=ntfs label="Recovery"
    assign letter="R"
    create partition primary size=300
    format quick fs=ntfs label="System"
    assign letter="S"
    active
    create partition primary
    format quick fs=ntfs label="Windows"
    assign letter="C"
    exit
    ```

    This example temporarily assigns these drive letters: Windows=C, System=S, and Recovery=R. If you’re deploying to PCs with unformatted hard drives, change the Windows drive letter to a letter that’s near the end of the alphabet, such as W, to avoid drive letter conflicts. Do not use X, because this drive letter is reserved for Windows PE. After the PC reboots, the Windows partition is assigned the letter C, and the other partitions don’t receive drive letters.

    For examples of recommended partition structures, see [Configure BIOS/MBR-Based Hard Drive Partitions](configure-biosmbr-based-hard-drive-partitions.md) and [Configure UEFI/GPT-Based Hard Drive Partitions](configure-uefigpt-based-hard-drive-partitions.md).

    **Note**  
    You can automate this task with the `diskpart /s <script>` command. For more information, see [Diskpart Command line syntax](http://go.microsoft.com/fwlink/?LinkId=128458).

     

5.  Use the DISM tool to apply images to your Windows partition.

    For each partition that you apply an image to, run the **DISM** **/apply-image** /imageFile: *&lt;image\_file&gt;* /index:*&lt;index\_number&gt;* /ApplyDir:*&lt;image\_path&gt;* command.

    ``` syntax
    Dism /apply-image /imagefile:N:\Images\my-windows-partition.wim /index:1 /ApplyDir:C:\
    ```

    **Note**  If the DISM /Apply-Image command fails, make sure you’re using a [supported version of DISM](dism-supported-platforms.md) for that Windows image. For example, to apply a Windows 10 image, you’ll need the Windows 10 version of DISM.

     

6.  To set up a basic system partition, you can use the BCDboot tool to copy a simple set of system files to a system partition. These files include boot configuration data (BCD) information that is used to start Windows:

    Use the BCDboot tool to copy common system partition files and to initialize boot configuration data:

    ``` syntax
    C:\Windows\System32\bcdboot C:\Windows /l en-US
    ```

    For more information about the BCDboot tool, see [BCDboot Command-Line Options](bcdboot-command-line-options-techref-di.md).

    **Note**  
    You can also set up the system partition by applying an image. Use the **DISM** **/apply-image** command. For example:

    `Dism /apply-image /imagefile:N:\Images\my-system-partition.wim /index:1 /ApplyDir:S:\`

     

You can set up the computer to reinstall your Windows image in the event of a system failure. For more information, see [Windows Recovery Environment (Windows RE) Technical Reference](windows-recovery-environment--windows-re--technical-reference.md).

**Important**  
Microsoft Reserved partitions (MSR) and Extended partitions are managed by the computer. Do not apply an image to these partitions.

 

You can use audit mode to test the computer and to perform additional customizations before you ship it to your end user. For more information, see [Boot Windows to Audit Mode or OOBE](boot-windows-to-audit-mode-or-oobe.md).

You can also perform some customizations to the computer without booting it. For more information, see [Service an Applied Windows Image](service-an-applied-windows-image.md).

**Note**  
If you receive the error message: **Bootmgr not found. Press CTRL+ALT+DEL**, this indicates that Windows cannot identify the boot information in the active partition. If you receive this error message, check the following:

-   Use the DiskPart tool to check to make sure that the system partition is set to Active.

-   Check to make sure that the active partition includes system files.

 

## <span id="related_topics"></span>Related topics


[Capture Images of Hard Disk Partitions Using DISM](capture-images-of-hard-disk-partitions-using-dism.md)

[Boot Windows to Audit Mode or OOBE](boot-windows-to-audit-mode-or-oobe.md)

[DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md)

[Applying Images using a script](http://go.microsoft.com/fwlink/?LinkId=618399)

 

 






