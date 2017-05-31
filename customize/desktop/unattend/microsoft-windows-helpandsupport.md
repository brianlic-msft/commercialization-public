---
title: Microsoft-Windows-HelpAndSupport
description: Microsoft-Windows-HelpAndSupport
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7d957ce8-fb2f-4484-bc17-36fef89d368a
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Microsoft-Windows-HelpAndSupport


**Note**  
In Windows 10, the [HelpAndSupport](microsoft-windows-helpandsupport-helpandsupport.md) settings are deprecated because the Help component that they impact is being retired. Existing information about the HelpAndSupport settings are provided for reference only.

 

In Windows 10, the OS disables the help components that shipped in Windows 8 and Windows 8.1 including the Help and Support Windows desktop application (HelpPane.exe). HelpPane.exe will continue to exist in the box, but calls to its interfaces will result in one of two outcomes:

-   If the user is offline, the OS launches the Getting Started app.
-   If the user is online, the OS opens a browser instance and redirects the browser to an online topic.

For more information on how OEMs can include their customer support contact information in the Contact Support App or Support Web page, see [OEMInformation](microsoft-windows-shell-setup-oeminformation.md).

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[HelpAndSupport](microsoft-windows-helpandsupport-helpandsupport.md)</p></td>
<td><p>Contains settings to specify OEM information for a customized <strong>Help and Support</strong> page.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


oobeSystem

specialize

## Applies To


To determine whether a component applies to the image you’re building, load your image into Windows SIM and search for the component or setting name. For information on how to view components and settings, see [Configure Components and Settings in an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915078).

## XML Example


The following example shows how to set a customized **Help and Support** page. The home page is branded with the Fabrikam logo. When the user clicks the logo, the default browser starts and the URL bar is prepopulated with http://www.fabrikam.com.

``` syntax
<HelpAndSupport>
  <Logo>C:\Fabrikam\Logos\Logo.png</Logo>
  <LogoURL>http://www.fabrikam.com/support</LogoURL>
  <Manufacturer>Fabrikam</Manufacturer>
  <SupportSearchURL>http://www.fabrikam.com/support/search/?term={Query}</SupportSearchURL>
  <TileColor>65280</TileColor>
</HelpAndSupport>
```

## Related topics


[Components](components-b-unattend.md)

[OEMInformation](microsoft-windows-shell-setup-oeminformation.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Microsoft-Windows-HelpAndSupport%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





