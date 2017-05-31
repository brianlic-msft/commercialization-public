---
Description: 'This section shows you how to add a fictitious driver and an MCSF customization setting as part of the package.'
ms.assetid: 9d776681-9006-4dd5-b69e-fb195a888f7d
MSHAttr: 'PreferredLib:/library'
author: CelesteDG
title: Create mobile packages
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Create mobile packages


In Windows 10 Mobile, packages make up the building blocks for the OS and they can contain all the files, libraries, registry settings, executables, and data on the mobile device. Every OS component, from device drivers to system files, must be contained in a package.

As an OEM, if you have device-specific drivers or customizations that you want to add to the OS, you need to create a package. This section shows you how to add a fictitious driver and an MCSF customization setting as part of the package.

For more detailed information about mobile packages, including specifying other components and package merging, see [Creating mobile packages](https://msdn.microsoft.com/library/dn756642).

### <span id="add_a_driver_component"></span><span id="ADD_A_DRIVER_COMPONENT"></span>Add a driver component

To learn more about drivers and get started on writing your own, see [Device and Driver Technologies](https://msdn.microsoft.com/library/windows/hardware/ff557557).

In this walkthrough, we're downloading the sample echo KMDF driver, converting it to a universal Windows driver, and then using Visual Studio to create a package file.

**To add a driver**

1.  Download the echo universal driver sample.

    1.  Download the master.zip file and save it to your local hard drive: <https://github.com/microsoft/windows-driver-samples/archive/master.zip>.

    2.  Extract all the contents of the master.zip file. Specify a new folder, such as *C:\\DriverSamples*, or browse to an existing one to store the extracted files.

    3.  After the files are extracted, go to the general\\echo\\kmdf subfolder within the folder where you saved the extracted files to find the driver solution for the echo driver sample. For example, if you created a *C:\\DriverSamples* folder in the previous step, you can locate the driver solution under *C:\\DriverSamples\\general\\echo\\kmdf*.

2.  Convert the existing echo driver project to a universal Windows driver project.

    1.  In Visual Studio 2015, open the existing kmdfecho driver project, kmdfecho.sln.

    2.  Location the Solution Explorer in Visual Studio. In the Solution Explorer pane, right-click on **Solution 'kmdfecho' (3 projects)** and choose **Configuration Manager**.

    3.  In the **Configuration Manager** window, set the target operating system to **Windows 10**.

    4.  Right-click on the driver project and then choose **Properties**. Under **Configuration Manager** &gt; **Driver**, verify that the **Target Platform** is set to **Universal**.

        Other choices in **Target Platform** include **Mobile**. You may select this option if you want to build a driver that runs on Windows 10 Mobile only.

3.  From Visual Studio 2015, use PkgGen to generate a package file.

    1.  Right-click on the driver project and choose **Add**-&gt;**New Item**.

    2.  Under **Visual C++** &gt; **Windows Driver**, choose **Package Manifest**, and then click **Add**.

        Visual Studio adds a file called Package.pkg.xml to your driver project. You can right-click on the file and choose **Properties** to verify that the item type is set to **PkgGen**. On the same property page, you can set **Excluded from Build** to **Yes** if you decide later that you want to build this driver project and not generate a package file.

    3.  Click **OK**.

    4.  Right-click on the driver project and choose **Properties**. Under **Configuration Properties**, open the **PackageGen** node and change the **Version** to a any value that you like. For example, you can set the version to *1.0.0.0*.

    5.  Set the package **Owner**, **Component**, and **SubComponent** values.

4.  Right-click on the driver project and choose **Properties**. Set the test certificates to one of the OEM test certificates that was installed when you ran installoemcerts.cmd.

    For example, you can use CN=Windows Phone OEM Root 2013 (TEST ONLY).

5.  Save your work and then restart Visual Studio as an administrator.

6.  Build your driver. Visual Studio links against the required libraries and generates a .cat file, an .inf file, a driver binary, and an .spkg file.

    Once the driver is built, you should see a new folder named *ProjectName*.spkg, which contains the .cab and the .spkg.

    We will use the driver .spkg that you built in this walkthrough and combining it with the .spkg from the next walkthrough to build a mobile OS image.

To learn about how to run PkgGen.exe outside of Visual Studio, see the next section on adding a customization setting. Also see the *Run the pkggen.exe tool* section in [Creating mobile packages](https://msdn.microsoft.com/library/dn756642).

### <span id="add_an_mcsf_customization_setting"></span><span id="ADD_AN_MCSF_CUSTOMIZATION_SETTING"></span>Add an MCSF customization setting

In Windows 10 Mobile, there are two supported customization frameworks: Managed Centralized Settings Framework (MCSF) and Windows provisioning. For more information about these frameworks, see [Customizations for mobile devices](https://msdn.microsoft.com/library/windows/hardware/mt481438). When it comes to adding a custom OEM customization setting, only MCSF is extendable and available for OEMs to declare their own various mobile OS settings in a simple and consistent way that's similar to the Microsoft customization settings.

To learn how to use MCSF and the package XML schema to declare and access custom OEM settings, see the sections in [Managed Centralized Settings Framework (MCSF)](https://msdn.microsoft.com/library/windows/hardware/dn772150).

In this walkthrough, we're extending the [Configure Quick actions](https://msdn.microsoft.com/library/windows/hardware/dn757416) customization to use the MCSF schema to create a policy setting that exposes the various slots so that they can be easily configured later without having to remember the registry keys and values. To do this, we add the policy settings declarations in a .pkg.xml file and then build this file to create a package.

**To add a customization setting**

1.  Write the MCSF policy setting that corresponds to the following registry key:

    ``` syntax
    $(HKLM.SOFTWARE)\Microsoft\Shell\OEM\QuickActions\Slot\X
    Type:  REG_SZ
    Possible values:  
       Microsoft.QuickAction.AllSettings
       Microsoft.QuickAction.Connect
       Microsoft.QuickAction.Note
       Microsoft.QuickAction.Flashlight
       Microsoft.QuickAction.RotationLock
       Microsoft.QuickAction.BatterySaver
       Microsoft.QuickAction.Bluetooth
       Microsoft.QuickAction.WiFi
       Microsoft.QuickAction.AirplaneMode
       Microsoft.QuickAction.Vpn
       Microsoft.QuickAction.Cellular
       Microsoft.QuickAction.MobileHotspot
       Microsoft.QuickAction.Camera
       Microsoft.QuickAction.Brightness
       Microsoft.QuickAction.QuietHours
       Microsoft.QuickAction.Location
    ```

    The *X* in the registry key should be replaced with the slot number being configured (beginning with 1). Slots are ordered right-to-left. There is a maximum of 5 slots on a large screen mobile device while mobile devices without a large screen have 4 slots.

    The following code example shows how the MCSF policy settings for the quick actions can be declared:

    ``` syntax
        <SettingsGroup Path="Notifications/QuickActions">  
          <!-- Default Quick actions configuration -->  
          <Setting Name="QuickActionSlot1" Description="App to place in quick action slot 1.">  
            <RegistrySource Path="$(hklm.software)\Microsoft\Shell\OEM\QuickActions\Slot\1" Type="REG_SZ" Default="Microsoft.QuickAction.AllSettings" />  
            <Validate>
               <!-- Shows the available options for the quick action slot -->
               <Option Value="Microsoft.QuickAction.AllSettings" FriendlyName="All settings" />
               <Option Value="Microsoft.QuickAction.Connect" FriendlyName="Connect" />
               <Option Value="Microsoft.QuickAction.Note" FriendlyName="Note" />
               <Option Value="Microsoft.QuickAction.Flashlight" FriendlyName="Flashlight" />
               <Option Value="Microsoft.QuickAction.RotationLock" FriendlyName="Rotation lock" />
               <Option Value="Microsoft.QuickAction.BatterySaver" FriendlyName="Battery saver" />
               <Option Value="Microsoft.QuickAction.Bluetooth" FriendlyName="Bluetooth" />
               <Option Value="Microsoft.QuickAction.WiFi" FriendlyName="Wi-Fi" />
               <Option Value="Microsoft.QuickAction.AirplaneMode" FriendlyName="Airplane mode" />
               <Option Value="Microsoft.QuickAction.Vpn" FriendlyName="VPN" />
               <Option Value="Microsoft.QuickAction.Cellular" FriendlyName="Cellular" />
               <Option Value="Microsoft.QuickAction.MobileHotspot" FriendlyName="Mobile hotspot" />
               <Option Value="Microsoft.QuickAction.Camera" FriendlyName="Camera" />
               <Option Value="Microsoft.QuickAction.Brightness" FriendlyName="Brightness" />
               <Option Value="Microsoft.QuickAction.QuietHours" FriendlyName="Quiet hours" />
               <Option Value="Microsoft.QuickAction.Location" FriendlyName="Location" />
            </Validate>
          </Setting>  
          <Setting Name="QuickActionSlot2" Description="App to place in quick action slot 2.">  
            <RegistrySource Path="$(hklm.software)\Microsoft\Shell\OEM\QuickActions\Slot\2" Type="REG_SZ" Default="Microsoft.QuickAction.RotationLock" />  
            <Validate>
               <!-- Shows the available options for the quick action slot -->
               <Option Value="Microsoft.QuickAction.AllSettings" FriendlyName="All settings" />
               <Option Value="Microsoft.QuickAction.Connect" FriendlyName="Connect" />
               <Option Value="Microsoft.QuickAction.Note" FriendlyName="Note" />
               <Option Value="Microsoft.QuickAction.Flashlight" FriendlyName="Flashlight" />
               <Option Value="Microsoft.QuickAction.RotationLock" FriendlyName="Rotation lock" />
               <Option Value="Microsoft.QuickAction.BatterySaver" FriendlyName="Battery saver" />
               <Option Value="Microsoft.QuickAction.Bluetooth" FriendlyName="Bluetooth" />
               <Option Value="Microsoft.QuickAction.WiFi" FriendlyName="Wi-Fi" />
               <Option Value="Microsoft.QuickAction.AirplaneMode" FriendlyName="Airplane mode" />
               <Option Value="Microsoft.QuickAction.Vpn" FriendlyName="VPN" />
               <Option Value="Microsoft.QuickAction.Cellular" FriendlyName="Cellular" />
               <Option Value="Microsoft.QuickAction.MobileHotspot" FriendlyName="Mobile hotspot" />
               <Option Value="Microsoft.QuickAction.Camera" FriendlyName="Camera" />
               <Option Value="Microsoft.QuickAction.Brightness" FriendlyName="Brightness" />
               <Option Value="Microsoft.QuickAction.QuietHours" FriendlyName="Quiet hours" />
               <Option Value="Microsoft.QuickAction.Location" FriendlyName="Location" />
            </Validate>     
          </Setting> 
          <Setting Name="QuickActionSlot3" Description="App to place in quick action slot 3.">  
            <RegistrySource Path="$(hklm.software)\Microsoft\Shell\OEM\QuickActions\Slot\3" Type="REG_SZ" Default="Microsoft.QuickAction.Bluetooth" />  
            <Validate>
               <!-- Shows the available options for the quick action slot -->
               <Option Value="Microsoft.QuickAction.AllSettings" FriendlyName="All settings" />
               <Option Value="Microsoft.QuickAction.Connect" FriendlyName="Connect" />
               <Option Value="Microsoft.QuickAction.Note" FriendlyName="Note" />
               <Option Value="Microsoft.QuickAction.Flashlight" FriendlyName="Flashlight" />
               <Option Value="Microsoft.QuickAction.RotationLock" FriendlyName="Rotation lock" />
               <Option Value="Microsoft.QuickAction.BatterySaver" FriendlyName="Battery saver" />
               <Option Value="Microsoft.QuickAction.Bluetooth" FriendlyName="Bluetooth" />
               <Option Value="Microsoft.QuickAction.WiFi" FriendlyName="Wi-Fi" />
               <Option Value="Microsoft.QuickAction.AirplaneMode" FriendlyName="Airplane mode" />
               <Option Value="Microsoft.QuickAction.Vpn" FriendlyName="VPN" />
               <Option Value="Microsoft.QuickAction.Cellular" FriendlyName="Cellular" />
               <Option Value="Microsoft.QuickAction.MobileHotspot" FriendlyName="Mobile hotspot" />
               <Option Value="Microsoft.QuickAction.Camera" FriendlyName="Camera" />
               <Option Value="Microsoft.QuickAction.Brightness" FriendlyName="Brightness" />
               <Option Value="Microsoft.QuickAction.QuietHours" FriendlyName="Quiet hours" />
               <Option Value="Microsoft.QuickAction.Location" FriendlyName="Location" />
            </Validate>
          </Setting> 
          <Setting Name="QuickActionSlot4" Description="App to place in quick action slot 4.">  
            <RegistrySource Path="$(hklm.software)\Microsoft\Shell\OEM\QuickActions\Slot\4" Type="REG_SZ" Default="Microsoft.QuickAction.WiFi" />  
            <Validate>
               <!-- Shows the available options for the quick action slot -->
               <Option Value="Microsoft.QuickAction.AllSettings" FriendlyName="All settings" />
               <Option Value="Microsoft.QuickAction.Connect" FriendlyName="Connect" />
               <Option Value="Microsoft.QuickAction.Note" FriendlyName="Note" />
               <Option Value="Microsoft.QuickAction.Flashlight" FriendlyName="Flashlight" />
               <Option Value="Microsoft.QuickAction.RotationLock" FriendlyName="Rotation lock" />
               <Option Value="Microsoft.QuickAction.BatterySaver" FriendlyName="Battery saver" />
               <Option Value="Microsoft.QuickAction.Bluetooth" FriendlyName="Bluetooth" />
               <Option Value="Microsoft.QuickAction.WiFi" FriendlyName="Wi-Fi" />
               <Option Value="Microsoft.QuickAction.AirplaneMode" FriendlyName="Airplane mode" />
               <Option Value="Microsoft.QuickAction.Vpn" FriendlyName="VPN" />
               <Option Value="Microsoft.QuickAction.Cellular" FriendlyName="Cellular" />
               <Option Value="Microsoft.QuickAction.MobileHotspot" FriendlyName="Mobile hotspot" />
               <Option Value="Microsoft.QuickAction.Camera" FriendlyName="Camera" />
               <Option Value="Microsoft.QuickAction.Brightness" FriendlyName="Brightness" />
               <Option Value="Microsoft.QuickAction.QuietHours" FriendlyName="Quiet hours" />
               <Option Value="Microsoft.QuickAction.Location" FriendlyName="Location" />
            </Validate>
          </Setting> 
          <Setting Name="QuickActionSlot5" Description="App to place in quick action slot 5.">  
            <RegistrySource Path="$(hklm.software)\Microsoft\Shell\OEM\QuickActions\Slot\5" Type="REG_SZ" Default="Microsoft.QuickAction.Camera" />  
            <Validate>
               <!-- Shows the available options for the quick action slot -->
               <Option Value="Microsoft.QuickAction.AllSettings" FriendlyName="All settings" />
               <Option Value="Microsoft.QuickAction.Connect" FriendlyName="Connect" />
               <Option Value="Microsoft.QuickAction.Note" FriendlyName="Note" />
               <Option Value="Microsoft.QuickAction.Flashlight" FriendlyName="Flashlight" />
               <Option Value="Microsoft.QuickAction.RotationLock" FriendlyName="Rotation lock" />
               <Option Value="Microsoft.QuickAction.BatterySaver" FriendlyName="Battery saver" />
               <Option Value="Microsoft.QuickAction.Bluetooth" FriendlyName="Bluetooth" />
               <Option Value="Microsoft.QuickAction.WiFi" FriendlyName="Wi-Fi" />
               <Option Value="Microsoft.QuickAction.AirplaneMode" FriendlyName="Airplane mode" />
               <Option Value="Microsoft.QuickAction.Vpn" FriendlyName="VPN" />
               <Option Value="Microsoft.QuickAction.Cellular" FriendlyName="Cellular" />
               <Option Value="Microsoft.QuickAction.MobileHotspot" FriendlyName="Mobile hotspot" />
               <Option Value="Microsoft.QuickAction.Camera" FriendlyName="Camera" />
               <Option Value="Microsoft.QuickAction.Brightness" FriendlyName="Brightness" />
               <Option Value="Microsoft.QuickAction.QuietHours" FriendlyName="Quiet hours" />
               <Option Value="Microsoft.QuickAction.Location" FriendlyName="Location" />
            </Validate>
          </Setting> 
        </SettingsGroup>
    ```

2.  Create a .pkg.xml file and add the policy settings in the previous step to the .pkg.xml file. The following example shows how to do this.

    ```XML
    <?xml version="1.0" encoding="utf-8">
    <Package xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
      Owner=""
      Component=""
      SubComponent=""
      OwnerType="OEM"
      ReleaseType="">
       <Components>
        <SettingsGroup Path="Notifications/QuickActions">  
          <!-- Default Quick actions configuration -->  
          <Setting Name="QuickActionSlot1" Description="App to place in quick action slot 1.">  
            <RegistrySource Path="$(hklm.software)\Microsoft\Shell\OEM\QuickActions\Slot\1" Type="REG_SZ" Default="Microsoft.QuickAction.AllSettings" />  
            <Validate>
               <!-- Shows the available options for the quick action slot -->
               <Option Value="Microsoft.QuickAction.AllSettings" FriendlyName="All settings" />
               <Option Value="Microsoft.QuickAction.Connect" FriendlyName="Connect" />
               <Option Value="Microsoft.QuickAction.Note" FriendlyName="Note" />
               <Option Value="Microsoft.QuickAction.Flashlight" FriendlyName="Flashlight" />
               <Option Value="Microsoft.QuickAction.RotationLock" FriendlyName="Rotation lock" />
               <Option Value="Microsoft.QuickAction.BatterySaver" FriendlyName="Battery saver" />
               <Option Value="Microsoft.QuickAction.Bluetooth" FriendlyName="Bluetooth" />
               <Option Value="Microsoft.QuickAction.WiFi" FriendlyName="Wi-Fi" />
               <Option Value="Microsoft.QuickAction.AirplaneMode" FriendlyName="Airplane mode" />
               <Option Value="Microsoft.QuickAction.Vpn" FriendlyName="VPN" />
               <Option Value="Microsoft.QuickAction.Cellular" FriendlyName="Cellular" />
               <Option Value="Microsoft.QuickAction.MobileHotspot" FriendlyName="Mobile hotspot" />
               <Option Value="Microsoft.QuickAction.Camera" FriendlyName="Camera" />
               <Option Value="Microsoft.QuickAction.Brightness" FriendlyName="Brightness" />
               <Option Value="Microsoft.QuickAction.QuietHours" FriendlyName="Quiet hours" />
               <Option Value="Microsoft.QuickAction.Location" FriendlyName="Location" />
            </Validate>
          </Setting>  
          <Setting Name="QuickActionSlot2" Description="App to place in quick action slot 2.">  
            <RegistrySource Path="$(hklm.software)\Microsoft\Shell\OEM\QuickActions\Slot\2" Type="REG_SZ" Default="Microsoft.QuickAction.RotationLock" />  
            <Validate>
               <!-- Shows the available options for the quick action slot -->
               <Option Value="Microsoft.QuickAction.AllSettings" FriendlyName="All settings" />
               <Option Value="Microsoft.QuickAction.Connect" FriendlyName="Connect" />
               <Option Value="Microsoft.QuickAction.Note" FriendlyName="Note" />
               <Option Value="Microsoft.QuickAction.Flashlight" FriendlyName="Flashlight" />
               <Option Value="Microsoft.QuickAction.RotationLock" FriendlyName="Rotation lock" />
               <Option Value="Microsoft.QuickAction.BatterySaver" FriendlyName="Battery saver" />
               <Option Value="Microsoft.QuickAction.Bluetooth" FriendlyName="Bluetooth" />
               <Option Value="Microsoft.QuickAction.WiFi" FriendlyName="Wi-Fi" />
               <Option Value="Microsoft.QuickAction.AirplaneMode" FriendlyName="Airplane mode" />
               <Option Value="Microsoft.QuickAction.Vpn" FriendlyName="VPN" />
               <Option Value="Microsoft.QuickAction.Cellular" FriendlyName="Cellular" />
               <Option Value="Microsoft.QuickAction.MobileHotspot" FriendlyName="Mobile hotspot" />
               <Option Value="Microsoft.QuickAction.Camera" FriendlyName="Camera" />
               <Option Value="Microsoft.QuickAction.Brightness" FriendlyName="Brightness" />
               <Option Value="Microsoft.QuickAction.QuietHours" FriendlyName="Quiet hours" />
               <Option Value="Microsoft.QuickAction.Location" FriendlyName="Location" />
            </Validate>     
          </Setting> 
          <Setting Name="QuickActionSlot3" Description="App to place in quick action slot 3.">  
            <RegistrySource Path="$(hklm.software)\Microsoft\Shell\OEM\QuickActions\Slot\3" Type="REG_SZ" Default="Microsoft.QuickAction.Bluetooth" />  
            <Validate>
               <!-- Shows the available options for the quick action slot -->
               <Option Value="Microsoft.QuickAction.AllSettings" FriendlyName="All settings" />
               <Option Value="Microsoft.QuickAction.Connect" FriendlyName="Connect" />
               <Option Value="Microsoft.QuickAction.Note" FriendlyName="Note" />
               <Option Value="Microsoft.QuickAction.Flashlight" FriendlyName="Flashlight" />
               <Option Value="Microsoft.QuickAction.RotationLock" FriendlyName="Rotation lock" />
               <Option Value="Microsoft.QuickAction.BatterySaver" FriendlyName="Battery saver" />
               <Option Value="Microsoft.QuickAction.Bluetooth" FriendlyName="Bluetooth" />
               <Option Value="Microsoft.QuickAction.WiFi" FriendlyName="Wi-Fi" />
               <Option Value="Microsoft.QuickAction.AirplaneMode" FriendlyName="Airplane mode" />
               <Option Value="Microsoft.QuickAction.Vpn" FriendlyName="VPN" />
               <Option Value="Microsoft.QuickAction.Cellular" FriendlyName="Cellular" />
               <Option Value="Microsoft.QuickAction.MobileHotspot" FriendlyName="Mobile hotspot" />
               <Option Value="Microsoft.QuickAction.Camera" FriendlyName="Camera" />
               <Option Value="Microsoft.QuickAction.Brightness" FriendlyName="Brightness" />
               <Option Value="Microsoft.QuickAction.QuietHours" FriendlyName="Quiet hours" />
               <Option Value="Microsoft.QuickAction.Location" FriendlyName="Location" />
            </Validate>
          </Setting> 
          <Setting Name="QuickActionSlot4" Description="App to place in quick action slot 4.">  
            <RegistrySource Path="$(hklm.software)\Microsoft\Shell\OEM\QuickActions\Slot\4" Type="REG_SZ" Default="Microsoft.QuickAction.WiFi" />  
            <Validate>
               <!-- Shows the available options for the quick action slot -->
               <Option Value="Microsoft.QuickAction.AllSettings" FriendlyName="All settings" />
               <Option Value="Microsoft.QuickAction.Connect" FriendlyName="Connect" />
               <Option Value="Microsoft.QuickAction.Note" FriendlyName="Note" />
               <Option Value="Microsoft.QuickAction.Flashlight" FriendlyName="Flashlight" />
               <Option Value="Microsoft.QuickAction.RotationLock" FriendlyName="Rotation lock" />
               <Option Value="Microsoft.QuickAction.BatterySaver" FriendlyName="Battery saver" />
               <Option Value="Microsoft.QuickAction.Bluetooth" FriendlyName="Bluetooth" />
               <Option Value="Microsoft.QuickAction.WiFi" FriendlyName="Wi-Fi" />
               <Option Value="Microsoft.QuickAction.AirplaneMode" FriendlyName="Airplane mode" />
               <Option Value="Microsoft.QuickAction.Vpn" FriendlyName="VPN" />
               <Option Value="Microsoft.QuickAction.Cellular" FriendlyName="Cellular" />
               <Option Value="Microsoft.QuickAction.MobileHotspot" FriendlyName="Mobile hotspot" />
               <Option Value="Microsoft.QuickAction.Camera" FriendlyName="Camera" />
               <Option Value="Microsoft.QuickAction.Brightness" FriendlyName="Brightness" />
               <Option Value="Microsoft.QuickAction.QuietHours" FriendlyName="Quiet hours" />
               <Option Value="Microsoft.QuickAction.Location" FriendlyName="Location" />
            </Validate>
          </Setting> 
          <Setting Name="QuickActionSlot5" Description="App to place in quick action slot 5.">  
            <RegistrySource Path="$(hklm.software)\Microsoft\Shell\OEM\QuickActions\Slot\5" Type="REG_SZ" Default="Microsoft.QuickAction.Camera" />  
            <Validate>
               <!-- Shows the available options for the quick action slot -->
               <Option Value="Microsoft.QuickAction.AllSettings" FriendlyName="All settings" />
               <Option Value="Microsoft.QuickAction.Connect" FriendlyName="Connect" />
               <Option Value="Microsoft.QuickAction.Note" FriendlyName="Note" />
               <Option Value="Microsoft.QuickAction.Flashlight" FriendlyName="Flashlight" />
               <Option Value="Microsoft.QuickAction.RotationLock" FriendlyName="Rotation lock" />
               <Option Value="Microsoft.QuickAction.BatterySaver" FriendlyName="Battery saver" />
               <Option Value="Microsoft.QuickAction.Bluetooth" FriendlyName="Bluetooth" />
               <Option Value="Microsoft.QuickAction.WiFi" FriendlyName="Wi-Fi" />
               <Option Value="Microsoft.QuickAction.AirplaneMode" FriendlyName="Airplane mode" />
               <Option Value="Microsoft.QuickAction.Vpn" FriendlyName="VPN" />
               <Option Value="Microsoft.QuickAction.Cellular" FriendlyName="Cellular" />
               <Option Value="Microsoft.QuickAction.MobileHotspot" FriendlyName="Mobile hotspot" />
               <Option Value="Microsoft.QuickAction.Camera" FriendlyName="Camera" />
               <Option Value="Microsoft.QuickAction.Brightness" FriendlyName="Brightness" />
               <Option Value="Microsoft.QuickAction.QuietHours" FriendlyName="Quiet hours" />
               <Option Value="Microsoft.QuickAction.Location" FriendlyName="Location" />
            </Validate>
          </Setting> 
        </SettingsGroup>
       </Components>
    </Package>
    ```

3.  Add values for the **Owner**, **Component**, **SubComponent**, and **ReleaseType** elements. For example:

    -   **Owner**="Contoso"
    -   **Component**="Customization.Notifications"
    -   **SubComponent**="QuickActions"
    -   **ReleaseType**="Test"

    To learn more about the elements and attributes, see [Primary elements and attributes of a package project file](https://msdn.microsoft.com/library/dn756796).

4.  Name and save the .pkg.xml file as "QuickActions.pkg.xml".

5.  Generate a package, or .spkg file, using the "QuickActions.pkg.xml" as input. For more information, see *Run the pkggen.exe tool* in [Creating mobile packages](https://msdn.microsoft.com/library/dn756642).

    **To generate a package using QuickActions.pkg.xml**

    1.  Open a command line with administrator privileges.

    2.  Enter the following command to build a package from QuickActions.pkg.xml.

        **PkgGen QuickActions.pkg.xml /config:"%WPDKCONTENTROOT%\\Tools\\bin\\i386\\pkggen.cfg.xml"**

        This command will generate a package called Customization.Notifications.QuickActions.spkg. In the next section, we will use this package and add it to a feature manifest file.

 

 



