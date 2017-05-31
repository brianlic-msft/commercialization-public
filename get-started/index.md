---
title: Get started with Windows 10
description: Build innovative and differentiated devices with Windows 10.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e9ebd4e2-f05e-40fb-9dc3-925f96dce182
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Get started with Windows 10

Build innovative and differentiated devices with Windows 10. Windows 10 runs on a broad set of devices—from desktops, notebooks, phones, and Internet of Things (IoT) devices. The operating system's common core works across platforms with 80-inch screens, 4-inch screens, or devices with no screens at all.

You can create devices to use touch/pen, mouse/keyboard, controller/gesture—or you can build them to switch between input types.

## Start here

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><strong><em>I'm new to this!</em></strong></td>
<td><strong><em>I'm back!</em></strong></td>
</tr>
<tr class="even">
<td><p>Learn about the different kits used to build Windows devices.</p>
<p>[Get familiar with the kits and tools](kits-and-tools-overview.md)</p>
<p>Download each of the kits here:</p>
<ul>
<li>[Windows Driver Kit (WDK) 10](https://go.microsoft.com/fwlink/p/?LinkId=733614)</li>
<li>[Windows Hardware Lab Kit (HLK) for Windows 10](https://go.microsoft.com/fwlink/p/?LinkId=733613)</li>
<li>[Windows Assessment and Deployment Kit (ADK) for Windows 10](https://go.microsoft.com/fwlink/p/?LinkId=733615)</li>
</ul></td>
<td><p>Welcome back! Here's what's new in:</p>
<ul>
<li>[... Windows 10](what-s-new-in-windows.md)</li>
<li>[... Windows ADK](what-s-new-in-kits-and-tools.md)</li>
<li>[... Windows Performance Toolkit](https://msdn.microsoft.com/en-us/library/windows/hardware/dn927303.aspx)</li>
<li>[... Hardware Lab Kit](https://msdn.microsoft.com/library/windows/hardware/mt187880.aspx)</li>
<li>[... driver development](https://msdn.microsoft.com/windows/hardware/drivers/what-s-new-in-driver-development)</li>
<li>[... design](https://msdn.microsoft.com/library/windows/hardware/mt703371.aspx)</li>
<li>[... customizations](https://msdn.microsoft.com/library/windows/hardware/mt723363.aspx)</li>
<li>[... manufacturing](https://msdn.microsoft.com/windows/hardware/commercialize/manufacture/whats-new-in-windows-manufacturing)</li>
<li>[... unattend settings](https://msdn.microsoft.com/library/windows/hardware/mt750416.aspx)</li>
<li>[... MDM enrollment and management](https://msdn.microsoft.com/library/windows/hardware/mt299056.aspx)</li>
<li>[... Windows PE](https://msdn.microsoft.com/windows/hardware/commercialize/manufacture/desktop/whats-new-in-windows-pe-s14)</li>
</ul></td>
</tr>
</tbody>
</table>

You can optimize your hardware for Windows 10 during any phase of the development process. These step-by-step guides walk you through using development boards, building Universal Windows drivers for a variety of devices, and making sure your hardware components, peripherals, and technologies are compatible with Windows 10.

## Design hardware with the latest features

From Cortana to Continuum to the core architecture, this release includes tons of new platform features and improvements to help you create compelling user experiences on any form factor.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>Continuum switches in and out of &quot;tablet mode&quot;, adapting and optimizing apps and the Windows shell based on the physical form factor and customer's preferences.</p>
<p>[Read more about implementing Continuum](https://msdn.microsoft.com/en-us/library/windows/hardware/dn917883.aspx)</p></td>
<td><p>Cortana, the personal assistant technology introduced on Windows Phone 8.1, is now supported on all Windows 10 devices. Learn device recommendations and test setup in these articles.</p>
<p>[Read more about including Cortana](https://msdn.microsoft.com/en-us/library/windows/hardware/dn915051.aspx)</p></td>
<td><p>Windows Hello allows users to securely logon to a device using a biometric device like a fingerprint reader or an IR camera.</p>
<p>[Learn more about biometric requirements for Windows Hello](https://msdn.microsoft.com/en-us/library/windows/hardware/mt587095.aspx)</p></td>
</tr>
</tbody>
</table>
 
## Develop Windows Universal Drivers

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>Learn fundamental concepts about drivers.</p>
<p>[Get started with Windows drivers](https://msdn.microsoft.com/en-us/library/windows/hardware/ff554690.aspx)</p></td>
<td><p>Build a universal sensor driver based on the Sharks Cove dev board. Learn how to load a Windows 10 image and provision these boards for driver deployment, debugging, and testing.</p>
<p>[Work with the Sharks Cove hardware development board](https://msdn.microsoft.com/en-us/library/windows/hardware/dn745910.aspx)</p></td>
<td><p>Create a single driver that runs across multiple different device types, from embedded systems to tablets and desktop PCs. UMDF and KMDF templates are included in Visual Studio to help you get started.</p>
<p>[Get started with Universal Windows drivers](http://go.microsoft.com/fwlink/p/?LinkId=526095)</p></td>
</tr>
</tbody>
</table>

## Customize Windows images to reflect your brand

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>For desktop PCs, you can use your existing settings file (Unattend.xml) to add settings during Windows installation.</p>
<p>[Build a Windows Setup unattend file](https://msdn.microsoft.com/windows/hardware/commercialize/manufacture/desktop/update-windows-settings-and-scripts-create-your-own-answer-file-sxs)</p></td>
</tr>
</tbody>
</table>

## Test system components for compatibility and performance

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>Write and run test automations with the Test Authoring and Execution Framework (TAEF). Share your tests across disciplines and teams.</p>
<p>[Get started with the Test Authoring and Execution Framework (TAEF)](https://msdn.microsoft.com/en-us/library/windows/hardware/hh439627.aspx)</p></td>
<td><p>Test your hardware with the Windows Hardware Lab Kit.</p>
<p>[Get started with the Windows Hardware Lab Kit](https://msdn.microsoft.com/en-us/library/windows/hardware/dn915002.aspx)</p></td>
<td><p>Analyze system and application performance using the Windows Performance Toolkit.</p>
<p>[Get started with the Windows Performance step-by-step guides](https://msdn.microsoft.com/en-us/library/windows/hardware/mt634257.aspx)</p></td>
</tr>
</tbody>
</table>

## <a href="" id="manufacturing---putting-it-all-together"></a>Manufacturing – putting it all together

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>For desktop PCs, learn strategies to build set of images for specific markets to meet different customers' needs. Apply classic and modern Windows apps, drivers, languages, and other customizations, and mix and match your customizations as new Windows editions are released through automated scripts or a familiar Windows interface.</p>
<p>[Build and deploy desktop devices](https://msdn.microsoft.com/windows/hardware/commercialize/manufacture/desktop/oem-windows-deployment-and-imaging-walkthrough)</p></td>
<td><p>Build IoT Core devices, applying apps, drivers, and settings to new devices.</p>
<p>[Build and deploy IoT Core devices](https://msdn.microsoft.com/windows/hardware/commercialize/manufacture/iot/iot-core-manufacturing-guide)</p></td>
<td><p>OEMs and ODMs can build and test mobile devices and drivers.</p>
<p>[Build and deploy phones](https://msdn.microsoft.com/windows/hardware/commercialize/manufacture/mobile/mobile-deployment-and-imaging)</p></td>
</tr>
</tbody>
</table>
