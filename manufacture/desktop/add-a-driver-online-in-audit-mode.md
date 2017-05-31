---
author: Justinha
Description: Add a Driver Online in Audit Mode
ms.assetid: 3b7e2d24-4bd4-4ca3-8e6f-2bd771ebab3b
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Add a Driver Online in Audit Mode
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Add a Driver Online in Audit Mode


You can use an answer file to automate the installation of device drivers when the computer is booted in audit mode.

## <span id="bkmk_2"></span><span id="BKMK_2"></span>Adding a Device Driver


The [auditSystem](auditsystem.md) configuration pass processes unattended Setup settings while Windows is running in system context, before a user logs on to the computer in audit mode. The **auditSystem** configuration pass runs only if the computer is booted in audit mode. To add device drivers during the **auditSystem** configuration pass, add the [Microsoft-Windows-PnpCustomizationsNonWinPE](https://msdn.microsoft.com/library/windows/hardware/dn923009) component to your answer file in the **auditSystem** configuration pass, and specify the path for each device driver. After you run Setup, boot Windows in audit mode. You can run the **Sysprep** command with the **/audit** option to configure the computer to start in audit mode the next time that it boots. Or, in the answer file, you can configure the Microsoft-Windows-Deployment\\Reseal\\`Mode` setting to **audit**. For more information, see [Unattended Windows Setup Reference](https://msdn.microsoft.com/library/windows/hardware/dn923277).

### <span id="To_add_a_device_driver_during_the_auditSystem_configuration_pass"></span><span id="to_add_a_device_driver_during_the_auditsystem_configuration_pass"></span><span id="TO_ADD_A_DEVICE_DRIVER_DURING_THE_AUDITSYSTEM_CONFIGURATION_PASS"></span>To add a device driver during the auditSystem configuration pass

1.  Locate the .inf files that you want to install during audit mode for the device driver.

2.  On your technician computer, open Windows System Image Manager (Windows SIM). Click **Start**, type **Windows System Image Manager**, and then select **Windows System Image Manager**.

3.  Open your answer file and expand the **Components** node to display available settings.

4.  Add the Microsoft-Windows-PnpCustomizationsNonWinPE component to your answer file in the **auditSystem** configuration pass.

5.  Expand the **Microsoft-Windows-PnpCustomizationsNonWinPE** node in the answer file. Right-click **DevicePaths**, and then click **Insert New PathAndCredentials**.

    A new **PathAndCredentials** list item appears.

6.  For each location that you access, add a separate **PathAndCredentials** list item.

7.  In the Microsoft-Windows-PnpCustomizationsNonWinPE component, specify the path of the device driver and the credentials that are used to access the file if the file is on a network share.

    **Note**  
    You can include multiple device-driver paths by adding multiple **PathAndCredentials** list items. If you add multiple list items, you must increment the value of `Key` for each path. For example, if you add two separate driver paths, the first path uses the `Key` value of **1**, and the second path uses the `Key` value of **2**.

     

8.  Save the answer file and close Windows SIM. The answer file must resemble this example:

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?> 
    <unattend xmlns="urn:schemas-microsoft-com:unattend">
       <settings pass="auditSystem">
          <component name="Microsoft-Windows-PnpCustomizationsNonWinPE" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
             <DriverPaths>
                <PathAndCredentials wcm:keyValue="1" wcm:action="add">
                   <Credentials>
                      <Domain>Fabrikam</Domain> 
                      <Password>MyPassword</Password> 
                      <Username>MyUserName</Username> 
                   </Credentials>
                   <Path>\\networkshare\share\drivers</Path> 
                </PathAndCredentials>
             </DriverPaths>
          </component>
       </settings>
    </unattend>
    ```

9.  Boot in Windows Preinstallation Environment (Windows PE), run Windows Setup, and specify the name of the answer file. For example:

    ``` syntax
    Setup /unattend:C:\unattend.xml
    ```

    The specified answer file is cached to the system so that when you run audit mode, the computer applies settings in the answer file.

    Setup finishes.

10. Run the **Sysprep** command with the **/audit** option to configure the computer to start in audit mode the next time that it boots. For example:

    ``` syntax
    Sysprep /audit /reboot
    ```

    When Windows reboots in audit mode, device drivers that you specified in the answer file are added.

You can use the PNPUtil tool to add, remove, and enumerate drivers on a running operating system. For more information about how to use PNPUtil to add or remove Plug and Play drivers, see [Install a Plug and Play Device](http://go.microsoft.com/fwlink/?LinkId=139151).

## <span id="related_topics"></span>Related topics


[Device Drivers and Deployment Overview](device-drivers-and-deployment-overview.md)

[Add Device Drivers to Windows During Windows Setup](add-device-drivers-to-windows-during-windows-setup.md)

[DISM Driver Servicing Command-Line Options](dism-driver-servicing-command-line-options-s14.md)

[Add and Remove Drivers to an Offline Windows Image](add-and-remove-drivers-to-an-offline-windows-image.md)

[Audit Mode Overview](audit-mode-overview.md)

[Boot Windows to Audit Mode or OOBE](boot-windows-to-audit-mode-or-oobe.md)

 

 






