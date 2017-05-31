---
author: kpacquer
Description: 'Provides information about the status of the call.'
ms.assetid: dcd0fe41-15bf-4615-a9ed-aaf15dde5078
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'MFGPHONE\_CALLSTATUS enumeration'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# MFGPHONE\_CALLSTATUS enumeration


Provides information about the status of the call.

**MFGPHONE\_CALLSTATUS** is for phone manufacturers and can only be called in Manufacturing Mode.

**Syntax**

```ManagedCPlusPlus
typedef enum _MFGPHONE_CALLSTATUS { 
  MFGPHONE_CALLSTATUS_UNKNOWN   = 0,
  MFGPHONE_CALLSTATUS_IDLE      = 1,
  MFGPHONE_CALLSTATUS_CALLING   = 2,
  MFGPHONE_CALLSTATUS_INCOMING  = 3,
  MFGPHONE_CALLSTATUS_ACTIVE    = 4
} MFGPHONE_CALLSTATUS;
```

**Constants**

<span id="MFGPHONE_CALLSTATUS_UNKNOWN_"></span><span id="mfgphone_callstatus_unknown_"></span>**MFGPHONE\_CALLSTATUS\_UNKNOWN**   
The call status is unknown.

<span id="MFGPHONE_CALLSTATUS_IDLE"></span><span id="mfgphone_callstatus_idle"></span>**MFGPHONE\_CALLSTATUS\_IDLE**  
The call status is idle.

<span id="MFGPHONE_CALLSTATUS_CALLING"></span><span id="mfgphone_callstatus_calling"></span>**MFGPHONE\_CALLSTATUS\_CALLING**  
The call status is calling.

<span id="MFGPHONE_CALLSTATUS_INCOMING"></span><span id="mfgphone_callstatus_incoming"></span>**MFGPHONE\_CALLSTATUS\_INCOMING**  
The call status is incoming.

<span id="MFGPHONE_CALLSTATUS_ACTIVE"></span><span id="mfgphone_callstatus_active"></span>**MFGPHONE\_CALLSTATUS\_ACTIVE**  
The call status is active.

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

 

 





