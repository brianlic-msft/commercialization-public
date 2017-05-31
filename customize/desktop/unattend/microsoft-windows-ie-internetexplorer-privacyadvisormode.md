---
title: PrivacyAdvisorMode
description: PrivacyAdvisorMode
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c9514954-0b31-4f4b-b70f-94f692f3f909
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# PrivacyAdvisorMode


`PrivacyAdvisorMode` specifies whether InPrivate Browsing and InPrivate Blocking are active in Internet Explorer, and when they provide alerts.

InPrivate Browsing prevents Internet Explorer from storing data about your browsing session. This includes cookies, temporary Internet files, history, and other data.

InPrivate Blocking helps prevent the websites you go to from automatically sharing details about your visit with other websites. To help protect your privacy, some website content may be blocked.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>InPrivate Blocking is off.</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>InPrivate Blocking is set to Manually Block. Individual websites to be blocked must be added to the list manually.</p></td>
</tr>
<tr class="odd">
<td><p>2</p></td>
<td><p>InPrivate Blocking is set to Automatic.</p>
<p>This is the default value.</p></td>
</tr>
</tbody>
</table>

 

## Valid Configuration Passes


specialize

## Parent Hierarchy


[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md) | **PrivacyAdvisorMode**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md).

## XML Example


The following XML output shows how to configure Internet Explorer to turn off InPrivate Blocking and InPrivate Browsing.

``` syntax
<PrivacyAdvisorMode>0</PrivacyAdvisorMode>
```

## Related topics


[Microsoft-Windows-IE-InternetExplorer](microsoft-windows-ie-internetexplorer.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20PrivacyAdvisorMode%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





