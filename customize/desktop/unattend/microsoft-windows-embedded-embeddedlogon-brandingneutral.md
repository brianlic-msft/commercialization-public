---
title: BrandingNeutral
description: Specifies which UI elements display on the Welcome screen.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 6B2FE91F-030A-4A37-8F34-E26F92E3464B
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# BrandingNeutral


Specifies which UI elements display on the Welcome screen.

## Values


The following table shows the possible values. You can combine these values using bitwise exclusive-OR logic to disable multiple Welcome screen UI elements.

The default value is 17, which disables all Welcome screen UI elements and the **Switch user** button.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Value</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>1</p></td>
<td><p>Disables all Welcome screen UI elements.</p></td>
</tr>
<tr class="even">
<td><p>2</p></td>
<td><p>Disables the <strong>Power</strong> button.</p></td>
</tr>
<tr class="odd">
<td><p>4</p></td>
<td><p>Disables the <strong>Language</strong> button.</p></td>
</tr>
<tr class="even">
<td><p>8</p></td>
<td><p>Disables the <strong>Ease of access</strong> button.</p></td>
</tr>
<tr class="odd">
<td><p>16</p></td>
<td><p>Disables the <strong>Switch user</strong> button.</p></td>
</tr>
<tr class="even">
<td><p>32</p></td>
<td><p>Disables the blocked shutdown resolver (BSDR) screen so that restarting or shutting down the system causes the OS to immediately force close any applications that are blocking system shut down. No UI is displayed and users are not given a chance to cancel the shutdown process. This can result in a loss of data if any open applications have unsaved data.</p></td>
</tr>
</tbody>
</table>

 

## Parent Hierarchy


[Microsoft-Windows-Embedded-EmbeddedLogon](microsoft-windows-embedded-embeddedlogon.md) | **BrandingNeutral**

## Valid Configuration Passes


offlineServicing

specialize

## Applies To


For a list of the Windows editions and architectures that this component supports, see [Microsoft-Windows-Embedded-EmbeddedLogon](microsoft-windows-embedded-embeddedlogon.md).

## XML example


``` syntax
<settings pass="specialize">
    <component name="Microsoft-Windows-Embedded-EmbeddedLogon" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <BrandingNeutral>17</BrandingNeutral>
    </component>
</settings>
```

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20BrandingNeutral%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")




