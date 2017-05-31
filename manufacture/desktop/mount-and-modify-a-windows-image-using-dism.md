---
author: Justinha
Description: Mount and Modify a Windows Image Using DISM
ms.assetid: f48b4681-bc59-4eb1-89c9-0163594467f7
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Mount and Modify a Windows Image Using DISM
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Mount and Modify a Windows Image Using DISM


You can use the Deployment Image Servicing and Management (DISM) tool to mount a Windows image from a WIM or VHD file. Mounting an image maps the contents of the image to a directory so that you can service the image using DISM without booting into the image. You can also perform common file operations, such as copying, pasting, and editing on a mounted image.

**Note**  
DISM cannot mount a Windows image from a VHD on Windows Vista with Service Pack 1 (SP1) or Windows Server 2008. You must attach the VHD using the DiskPart tool before you can use DISM to service the image. When you service VHD images that have been attached using the DiskPart tool, the changes are automatically committed with each operation and cannot be discarded.

 

You can mount and modify multiple images on a single computer. For more information, see [Deployment Image Servicing and Management (DISM) Best Practices](deployment-image-servicing-and-management--dism--best-practices.md).

## <span id="Mounting_an_Image"></span><span id="mounting_an_image"></span><span id="MOUNTING_AN_IMAGE"></span>Mounting an Image


You can mount an image using the **/optimize** option to reduce initial mount time. However, When using the **/optimize** option, processes that are ordinarily performed during a mount will instead be completed the first time that you access a directory. As a result, there may be an increase in the time that is required to access a directory for the first time after mounting an image using the **/optimize** option.

**To mount an image**

1.  Open a command prompt with administrator privileges. If you are using a version of Windows other than Windows 8 or Windows 10, use the Deployment Tools Cmd Prompt installed with the ADK or navigate to the DISM directory on your local computer.

2.  Mount the image.

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\test\images\myimage.wim /index:1 /MountDir:C:\test\offline
    ```

    **Note**  
    To mount a Windows image from a VHD file, you must specify `/index:1`.

     

    You can also add options to mount the image with read-only permissions or to reduce the initial mount time with the **/Optimize** option. For example,

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\test\images\myimage.wim /index:1 /MountDir:C:\test\offline /ReadOnly /Optimize
    ```

    For more information about the options available for the **/Mount-Image** option in DISM, see [DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md).

## <span id="Modifying_an_Image"></span><span id="modifying_an_image"></span><span id="MODIFYING_AN_IMAGE"></span>Modifying an Image


After you mount an image, you can browse the directory of the image. You can review the file and folder structure, and add, edit, or delete files and folders.

You can also use the DISM tool to add and remove drivers and packages, including language packs, enumerate drivers and packages, modify configuration settings, and more. For more information, see [Service a Windows Image Using DISM](service-a-windows-image-using-dism.md).

**To view and modify an image**

1.  On your technician computer open the mounted directory. For example,

    ``` syntax
    cd C:\mounted_images
    ```

2.  Delete, edit, or add additional files and folders to the location where they must appear after they have been applied to the destination computer. For example, C:\\program\_files\\application\_name.

    **Important**  
    If you must add an application or a device, verify that you included all of the required files. Although you can add application files and folders, you cannot install applications.

     

## <span id="Committing_Changes_to_an_Image"></span><span id="committing_changes_to_an_image"></span><span id="COMMITTING_CHANGES_TO_AN_IMAGE"></span>Committing Changes to an Image


You can commit changes to an image without unmounting the image.

**To commit changes to an image**

-   At the command prompt, type:

    ``` syntax
    Dism /Commit-Image /MountDir:C:\test\offline
    ```

    Use **/CheckIntegrity** to detect and track .wim file corruption when you commit changes to the image. When you apply or mount the image, use **/CheckIntegrity** again to stop the operation if file corruption was detected. **/CheckIntegrity** cannot be used with virtual hard disk (VHD) files.

## <span id="Unmounting_an_Image"></span><span id="unmounting_an_image"></span><span id="UNMOUNTING_AN_IMAGE"></span>Unmounting an Image


After you modify an image, you must unmount it. If you mounted your image with the default read/write permissions, you can commit your changes. This makes your modifications a permanent part of the image.

**To unmount an image**

1.  Open a command prompt with administrator privileges. If you are using a version of Windows other than Windows 8 or Windows 10, use the Deployment Tools Cmd Prompt installed with the ADK or navigate to the DISM directory on your local computer.


2.  Unmount the image.

    ``` syntax
    Dism /Unmount-Image /MountDir:C:\test\offline /commit
    ```

    where `C:\test\offline` is the location of the mount directory. If you do not specify the parameters to unmount, this option lists all of the mounted images but does not perform the unmount action.

    **Important**  
    You must use either the **/commit** or **/discard** argument when you use the **/unmount** option.

     

After modifying an image, you can apply the image from a network share or from local media, such as a CD/DVD or a USB flash drive (UFD).

## <span id="Troubleshooting"></span><span id="troubleshooting"></span><span id="TROUBLESHOOTING"></span>Troubleshooting


**If the DISM commands in this topic fail, try the following:**

1.  Make sure that you are using the Windows 10 version of DISM that is installed with the Windows ADK.

2.  If you are using a Windows 8.1, Windows 8, or Windows 7 PC, use the **Deployment and Imaging Tools Environment** to access the tools that are installed with the Windows 10 version of the Windows ADK.

3.  Don’t mount images to protected folders, such as your User\\Documents folder.

4.  If DISM processes are interrupted, consider temporarily disconnecting from the network and disabling virus protection.

5.  If DISM processes are interrupted, consider running the commands from the Windows Preinstallation Environment (WinPE) instead.

## <span id="related_topics"></span>Related topics


[DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md)

[Service a Windows Image Using DISM](service-a-windows-image-using-dism.md)

 

 






