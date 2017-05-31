---
title: Accelerator
description: Accelerator
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 94dca439-9805-4596-b1e6-d85ff0f7a1ed
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Accelerator


`Accelerator` contains the settings that add a predefined Accelerator.

**Note**  
This element does not appear in the **Properties** pane of Windows System Image Manager (Windows SIM) until you add this element to the answer file.

 

Accelerators are menu options in Internet Explorer that help automate common browser-related tasks. In Internet Explorer, when you right-click selected text, Accelerators appear in the list of available options. For example, if you select an address, you can use an Accelerator to show a map of that address.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[AcceleratorXML](microsoft-windows-ie-internetexplorer-accelerators-accelerator-acceleratorxml.md)</p></td>
<td><p>Specifies the URL of an Accelerator XML file.</p></td>
</tr>
<tr class="even">
<td><p>[ItemKey](microsoft-windows-ie-internetexplorer-accelerators-accelerator-itemkey.md)</p></td>
<td><p>Specifies a unique key for the Accelerator.</p></td>
</tr>
<tr class="odd">
<td><p>[IsDefault](microsoft-windows-ie-internetexplorer-accelerators-accelerator-isdefault.md)</p></td>
<td><p>Specifies whether the Accelerator is the default Accelerator.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md) | [Accelerators](microsoft-windows-ie-internetexplorer-accelerators.md)| **Accelerator**

## Applies To


For a list of Windows editions and architectures that this component supports, see [Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md).

## XML Example


The following XML output specifies adding two Accelerators.

``` syntax
<Accelerators>
  <Accelerator wcm:action="add">
    <AcceleratorXML>C:\Fabrikam\Accelerator1.xml</AcceleratorXML>
    <ItemKey>Accelerator1</ItemKey> 
    <IsDefault>true</IsDefault> 
  </Accelerator>
  <Accelerator wcm:action="add">
    <AcceleratorXML>C:\Fabrikam\Accelerator2.xml</AcceleratorXML> 
    <ItemKey>Accelerator2</ItemKey> 
  </Accelerator>
</Accelerators>
```

## Related topics


[Accelerators](microsoft-windows-ie-internetexplorer-accelerators.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Accelerator%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





