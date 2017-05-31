---
author: KPacquer
Description: 'Add device drivers'
ms.assetid: 9a8f525c-bb8f-492c-a555-0b512e44bcd1
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Lab 3: Add device drivers'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Lab 3: Add device drivers 

Add device drivers to your images to support your hardware. Some have different installation procedures:

-  **.inf-style drivers**: Many drivers include an information file (with an .inf extension) to help install the driver. These can be installed using tools described in this topic.    
-  **.exe-style drivers**: Drivers without an .inf file often must be installed like typical Windows desktop applications. We'll show you how to add those in [Lab 10: Add desktop applications and settings with siloed provisioning packages (SPPs)](add-desktop-apps-with-spps-sxs.md).
-  **Boot-critical drivers**: Graphics and storage drivers may sometimes need to be added to the Windows image (as shown in this topic), as well as the Windows PE image (as shown earlier in [Lab 1: Install Windows PE](install-windows-pe-sxs.md)), and in the Windows recovery image. We'll show you how to update the recovery image later in [Lab 12: Update the recovery image](update-the-recovery-image.md).

## <span id="Prepare_and_mount_the_image"></span>Prepare and mount the image
To make the changes to a Windows image, you'll mount the image contents into a temporary folder, and use tools like DISM to make the changes. Unmount the images to save the changes, and use your deployment scripts to test the images. 

![image: Mounting an image, making changes, and unmounting the image](images/dep-win8-sxs-createmodelspecificfiles.jpg)

**Step 1: Backup your Windows image file (recommended while testing new designs)**

1.  Click **Start**, and type **deployment**. Right-click **Deployment and Imaging Tools Environment** and then select **Run as administrator**.

2.  Make a backup of the image file:
``` syntax
copy "C:\Images\Win10_x64\sources\install.wim" C:\Images\install-backup.wim
```

**Step 2: Mount the Windows image file**

Create a temporary folder to mount the files, and mount the image into it: 
``` syntax
md C:\mount\windows
Dism /Mount-Image /ImageFile:"C:\Images\install.wim" /Index:1 /MountDir:"C:\mount\windows" /Optimize
```
Where /Index:1 refers to the image you want to mount. 
For the Windows 10 Home/Pro edition, use /Index:2 to select the Home edition.

This step can take several minutes.

**Troubleshooting:**

-   Don’t mount images to protected folders, such as your User\\Documents folder.

-   If DISM processes are interrupted, consider temporarily disconnecting from the public network and disabling virus protection.
	
-   If you've mounted an image to the folder before, try cleaning up the resources associated with the mounted image:

	``` syntax
	Dism /Cleanup-Mountpoints
	```

-   For some DISM commands, you'll need to make sure that you are using the **Deployment and Imaging Tools Environment** rather than the standard command prompt.

## <span id="Add_customizations_to_the_image"></span>Add customizations to the image
These are just examples - you don't have to add all of these.

**Step 3: Add drivers**

1.  Add a single driver that includes an .inf file:

    ``` syntax
    Dism /Add-Driver /Image:"C:\mount\windows" /Driver:"C:\Drivers\PnP.Media.V1\media1.inf"
    ```

    where "C:\\Drivers\\PnP.Media.V1\\media1.inf" is the base .inf file in your driver package.

    **Troubleshooting**: For many DISM commands, you can detailed information about the error by adding the /LogPath option. For example:

    ``` syntax
    Dism /Add-Driver /Image:"C:\mount\windows" /Driver:"C:\Drivers\PnP.Media.V1\media1.inf" /LogPath=C:\mount\dism.log
    ```

2.  Install a group of drivers by using the /Recurse option. This adds all drivers with a .inf file in that folder and all its subfolders.

    **Warning**: While /Recurse can be handy, it's easy to bloat your image with it. Some driver packages include multiple .inf driver packages, which often share payload files from the same folder. During installation, each .inf driver package is expanded into a separate folder, each with a copy of the payload files. We've seen cases where a popular driver in a 900MB folder added 10GB to images when added with the /Recurse option.

    ``` syntax
    Dism /Add-Driver /Image:"C:\mount\windows" /Driver:c:\drivers /Recurse 
    ```
    
3.  Verify that the drivers are part of the image:

    ``` syntax
    Dism /Get-Drivers /Image:"C:\mount\windows"
    ```

    Review the resulting list of packages and verify that the list contains the driver.


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

**Step 6: Verify drivers**
1.  After the PC boots, either create a new user account, or else press Ctrl+Shift+F3 to reboot into the built-in administrator account (This is also known as audit mode).

2.  Right-click the **Start** button, and select **Command Prompt (Admin)**.

3.  Verify that the drivers appear correctly:

    ``` syntax
    Dism /Get-Drivers /Online
    ```

    Review the resulting list of drivers. For example:

    ``` syntax
    Deployment Image Servicing and Management tool
    Version: 10.0.15063.0

    Image Version: 10.0.15063.0

    Obtaining list of 3rd party drivers from the driver store...

    Driver packages listing:

    Published Name : oem0.inf
    Original File Name : contoso.graphicsdriver.inf
    Inbox : No
    Class Name : Graphics
    Provider Name : Contoso
    Date : 05/19/2017
    Version : 10.0.0.1

    The operation completed successfully.
    ```

## <span id="Learn_more"></span>Learn more

* When creating several devices with the identical hardware configuration, you can speed up installation time and first boot-up time by [maintaining driver configurations when capturing a Windows image](maintain-driver-configurations-when-capturing-a-windows-image.md). 


Next step: [Lab 4: Add languages](add-drivers-langs-universal-apps-sxs.md)