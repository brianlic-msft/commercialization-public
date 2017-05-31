---
title: Configure Quick actions
description: OEMs can change the default set of actions for each slot on the Quick actions screen in Notifications actions.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 005cb05d-947d-4317-ade9-85760577d034
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Configure Quick actions


OEMs can change the default set of actions for each slot on the **Quick actions** screen in **Notifications & actions**.

The **Notifications & actions** settings screen contains a section at the top for users to configure **Quick actions**, which are actions that users can have available for quick access or without having to open the apps list or the settings screen to find them. Each quick action has a slot. If a user selects a quick action to go into an occupied slot (for example, Slot 1), and the chosen action already exists in another slot (for example, Slot 2), the two quick actions will swap so that the user-selected action always moves to the slot that the user has selected even though the action may already be in another slot.

**Note**  In Windows 10 Mobile, the quick actions are not configurable through MCSF settings or Windows provisioning. OEMs must directly set the registry key to change the OS default quick actions.

 

Slots are ordered right-to-left so Slot 1 is always on the right and Slot 5 only appears in large screen devices.

The default pinned quick actions for 4-slot mobile devices are:

-   Slot 4: Wi-Fi
-   Slot 3: Bluetooth
-   Slot 2: Rotation lock
-   Slot 1: All settings

The default pinned quick actions for 5-slot mobile devices are:

-   Slot 5: Camera
-   Slot 4: Wi-Fi
-   Slot 3: Bluetooth
-   Slot 2: Rotation lock
-   Slot 1: All settings

OEMs can change the default quick action for each slot. If an OEM chooses not to configure all the slots available for the device, only the slot that was set will be changed and the other default Windows quick actions will remain set.

A slot cannot be empty. If an OEM sets the value for Slot 5, but the mobile device is not a large screen device, the OS ignores the value set for Slot 5. If an invalid value is used, the OS ignores the setting.

<a href="" id="instructions-"></a>**Instructions:**  
**To override the default pinned quick actions**

-   Set the `HKLM\Software\Microsoft\Shell\OEM\QuickActions\Slot` registry key and then set the value of the slot number that you want to configure to a friendly name value.

    The following table shows the friendly names that you can use as the value for the slot number that you want to configure.

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>FriendlyName</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>Microsoft.QuickAction.AllSettings</p></td>
    <td><p>Pins All settings</p></td>
    </tr>
    <tr class="even">
    <td><p>Microsoft.QuickAction.Connect</p></td>
    <td><p>Pins the Connect app</p></td>
    </tr>
    <tr class="odd">
    <td><p>Microsoft.QuickAction.Note</p></td>
    <td><p>Pins the Note app</p></td>
    </tr>
    <tr class="even">
    <td><p>Microsoft.QuickAction.Flashlight</p></td>
    <td><p>Pins the Flashlight app</p></td>
    </tr>
    <tr class="odd">
    <td><p>Microsoft.QuickAction.RotationLock</p></td>
    <td><p>Pins Rotation lock</p></td>
    </tr>
    <tr class="even">
    <td><p>Microsoft.QuickAction.BatterySaver</p></td>
    <td><p>Pins Battery saver</p></td>
    </tr>
    <tr class="odd">
    <td><p>Microsoft.QuickAction.Bluetooth</p></td>
    <td><p>Pins Bluetooth settings</p></td>
    </tr>
    <tr class="even">
    <td><p>Microsoft.QuickAction.WiFi</p></td>
    <td><p>Pins Wi-Fi settings</p></td>
    </tr>
    <tr class="odd">
    <td><p>Microsoft.QuickAction.AirplaneMode</p></td>
    <td><p>Pins Airplane mode settings</p></td>
    </tr>
    <tr class="even">
    <td><p>Microsoft.QuickAction.Vpn</p></td>
    <td><p>Pins VPN settings</p></td>
    </tr>
    <tr class="odd">
    <td><p>Microsoft.QuickAction.Cellular</p></td>
    <td><p>Pins Cellular settings</p></td>
    </tr>
    <tr class="even">
    <td><p>Microsoft.QuickAction.MobileHotspot</p></td>
    <td><p>Pins Mobile hotspot settings</p></td>
    </tr>
    <tr class="odd">
    <td><p>Microsoft.QuickAction.Camera</p></td>
    <td><p>Pins the Camera app</p></td>
    </tr>
    <tr class="even">
    <td><p>Microsoft.QuickAction.Brightness</p></td>
    <td><p>Pins Brightness</p></td>
    </tr>
    <tr class="odd">
    <td><p>Microsoft.QuickAction.QuietHours</p></td>
    <td><p>Pins Quiet hours</p></td>
    </tr>
    <tr class="even">
    <td><p>Microsoft.QuickAction.Location</p></td>
    <td><p>Pins Location settings</p></td>
    </tr>
    </tbody>
    </table>

     

    For example, to change Slot 4 on 4-slot mobile devices from Wi-Fi to Airplane mode, set the value for `HKLM\Software\Microsoft\Shell\OEM\QuickActions\Slot\4` to Microsoft.QuickAction.AirplaneMode.

<a href="" id="testing-"></a>**Testing:**  
1.  Flash the build that contains this customization to a mobile device.

2.  Verify that the default quick action(s) that you set are showing up in the correct slot(s). For large screen devices, verify that there are 5 quick actions that are showing up instead of 4.

3.  Navigate to the **Quick actions** screen in **Notifications & actions** screen and verify that the default quick settings action(s) that you set are also showing up in the correct slots.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_phCustomization\p_phCustomization%5D:%20Configure%20Quick%20actions%20%20RELEASE:%20%289/7/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




