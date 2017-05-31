---
author: kpacquer
Description: 'Provides information about the state of the SIM.'
ms.assetid: 8533be42-70de-433c-89ac-2c623d9b4397
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'MFGPHONE\_SIMSTATE enumeration'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# MFGPHONE\_SIMSTATE enumeration


Provides information about the state of the SIM.

**MFGPHONE\_SIMSTATE** is for phone manufacturers and can only be called in Manufacturing Mode.

**Syntax**

```ManagedCPlusPlus
typedef enum _MFGPHONE_SIMSTATE { 
  MFGPHONE_SIMSTATE_UNKNOWN   = 0,
  MFGPHONE_SIMSTATE_NONE      = 1,
  MFGPHONE_SIMSTATE_ACTIVE    = 2,
  MFGPHONE_SIMSTATE_INVALID   = 3,
  MFGPHONE_SIMSTATE_LOCKED    = 4,
  MFGPHONE_SIMSTATE_DISABLED  = 5
} MFGPHONE_SIMSTATE;
```

**Constants**

<span id="MFGPHONE_SIMSTATE_UNKNOWN"></span><span id="mfgphone_simstate_unknown"></span>**MFGPHONE\_SIMSTATE\_UNKNOWN**  
The SIM state is unknown.

<span id="MFGPHONE_SIMSTATE_NONE"></span><span id="mfgphone_simstate_none"></span>**MFGPHONE\_SIMSTATE\_NONE**  
The SIM state is none. There is no SIM.

<span id="MFGPHONE_SIMSTATE_ACTIVE"></span><span id="mfgphone_simstate_active"></span>**MFGPHONE\_SIMSTATE\_ACTIVE**  
The SIM state is active.

<span id="MFGPHONE_SIMSTATE_INVALID"></span><span id="mfgphone_simstate_invalid"></span>**MFGPHONE\_SIMSTATE\_INVALID**  
The SIM state is invalid.

<span id="MFGPHONE_SIMSTATE_LOCKED"></span><span id="mfgphone_simstate_locked"></span>**MFGPHONE\_SIMSTATE\_LOCKED**  
The SIM state is locked.

<span id="MFGPHONE_SIMSTATE_DISABLED"></span><span id="mfgphone_simstate_disabled"></span>**MFGPHONE\_SIMSTATE\_DISABLED**  
The SIM state is disabled.

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

 

 





