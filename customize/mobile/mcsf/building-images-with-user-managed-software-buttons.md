---
title: Building images with user-managed software buttons
description: Building images with user-managed software buttons
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7b9d32c9-b184-40bb-9eef-2582ec103c93
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Building images with user-managed software buttons


On mobile devices with 1080p, 720p, WXGA, or qHD display panels without hardware Back, Start, and Search buttons, OEMs can build mobile images where the OS renders the Back, Start, and Search buttons in a navigation bar directly on the display. In this scenario, the buttons are not persistent; users can show or hide the buttons.

Optionally, OEMs can also customize the user experience for the navigation bar including:

-   Changing the default color of the navigation bar background: light, dark, or a color that matches the device accent color.

-   Enabling the navigation bar to be automatically hidden or shown.

The user-managed software buttons are optional, so OEMs must add the **NAVIGATIONBAR** feature in the OEMInput.xml file before the settings can be configured properly. A navigation bar Settings CPL is also added to enable users to change the default settings. In addition, OEMs must also set the correct value for the **Resolution** element.

OEMs should note the following accessibility features when support for the navigation bar is added:

-   During initial phone setup, the navigation bar is always visible and cannot be dismissed.

-   When the Narrator is active, the navigation bar is shown and cannot be dismissed until the Narrator is disabled.

-   The Narrator can narrate the controls on the navigation bar.

-   The buttons on the navigation bar provide haptic feedback.

**Note**  
Some settings in this customization may not be available depending on the Windows Phone 8.1 release that you are using to commercialize your device.

 

<a href="" id="constraints---imagetimeonly"></a>**Constraints:** ImageTimeOnly  

<a href="" id="instructions-"></a>**Instructions:**  
To build an image with software-rendered buttons that can be shown or hidden by users:

1.  Create a customization answer file using the contents shown in the following code sample.

    ``` syntax
    <?xml version="1.0" encoding="utf-8" ?>  
    <ImageCustomizations xmlns="http://schemas.microsoft.com/embedded/2004/10/ImageUpdate"  
                         Name="UserManagedSoftwareButtons"  
                         Description="Use to create an image that supports a 1080p, 720p, WXGA, or qHD display 
                                      panels without hardware Back, Start, and Search buttons."  
                         Owner=""  
                         OwnerType="OEM"> 

      <Static>  

        <Settings Path="Input/Touch/CapButtons">  

          <Setting Name="ButtonCount" Value="" />   
          <Setting Name="ButtonAreaTotal" Value="" />   

          <Setting Name="Name0" Value="" />   
          <Setting Name="VKey0" Value="" />
          <Setting Name="Area0" Value="" />   

          <Setting Name="Name1" Value="" />   
          <Setting Name="VKey1" Value="" />   
          <Setting Name="Area1" Value="" />   

          <Setting Name="Name2" Value="" />   
          <Setting Name="VKey2" Value="" />   
          <Setting Name="Area2" Value="" />   

          <Setting Name="VibrateSupport" Value="" />   
          <Setting Name="VibrateDuration" Value="" />   
          <Setting Name="VibrateIntensity" Value="" />   

        </Settings>  

        <Settings Path="Shell/NavigationBar">  
          <Setting Name="Color" Value="" />    
          <Setting Name="AutoHide" Value="" />   
          <Setting Name="SwipeUpToHide" Value="" /> 

          <!-- These settings are available for Windows Phone 8.1 GDR1 or later versions of the OS.
          <Setting Name="BurnInProtectionMode" Value="" />
          <Setting Name="BurnInProtectionIdleTimerTimeout" Value="" />
          <Setting Name="BurnInProtectionMaskSwitchingPeriod" Value="" />
          <Setting Name="BurnInProtectionWhiteReplacementColor" Value="" />
          <Setting Name="BurnInProtectionBlackReplacementColor" Value="" />
          <Setting Name="UserEducationHintDisable" Value="" />
          <Setting Name="DoubleTapOff" Value="" />
          --> 
        </Settings>  

      </Static>

    </ImageCustomizations>
    ```

2.  Specify an `Owner` value in the customization answer file.

3.  For the `ButtonCount`, `ButtonAreaTotal`, `Area`*n*, `Name`*n*, and `VKey`*n* settings, specify values as described in [Defining capacitive button behavior](defining-capacitive-button-behavior.md).

4.  **Optional**. To enable the built-in vibration feedback mechanism for the buttons, include the `VibrateSupport`, `VibrateDuration`, and `VibrateIntensity` settings and specify values as described in [Defining capacitive button behavior](defining-capacitive-button-behavior.md). If you do not want to enable vibration feedback, you can omit these settings from the customization answer file.

5.  **Optional**. To specify the default color of the software-rendered Back, Home, and Search buttons, include the `Color` setting and set `Value` to one of the following values. If you do not want to specify the default color, you can omit the `Color` setting and its parent `Settings` element.

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
    <td><p>0 or 'Always Dark'</p></td>
    <td><p>The buttons are black. This is the default value.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Theme Color'</p></td>
    <td><p>The color of the buttons matches the current theme chosen by the user (black for dark theme, white for light theme).</p></td>
    </tr>
    <tr class="odd">
    <td><p>2 or 'Accent Color'</p></td>
    <td><p>The color of the buttons matches the current accent color chosen by the user.</p></td>
    </tr>
    </tbody>
    </table>

