---
title: AccountData
description: AccountData
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: A437953E-2D78-4183-89F1-1F1F36121427
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# AccountData


`AccountData` specifies account data used when joining a domain.

For information about joining a domain using Provisioning, see the MSDN topic, [NetJoin](http://go.microsoft.com/fwlink/?LinkId=124095).

To generate the `AccountData` information:

1.  Use the command:

    **djoin.exe** /provision /domain domainname /machine machinename /savefile filename

    Example:

    ``` syntax
    djoin.exe /provision /domain contoso.com /machine machinename /savefile AccountData.txt
    ```

2.  Copy and paste the contents of AccountData.txt to the answer file.

## Values


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>AccountData</em></p></td>
<td><p>Specifies account data used when joining a domain.</p>
<p><em>AccountData</em> is a string.</p></td>
</tr>
</tbody>
</table>

 

This string type supports empty elements.

## Valid Configuration Passes


offlineServicing

## Parent Hierarchy


[Microsoft-Windows-UnattendedJoin](microsoft-windows-unattendedjoin.md) | [OfflineIdentification](microsoft-windows-unattendedjoin-offlineidentification.md) | [Provisioning](microsoft-windows-unattendedjoin-offlineidentfication-provisioning.md) | **AccountData**

## Applies To


Windows 10 for desktop editions (Home, Pro, Enterprise, and Education)

Windows Server 2016

For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-UnattendedJoin](microsoft-windows-unattendedjoin.md).

## XML Example


The following XML output shows how to set the Provisioning settings.

``` syntax
<OfflineIdentification>
   <Provisioning>
      <AccountData>BASE64-ENCODED-BLOB</AccountData>   
   </Provisioning>
</OfflineIdentification>
```

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20AccountData%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




