---
title: FeedURL
description: FeedURL
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: b0be8c90-348d-46cb-80a3-ccf849ce07d0
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# FeedURL


`FeedURL` specifies the URL of a [FeedItem](microsoft-windows-ie-internetexplorer-feedlist-feeditem.md).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Feed_URL</em></p></td>
<td><p>Specifies the URL of the feed item. <em>Feed_URL</em> is a string.</p></td>
</tr>
</tbody>
</table>

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Parent Hierarchy


[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md) | [FeedList](microsoft-windows-ie-internetexplorer-feedlist.md) | [FeedItem](microsoft-windows-ie-internetexplorer-feedlist-feeditem.md) | **FeedURL**

## Valid Configuration Passes


specialize

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md).

## XML Example


The following XML output shows how to set a [FeedList](microsoft-windows-ie-internetexplorer-feedlist.md).

``` syntax
<FeedList>
   <FeedItem wcm:action="add">
      <FeedKey>Feed1</FeedKey>
      <FeedTitle>My Feed 1</FeedTitle>
      <FeedURL>http://www.fabrikam.com/rss1</FeedURL>
   </FeedItem>
   <FeedItem wcm:action="add">
      <FeedKey>Feed2</FeedKey>
      <FeedTitle>My Feed 2</FeedTitle>
      <FeedURL>http://www.fabrikam.com/rss2</FeedURL>
   </FeedItem>
</FeedList>
```

## Related topics


[FeedItem](microsoft-windows-ie-internetexplorer-feedlist-feeditem.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20FeedURL%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





