---
author: kpacquer
Description: 'Callback-based notification mechanism for receiving events on SIM-based phone lines.'
ms.assetid: 58ca5582-71d0-4b33-a3b3-68374c6ed1d5
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: MfgPhoneSetSimLineEventNotifyCallback function
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# MfgPhoneSetSimLineEventNotifyCallback function


Callback-based notification mechanism for receiving events on SIM-based phone lines.

**MfgPhoneSetSimLineEventNotifyCallback** is for phone manufacturers and can only be called in Manufacturing Mode.

**Syntax**

```ManagedCPlusPlus
HRESULT APIENTRY MfgPhoneSetSimLineEventNotifyCallback(
  _In_ MFGPHONE_SIMLINEEVENT_NOTIFY_CALLBACK  Callback,
  _In_ PVOID                                  Context
);
```

**Parameters**

*Callback* \[in\]  
The callback function to call when the event occurs.

*Context* \[in\]  
The context.

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

 

 





