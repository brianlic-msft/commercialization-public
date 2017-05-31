---
title: QLID
description: QLID
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2cd5f2b4-9f36-4812-85d7-a0b3af009de9
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# QLID


`QLID` specifies a unique ID to associate with a [QuickLinkItem](microsoft-windows-ie-internetexplorer-quicklinklist-quicklinkitem.md).

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>ID</em></p></td>
<td><p>Specifies a unique value to represent the [QuickLinkItem](microsoft-windows-ie-internetexplorer-quicklinklist-quicklinkitem.md). <em>ID</em> is a string.</p></td>
</tr>
</tbody>
</table>

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Valid Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md) | [QuickLinkList](microsoft-windows-ie-internetexplorer-quicklinklist.md) | [QuickLinkItem](microsoft-windows-ie-internetexplorer-quicklinklist-quicklinkitem.md) | **QLID**

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


[QuickLinkItem](microsoft-windows-ie-internetexplorer-quicklinklist-quicklinkitem.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20QLID%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