6.  **Optional**. To configure the navigation bar auto show and hide option, set `AutoHide` to one of the following values:

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
    <td><p>0 or 'Disabled'</p></td>
    <td><p>Disables the auto show and hide option for the navigation bar. This is the default OS value.</p></td>
    </tr>
    <tr class="even">
    <td><p>1 or 'Enabled'</p></td>
    <td><p>Enables the auto show and hide option for the navigation bar.</p></td>
    </tr>
    </tbody>
    </table>

     

7.  **Optional**. If you are using Windows Phone 8.1 GDR1 or later versions of the OS, you can also configure these settings:

    -   To set the OLED burn-in protection flag for the nav bar, set `BurnInProtectionMode` to one of the following values:

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
        <td><p>0 or 'Disabled'</p></td>
        <td><p>Disables the nav bar option for burn-in protection mode. This is the default OS value.</p></td>
        </tr>
        <tr class="even">
        <td><p>1 or 'Enabled'</p></td>
        <td><p>Enables the nav bar option for burn-in protection mode.</p></td>
        </tr>
        </tbody>
        </table>

         

    -   To set the timeout, in seconds, for the OLED burn-in protection idle timer, set the value for `BurnInProtectionIdleTimerTimeout`. The default value is 60 seconds. If you change the default value, the new value must be 1 second or more.

    -   To set the OLED burn-in protection mask switching period, in milliseconds, set the value for `BurnInProtectionMaskSwitchingPeriod`. The default value is 10,000 milliseconds (10 seconds). If you change the default value, the new value must be 1 millisecond or more.

    -   OEMs can also change the color that the nav bar uses during OLED burn-in protection. There are two settings: one for white UI elements like the button icon's color when the device is using a light theme and accent color mode, and the other is for black UI elements like the black background when the device is using a dark theme.

        -   To set the white replacement color for the nav bar when in burn-in protection mode, set the value for `BurnInProtectionWhiteReplacementColor` to the ARGB color that you want to use. The color must be specified in the format **0xFFxxxxxx**. The default value for the white replacement color is 0xFFA9A9A9.

        -   To set the black replacement color for the nav bar when in burn-in protection mode, set the value for `BurnInProtectionBlackReplacementColor` to the ARGB color that you want to use. The color must be specified in the format **0xFFxxxxxx**. The default value for the black replacement color is 0xFF323232.

    -   By default, the nav bar shows a user education hint, which is a small piece of UI that the user is required to interact with at least once to learn the swipe up gesture. Once the user has seen the hint, they can choose to stop showing the hint so that it disappears the next time the user swipes up from the bottom of the screen to show the nav bar.

        For OEMs building test and health images, you can configure the user hint by setting `UserEducationHintDisable` to one of the following values:

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
        <td><p>0 or 'Hint Disabled'</p></td>
        <td><p>Disables the user education hint.</p></td>
        </tr>
        <tr class="even">
        <td><p>1 or 'Hint Enabled'</p></td>
        <td><p>Enables the user education hint. This is the default OS behavior.</p></td>
        </tr>
        </tbody>
        </table>

         

    -   To allow users to double tap any open space on the nav bar to turn off the screen, configure the `DoubleTapOff` setting to one of the following values:

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
        <td><p>0 or Disabled'</p></td>
        <td><p>Disables the feature. This is the default OS behavior.</p></td>
        </tr>
        <tr class="even">
        <td><p>1 or 'Enabled'</p></td>
        <td><p>Enables the feature.</p></td>
        </tr>
        </tbody>
        </table>

         

8.  If you have not done so already, create an OEMInput XML file to define the set of packages to include in your phone image, and configure your computer to use the imaging tools. For more information, see [Building a mobile image using ImgGen.cmd](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/manufacture/mobile/building-a-phone-image-using-imggencmd).

9.  In your OEMInput XML file, set the value of the **Resolution** element to 1080x1920, 768x1280, 720x1280, or 540x960, depending on the resolution of the panel. For more information, see [OEMInput file contents](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/manufacture/mobile/oeminput-file-contents).

    In the following example, the highlighted entry shows what you need to add to the OEMInput XML file if you are supporting a 1080x1920 resolution.

    ``` syntax
    <Resolutions>
          <Resolution>1080x1920</Resolution>
    </Resolutions>
    ```

10. In your OEMInput XML file, add the **NAVIGATIONBAR** feature to the **Microsoft** element that is a child of the **Features** element. This feature adds a phone setting that enables users to configure the color of the software buttons.

    ``` syntax
    <Features>
      <Microsoft>
        <Feature>NAVIGATIONBAR</Feature>
      </Microsoft>
    </Features>
    ```

    For more information, see [Optional features for building images](https://msdn.microsoft.com/en-us/windows/hardware/commercialize/manufacture/mobile/optional-features-for-building-images).

<a href="" id="testing-steps-"></a>**Testing steps:**  
The following scenarios are examples for testing the navigation bar and verifying the expected user experience based on your settings. You can add more testing scenarios including playing a game, capturing a screenshot, searching for content, browsing the Internet, and so on.

1.  Flash a build containing this customization to a mobile device that does not have dedicated capacitive navigation buttons.

2.  Go through the initial device setup process and verify whether the navigation bar can be hidden using a swipe gesture or by tapping the chevron (or **^** symbol facing downwards). Tap the Start button and verify that the navigation panel can be hidden or shown using a gesture or the chevron.

3.  When the navigation bar is up, play a video and verify that the software buttons are automatically hidden with a transition. Tap on the screen to show the controls and navigation bar. Forward the video and then let it play for a while until the navigation bar auto hides itself. Show the navigation bar again by tapping on the screen and tap the back button to close the video.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Building%20images%20with%20user-managed%20software%20buttons%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




