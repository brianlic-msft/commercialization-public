---
title: Customizations for boot, initial setup, and shutdown
description: Use these customizations to configure the device boot, initial setup, or shutdown experience.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d6dc354b-1579-4f73-acaa-c28d700c75ec
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Customizations for boot, initial setup, and shutdown


Use these customizations to configure the device boot, initial setup, or shutdown experience.

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
<td><p>[Configure the timezone confirmation page during setup](configure-the-timezone-confirmation-page-during-setup.md)</p></td>
<td><p>Use to allow users to change the timezone and region during device setup.</p></td>
</tr>
<tr class="even">
<td><p>[Configuring a boot screen to display in the final boot screen slot](configuring-a-boot-screen-to-display-in-the-final-boot-screen-slot.md)</p></td>
<td><p>By default, the Windows 10 Mobile logo is displayed as the final boot screen. However, partners can display a different screen for the final boot screen slot. The image must be in .JPG, .JPEG, or .PNG format.</p></td>
</tr>
<tr class="odd">
<td><p>[Configuring boot battery charging behavior](configuring-boot-battery-charging-behavior.md)</p></td>
<td><p>The boot (UEFI) environment contains a battery charging application (owned by Microsoft) that is responsible for charging the battery in pre-boot and low power states. OEMs can configure some of the behavior of this application by using the registry values described in this topic.</p></td>
</tr>
<tr class="even">
<td><p>[Configuring OEM and mobile operator boot screens](configuring-oem-and-mobile-operator-boot-screens.md)</p></td>
<td><p>Partners must add at least one, and no more than two, boot screens (also called <em>splash screens</em>) that are displayed when the device is turned on. These screens are intended for partners to display branding elements or logos.</p></td>
</tr>
<tr class="odd">
<td><p>[Configuring the duration of the first boot screen](configuring-the-duration-of-the-first-boot-screen.md)</p></td>
<td><p>If partners specify two boot screens (in addition to the Windows 10 Mobile boot screen), they can modify the duration of the first boot screen. We recommend that partners choose a duration for the first boot screen so that the first and second boot screens appear for the same amount of time.</p></td>
</tr>
<tr class="even">
<td><p>[Custom shutdown screen](custom-shutdown-screen.md)</p></td>
<td><p>Partners can add a static logo or background during shutdown.</p></td>
</tr>
<tr class="odd">
<td><p>[Language selection during initial setup](language-selection-during-initial-setup.md)</p></td>
<td><p>If multiple display languages are included on the device, partners have the option of hiding the <strong>Language selection</strong> screen during setup.</p></td>
</tr>
<tr class="even">
<td><p>[Partner account configuration during setup](partner-account-configuration-during-setup.md)</p></td>
<td><p>In Windows 10 Mobile, an OEM or mobile operator may specify one preloaded app to be launched at the end of setup to walk users through an OEM or mobile operator account setup.</p>
<p>Optionally, an OEM or mobile operator may also preload an additional 4 apps that can be subroutined and called from a main app. In this case, the partner specifies one of the apps as the hub app (main app), which will be automatically launched at the end of setup. This app can then invoke other spoke apps (subroutined apps) to complete other tasks.</p></td>
</tr>
<tr class="odd">
<td><p>[Screen background color during initial setup](screen-background-color-during-initial-setup.md)</p></td>
<td><p>For Windows 10 Mobile, the default background during OOBE or initial device setup is always dark. To align with this change, OEMs can no longer change the default screen background color during OOBE or initial device setup.</p></td>
</tr>
<tr class="even">
<td><p>[Set the default country/region when SIM PIN is on](https://msdn.microsoft.com/library/windows/hardware/mt613526)</p></td>
<td><p>OEMs can customize the default home country/region that shows up during OOBE in cases where the SIM PIN is turned on. This value is associated with the default ICCID values. When SIM PIN is turned off, the OS uses the MCC-derived country/region instead.</p></td>
</tr>
</tbody>
</table>

 

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Customizations%20for%20boot,%20initial%20setup,%20and%20shutdown%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




