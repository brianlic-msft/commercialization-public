---
title: QuickLinkItem
description: QuickLinkItem
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2c525eb2-440e-4aef-bffd-f405d41b6622
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# QuickLinkItem


`QuickLinkItem` specifies the unique ID, the friendly site name that is displayed on the **Favorites** toolbar, and an associated Uniform Resource Locator (URL).

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[QLID](microsoft-windows-ie-internetexplorer-quicklinklist-quicklinkitem-qlid.md)</p></td>
<td><p>Specifies a unique ID to associate with a <code>QuickLinkItem</code>.</p></td>
</tr>
<tr class="even">
<td><p>[QuickLinkName](microsoft-windows-ie-internetexplorer-quicklinklist-quicklinkitem-quicklinkname.md)</p></td>
<td><p>Specifies a friendly name for the <code>QuickLinkItem</code>, as it appears on the <strong>Favorites</strong> toolbar.</p></td>
</tr>
<tr class="odd">
<td><p>[QuickLinkUrl](microsoft-windows-ie-internetexplorer-quicklinklist-quicklinkitem-quicklinkurl.md)</p></td>
<td><p>Specifies a URL value to associate with a <code>QuickLinkItem</code>.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md) | [QuickLinkList](microsoft-windows-ie-internetexplorer-quicklinklist.md) | **QuickLinkItem**

## Applies To


For the list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md).

## XML Example


The following XML output shows how to configure a [QuickLinkList](microsoft-windows-ie-internetexplorer-quicklinklist.md).

``` syntax
<QuickLinkList>
   <QuickLinkItem>
      <QLID>0</QLID>
      <QuickLinkUrl>http://www.fabrikam.com/QL.htm</QuickLinkUrl>
      <QuickLinkName>Fabrikam Quick Link</QuickLinkName>
   </QuickLinkItem>
   <QuickLinkItem>
      <QLID>1</QLID>
      <QuickLinkUrl>http://www.fabrikam.com/QL2.htm</QuickLinkUrl>
      <QuickLinkName>Fabrikam Quick Link 2</QuickLinkName>
   </QuickLinkItem>
</QuickLinkList>
```

## Related topics


[QuickLinkList](microsoft-windows-ie-internetexplorer-quicklinklist.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20QuickLinkItem%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





