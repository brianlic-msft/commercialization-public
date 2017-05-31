---
author: kpacquer
Description: 'Returns a boolean indicating whether the phone speaker is being used, as opposed to the handset earphone.'
ms.assetid: 933f0816-a094-4f7b-a26f-5d31ed97f677
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: MfgPhoneGetSpeaker function
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# MfgPhoneGetSpeaker function


Returns a boolean indicating whether the phone speaker is being used, as opposed to the handset earphone.

**MfgPhoneGetSpeaker** is for phone manufacturers and can only be called in Manufacturing Mode.

**Syntax**

```ManagedCPlusPlus
HRESULT APIENTRY MfgPhoneGetSpeaker(
  _Out_ PBOOL pbSpeakerOn
);
```

**Parameters**

*pbSpeakerOn* \[out\]  
TRUE if the speaker is being used, otherwise FALSE.

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

 

 





