---
author: kpacquer
Description: 'Provides information about the state of the phone line? call?.'
ms.assetid: 0157eda2-5066-4f2e-95f8-1ae990db2540
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'MFGPHONE\_REGISTRATIONSTATE enumeration'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# MFGPHONE\_REGISTRATIONSTATE enumeration


Provides information about the state of the phone line? call?

**MFGPHONE\_REGISTRATIONSTATE** is for phone manufacturers and can only be called in Manufacturing Mode.

**Syntax**

```ManagedCPlusPlus
typedef enum _MFGPHONE_REGISTRATIONSTATE { 
  MFGPHONE_REGISTRATIONSTATE_UNKNOWN           = 0,
  MFGPHONE_REGISTRATIONSTATE_NOSIGNAL          = 1,
      MFGPHONE_REGISTRATIONSTATE_UNREGISTERED  = 2,
  MFGPHONE_REGISTRATIONSTATE_REGISTERING       = 3,
  MFGPHONE_REGISTRATIONSTATE_REGISTERED        = 4,
  MFGPHONE_REGISTRATIONSTATE_DENIED            = 5
} MFGPHONE_REGISTRATIONSTATE;
```

**Constants**

<span id="MFGPHONE_REGISTRATIONSTATE_UNKNOWN"></span><span id="mfgphone_registrationstate_unknown"></span>**MFGPHONE\_REGISTRATIONSTATE\_UNKNOWN**  
The registration state is not known.

<span id="MFGPHONE_REGISTRATIONSTATE_NOSIGNAL"></span><span id="mfgphone_registrationstate_nosignal"></span>**MFGPHONE\_REGISTRATIONSTATE\_NOSIGNAL**  
There is no signal to detect the registration state.

<span id="____MFGPHONE_REGISTRATIONSTATE_UNREGISTERED"></span><span id="____mfgphone_registrationstate_unregistered"></span> **MFGPHONE\_REGISTRATIONSTATE\_UNREGISTERED**  
The registration state is unregistered.

<span id="MFGPHONE_REGISTRATIONSTATE_REGISTERING"></span><span id="mfgphone_registrationstate_registering"></span>**MFGPHONE\_REGISTRATIONSTATE\_REGISTERING**  
The registration state is registering.

<span id="MFGPHONE_REGISTRATIONSTATE_REGISTERED"></span><span id="mfgphone_registrationstate_registered"></span>**MFGPHONE\_REGISTRATIONSTATE\_REGISTERED**  
The registration state is registered.

<span id="MFGPHONE_REGISTRATIONSTATE_DENIED"></span><span id="mfgphone_registrationstate_denied"></span>**MFGPHONE\_REGISTRATIONSTATE\_DENIED**  
The registration state is denied.

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
</tbody>
</table>

 

 





