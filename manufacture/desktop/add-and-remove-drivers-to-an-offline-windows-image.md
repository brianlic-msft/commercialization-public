---
author: Justinha
Description: Add and Remove Drivers to an Offline Windows Image
ms.assetid: 71651630-2e26-4174-8161-8f83b8ae4bc3
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Add and Remove Drivers to an Offline Windows Image
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Add and Remove Drivers to an Offline Windows Image


You can use the Deployment Image Servicing and Management (DISM) tool to install or remove driver (.inf) files in an offline Windows image. You can either apply an unattended answer file to a mounted .wim, .vhd, or .vhdx file, or you can add or remove the drivers directly by using the command prompt.

When you use DISM to install a device driver to an offline image, the device driver is added to the driver store in the offline image. When the image is booted, Plug and Play (PnP) runs and associates the drivers in the store to the corresponding devices on the computer.

**Note**   To add drivers to a Windows 10 image offline, you must use a technician computer running Windows 10, Windows Server 2016 Technical Preview, or Windows Preinstallation Environment (WinPE) for Windows 10. Driver signature verification may fail when you add a driver to a Windows 10 image offline from a technician computer running any other operating system.


## To add drivers to an offline image by using DISM

1.  At an elevated command prompt, retrieve the name or index number for the image that you want to modify. For example, type:

    ``` syntax
    Dism /Get-ImageInfo /ImageFile:C:\test\images\install.wim
    ```

    An index or name value is required for most operations that specify a WIM file. For a VHD file, you must specify `/Index:1`.

2.  Mount the offline Windows image. For example, type:

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\test\images\install.wim /Name:"Windows Drive" /MountDir:C:\test\offline
    ```

3.  Add a driver to the image.

    ``` syntax
    Dism /Image:C:\test\offline /Add-Driver /Driver:C:\drivers\mydriver.inf
    ```

    To install all of the drivers from a folder and all its subfolders, point to the folder and use the **/Recurse** option.

    ``` syntax
    Dism /Image:C:\test\offline /Add-Driver /Driver:c:\drivers /Recurse
    ```

    **Warning**  While /Recurse can be handy, it's easy to bloat your image with it. Some driver packages include multiple .inf driver packages, which often share payload files from the same folder. During installation, each .inf driver package is expanded into a separate folder, each with a copy of the payload files. We've seen cases where a popular driver in a 900MB folder added 10GB to images when added with the /Recurse option.

    To install an unsigned driver, use **/ForceUnsigned** to override the requirement that drivers installed on X64-based computers must have a digital signature.

    ``` syntax
    Dism /Image:C:\test\offline /Add-Driver /Driver:C:\drivers\mydriver.inf /ForceUnsigned
    ```

4.  Review the list of third-party driver (.inf) files in the Windows image. Drivers added to the Windows image are named Oem\*.inf. This is to guarantee unique naming for new drivers added to the computer. For example, the files MyDriver1.inf and MyDriver2.inf are renamed Oem0.inf and Oem1.inf.

    ``` syntax
    Dism /Image:C:\test\offline /Get-Drivers 
    ```

5.  Commit the changes and unmount the image.

    ``` syntax
    Dism /Unmount-Image /MountDir:C:\test\offline /Commit
    ```

## To remove drivers from an offline image by using DISM

1.  At an elevated command prompt, retrieve the name or index number for the image that you want to modify.

    ``` syntax
    Dism /Get-ImageInfo /ImageFile:C:\test\images\install.wim
    ```

    An index or name value is required for most operations that specify a WIM file. For a VHD file, you must specify `/Index:1`.

2.  Mount the offline Windows image. For example:

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\test\images\install.wim /Name:"Windows 10 Home" /MountDir:C:\test\offline
    ```

3.  Remove a specific driver from the image. Multiple drivers can be removed on one command line.

    ``` syntax
    Dism /Image:C:\test\offline /Remove-Driver /Driver:OEM1.inf /Driver:OEM2.inf
    ```

    **Warning**  
    Removing a boot-critical driver package can make the offline Windows image unbootable. For more information, see [DISM Driver Servicing Command-Line Options](dism-driver-servicing-command-line-options-s14.md).
     

