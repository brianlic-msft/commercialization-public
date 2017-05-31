---
title: StartPages
description: StartPages
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: dfe41935-694e-46c9-ab1a-615706399d1c
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# StartPages


The `StartPages` setting specifies additional home pages opened when tabbed browsing is enabled.

To set the primary home page, use the [Home\_Page](microsoft-windows-ie-internetexplorer-home-page.md) setting. If you set **StartPages**, and do not set the Home\_Page setting, then the default MSN home page will appear as the first home page.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[StartPage](microsoft-windows-ie-internetexplorer-startpages-startpage.md)</p></td>
<td><p>Specifies a tabbed browsing home page.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md) | **StartPages**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md).

## XML Example


The following XML output shows how to set a primary home page and two secondary home pages.

``` syntax
<Home_Page>http://www.fabrikam.com</Home_Page>
<StartPages>
   <StartPage>
      <StartPageKey>StartPage1</StartPageKey>
      <StartPageUrl>http://www.fabrikam.com/news</StartPageUrl>
   </StartPage>
   <StartPage>
      <StartPageKey>StartPage2</StartPageKey>
      <StartPageUrl>http://www.contoso.com</StartPageUrl>
   </StartPage>
</StartPages>
```

## Related topics


[Home\_Page](microsoft-windows-ie-internetexplorer-home-page.md)

[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20StartPages%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





