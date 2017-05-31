---
title: Identifier
description: Identifier
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 4b9ba7ec-f231-4ab0-87b3-0f40d437cbed
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Identifier


`Identifier` specifies the interface to apply to other settings within [Interface](microsoft-windows-netbt-interfaces-interface.md). It can be expressed in one of the following ways:

-   As a string representation of an interface net locally unique identifier (NetLUID) (0x6000001000000)

-   As an interface alias (Local Area Connection)

-   As an interface MAC address (00-11-22-33-44-55)

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>Identifier</em></p></td>
<td><p>Specifies the interface to apply to the other settings within the [Interface](microsoft-windows-netbt-interfaces-interface.md) setting. <em>Identifier</em> is a string with a maximum length of 256 characters.</p></td>
</tr>
</tbody>
</table>

 

This string type does not support empty elements. Do not create an empty value for this setting.

## Parent Hierarchy


[microsoft-windows-netbt-](microsoft-windows-netbt.md) | [Interfaces](microsoft-windows-netbt-interfaces.md) | [Interface](microsoft-windows-netbt-interfaces-interface.md) | **Identifier**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-netbt-](microsoft-windows-netbt.md).

## XML Example


The following XML output shows how to configure microsoft-windows-netbt-.

``` syntax
<Interfaces>
   <Interface wcm:action="add">
      <NameServerList>
         <IpAddress wcm:action="add" wcm:keyValue="IpAddress1">123.45.67.89</IpAddress>
         <IpAddress wcm:action="add" wcm:keyValue="IpAddress2">56.78.90.123</IpAddress>
       </NameServerList>
       <NetbiosOptions>2</NetbiosOptions>
       <Identifier>Local Area Connection</Identifier>
   </Interface>
</Interfaces>
```

## Related topics


[Interface](microsoft-windows-netbt-interfaces-interface.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Identifier%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





