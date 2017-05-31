---
author: kpacquer
Description: 'Gets the number of currently detected SIM slots.'
ms.assetid: 432b3748-4444-41b8-ac0b-f227d0f36aef
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: MfgPhoneGetSimLineCount function
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# MfgPhoneGetSimLineCount function


Gets the number of currently detected SIM slots.

**MfgPhoneGetSimLineCount** is for phone manufacturers and can only be called in Manufacturing Mode.

**Syntax**

```ManagedCPlusPlus
HRESULT APIENTRY MfgPhoneGetSimLineCount(
  _Out_ PUINT SimLineCount
);
```

**Parameters**

*SimLineCount* \[out\]  
Pointer to a **UINT** that specifies the number of currently detected SIM slots. Both active and inactive SIM slots are included in the count.

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

 

 





