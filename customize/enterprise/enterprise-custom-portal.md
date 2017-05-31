---
title: Customizations for enterprise desktop
description: Windows 10 Enterprise customizations provide a controlled and specialized experience for the end-users of a Windows 10 device by allowing OEMs and system administrators to lock down the Windows 10 device interaction experience.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: dac59fd3-f5d0-4d02-ac89-0caf7fe3c9dd
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Customizations for enterprise desktop


## Purpose


Windows 10 Enterprise customizations provide a controlled and specialized experience for the end-users of a Windows 10 device by allowing OEMs and system administrators to lock down the Windows 10 device interaction experience.

There are many reasons for locking down a device, such as protecting the system from malicious users, providing a custom defined user experience, and increasing system reliability.

You can lock down your Windows 10 desktop device by using the lock down features individually or in combination with each other to get the effect you desire for your image. You can, for instance, create a dedicated cashier device that runs a full screen Point of Service (POS) application.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Task</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Block connecting to USB devices</p></td>
<td><p>You can use MDM and group policies to [prevent users from attaching USB devices](https://msdn.microsoft.com/en-us/library/bb530324.aspx) which may expose a security risk for your device.</p></td>
</tr>
<tr class="even">
<td><p>Create a kiosk experience</p></td>
<td><p>You can create a single use device using enterprise desktop customizations. One example of a single use device is a [kiosk application](create-a-kiosk-image.md), where users interact with a single application that you select, like a catalog of items for sale at the entrance to your store. You can create an immersive experience complete with videos telling the story of your catalog items and how they are used, along with a way for customers to purchase items right at the kiosk.</p>
<p>If you are a developer using UWP, you can use [Assigned access](assigned-access.md) to create a Kiosk or single-use Windows 10 device. If you are a Win32 developer, you can use [Shell Launcher](shell-launcher.md) instead.</p></td>
</tr>
<tr class="odd">
<td><p>Customize the logon experience</p></td>
<td><p>You can use the [Custom Logon](custom-logon.md) feature to suppress Windows 10 UI elements that relate to the Welcome screen and shutdown screen. For example, you can [supress all elements of the Welcome screen UI](complementary-features-to-custom-logon.md) and provide a custom logon UI. You can suppress the ease of access option on the logon screen. You can also suppress the Blocked Shutdown Resolver (BSDR) screen and automatically end applications while the OS waits for applications to close before a shutdown.</p></td>
</tr>
<tr class="even">
<td><p>Disable the camera</p></td>
<td><p>In some circumstances, you may want or need to disable the camera on for privacy purposes. You can disable the camera in Settings&gt;Privacy, or by using [MDM policy](https://msdn.microsoft.com/en-us/library/windows/hardware/dn904962.aspx#camera-allowcamera).</p></td>
</tr>
<tr class="odd">
<td><p>Log in automatically</p></td>
<td><p>When your device restarts, whether from an update or power outage, you can log on the assigned access account manually or you can configure the device to [log on to the assigned access account automatically](create-a-kiosk-image.md).</p></td>
</tr>
<tr class="even">
<td><p>Prevent use of removable media</p></td>
<td><p>You can use Device Installation Restrictions to prevent users from installing all devices which could expose malware to your device.</p></td>
</tr>
<tr class="odd">
<td><p>Protect storage media from being written to</p></td>
<td><p>You can use [Overlay for Unified Write Filter (UWF)](uwfoverlay.md) on your device to help protect your physical storage media, including most standard writable storage types that are supported by Windows, such as physical hard disks, solid-state drives, internal USB devices, external SATA devices, and so on. You can also use UWF to make read-only media appear to the OS as a writable volume.</p></td>
</tr>
<tr class="even">
<td><p>Put the device in tablet mode</p></td>
<td><p>[Tablet mode](create-a-kiosk-image.md#lockdown-settings) makes Windows easier and more intuitive to use with touch screens commonly used for kiosk or other single use devices. In tablet mode, apps open in full-screen.</p></td>
</tr>
<tr class="odd">
<td><p>Restrict access to apps</p></td>
<td><p>[AppLocker](https://msdn.microsoft.com/en-us/library/windows/hardware/dn920019.aspx)helps to secure your system by preventing the execution of unwanted applications.</p></td>
</tr>
<tr class="even">
<td><p>Suppress unwanted keyboard entries</p></td>
<td><p>You can use [Keyboard Filter](keyboardfilter.md) to suppress undesirable key presses or key combinations. Normally, a customer can use certain Windows key combinations like <strong>Ctrl+Alt+Delete</strong> or <strong>Ctrl+Shift+Tab</strong> to alter the operation of a device by locking the screen or using Task Manager to close a running application. Other common examples include <strong>ALT + F4</strong> for closing an application or <strong>Windows + L</strong> for locking a device. This may not be desirable if your device is intended for a dedicated purpose.</p></td>
</tr>
<tr class="odd">
<td><p>Suppress Windows branding on Startup</p></td>
<td><p>You can use the [Unbranded Boot](unbranded-boot.md) feature to suppress Windows elements that appear when Windows starts or resumes and can suppress the crash screen when Windows encounters an error that it cannot recover from.</p></td>
</tr>
<tr class="even">
<td><p>Turn off app notifications on the lock screen</p></td>
<td><p>You can [disable app notifications](create-a-kiosk-image.md#lockdown-settings) to prevent users of your public devices from receiving app notifications that are not intended for their eyes.</p></td>
</tr>
<tr class="odd">
<td><p>Turn off the power button</p></td>
<td><p>If you don’t want customers to be able to turn off your device by pushing the power button, you should turn [disable it](create-a-kiosk-image.md#lockdown-settings).</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Channel 9 video: Customizing Your Device Experience with Assigned Access](https://channel9.msdn.com/Events/Build/2016/P508)

[Find the Application User Model ID of an installed app](find-the-application-user-model-id-of-an-installed-app.md)

**Assigned access reference**
[Assigned access Windows PowerShell reference](assigned-access-windows-powershell-reference.md)

[WEDL\_AssignedAccess](wedl-assignedaccess.md)

**Keyboard Filter reference**
[Keyboard Filter key names](keyboardfilter-key-names.md)

[Predefined key combinations](predefined-key-combinations.md)

[Keyboard Filter WMI provider reference](keyboardfilter-wmi-provider-reference.md)

**Shell Launcher reference**
[WESL\_UserSetting](wesl-usersetting.md)

**Unified Write Filter reference**
[Unified Write Filter WMI provider reference](uwf-wmi-provider-reference.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20Customizations%20for%20enterprise%20desktop%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





