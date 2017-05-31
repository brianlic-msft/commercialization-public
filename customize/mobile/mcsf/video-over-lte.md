---
title: Video over LTE
description: Partners can customize specific settings and behavior for Video over LTE to meet mobile operator requirements.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 95b11ce7-d2ab-411f-85de-243f916d4ca5
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Video over LTE


Partners can customize specific settings and behavior for Video over LTE to meet mobile operator requirements.

These include:

-   Showing or hiding the LTE video calling switch

-   Setting the default value for the switch

-   Customizing the name/label of the switch and the description

-   Specifying the timeout, in milliseconds, for the device to remain in video transition state

-   Enabling video conferencing

-   Specifying the amount of time before a video call is downgraded to a voice call due to low video quality

-   Hiding the video charges dialog that is displayed when the user turns on the LTE video calling switch

<a href="" id="constraints---some-none--some-firstvariationonly"></a>**Constraints:** Some None, some FirstVariationOnly  
This customization supports: **per-IMSI** value

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="VideoOverLTESettings"  
                         Description="Use to customize the settings for Video over LTE."  
                         Owner=""  
                         OwnerType="OEM"> 
      
      <!-- Define the Targets --> 
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
        
        <!-- Add the resource-only dll file and language MUI packages if you are using Windows Phone 8.1 GDR1 and later versions of the OS -->
        <Settings Path="Localization/MUI">  
          <!-- Use to add your base MUI DLL file -->
          <Asset Name="BaseDll" Source="" />

          <!-- Use to specify the language MUI packages (*.dll.mui) for the languages you are supporting and have localized strings for -->
          <Asset Name="LanguageDll/$(langid)" Source="" />
          <Asset Name="LanguageDll/$(langid)" Source="" />
          <Asset Name="LanguageDll/$(langid)" Source="" />
          <!-- Add as many as you need -->         
        </Settings>
      </Static>

      <!-- Specify the Variant -->
      <Variant Name=""> 
        <TargetRefs>
          <TargetRef Id="" /> 
        </TargetRefs>
     
        <Settings Path="Phone/PerSimSettings/$(__IMSI)">  
          <Setting Name="ShowVideoCallingSwitch" Value="" />
          <Setting Name="DefaultEnableVideoCalling" Value="" /> 
          <Setting Name="DefaultEnableVideoCapability" Value="" />   
          <Setting Name="ShowVideoCapabilitySwitch" Value="" />  
          <Setting Name="AllowVideoConferencing" Value="" />  
          <Setting Name="SupressVideoCallingChargesDialog" Value="" />  
        </Settings>  

        <Settings Path="Phone/PhoneSettings">  
          <!-- Note that these settings are FirstVariationOnly -->

          <Setting Name="VideoTransitionTimeout" Value="" />
          <Setting Name="VideoCallingLabel" Value="" />
          <Setting Name="VideoCallingDescription" Value="" />
          <Setting Name="LowVideoQualityTimeout" Value="" />
          
          <-- If you enable video conferencing, you can also specify the number of participants that can be added to the conference call -->
          <Setting Name="ConferenceCallMaximumPartyCount" Value="" />

        </Settings> 

      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  Add the resource-only .dll file and the language MUI packages (\*.dll.mui) for the languages you are supporting. To do this, follow these steps:

    1.  Add the resource-only .dll that contains the custom display string by setting the `BaseDll` asset to point to the location of your base MUI DLL file. For example: *C:\\Path\\DisplayStrings.dll*.

    2.  Add the language MUI packages (\*.dll.mui) for all the languages you are supporting and have localized strings for. To do this:

        -   Set the asset's `Name` to `LanguageDll/`*$(langid)* where *$(langid)* corresponds to the language. For example: *LanguageDll/en-US*.

        -   Set the asset's `Source` to the location of the .dll.mui file for that language. For example: *C:\\Path\\en-us\\DisplayStrings.dll.mui*.

        -   Repeat the previous steps for the other languages.

            The following example shows the customization answer file entries for en-US, fr-CA, and es-MX languages:

            ``` syntax
            <Asset Name="LanguageDll/en-US" Source="C:\Path\en-us\DisplayStrings.dll.mui" />
            <Asset Name="LanguageDll/fr-CA" Source="C:\Path\fr-CA\DisplayStrings.dll.mui" />
            <Asset Name="LanguageDll/es-MX" Source="C:\Path\es-MX\DisplayStrings.dll.mui" />
            ```

        For more information, see [Create a resource-only .dll for localized strings](create-a-resource-only-dll-for-localized-strings.md).

4.  Define **Targets** or conditions for when a variant can be applied, such as keying off a SIM's MCC, MNC, and SPN.

5.  Define settings for a **Variant**, which are applied if the associated target's conditions are met.

