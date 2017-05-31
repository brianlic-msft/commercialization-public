---
author: kpacquer
Description: 'These APIs are used by phone manufacturers to test phone call functionality while the device is booted into Manufacturing Mode.'
ms.assetid: 3a1bdf3e-e95d-4277-bad7-1063a138f473
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Manufacturing Mode Phone Call Testing APIs
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Manufacturing Mode Phone Call Testing APIs


\[Some information relates to pre-released product, which may be substantially modified before it's commercially released. Microsoft makes no warranties, express or implied, with respect to the information provided here.\]

These APIs are used by phone manufacturers to test phone call functionality while the device is booted into Manufacturing Mode.

## <span id="in_this_section"></span>In this section


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Topic</th>
<th align="left">Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>[<strong>MfgPhoneDial</strong>](mfgphonedial.md)</p></td>
<td align="left"><p>Causes the phone to dial a call.</p></td>
</tr>
<tr class="even">
<td align="left"><p>[<strong>MfgPhoneEndCall</strong>](mfgphoneendcall.md)</p></td>
<td align="left"><p>Ends a phone call.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>[<strong>MfgPhoneGetSimLineCount</strong>](mfgphonegetsimlinecount.md)</p></td>
<td align="left"><p>Gets the number of currently detected SIM slots.</p></td>
</tr>
<tr class="even">
<td align="left"><p>[<strong>MfgPhoneGetSimLineDetail</strong>](mfgphonegetsimlinedetail.md)</p></td>
<td align="left"><p>Retrieves a struct that contains the current details for a given SIM-based phone line.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>[<strong>MfgPhoneGetSpeaker</strong>](mfgphonegetspeaker.md)</p></td>
<td align="left"><p>Returns a boolean indicating whether the phone speaker is being used, as opposed to the handset earphone.</p></td>
</tr>
<tr class="even">
<td align="left"><p>[<strong>MfgPhoneInitialize</strong>](mfgphoneinitialize.md)</p></td>
<td align="left"><p>Initializes the phone system and the internal state of the API implemented by DLL.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>[<strong>MfgPhoneSetSimLineEventNotifyCallback</strong>](mfgphonesetsimlineeventnotifycallback.md)</p></td>
<td align="left"><p>Callback-based notification mechanism for receiving events on SIM-based phone lines.</p></td>
</tr>
<tr class="even">
<td align="left"><p>[<strong>MfgPhoneSetSpeaker</strong>](mfgphonesetspeaker.md)</p></td>
<td align="left"><p>Sets a value indicating whether the phone speaker should be used, as opposed to the handset earphone.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>[<strong>MfgPhoneUninitialize</strong>](mfgphoneuninitialize.md)</p></td>
<td align="left"><p>Uninitializes the phone system and the internal state of the API implemented by DLL.</p></td>
</tr>
<tr class="even">
<td align="left"><p>[<strong>MFGPHONE_CALLSTATUS</strong>](mfgphone-callstatus.md)</p></td>
<td align="left"><p>Provides information about the status of the call.</p></td>
</tr>
<tr class="odd">
<td align="left"><p>[<strong>MFGPHONE_LINESYSTEMTYPE</strong>](mfgphone-linesystemtype.md)</p></td>
<td align="left"><p>Provides information about the type of line system.</p></td>
</tr>
<tr class="even">
<td align="left"><p>[<strong>MFGPHONE_REGISTRATIONSTATE</strong>](mfgphone-registrationstate.md)</p></td>
<td align="left"><p>Provides information about the state of the phone line? call?</p></td>
</tr>
<tr class="odd">
<td align="left"><p>[<strong>MFGPHONE_SIMLINEDETAIL</strong>](mfgphone-simlinedetail.md)</p></td>
<td align="left"><p>Provides information about a particular SIM-based phone line.</p></td>
</tr>
<tr class="even">
<td align="left"><p>[<strong>MFGPHONE_SIMSTATE</strong>](mfgphone-simstate.md)</p></td>
<td align="left"><p>Provides information about the state of the SIM.</p></td>
</tr>
</tbody>
</table>

 

 

 





