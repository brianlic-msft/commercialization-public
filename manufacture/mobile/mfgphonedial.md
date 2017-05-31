---
author: kpacquer
Description: 'Causes the phone to dial a call.'
ms.assetid: f01afc0d-70cf-4d13-8d99-fb27bb329376
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: MfgPhoneDial function
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# MfgPhoneDial function


Causes the phone to dial a call.

**MfgPhoneDial** is for phone manufacturers and can only be called in Manufacturing Mode.

**Syntax**

```ManagedCPlusPlus
HRESULT APIENTRY MfgPhoneDial(
  _In_ UINT    SimSlot,
  _In_ PCWSTR  DialNumber
);
```

**Parameters**

*SimSlot* \[in\]  
The SIM-based phone line to use.

*DialNumber* \[in\]  
The phone number to dial.

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

 

 





