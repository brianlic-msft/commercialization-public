---
author: kpacquer
Description: 'Initializes the phone system and the internal state of the API implemented by DLL.'
ms.assetid: b9a9f95e-32ca-49fe-8f8c-9bf00d899edf
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: MfgPhoneInitialize function
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# MfgPhoneInitialize function


Initializes the phone system and the internal state of the API implemented by DLL.

**MfgPhoneInitialize** is for phone manufacturers and can only be called in Manufacturing Mode.

**Syntax**

```ManagedCPlusPlus
HRESULT APIENTRY MfgPhoneInitialize(void);
```

**Parameters**

This function has no parameters.

**Return value**

S\_OK is returned upon success and an error code is returned otherwise.

**Requirements**

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><p>Header</p></td>
<td align="left">Mfgphone.h (include Mfgphone.h)</td>
</tr>
<tr class="even">
<td align="left"><p>DLL</p></td>
<td align="left">MFGPHONE.DLL</td>
</tr>
</tbody>
</table>

 

 





