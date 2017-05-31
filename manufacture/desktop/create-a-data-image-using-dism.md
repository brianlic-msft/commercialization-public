---
author: Justinha
Description: Create a Data Image Using DISM
ms.assetid: e182335f-fe0e-4e85-8c2b-807d22af6d4b
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Create a Data Image Using DISM
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Create a Data Image Using DISM


To add applications, files, and other resources to Windows® during an installation, you can create a data image. By using the Deployment Image Servicing and Management (DISM) tool, you can create additional Windows image (.wim) files that contain only files and applications that you intend to copy to the Windows installation.

Data images enable you to add:

-   Applications, files, scripts, and other resources to Windows during an installation.

-   Files, resources, and other data to a partition other than the operating system partition.

**Note**  
Data images must be used only to add new files to a Windows installation. Do not use data images to replace existing Windows files. Overwriting operating system data is unsupported.

 

Previous methods of transferring data to a Windows installation required the use of $OEM$ folders. These folder structures are still supported, but data images provide an easier and more efficient means of transferring additional data to Windows.

In unattended installations, the Windows image to install is specified by the `OSImage` setting in the Microsoft-Windows-Setup component. You can add one or more `DataImage` settings in the Microsoft-Windows-Setup component that represent additional data images that you add to the system. For more information, see the Windows® Unattended Setup Reference.

**To create a data image**

1.  Locate the data that you will create a data image for.

2.  Open a command prompt as an administrator, or boot the computer to Windows PE to open the Windows PE command prompt.

3.  Use DISM to compress your data files to a .wim file. For example:

    ``` syntax
    Dism /Capture-Image /ImageFile:c:\data\myData.wim /CaptureDir:C:\data\dataFiles /Name:MyData
    ```

    In this example, everything under the C:\\Data\\DataFiles directory is added to the .wim file and the .wim file is given the label "MyData". All files and folders under C:\\Data\\DataFiles are extracted to the root of the drive specified in the answer file.

    For more information about how to use DISM, see [DISM Image Management Command-Line Options](dism-image-management-command-line-options-s14.md).

4.  Copy the data image to an available location such as another partition or a network share during Windows Setup.

**To add a data image path to an answer file**

1.  Use Windows System Image Manager (Windows SIM) to create an answer file that contains the path to the data image to install and the location for the installation.

2.  Add the Microsoft-Windows-Setup\\`DataImage` settings to the appropriate configuration pass for your environment. For example: `windowsPE`.

3.  Save the answer file and close Windows SIM.

    The answer file must resemble the following example:

    ``` syntax
       <settings pass="windowsPE">
          <component name="Microsoft-Windows-Setup" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
             <ImageInstall>
                <DataImage wcm:action="add">
                   <InstallTo>
                      <DiskID>0</DiskID>
                      <PartitionID>1</PartitionID>
                   </InstallTo>
                   <InstallFrom>
                      <Credentials>
                         <Domain>Fabrikam</Domain>
                         <Username>MyUsername</Username>
                         <Password>MyPassword</Password>
                      </Credentials>
                   <Path>\\networkshare\share\MyData.wim</Path>
                   </InstallFrom>
                      <Order>1</Order>
                </DataImage>
             </ImageInstall>
          </component>
       </settings>
    ```

4.  Run Setup.exe, specifying the location of the answer file. For example:

    ``` syntax
    setup /unattend:C:\unattend.xml
    ```

All the files and folders specified in the data image are extracted to the root of the drive during installation. Executable files and scripts are not run when the data image is applied; they are only copied to the drive. You can use `FirstLogonCommands` to specify commands to run the first time a user logs on to the computer. For more information about `FirstLogonCommands`, see the Windows® Unattended Setup Reference.

 

 





