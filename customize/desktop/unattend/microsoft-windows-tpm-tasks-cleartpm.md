---
title: Microsoft-Windows-TPM-Tasks-ClearTpm
description: Microsoft-Windows-TPM-Tasks-ClearTpm
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Microsoft-Windows-TPM-Tasks-ClearTpm

The `Microsoft-Windows-TPM-Tasks-ClearTpm` setting specifies whether to clear the Trusted Platform Module (TPM) during Windows setup.

Clearing the TPM prevents an issue in earlier versions that kept some Windows features from working if the TPM was incorrectly set.

## Value


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p><em>0</em></p></td>
<td><p>Do not clear the TPM. Default value.</p></td>
</tr><tr class="even">
<td><p><em>1</em></p></td>
<td><p>Clear the TPM only when Windows has taken ownership of the TPM. </p></td>
</tr><tr class="odd">
<td><p><em>2</em></p></td>
<td><p>Always clear the TPM. </p></td>
</tr>
</tbody>
</table>

## Parent Hierarchy


[Microsoft-Windows-TPM-Tasks](microsoft-windows-tpm-tasks.md) | **ClearTpm**

## Valid Configuration Passes


Specialize

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [Microsoft-Windows-TPM-Tasks](microsoft-windows-tpm-tasks.md).

## XML Example


The following XML shows how to use the `<ClearTpm>` setting in an unattend file.

``` syntax
<?xml version="1.0" encoding="UTF-8"?>

-<unattend xmlns="urn:schemas-microsoft-com:unattend">


-<settings pass="specialize">


-<component language="neutral" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" versionScope="nonSxS" publicKeyToken="31bf3856ad364e35" processorArchitecture="amd64" name="Microsoft-Windows-TPM-Tasks">

<ClearTpm>2</ClearTpm>

</component>

</settings>

<cpi:offlineImage xmlns:cpi="urn:schemas-microsoft-com:cpi" cpi:source="wim:c:/wims/14993/install.wim#Windows 10 Pro Insider Preview"/>

</unattend>
```

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20Microsoft-Windows-TwinUI%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")