6.  To show or hide the LTE video calling switch, set `ShowVideoCallingSwitch` to one of the following values:

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Value</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>0 or 'False'</p></td>
    <td><p>Hides the LTE video calling switch.</p>
    <p>This is the default OS value.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>Shows the LTE video calling switch.</p></td>
    </tr>
    </tbody>
    </table>

     

    **Note**  
    This setting does not set the default switch value. To do that, set `DefaultEnableVideoCalling`.

     

7.  To set the initial default value for the LTE video calling switch, set `DefaultEnableVideoCalling` to one of the following values:

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Value</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>0 or 'False'</p></td>
    <td><p>Sets the LTE video calling switch to Off.</p>
    <p>This is the default OS value.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>Sets the LTE video calling switch to On.</p></td>
    </tr>
    </tbody>
    </table>

     

8.  To set the initial value for LTE video capability sharing, set `DefaultEnableVideoCapability` to one of the following values:

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Value</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>0 or 'False'</p></td>
    <td><p>Sets the LTE video capability sharing to Off.</p>
    <p>This is the default OS value.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>Sets the LTE video capability sharing to On.</p></td>
    </tr>
    </tbody>
    </table>

     

9.  To specify whether to show the video capability sharing switch on the phone **Settings** screen, set `ShowVideoCapabilitySwitch` to one of the following values:

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Value</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>0 or 'False'</p></td>
    <td><p>Hides the video capability sharing switch.</p>
    <p>This is the default OS value.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>Shows the video capability sharing switch.</p></td>
    </tr>
    </tbody>
    </table>

     

10. To enable LTE video calls to be merged into a conference call, set `AllowVideoConferencing` to one of the following values:

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Value</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>0 or 'False'</p></td>
    <td><p>Disables LTE video calls from being merged into a conference call.</p>
    <p>This is the default OS value.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>Enables LTE video calls to be merged into a conference call.</p>
    <p>If you are enabling LTE video calls, you can also specify the maximum number of participants or callers that can be added to the video conference by setting <code>ConferenceCallMaximumPartyCount</code>. For more information, see [Maximum number of participants in a VoLTE conference call](maximum-number-of-participants-in-a-volte-conference-call.md).</p></td>
    </tr>
    </tbody>
    </table>

     

    If this setting is not enabled, the conference option in the UI will never be available. It will always show up as disabled (greyed out).

    **Note**  
    Video conference support is dependent on support by the mobile operator and the device chipset.

     

11. To show or hide the video charges dialog that is displayed when the user turns on the LTE video calling switch, set `SupressVideoCallingChargesDialog` to one of the following values:

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Value</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>0 or 'False'</p></td>
    <td><p>Shows the video calling charges dialog.</p>
    <p>This is the default OS value.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'True'</p></td>
    <td><p>Hides the video calling charges dialog.</p></td>
    </tr>
    </tbody>
    </table>

     

12. To set the time, in milliseconds, to wait for the response to the request to transition a VoLTE call to video, set `VideoTransitionTimeout`. You can set the value to a number between 10000 and 30000, inclusive. If you set the value to 0, the OS uses the default value of 30000 (30 seconds).

    An alert tone is played multiple times during this request. Each alert tone will be played in 10 second increments. The number of alert tones is determined by the request time out value divided by 10. For example:

    -   If you set the value to 30000 (or 30 seconds), the alert tone will play three times at 0, 10 and 20 seconds, and then 10 seconds later the request will time out.

    -   If you set the value to 25000 (or 25 seconds), the alert tone will play three times at 0, 10, and 20 seconds, then 5 seconds later the request will time out.

13. To customize the name or label of the LTE video calling switch and the description for the switch, set the value for the following settings:

    1.  To customize the switch name or label, set the `VideoCallingLabel` value to the name of the resource-only .dll file and specify the string offset. For example: *@DisplayStrings.dll,-101*.

        Replace *DisplayStrings.dll* with the name of your .dll file and replace *Offset* with the correct offset for the localized string.

    2.  To customize the switch description, set the `VideoCallingDescription` value to the name of the resource-only .dll file and specify the string offset. For example: *@DisplayStrings.dll,-102*.

        Replace *DisplayStrings.dll* with the name of your .dll file and replace *Offset* with the correct offset for the localized string.

14. To set the timer, in milliseconds, to automatically drop video support from an active video call when the video calling quality is low, set `LowVideoQualityTimeout`. This will transition the call to a VoLTE call. Set the value to a number between 0 and 120000, inclusive.

    A value of 0 disables the timer. This is also the OS default value.

    **Note**  
    Support for this feature is dependent on support by the mobile operator and the chipset.

     

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build containing this customization to a device.

2.  Go to the **Phone** settings screen.

3.  Verify whether the switches are visible or the correct settings and values are showing up based on the values you specified for the Video over LTE settings.

4.  If you customized the switch label and description, verify that the correct localized strings are showing up based on the device language.

5.  If the right conditions are met, verify that the timeouts work as expected.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Video%20over%20LTE%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




