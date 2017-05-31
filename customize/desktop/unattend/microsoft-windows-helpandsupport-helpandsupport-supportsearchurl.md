---
title: SupportSearchURL
description: SupportSearchURL
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: cb9ed493-50bf-4d0e-ac0e-d571569e7323
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# SupportSearchURL


**Note**  
In Windows 10, this setting and other [HelpAndSupport](microsoft-windows-helpandsupport-helpandsupport.md) settings are deprecated because the Help component that they impact is being retired. Existing information in this topic is provided for reference only.

For more information on how OEMs can include their customer support contact information in the Contact Support App or Support Web page, see [OEMInformation](microsoft-windows-shell-setup-oeminformation.md).

 

`SupportSearchURL` specifies the URL that the system uses to display a search link on the page of search results. For example, when a user performs a search in **Help and Support**, a link to the Original Equipment Manufacturer's (OEM's) webpage appears at the bottom of the search results. When the user clicks this link, the default web browser opens the webpage.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>&lt;URL&gt;</em></p></td>
<td><p>Specifies the URL of a link to a support page. <em>&lt;URL&gt;</em> is a string.</p>
<p>The URL can include a placeholder variable named <code>{Query}</code> for the search query. If this variable is in the URL, the system replaces the variable with the user's search query before it sends the URL to the browser:</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


oobeSystem

specialize

## Parent Hierarchy


[Microsoft-Windows-HelpAndSupport](microsoft-windows-helpandsupport.md) | [HelpAndSupport](microsoft-windows-helpandsupport-helpandsupport.md) | `SupportSearchURL`

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-HelpAndSupport](microsoft-windows-helpandsupport.md).

## XML Example


The following example shows how to set a customized **Help and Support** page.

When a user searches on the **Help and Support** page for "email", the **Support** section of the **Search Results** pane displays results from the `http://www.fabrikam.com/support/search/?term=email` webpage.

``` syntax
<HelpAndSupport>
  <Logo>C:\Fabrikam\Logos\Logo.png</Logo>
  <LogoURL>http://www.fabrikam.com/support</LogoURL>
  <Manufacturer>Fabrikam</Manufacturer>
  <SupportSearchURL>http://www.fabrikam.com/support/search/?term={Query}</SupportSearchURL>
</HelpAndSupport>
```

## Related topics


[Microsoft-Windows-HelpAndSupport](microsoft-windows-helpandsupport.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20SupportSearchURL%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





