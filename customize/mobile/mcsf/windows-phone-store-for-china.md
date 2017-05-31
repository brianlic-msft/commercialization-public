---
title: Windows Store for China
description: For a Windows 10 Mobile device shipping in China, OEMs must specify that the device is intended for that market by setting the PhoneROMLanguage setting in DeviceTargetingInfo to the appropriate locale ID.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2a9e735b-1e52-4a99-bd84-18f187effe85
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows Store for China


For a Windows 10 Mobile device shipping in China, OEMs must specify that the device is intended for that market by setting the **PhoneROMLanguage** setting in **DeviceTargetingInfo** to the appropriate locale ID. For example, for Chinese (China) the locale ID must be set to 0804. When enabled, users are routed to the Windows Store for China.

**Note**  
This customization is only a requirement for China.

 

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="PhoneMetadataDeviceTargetingInfo"  
                         Description="Use to set phone metadata including the phone model name, OEM and mobile operator name, hardware and software versions, and so on."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <!-- Define the Targets for the Variant --> 
      <Targets>
         <Target Id="">
            <TargetState>
               <Condition Name="" Value="" />
               <Condition Name="" Value="" />
            </TargetState>
         </Target>
      </Targets>
      
      <Static>
        <Settings Path="Multivariant">
          <Setting Name="Enable" Value="1" />
        </Settings>
        <Settings Path="AutoDataConfig">
          <Setting Name="Enable" Value="0" />
        </Settings>
      </Static>

      <Static>  
        <!-- These settings are ImageTimeOnly and will be put directly into the registry hive -->
        <Settings Path="DeviceInfo/Static">       
          <Setting Name="PhoneManufacturer" Value="" />    
          <Setting Name="PhoneROMVersion" Value="" /> 
          <Setting Name="PhoneHardwareRevision" Value="" />    
          <Setting Name="PhoneSOCVersion" Value="" /> 
          <Setting Name="PhoneFirmwareRevision" Value="" />   
          <Setting Name="PhoneRadioHardwareRevision" Value="" />    
          <Setting Name="PhoneRadioSoftwareRevision" Value="" /> 
          <Setting Name="PhoneBootLoaderVersion" Value="" />    
          <Setting Name="PhoneROMLanguage" Value="0804" /> 
          <Setting Name="PhoneHardwareVariant" Value="" /> 
       </Settings>  
      </Static>

      <!-- Specify the Variant -->
      <Variant Name=""> 
        <TargetRefs>
          <TargetRef Id="" /> 
        </TargetRefs>

        <!-- These settings are FirstVariationOnly and can be configured at runtime potentially based on SIM value --> 
        <Settings Path="DeviceInfo/Variant">
          <Setting Name="PhoneMobileOperatorName" Value="" /> 
          <Setting Name="PhoneManufacturerModelName" Value="" />    
          <Setting Name="PhoneMobileOperatorDisplayName" Value="" /> 
          <Setting Name="PhoneSupportPhoneNumber" Value="" />    
          <Setting Name="PhoneSupportLink" Value="" /> 
          <Setting Name="PhoneOEMSupportLink" Value="" />    
          <Setting Name="PhoneModelName" Value="" /> 
       </Settings> 
      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Set `PhoneROMLanguage` to 0804 for China (Chinese).

    If partners do not set the `PhoneROMLanguage` setting to a China locale ID, partners may not ship the device in China. For more information about all locale IDs (LCIDs) including Chinese LCIDs, see [Locale IDs assigned by Microsoft](http://go.microsoft.com/fwlink/p/?LinkId=269594) on MSDN.

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a device with a UICC.

2.  From the device, launch the Windows Store and verify that you are routed to the store for China.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Windows%20Store%20for%20China%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




