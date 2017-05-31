---
title: Additional ringtones
description: OEMs and mobile operators can each preload a set of custom ringtone files on Windows mobile devices, and they can set a default ringtone.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: ccd54a92-3748-43c7-a582-7d68ad46b30d
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Additional ringtones


OEMs and mobile operators can each preload a set of custom ringtone files on Windows mobile devices, and they can set a default ringtone.

Ringtones should be a maximum of 150 KB and have a length of 5 to 15 seconds. They must be in .wma format, with a compression of 128 kbit/s for stereo or 64 kbit/s for mono. Partner ringtones should play at an appropriate volume relative to other sounds and ringtones, and there should be minimal distortion from the device speaker, at full volume.

**Limitations and restrictions**:

-   The names of the ringtones must be localized for all display languages that ship on the device.

-   Partners must not move, delete, or modify the ringtones provided by Microsoft.

-   Partners can only change the default alert sound used for phone calls – all other ringtone and alert defaults must not be changed unless specified elsewhere in the documentation.

-   Users can delete partner ringtones.

Partners must keep the following design considerations in mind when implementing additional ringtones:

**File size:** Ringtone recommended maximum 150 KB; Alarm 100 KB(others as small as possible)

**Format:** .wma

**Compression:** WMA (128 kbps/stereo; 64 kbps/mono)

**Sound length:** Ringtones 5-15 seconds; Alarm 5-15 seconds; Calendar 1-3 seconds; Alerts 0.5-1.5 seconds

**Appropriate volumes:** Sounds should be appropriately balanced with ringtones and system sounds that ship with the OS.

**Minimal distortion** from device speaker, at full volume.

<a href="" id="constraints---firstvariationonly"></a>**Constraints:** FirstVariationOnly  

<a href="" id="instructions-"></a>**Instructions:**  
**To add additional ringtones**

1.  Create a .dll that contains the ringtone display name. For more information on how to do this, see [Create a resource-only .dll for localized strings](create-a-resource-only-dll-for-localized-strings.md).

2.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="AdditionalRingtones"  
                         Description="Use to add ringtone sound files and set a new default ringtone."  
                         Owner=""
                         OwnerType="OEM"> 
      
       <Static>  

        <Settings Path="Localization/MUI">  
          <!-- Use to add your base MUI DLL file -->
          <Asset Name="BaseDll" Source="" />

          <!-- Use to specify the language MUI packages (*.dll.mui) for the languages you are supporting and have localized strings for -->
          <Asset Name="LanguageDll/$(langid)" Source="" />
          <Asset Name="LanguageDll/$(langid)" Source="" />
          <Asset Name="LanguageDll/$(langid)" Source="" />
          <!-- Add as many as you need -->         
        </Settings>  

        <Settings Path="EventSounds">  
          <!-- Use to add additional ringtones -->
          <Asset Name="Ringtones" DisplayName="@DisplayStrings.dll,-Offset" Source="" Type="" />
          <Asset Name="Ringtones" DisplayName="@DisplayStrings.dll,-Offset" Source="" Type="" />
        </Settings>  

       </Static>

    </ImageCustomizations>
    ```

3.  Specify an `Owner`.

4.  Add the resource-only .dll that contains the ringtone sounds' display names by setting the `BaseDll` asset to point to the location of your base MUI DLL file. For example: *C:\\Path\\DisplayStrings.dll*.

5.  Add the language MUI packages (\*.dll.mui) for all the languages you are supporting and have localized strings for. To do this:

    -   Set the asset's `Name` to `LanguageDll/`*$(langid)* where *$(langid)* corresponds to the language. For example: *LanguageDll/en-US*.

    -   Set the asset's `Source` to the location of the .dll.mui file for that language. For example: *C:\\Path\\en-us\\DisplayStrings.dll.mui*.

    -   Repeat the previous steps for the other languages.

        The following example shows the customization answer file entries for en-US, fr-CA, and es-MX languages:

        ``` syntax
        <Asset Name="LanguageDll/en-US" Source="C:\Path\en-us\DisplayStrings.dll.mui” />
        <Asset Name="LanguageDll/fr-CA" Source="C:\Path\fr-CA\DisplayStrings.dll.mui" />
        <Asset Name="LanguageDll/es-MX" Source="C:\Path\es-MX\DisplayStrings.dll.mui" />
        ```

6.  Add additional notification sounds by adding a `Ringtones` asset. To do this:

    -   Set the asset's `Name` to `Ringtones`.

    -   Set the `DisplayName` to the name of the resource-only .dll file and specify the string offset. Replace *DisplayStrings.dll* with the name of your .dll file and replace *Offset* with the correct offset for the localized string. For example: *@DisplayStrings.dll,-104*.

    -   Set `Source` to the full path to the custom ringtone sound on your development machine. For example: *C:\\Path\\MellowRingtone.wma*.

    -   Optionally, set `Type` to either `OEM` or `MobileOperator` to distinguish the type of asset. If you do not set the type, this defaults to OEM.

    -   Repeat the previous steps for any additional ringtone sounds.

If you are setting the default alarm sound in addition to adding other alarm sound files, see the *To set a new default ringtone* section.

**To set a new default ringtone**

1.  Create a customization answer file using the contents shown in the following code sample or use the sample AdditionalRingtones.xml file.

    ``` syntax
       <Settings Path="EventSounds">
            <!-- Use to set a new default ringtone -->
            <Setting Name="DefaultRingtone" Value="" />
       </Settings>
    ```

2.  Set the `Value` to the desired default ringtone sound file name. For example: *MellowRingtone.wma*.

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization and multiple display languages to a mobile device.

2.  Go to the **Ringtone** screen in **Settings**.

3.  Verify all added custom ringtones are in the **Ringtone** drop-down list.

4.  If a new default ringtone is set, verify the **Ringtone** drop-down list defaults to the specified ringtone.

5.  Verify the custom ringtone names are correct for all display languages on the device.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Additional%20ringtones%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




