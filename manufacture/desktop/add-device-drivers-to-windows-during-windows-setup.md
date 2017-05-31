---
author: Justinha
Description: Add Device Drivers to Windows During Windows Setup
ms.assetid: adb22778-06a2-493a-81de-3a1306a0b208
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Add Device Drivers to Windows During Windows Setup
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Add Device Drivers to Windows During Windows Setup


To install Windows® on some hardware designs, you may need to add device drivers to Windows Setup. You can add drivers to Windows Setup by using an answer file that specifies the path to the driver files. To do this in new installations, you add the Microsoft-Windows-PnpCustomizationWinPE component during the [windowsPE](windowspe.md) configuration pass, add the driver paths, and then specify the answer file.

You can also modify existing images and add and remove drivers. You can service offline images in several ways. For example, you can add the Microsoft-Windows-PnpCustomizationsNonWinPE component during the [offlineServicing](offlineservicing.md) configuration pass, add or remove the driver paths, and then specify the name of the answer file. For more information about how to modify drivers on an offline Windows image by using an answer file, and also other methods of adding drivers to and removing drivers from an existing image, see [Add and Remove Drivers to an Offline Windows Image](add-and-remove-drivers-to-an-offline-windows-image.md).

## <span id="bkmk_1"></span><span id="BKMK_1"></span> Add Drivers to New Installations (windowsPE)


For new installations, you add drivers during the [windowsPE](windowspe.md) configuration pass.

This method initializes Windows Preinstallation Environment (Windows PE) and processes Windows PE settings from the answer file, as follows:

1.  Windows stages the Windows PE drivers in the RAM driver store.. Windows loads boot-critical drivers that Windows PE requires to access the local disk and network. When you right-click **DevicePaths** and select **Insert New PathAndCredentials into Windows PE**, Windows PE processes other Windows PE customizations that the answer file specifies.

2.  The Windows Setup process applies the Windows image. Boot-critical drivers appear on the Windows image before Setup installs that image. Other drivers that you added to the Windows PE driver store appear in the Windows image driver store. When Windows Setup processes the [offlineServicing](offlineservicing.md) pass, Windows Setup also adds any drivers that the driver path specifies to the Windows image driver store.

**To add a device driver during the windowsPE pass**

1.  Use Windows System Image Manager (Windows SIM) to create an answer file that contains the paths to the device drivers that you intend to install.

2.  Add the **Microsoft-Windows-PnpCustomizationsWinPE** component to your answer file in the [windowsPE](windowspe.md) configuration pass.

3.  Expand the **Microsoft-Windows-PnpCustomizationsWinPE** node in the answer file. Right-click **DevicePaths**, and then select **Insert New PathAndCredentials**.

    A new **PathAndCredentials** list item appears.

4.  For each location that you access, add a separate **PathAndCredentials** list item.

    You can include multiple device driver paths by adding multiple **PathAndCredentials** list items. If you add multiple list items, you must increment the `Key` value for each path. For example, if you add two separate driver paths, the first path uses the `Key` value of `1`, and the second path uses the `Key` value of `2`.

5.  Save the answer file, and then close Windows SIM. The answer file must resemble the following example:

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?> 
    <unattend xmlns="urn:schemas-microsoft-com:unattend">
       <settings pass="windowsPE">
          <component name="Microsoft-Windows-PnpCustomizationsWinPE" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
             <DriverPaths>
                <PathAndCredentials wcm:keyValue="1" wcm:action="add">
                   <Credentials>
                      <Domain>Fabrikam</Domain> 
                      <Password>MyPassword</Password> 
                      <Username>MyUserName</Username> 
                   </Credentials>
                   <Path>\\server\share\drivers</Path> 
                </PathAndCredentials>
             </DriverPaths>
          </component>
       </settings>
    </unattend>
    ```

6.  Boot to Windows PE.

7.  At a command prompt, run Windows Setup. Specify the name of the answer file. For example:

    ``` syntax
    Setup /unattend:C:\unattend.xml
    ```

    Windows Setup adds the device drivers in the \\\\server\\share\\drivers path to the system during the setup process.

For more information about drivers, see [Device Drivers and Deployment Overview](device-drivers-and-deployment-overview.md) and [Add a Driver Online in Audit Mode](add-a-driver-online-in-audit-mode.md). For more information about Windows components, see [Unattended Windows Setup Reference](http://go.microsoft.com/fwlink/?LinkId=206281).

## <span id="related_topics"></span>Related topics


[Windows Setup Technical Reference](windows-setup-technical-reference.md)

[Boot from a DVD](boot-from-a-dvd.md)

[Deploy a Custom Image](deploy-a-custom-image.md)

[Boot Windows to Audit Mode or OOBE](boot-windows-to-audit-mode-or-oobe.md)

[Use a Configuration Set with Windows Setup](use-a-configuration-set-with-windows-setup.md)

[Add a Custom Script to Windows Setup](add-a-custom-script-to-windows-setup.md)

 

 