4.  Commit the changes and unmount the image.

    ``` syntax
    Dism /Unmount-Image /MountDir:C:\test\offline /Commit
    ```

## To add drivers to an offline Windows image by using an unattended answer file

1.  Locate the device driver .inf files that you intend to install on the Windows image.

    **Note**  
    All drivers in the directory and subdirectories that are referenced in the answer file are added to the image. You should manage the answer file and these directories carefully to address concerns about increasing the size of the image with unnecessary driver packages.

2.  Use Windows System Image Manager (Windows SIM) to create an answer file that contains the paths to the device drivers that you intend to install.

3.  Add the Microsoft-Windows-PnpCustomizationsNonWinPE component to your answer file in the **offlineServicing** configuration pass.

4.  Expand the **Microsoft-Windows-PnpCustomizationsNonWinPE** node in the answer file. Right-click **DevicePaths**, and then select **Insert New PathAndCredentials**.

    A new **PathAndCredentials** list item appears.

5.  For each location that you intend to access, add a separate **PathAndCredentials** list item.

6.  In the Microsoft-Windows-PnpCustomizationsNonWinPE component, specify the path to the device driver and the credentials that are used to access the file, if the file is on a network share.

    **Note**  
    You can include multiple device driver paths by adding multiple **PathAndCredentials** list items. If you add multiple list items, you must increment the value of **Key** for each path. For example, you can add two separate driver paths where the value of **Key** for the first path is equal to **1** and the value of **Key** for the second path is equal to **2**.

7.  Save the answer file and exit Windows SIM. The answer file must resemble the following sample.

    ``` syntax
    <?xml version="1.0" ?><unattend xmlns="urn:schemas-microsoft-com:asm.v3" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State">
       <settings pass="offlineServicing">
          <component name="Microsoft-Windows-PnpCustomizationsNonWinPE" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS">
             <DriverPaths>
                <PathAndCredentials wcm:keyValue="1">
                   <Path>\\networkshare\share\drivers</Path>
                   <Credentials>
                      <Domain>Fabrikam</Domain>
                      <Username>MyUserName</Username>
                      <Password>MyPassword</Password>
                   </Credentials>
                </PathAndCredentials>
             </DriverPaths>
          </component>
       </settings>
    </unattend>
    ```

8.  Mount the Windows image that you intend to install the drivers to by using DISM. For example, type:

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\test\images\install.wim /Index:1 /MountDir:C:\test\offline
    ```

    An index or name value is required for most operations that specify a WIM file. For a VHD file, you must specify `/Index:1`.

9.  Use DISM to apply the answer file to the mounted Windows image. For example, type:

    ``` syntax
    DISM /Image:C:\test\offline /Apply-Unattend:C:\test\answerfiles\myunattend.xml
    ```

    For more information about how to apply an answer file, see [DISM Unattended Servicing Command-Line Options](dism-unattended-servicing-command-line-options.md).

    The .inf files referenced in the path in the answer file are added to the Windows image.

10. Review the list of third-party driver (.inf) files in the Windows image. Drivers added to the Windows image are named Oem\*.inf. This is to guarantee that all new drivers that are added to the computer are uniquely named. For example, the files MyDriver1.inf and MyDriver2.inf are renamed Oem0.inf and Oem1.inf.

    For example, type:

    ``` syntax
    Dism /Image:C:\test\offline /Get-Drivers 
    ```

11. Unmount the .wim file and commit the changes. For example, type:

    ``` syntax
    Dism /Unmount-Image /MountDir:C:\test\offline /Commit
    ```

If you need drivers for WinPE to see the local hard disk drive or a network, you must use the **windowsPE** configuration pass of an answer file to add drivers to the WinPE driver store and to reflect boot-critical drivers required by WinPE. For more information, see [Add Device Drivers to Windows During Windows Setup](add-device-drivers-to-windows-during-windows-setup.md).

## <span id="related_topics"></span>Related topics


[Device Drivers and Deployment Overview](device-drivers-and-deployment-overview.md)

[Add Device Drivers to Windows During Windows Setup](add-device-drivers-to-windows-during-windows-setup.md)

[DISM - Deployment Image Servicing and Management Technical Reference for Windows](dism---deployment-image-servicing-and-management-technical-reference-for-windows.md)

 

 






