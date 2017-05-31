---
author: Justinha
Description: Export or Import Default Application Associations
ms.assetid: 87eb7510-df1a-4e3f-9cd4-5400fa6e1a07
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Export or Import Default Application Associations
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Export or Import Default Application Associations


You can use the Deployment Image Servicing and Management (DISM) tool to change the default programs associated with a file name extension or protocol in a Windows® image.

## <span id="Generate_Default_Application_Associations_XML_File"></span><span id="generate_default_application_associations_xml_file"></span><span id="GENERATE_DEFAULT_APPLICATION_ASSOCIATIONS_XML_FILE"></span>Generate Default Application Associations XML File


Deploy your Windows image to a test computer and configure the programs that are included in your image. You can log into Windows and use Control Panel to select your default application associations. You can export the default application associations that you have configured to an XML file on a network share or removable media so that you can import them into the WIM or VHD file before you deploy it to your destination computers.

**Set default application associations**

1.  Install your Windows image to a test computer. For more information about how to apply a Windows image, see [Apply Images Using DISM](apply-images-using-dism.md).

2.  Start the test computer and complete Windows Setup.

3.  Click **Search**, click **Settings**, and then type **Default Programs**. Click **Default Programs**.

4.  You can configure default programs by file name extension or by application. For example, to set an installed photo viewing application as the default program that is used to open all of the file types and protocols that it supports, click **Set your default programs**, click the photo viewing application in the program list, and then click **Set this program as default**.

**Export default application association settings**

1.  On your test computer, open a command prompt with administrative credentials. If you are using a version of Windows other than Windows 8, use the Deployment Tools Command Prompt installed with the ADK or navigate to the DISM directory on your local computer.

2.  Export the default application association settings from the test computer to an .xml file on a network share or USB drive. For example, at a command prompt type the following command:

    ``` syntax
    Dism /Online /Export-DefaultAppAssociations:\\Server\Share\AppAssoc.xml
    ```

    Where:

    -   Server is the name of the server or computer that contains the share that you will export the default application association settings.

    -   Share is the name of the share where you will export the default application association settings.

## <span id="Add_or_Remove_Default_Application_Association_Settings_to_a_Windows_Image"></span><span id="add_or_remove_default_application_association_settings_to_a_windows_image"></span><span id="ADD_OR_REMOVE_DEFAULT_APPLICATION_ASSOCIATION_SETTINGS_TO_A_WINDOWS_IMAGE"></span>Add or Remove Default Application Association Settings to a Windows Image


You can change the default application association settings in a WIM or VHD file before you deploy it to your destination computers. You can also add and remove default application association settings from an online image.

**Import default application association settings**

1.  On your technician computer, open a command prompt with administrative credentials. If you are using a version of Windows other than Windows 8, use the Deployment Tools Command Prompt installed with the ADK or navigate to the DISM directory on your local computer.

2.  Mount a Windows image from a WIM or VHD file. For example, at the command prompt type the following command:

    ``` syntax
    Dism /Mount-Image /ImageFile:C:\test\images\install.wim /Name:"Windows" /MountDir:C:\test\offline
    ```

3.  Import the .xml file that has the default application association settings to the Windows image. For example, at the command prompt type the following command:

    ``` syntax
    Dism.exe /Image:C:\test\offline /Import-DefaultAppAssociations:\\Server\Share\AppAssoc.xml
    ```

    Where:

    -   Server is the name of the server or computer that contains the share that you will export the default application association settings.

    -   Share is the name of the share where you will export the default application association settings.

**Review the default application association setting in an image**

1.  On your technician computer, open a command prompt with administrative credentials. If you are using a version of Windows other than Windows 8, use the Deployment Tools Command Prompt installed with the ADK or navigate to the DISM directory on your local computer.

2.  List the application associations that have been applied to the mounted image. For example, at the command prompt, type the following command:

    ``` syntax
    Dism.exe /Image:C:\test\offline /Get-DefaultAppAssociations
    ```

**Remove default application association settings**

1.  On your technician computer, open a command prompt with administrative credentials. If you are using a version of Windows other than Windows 8, use the Deployment Tools Command Prompt installed with the ADK or navigate to the DISM directory on your local computer.

2.  Remove the custom default application association that have been added to the mounted image. For example, at the command prompt type the following command:

    ``` syntax
    Dism.exe /Image:C:\test\offline /Remove-DefaultAppAssociations
    ```

 

 





