---
author: kpacquer
Description: 'Ends a phone call.'
ms.assetid: 2f6ce0fe-177b-4af5-8673-a9a4316309e4
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: MfgPhoneEndCall function
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# MfgPhoneEndCall function


Ends a phone call.

**MfgPhoneEndCall** is for phone manufacturers and can only be called in Manufacturing Mode.

**Syntax**

```ManagedCPlusPlus
HRESULT APIENTRY MfgPhoneEndCall(
  _In_ UINT SimSlot  
);
```

**Parameters**

*SimSlot* \[in\]  
The SIM-based phone line whose call should be ended.

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

 

 





