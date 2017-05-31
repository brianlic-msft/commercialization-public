---
title: Adding an LED notification option
description: OEMs can configure a registry key to specify a selected notification LED as the LED notification and then add an LED notification option to the device's messaging Settings screen.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: E3D7C1B9-ED2B-4808-995C-7D848C845A8E
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Adding an LED notification option


In Windows 10 Mobile, the notification LED on handheld devices may not turn on when a user receives a text message. To improve this user experience, OEMs can configure a registry key to specify a selected notification LED as the LED notification and then add an **LED notification** option to the device's messaging **Settings** screen.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  You must configure the **HardwareId** and **InstanceId** registry keys to enable LED notification on the device. In the following example, you must change the value of **HardwareId** to match your device ID (DeviceId).

    ``` syntax
      [HKEY_LOCAL_MACHINE\Microsoft\Shell\Nocontrol\LedAlert]
       "HardwareId"="ACPI\\QCOM0D50"   
       "InstanceId"=dword:0
    ```

    **HardwareId** specifies the HardwareId for the LED while **InstanceId** specifies the InstanceId for the selected notification LED.

    If the OS correctly detects the LED, the following registry keys will also be populated. Otherwise, they will not be created.

    ``` syntax
      "LedHwAvailable"=dword:00000001
       "Intensity"=dword:00000064 
       "Period"=dword:000007d0 
       "Dutycycle"=dword:0000003c 
       "Cyclecount"=dword:ffffffff 
    ```

    Where:

    -   **Intensity** - Denotes the intensity, from 0-100%
    -   **Period** - Specifies the period, in milliseconds
    -   **Dutycycle** - Specifies the duty cycle, from 0-100%
    -   **Cyclecount** - Specifies the number of repetitions per cycle

2.  To add the registry keys and their values to the OS image, create a new .pkg.xml file or modify an existing one and then add a **RegKeys** element to the .pkg.xml.

    The following example shows how to do this.

    ``` syntax
    <?xml version="1.0" encoding="utf-8"?>
    <Package xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema"
      Owner=""
      Component=""
      SubComponent=""
      OwnerType="OEM"
      ReleaseType="">
       <Components>
        <OSComponent>
          <RegKeys>
            <RegKey KeyName="$(hklm.software)\Microsoft\Shell\Nocontrol\LedAlert">
              <RegValue
                  Name="HardwareId"
                  Type="REG_SZ"
                  Value="ACPI\QCOM0D50"   
                  />
               <RegValue
                  Name="InstanceId"
                  Type="REG_DWORD"
                  Value="0"
                  />
              </RegKey>
            </RegKeys>
        </OSComponent>
       </Components>
    </Package>
    ```

    Specify the values for the **Owner**, **Component**, **SubComponent**, and **ReleaseType**. For example:

    -   **Owner**="Contoso"
    -   **Component**="LEDNotification"
    -   **SubComponent**="EnableLEDAlert"
    -   **ReleaseType**="Test"

    You must also replace the **Value** for **HardwareId** to one that matches your LED's DeviceId.

3.  Name and save your .pkg.xml file, then generate a package (.spkg) using the .pkg.xml as input. 

4.  After you've created the .spkg, define the specific types of image builds that you want to contain the package.

    For example, the following code snippet shows a sample OEM feature manifest (FM) file that may contain the .spkg that includes the customization:

    ``` syntax
    <?xml version="1.0" encoding="utf-8"?>  
    <FeatureManifest 
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
      xmlns:xsd="http://www.w3.org/2001/XMLSchema" 
      xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate">  
    <!--  Sample FM File -->
      <Features>  
        <OEM>  
          <PackageFile Path="SourceDirectory" Name="Contoso.LEDNotification.EnableLEDAlert.spkg">  
            <FeatureIDs>  
              <FeatureID>WEH_LEDALERT</FeatureID>  
            </FeatureIDs>  
          </PackageFile>  
        </OEM>  
      </Features>  
    </FeatureManifest>  
    ```

    In this example, replace *SourceDirectory* with the location that contains the .spkg that you created in the previous step. Also, replace the example *Contoso.LEDNotification.EnableLEDAlert.spkg* with the actual name of the .spkg file. **FeatureID** specifies the ID that you're associating with the .spkg. You can provide a different name if you'd like.

   5.  Once you've defined the feature, modify your OEMInput.xml file to add a **Features** element (if one doesn't already exist), add a new **OEM** child element (if one doesn't already exist), and add a new **Feature** entry with the name of the feature that you just defined.

    For example, the OEMInput.xml entry for the feature you defined in the previous step will look like this:

    ``` syntax
      <Features>
        <OEM>
          <Feature>WEH_LEDALERT</Feature>
        </OEM>
      </Features>
    ```

    For more information about OEMInput.xml, see [OEMInput file contents](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/manufacture/mobile/oeminput-file-contents).

6.  Build the OS image. For more information, see *Using ImgGen.cmd to generate an image* in [Build a mobile image using ImgGen.cmd](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/manufacture/mobile/building-a-phone-image-using-imggencmd).

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build that contains this customization to a mobile device.

2.  Go through OOBE to set up your device.

3.  Open the messaging app's **Settings** screen and verify that there's an option for **LED notification**. Make sure this option is checked or enabled.

4.  From another device, send a text message to the device that has LED notification turned on. Verify that you LED notification turned on when the text message was received.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Adding%20an%20LED%20notification%20option%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




