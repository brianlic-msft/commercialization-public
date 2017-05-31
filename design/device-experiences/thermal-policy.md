---
title: THERMAL\_POLICY
description: The THERMAL\_POLICY struct is used with the IOCTL\_THERMAL\_READ\_POLICY IO control code.
MS-HAID:
- 'cstandby.thermal\_policy'
- 'p\_weg\_hardware.thermal\_policy'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: C26D5AE4-92A8-4FBA-A930-79DF4B9A4E0B
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# THERMAL\_POLICY


The THERMAL\_POLICY struct is used with the [IOCTL\_THERMAL\_READ\_POLICY](ioctl-thermal-read-policy.md) IO control code. Policy drivers use IOCTL\_THERMAL\_READ\_POLICY to set the thermal policy for their associated thermal zone. If no thermal policy is specified, then the kernel uses the policies specified by the ACPI objects and methods declared under the thermal zone, as described in the ACPI specification.

## Syntax


<table>
<colgroup>
<col width="100%" />
</colgroup>
<thead>
<tr class="header">
<th>C++</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><code>typedef struct _THERMAL_POLICY {</code></p>
<p><code>        ULONG            Version;   BOOLEAN          WaitForUpdate;</code></p>
<p><code>  BOOLEAN          Hibernate;</code></p>
<p><code> BOOLEAN          Critical;</code></p>
<p><code>  BOOLEAN          ThermalStandby;</code></p>
<p><code>  ULONG            ActivationReasons;</code></p>
<p><code> ULONG            PassiveLimit;</code></p>
<p><code> ULONG            ActiveLevel;</code></p>
<p><code>} THERMAL_POLICY, *PTHERMAL_POLICY;</code></p></td>
</tr>
</tbody>
</table>

 

## Members


**Version**

Specifies the version of the policy structure. The current version is THERMAL\_POLICY\_VERSION\_1.

**WaitForUpdate**

Specifies if the policy driver should complete the [IOCTL\_THERMAL\_READ\_POLICY](ioctl-thermal-read-policy.md) IOCTL immediately. If the state is up to date and WaitForUpdate is TRUE, the policy driver should pend the IOCTL in a cancellable state until one of its policy preferences has changed, at which point it should complete the IOCTL with the new preferences. If the state is not up to date or WaitForUpdate is FALSE, the policy driver should immediately complete the IOCTL with the new preferences.

**Hibernate**

The policy driver specifies TRUE to indicate that the system should hibernate to address a thermal condition. Once the thermal condition has been resolved, the policy driver should set this member to FALSE. If the system does not support hibernate or if hibernate is disabled, the system will shut down instead.

**Critical**

The policy driver specifies TRUE to indicate that the system should shut down to address a thermal condition.

**ThermalStandby**

The policy driver specifies TRUE to indicate that the system should enter standby to address a thermal condition. Once the thermal condition has been resolved, the policy driver should set this member to FALSE.

**ActivationReasons**

Specifies why the thermal zone is throttled.

-   0x00000000

    Indicates that the zone isn't throttled.

-   \#define TZ\_ACTIVATION\_REASON\_THERMAL 0x00000001

    Indicates that the zone is throttled for thermal reasons.

-   \#define TZ\_ACTIVATION\_REASON\_CURRENT 0x00000002

    Indicates that the zone is throttled because the system cannot deliver sufficient current.

**PassiveLimit**

Specifies the amount by which the thermal zone should be throttled. 100 represents unthrottled while 0 represents fully throttled.

**ActiveLevel**

Specifies the index (from 0 through 9) of the current set of active cooling devices that should be engaged. For example, setting an ActiveLevel of 4 would engage all devices in the thermal zone’s \_AL4 device list, as well as any higher-indexed device lists (\_AL5, etc.). Specifying 10 will disable all active cooling devices.

## Related topics


[THERMAL\_WAIT\_READ](thermal-wait-read.md)

[Thermal management in Windows](thermal-management-in-windows.md)

 

 







