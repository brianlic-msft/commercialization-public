---
title: Customize using the mobile MCSF framework
description: The Managed Centralized Settings Framework (MCSF), which was introduced in Windows Phone 8.1, is supported in Windows 10.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 76de8fd4-b393-4cc1-93a8-ae9776c0446e
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Customize using the mobile MCSF framework


The Managed Centralized Settings Framework (MCSF), which was introduced in Windows Phone 8.1, is supported in Windows 10.

MCSF consists of both image time and runtime components that enable a simple and consistent way of declaring OS settings, and a centralized framework that the runtime configuration engine, mobile operators, device management servers, and others can query or modify these settings. A runtime configurable MCSF can either be a configuration service provider-based customization or registry-based customization being exposed through the MSCF CSP.

Similar to the Unattend answer file that can be provided to Windows Setup for Windows Desktop image customization, a customization answer file can be passed to customize an image with specific settings and to create variants for the image. The customization answer file allows for a broader integration across the OS by providing OEMs with a single place to define nearly all OS settings. During image build time, the customization answer file is processed and built as customization packages, which are automatically included in the images. OEM partners can leverage this system by defining a registry or configuration service provider-based settings in packages using MCSF. MCSF also produces customization policy files for both OEM partners and Microsoft. These files are extracted from the packages used to build the OS image to determine the valid settings for the OS image.


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
<td><p>[Managed Centralized Settings Framework (MCSF)](managed-centralized-settings-framework-mcsf.md)</p></td>
<td><p>Provides a standard way to describe settings that are customizable within packages. MCSF also generates a policy based on the settings descriptions. The settings framework can be image time or runtime configurable. A runtime configurable MCSF can either be a configuration service provider-based customization or registry-based customization being exposed through the MSCF CSP.</p></td>
</tr>
<tr class="even">
<td><p>[Customization answer file](customization-answer-file.md)</p></td>
<td><p>A <strong>customization answer file</strong> is an XML file that you write based on the MCSF schema. OEMs can use the MCSF customization answer file to specify the settings and variants for a custom mobile OS image. The customization answer file allows for a broader integration across the OS by providing OEMs with a single place to define nearly all mobile OS settings.</p></td>
</tr>
<tr class="odd">
<td><p>[Set languages and locales](set-languages-and-locales.md)</p></td>
<td><p>Provides an overview of the different language and locale settings based on the market in which the mobile device will ship.</p></td>
</tr>
<tr class="even">
<td><p>[Create a resource-only .dll for localized strings](create-a-resource-only-dll-for-localized-strings.md)</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>[Customizations for device management](customizations-for-device-management.md)</p></td>
<td><p>This section provides more information about device management settings that OEMs can change.</p></td>
</tr>
<tr class="even">
<td><p>[Customizations for hardware components](customizations-for-hardware-components.md)</p></td>
<td><p>This section contains information about customization settings that OEMs can use for the following hardware components:</p>
<ul>
<li>Buttons</li>
<li>Camera</li>
<li>Display</li>
<li>Networking</li>
<li>Sensors</li>
<li>Storage</li>
<li>Touch</li>
</ul></td>
</tr>
<tr class="odd">
<td><p>[Customizations for applications and Microsoft components](customizations-for-applications-and-microsoft-components.md)</p></td>
<td><p>This section contains information about customizations related to apps and Microsoft components.</p></td>
</tr>
<tr class="even">
<td><p>[Customizations for boot, initial setup, and shutdown](customizations-for-boot-initial-setup-and-shutdown.md)</p></td>
<td><p>Use these customizations to configure the device boot, initial setup, or shutdown experience.</p></td>
</tr>
<tr class="odd">
<td><p>[Customizations for browser](customizations-for-browser.md)</p></td>
<td><p>Describes the customizations for the browser.</p></td>
</tr>
<tr class="even">
<td><p>[Customizations for connectivity](customizations-for-connectivity.md)</p></td>
<td><p>Describes the customizations for configuring connectivity settings.</p></td>
</tr>
<tr class="odd">
<td><p>[Customizations for desktop experiences](customizations-for-desktop-experiences.md)</p></td>
<td><p>Describes the customizations that you can configure for the desktop when the mobile device is connected.</p></td>
</tr>
<tr class="even">
<td><p>[Customizations for email](customizations-for-email.md)</p></td>
<td><p>Describes the customizations related to email.</p></td>
</tr>
<tr class="odd">
<td><p>[Customizations for maps](customizations-for-maps.md)</p></td>
<td><p>Describes the customizations that you can configure for maps on the mobile device.</p></td>
</tr>
<tr class="even">
<td><p>[Customizations for phone calls](customizations-for-phone-calls.md)</p></td>
<td><p>Provides information about customizations you can configure for the phone or dialer app including branding, visual voicemail, caller ID matching, dialer codes, and more.</p></td>
</tr>
<tr class="odd">
<td><p>[Customizations for photos, music, and videos](customizations-for-photos-music-and-videos.md)</p></td>
<td><p>Contains the customizations you can configure for photos, music, and videos.</p></td>
</tr>
<tr class="even">
<td><p>[Customizations for Settings](customizations-for-settings.md)</p></td>
<td><p>The <strong>Settings</strong> app contains a predefined collection of user-configurable system settings that's organized into pages by functionality. As specified in policy, the appearance and default values of these settings are generally not customizable. The following table contain the complete list of user-facing settings that OEMs and mobile operators can change.</p></td>
</tr>
<tr class="odd">
<td><p>[Customizations for SMS and MMS](customizations-for-sms-and-mms.md)</p></td>
<td><p>Contains settings that you can configure for SMS and MMS.</p></td>
</tr>
<tr class="even">
<td><p>[Customizations for Start](customizations-for-start.md)</p></td>
<td><p>This section contains information about customizations related to Start.</p></td>
</tr>
</tbody>
</table>

 

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Customize%20using%20the%20mobile%20MCSF%20framework%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




