---
title: Customizations for applications and Microsoft components
description: This section contains information about customizations related to apps and Microsoft components.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 0ec3de7c-f796-4c48-af57-8e73a87af3e5
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Customizations for applications and Microsoft components


This section contains information about customizations related to apps and Microsoft components.

## In this section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Topic</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[Active phone cover settings](active-phone-cover-settings.md)</p></td>
<td><p>OEMs can create and register an active phone cover app, which allows partners to create a user experience with their mobile device cover accessories. This app must be preloaded on the phone as a Settings/CPL application.</p></td>
</tr>
<tr class="even">
<td><p>[Customize the SIM toolkit](https://msdn.microsoft.com/library/windows/hardware/mt629102)</p></td>
<td><p>OEMs can change the display duration for certain SIM toolkit UI dialogs or messages if the default values do not meet the requirements of the mobile operator.</p></td>
</tr>
<tr class="odd">
<td><p>[Enhanced apps experience for medium and large screens](enhanced-apps-experience-for-medium-and-large-screens.md)</p></td>
<td><p>OEMs can use the <strong>UserPreferenceWidth</strong> setting to override the default behavior based on the screen size and specify the physical width of the device (instead of using the automatically calculated <strong>HORZSIZE</strong> value). The value for <strong>UserPreferenceWidth</strong> influences the screen resolution scale factor. A reboot is required for the change to take effect on the chrome process or any apps that are already running. Note that this only has a meaningful impact on 720 x 1280 and 1080 x 1920 devices.</p></td>
</tr>
<tr class="even">
<td><p>[Include required Microsoft components to the image](include-required-microsoft-components-to-the-image.md)</p></td>
<td><p>This customization provides information on how partners can include the required Microsoft components in the OS image.</p></td>
</tr>
<tr class="odd">
<td><p>[Phone call/SMS filter applications](phone-callsms-filter-applications.md)</p></td>
<td><p>OEMs can build and register a phone call/SMS filter application, which helps reduce the number of unwanted phone calls and text messages that users receive.</p></td>
</tr>
<tr class="even">
<td><p>[Preload an app with a dependency](https://msdn.microsoft.com/library/windows/hardware/mt691485)</p></td>
<td><p>If you need to preinstall an app that has dependencies on other packages or components, you need to make sure that the other packages or components are preinstalled first before your app. If the dependent packages or components are not installed first, your app preinstall will fail.</p></td>
</tr>
<tr class="odd">
<td><p>[Remove optional Microsoft components from the image](remove-optional-microsoft-components-from-the-image.md)</p></td>
<td><p>This customization provides information on how partners can remove any of the optional Microsoft components.</p></td>
</tr>
</tbody>
</table>

 

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Customizations%20for%20applications%20and%20Microsoft%20components%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




