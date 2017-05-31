---
author: kpacquer
Description: 'Retrieves a struct that contains the current details for a given SIM-based phone line.'
ms.assetid: 6ff31b2e-4a76-48cc-aefd-f015eb8cdf4a
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: MfgPhoneGetSimLineDetail function
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# MfgPhoneGetSimLineDetail function


Retrieves a struct that contains the current details for a given SIM-based phone line.

**MfgPhoneGetSimLineDetail** is for phone manufacturers and can only be called in Manufacturing Mode.

**Syntax**

```ManagedCPlusPlus
HRESULT APIENTRY MfgPhoneGetSimLineDetail(
  _In_  UINT                     SimSlot,
  _Out_ PMFGPHONE_SIMLINEDETAIL  SimLineDetail,
  _In_  ULONG                    SimLineDetailSize,
  _Out_ PULONG                   RequiredSize
);
```

**Parameters**

*SimSlot* \[in\]  
Specifies the SIM-based phone line.

*SimLineDetail* \[out\]  
Pointer to a [**MFGPHONE\_SIMLINEDETAIL**](mfgphone-simlinedetail.md) struct that contains the current details for the SIM-based phone line specified by *SimSlot*.

*SimLineDetailSize* \[in\]  
Specifies the size of the **SimLineDetail** parameter.

*RequiredSize* \[out\]  
Specifies the required size for the **SimLineDetail** parameter.

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

 

 





