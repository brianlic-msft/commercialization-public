---
author: kpacquer
Description: 'Provides information about the type of line system.'
ms.assetid: 03dd827c-00f4-4288-b79d-7cfb3d4feab0
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'MFGPHONE\_LINESYSTEMTYPE enumeration'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# MFGPHONE\_LINESYSTEMTYPE enumeration


Provides information about the type of line system.

**MFGPHONE\_LINESYSTEMTYPE** is for phone manufacturers and can only be called in Manufacturing Mode.

**Syntax**

```ManagedCPlusPlus
typedef enum _MFGPHONE_LINESYSTEMTYPE { 
  MFGPHONE_LINESYSTEMTYPE_UNKNOWN   = 0,
  MFGPHONE_LINESYSTEMTYPE_GSM       = 1,
  MFGPHONE_LINESYSTEMTYPE_CDMA      = 2,
  MFGPHONE_LINESYSTEMTYPE_IMS       = 3
} MFGPHONE_LINESYSTEMTYPE;
```

**Constants**

<span id="MFGPHONE_LINESYSTEMTYPE_UNKNOWN_"></span><span id="mfgphone_linesystemtype_unknown_"></span>**MFGPHONE\_LINESYSTEMTYPE\_UNKNOWN**   
The line system type is unknown.

<span id="MFGPHONE_LINESYSTEMTYPE_GSM"></span><span id="mfgphone_linesystemtype_gsm"></span>**MFGPHONE\_LINESYSTEMTYPE\_GSM**  
The type of line system is GSM.

<span id="MFGPHONE_LINESYSTEMTYPE_CDMA"></span><span id="mfgphone_linesystemtype_cdma"></span>**MFGPHONE\_LINESYSTEMTYPE\_CDMA**  
The type of line system is CDMA.

<span id="MFGPHONE_LINESYSTEMTYPE_IMS"></span><span id="mfgphone_linesystemtype_ims"></span>**MFGPHONE\_LINESYSTEMTYPE\_IMS**  
The type of line system is IMS.

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

 

 





