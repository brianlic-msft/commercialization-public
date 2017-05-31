---
title: HelpAndSupport
description: HelpAndSupport
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 01f5aa96-b47b-40c0-a3bf-0a890407797b
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# HelpAndSupport


**Note**  
In Windows 10, the HelpAndSupport settings are deprecated because the Help component that they impact is being retired. Existing information about the HelpAndSupport settings are provided for reference only.

 

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
<td><p>[Logo](microsoft-windows-helpandsupport-helpandsupport-logo.md)</p></td>
<td><p>Specifies the path of an image file that contains the logo of the OEM or organization.</p></td>
</tr>
<tr class="even">
<td><p>[LogoURL](microsoft-windows-helpandsupport-helpandsupport-logourl.md)</p></td>
<td><p>Specifies the URL for a support page for the OEM or organization.</p></td>
</tr>
<tr class="odd">
<td><p>[Manufacturer](microsoft-windows-helpandsupport-helpandsupport-manufacturer.md)</p></td>
<td><p>Specifies the name of the OEM.</p></td>
</tr>
<tr class="even">
<td><p>[SearchContent](microsoft-windows-helpandsupport-helpandsupport-searchcontent.md)</p></td>
<td><p>Specifies whether the OEM or organization has provided offline Help content that the system must return in the search results.</p></td>
</tr>
<tr class="odd">
<td><p>[SupportSearchURL](microsoft-windows-helpandsupport-helpandsupport-supportsearchurl.md)</p></td>
<td><p>Specifies the URL that the system uses to display a search link on the page of search results.</p></td>
</tr>
<tr class="even">
<td><p>[TileColor](microsoft-windows-helpandsupport-helpandsupport-tilecolor.md)</p></td>
<td><p>Specifies the RGB background color of the tile for the OEM or organization on the <strong>Help and Support</strong> home page.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


oobeSystem

specialize

## Parent Hierarchy


[Microsoft-Windows-HelpAndSupport](microsoft-windows-helpandsupport.md) | `HelpAndSupport`

## XML Example


The following example shows how to set values for customizing the **Help and Support** user interface. This example customizes the **Help and Support** page to have a blue (16711680) OEM tile that includes the Fabrikam logo. When a user clicks the tile, the default Web browser opens http://www.fabrikam.com/support. When a user performs a search while offline, the system returns the matching offline Fabrikam topics in the **Help and Support** search results. When a user performs a search while online, the system returns the matching Fabrikam topics from the http://www.fabrikam.com/support/search page in the **Help and Support** search results. The Fabrikam name appears on the search-results page and on the OEM tile on the home page.

``` syntax
<HelpAndSupport>
  <Logo>C:\Fabrikam\Logos\Logo.bmp</Logo>
  <LogoURL>http://www.fabrikam.com/support</LogoURL>
  <Manufacturer>Fabrikam</Manufacturer>
  <SearchContent>true</SearchContent>
  <SupportSearchURL>http://www.fabrikam.com/support/search/?term={Query}</SupportSearchURL>
  <TileColor>16711680</TileColor>
</HelpAndSupport>
```

## Related topics


[Components](components-b-unattend.md)

[OEMInformation](microsoft-windows-shell-setup-oeminformation.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20HelpAndSupport%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





