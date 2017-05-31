---
title: Customizations for desktop devices
description: Customizations for desktop devices allow you to change the UI and other settings for a desktop image.
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Customizations for desktop devices
You have the following options to customize your image. Depending on which options you’d like to use, you’ll employ the associated method or choice of methods to apply the customization. 
<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Feature</th>
<th>Unattend</th>
<th>Modification file</th>
</tr>
</thead>
<tbody>
<!--<tr>
<td><p>Start menu</p></td>
<td><p>subset</p></td>
<td><p>LayoutModification.xml</p></td>
</tr>-->
<tr>
<td><p>Taskbar</p></td>
<td><p>subset</p></td>
<td><p>TaskbarLayoutModification.xml</p></td>
</tr>
<tr>
<td><p>Colors</p></td>
<td><p>yes</p></td>
<td><p>n/a</p></td>
</tr>
<tr>
<td><p>Dark mode</p></td>
<td><p>yes</p></td>
<td><p>n/a</p></td>
</tr>
<!--<tr>
<td><p>Pen and Windows Ink Workspace</p></td>
<td><p>subset</p></td>
<td><p>InkWorkspaceModification.xml</p></td>
</tr>-->
</tbody>
</table>

## In this section
These are some common ways to customize your desktop device. You will also find the tecnical reference for Unattend and WSIM. 

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

<tr class="even">
<td><p>[Customize the taskbar](customize-the-taskbar.md)</p></td>
<td><p>You can pin up to three additional apps to the taskbar by adding a taskbar layout modification file, for example, TaskbarLayoutModification.xml. You can specify different taskbar configurations based on SKU, device locale, or region.</p></td>
</tr>
<tr class="odd">
<td><p>[Set dark mode](set-dark-mode.md)</p></td>
<td><p>This personalization setting for end users allows them to express preference whether to see applications which support the setting in a dark or light mode.
Many Microsoft first party applications apply the setting and it is easy for you to support the functionality in your UWP applications as well.</p></td>
</tr>
<tr class="even">
<td><p>[Customize the Country and Operator Settings Asset](customize-cosa.md)</p></td>
<td><p>When a SIM is inserted in a COSA-enabled Windows-based device, the provisioning framework attempts to establish a cellular connection by searching for the matching profile and APN in COSA.</p></td>
</tr>
<tr class="even">
<td><p>[Windows SIM Technical Reference](wsim/windows-system-image-manager-technical-reference.md)</p></td>
<td><p>Settings reference for Windows System Image Manager.</p></td>
</tr>
<tr class="odd">
<td><p>[Unattended Windows Setup Reference](unattend/index.md)</p></td>
<td><p>Settings reference for Unattend.</p></td>
</tr>
</tbody>
</table>

 

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_mobile_customizations\p_mobile_customizations%5D:%20Customizations%20for%20mobile%20enterprise%20devices%20%20RELEASE:%20%2810/19/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")