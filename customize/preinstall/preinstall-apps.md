---
title: Preinstalled apps
description: OEMs and Mobile operators can create Partner applications that can be packaged and configured to install during the initial device setup process.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 268d5950-04e6-4450-94a0-a3d902edc7e7
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Preinstalled apps


## Purpose


The primary channel for distributing apps is the Windows Store. However, because Windows Store apps are only available on the device after a user-initiated download and some partner apps need to be available at first boot, there is an alternate option available for OEMs and mobile operators. OEMs and Mobile operators can create Partner applications that can be packaged and configured to install during the initial device setup process. While the user is going through the initial setup process, the preinstalled applications are installed in the background.

The process for creating a preinstalled app is similar to that of a standard app. An unsigned app package (.appx), generated with the Windows SDK, is submitted to the Windows Dev Center for certification and signing. During the submission process, you can specify that you are submitting a preinstalled app. If the app meets certification requirements, it is processed to create a package that can be downloaded from the Dev Center. The app can then be published to the Windows Store as well, so that users who have uninstalled the app can re-download it and updates can later be offered to devices that have the app installed.

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
<td><p>[Preinstallable apps for desktop devices](preinstallable-apps-for-windows-10-desktop.md)</p></td>
<td><p>Learn how to add an app to a Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) image that will be available to customers at first boot.</p></td>
</tr>
<tr class="even">
<td><p>[Preinstallable apps for mobile devices](preinstallable-apps-for-window-10-for-phones.md)</p></td>
<td><p>Learn how to add an app to a mobile image that will be available to customers at first boot.</p></td>
</tr>
<tr class="odd">
<td><p>[Preinstall tasks](preinstall-tasks.md)</p></td>
<td><p>OEMs and MOs are permitted to ship preinstalled apps in the device image. Some of those preinstalled apps require tasks to run without user interaction and often before the end-user opens the app for the first time; such as a product survey app or a SMS server registration. Similarly, some apps will need servicing tasks to run without user interaction after an app has been updated. Preinstall and update tasks provide the mechanism for allowing tasks to run in the background without before the app is installed or when it is updated.</p></td>
</tr>
</tbody>
</table>

 

## <a href="" id="developer-audience-heading"></a>Developer audience


Preinstall is designed for use by OEM and MO developers writing apps to be preinstalled on Windows 10 OS images.

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_preinstall\p_preinstall%5D:%20Preinstalled%20apps%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")




