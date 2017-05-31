---
author: kpacquer
Description: 'Provides information about a particular SIM-based phone line.'
ms.assetid: 004fe04e-48dc-4569-882a-035ca6918498
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'MFGPHONE\_SIMLINEDETAIL structure'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# MFGPHONE\_SIMLINEDETAIL structure


Provides information about a particular SIM-based phone line. This **struct** is retrieved via the [**MfgPhoneGetSimLineDetail**](mfgphonegetsimlinedetail.md) function.

**MFGPHONE\_SIMLINEDETAIL** iis for phone manufacturers and can only be called in Manufacturing Mode.

**Syntax**

```ManagedCPlusPlus
typedef struct _MFGPHONE_SIMLINEDETAIL {
  UINT                       SimSlot;
  MFGPHONE_SIMSTATE          SimState;
  MFGPHONE_REGISTRATIONSTATE RegistrationState;
  WCHAR  [64]                NetworkName;
  MFGPHONE_LINESYSTEMTYPE    LineSystemType;
  UINT                       SignalStrength;
  MFGPHONE_CALLSTATUS        CallStatus;
} MFGPHONE_SIMLINEDETAIL, *PMFGPHONE_SIMLINEDETAIL;
```

**Members**

**SimSlot**  
The SIM-based phone line to which the details in this struct pertain.

**SimState**  
An **enum** specifying the current state of the SIM-based phone line.

**RegistrationState**  
An **enum** specifying the current registration state of the phone line.

**NetworkName**  
WCHAR containing the name of the network.

**LineSystemType**  
An **enum** specifying the line system type of the phone line.

**SignalStrength**  
Unsigned Integer containing the signal strength of the phone line.

**CallStatus**  
An **enum** specifying the call status of the phone line.

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

 

 





