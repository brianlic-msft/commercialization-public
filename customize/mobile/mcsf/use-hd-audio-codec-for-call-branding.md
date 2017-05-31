---
title: Use HD audio codec for call branding
description: OEMs can customize call progress branding when a call is made using a specific audio codec.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: F38B7E1E-0CED-4644-B652-E70D3BFE69FD
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Use HD audio codec for call branding


OEMs can customize call progress branding when a call is made using a specific audio codec.

<a href="" id="constraints---none"></a>**Constraints:** None  

<a href="" id="instructions-"></a>**Instructions:**  
1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
     <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="EnableSupplementaryServiceEraseToDeactivateOverride" Description=”Call progress branding”
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
      </Static>

      <!-- Specify the Variant -->
      <Variant Name=""> 
        <TargetRefs>
          <TargetRef Id="" /> 
        </TargetRefs>
         <Settings Path="Phone/PerSimSettings/$(__IMSI)/HDAudio">  
          <Setting Name="" Value="" /> <!-- Use to identify codec and string -->
         </Settings>   
      </Variant>

    </ImageCustomizations>
    ```

2.  Specify an `Owner`.

3.  For the per-IMSI case:

    1.  Define Targets or conditions for when a variant can be applied, such as keying off a SIM's MCC, MNC, and SPN.

    2.  Define Targets or conditions for when a variant can be applied, such as keying off a SIM's MCC, MNC, and SPN.

4.  In the table below, identify the `Setting Name` that corresponds to your HD audio codec, and set that as `Setting Name`. Then, set `value` to the text string you want to use for call progress branding. For example, if you are using the EVRC audio codec, and you would like to display the text "EVRC" when using that codec, you would enter EVRCAudioQualityString in `Setting Name`, and EVRC in `Value. `

    **Note:** Text strings can be a maximum of 10 characters.

    | Setting name               | Value           | Description                                                     |
    |----------------------------|-----------------|-----------------------------------------------------------------|
    | EVRCAudioQualityString     | Any text string | Call progress branding for calls using the EVRC audio codec     |
    | EVRCBAudioQualityString    | Any text string | Call progress branding for calls using the EVRCB audio codec    |
    | EVRCNWAudioQualityString   | Any text string | Call progress branding for calls using the EVRCNW audio codec   |
    | EVRCWBAudioQualityString   | Any text string | Call progress branding for calls using the EVRCWB audio codec   |
    | EVSFBAudioQualityString    | Any text string | Call progress branding for calls using the EVSFB audio codec    |
    | EVSNBAudioQualityString    | Any text string | Call progress branding for calls using the EVSNB audio codec    |
    | EVSSWBAudioQualityString   | Any text string | Call progress branding for calls using the EVSSWB audio codec   |
    | EVSWBAudioQualityString    | Any text string | Call progress branding for calls using the EVSWB audio codec    |
    | GSMEFRAudioQualityString   | Any text string | Call progress branding for calls using the GSMEFR audio codec   |
    | GSMFRAudioQualityString    | Any text string | Call progress branding for calls using the GSMFR audio codec    |
    | GSMFRAudioQualityString    | Any text string | Call progress branding for calls using the GSMFR audio codec    |
    | QCELP13KAudioQualityString | Any text string | Call progress branding for calls using the QCELP13K audio codec |

     

<a href="" id="testing-steps-"></a>**Testing steps:**  
1.  Flash a build containing this customization to a phone.

2.  Make a phone call that uses HD audio.

3.  Verify that the call progress branding is displayed during the phone call.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Use%20HD%20audio%20codec%20for%20call%20branding%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




