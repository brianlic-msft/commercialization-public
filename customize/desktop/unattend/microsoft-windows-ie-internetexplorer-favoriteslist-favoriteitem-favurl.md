---
title: FavURL
description: FavURL
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 7b9cea4b-a6ef-40cd-906a-32062e5951fd
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# FavURL


`FavURL` specifies a Uniform Resource Locator (URL) to associate with a [FavoriteItem](microsoft-windows-ie-internetexplorer-favoriteslist-favoriteitem.md).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Url</em></p></td>
<td><p>Specifies the fully qualified path that begins with the <strong>http://</strong> prefix to the URL of each [FavoriteItem](microsoft-windows-ie-internetexplorer-favoriteslist-favoriteitem.md). <em>Url</em> is a string.</p></td>
</tr>
</tbody>
</table>

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Valid Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md) | [FavoritesList](microsoft-windows-ie-internetexplorer-favoriteslist.md) | [FavoriteItem](microsoft-windows-ie-internetexplorer-favoriteslist-favoriteitem.md) | **FavURL**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md).

## XML Example


The following XML output specifies how to configure favorites.

``` syntax
<FavoritesList>
   <FavoriteItem wcm:action="add">
      <FavIconFile>C:\Windows\favlink1.ico</FavIconFile>
      <FavID>Favorite1</FavID>
      <FavOffLine>true</FavOffLine>
      <FavTitle>My Favorite</FavTitle>
      <FavURL>http://www.fabrikam.com/myfav1</FavURL>
   </FavoriteItem>
  <FavoriteItem wcm:action="add">
      <FavIconFile> C:\Windows\favlink2.ico </FavIconFile>
      <FavID>Favorite2</FavID>
      <FavOffLine>true</FavOffLine>
      <FavTitle>Favorite 2</FavTitle>
      <FavURL>http://www.fabrikam.com/myfav2</FavURL>
   </FavoriteItem>
</FavoritesList>
```

## Related topics


[FavoriteItem](microsoft-windows-ie-internetexplorer-favoriteslist-favoriteitem.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20FavURL%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





