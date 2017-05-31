---
title: ItemUrl
description: ItemUrl
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c9ac59e1-e0d6-40ca-969e-dde1e29af88f
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ItemUrl


`ItemUrl` contains the path to a predefined Favorite item on the Favorite bar.

A Favorite can include web content such as links, feeds, web slices, or documents, such as Microsoft Word, Microsoft Excel and Microsoft PowerPoint documents.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><code>path</code></p></td>
<td><p>Specifies the path to the Favorite.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md) | [FavoriteBarItems](microsoft-windows-ie-internetexplorer-favoritebaritems.md) | [FavoriteBarItem](microsoft-windows-ie-internetexplorer-favoritebaritems-favoritebaritem.md) | **ItemURL**

## Applies To


For the list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md).

## XML Example


The following XML example shows three Favorite bar items.

``` syntax
<FavoriteBarItems> 
  <FavoriteBarItem> 
    <ItemKey>1</ItemKey> 
    <ItemName>Name1</ItemName> 
    <ItemUrl>http://www.fabrikam.com/stockwatch#stockprice</ItemUrl> 
    <ItemType>Webslice</ItemType> 
  </FavoriteBarItem> 
  <FavoriteBarItem> 
    <ItemKey>2</ItemKey> 
    <ItemName>Name2</ItemName> 
    <ItemUrl>http://www.msn.com/rss/ie8_slideshow.aspx</ItemUrl> 
    <ItemType>Webslice</ItemType> 
  </FavoriteBarItem> 
  <FavoriteBarItem> 
    <ItemKey>3</ItemKey> 
    <ItemName>Name3</ItemName> 
    <ItemUrl>http://www.fabrikam.com/xml/HomePage.xml</ItemUrl> 
    <ItemType>Headline</ItemType> 
  </FavoriteBarItem> 
</FavoriteBarItems>
```

## Related topics


[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20ItemUrl%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





