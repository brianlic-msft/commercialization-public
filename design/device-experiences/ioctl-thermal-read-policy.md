---
title: IOCTL\_THERMAL\_READ\_POLICY
description: The IOCTL\_THERMAL\_READ\_POLICY input/output (I/O) control request is sent by the kernel to a thermal zone’s policy driver to read the drivers' preferred policy.
MS-HAID:
- 'cstandby.ioctl\_thermal\_read\_policy'
- 'p\_weg\_hardware.ioctl\_thermal\_read\_policy'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 47A5C5E5-B874-4050-AC43-D8CB5619E5D5
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# IOCTL\_THERMAL\_READ\_POLICY


The IOCTL\_THERMAL\_READ\_POLICY input/output (I/O) control request is sent by the kernel to a thermal zone’s policy driver to read the drivers' preferred policy.

## <a href="" id="input-parameters-"></a>Input Parameters


To retrieve the input buffer, call [**WdfRequestRetrieveInputBuffer**](https://msdn.microsoft.com/library/windows/hardware/ff550014). The input buffer contains a [THERMAL\_POLICY](thermal-wait-read.md) struct that specifies the current policy that the kernel has for the thermal zone.

## Output Parameters


To retrieve the output buffer, call [**WdfRequestRetrieveOutputBuffer**](https://msdn.microsoft.com/library/windows/hardware/ff550018). The *Buffer* parameter points to a [THERMAL\_POLICY](thermal-wait-read.md) structure. Set the THERMAL\_POLICY's members to your policy driver's preferred thermal policy.

## I/O Status


Complete the request by calling [**WdfRequestCompleteWithInformation**](https://msdn.microsoft.com/library/windows/hardware/ff549948) and set Status to STATUS\_SUCCESS if the request is successful. Otherwise, an appropriate NTSTATUS error condition. The driver can pass the bytes returned to `sizeof(ULONG)` in the **Information** parameter.

## Related topics


[IOCTL\_THERMAL\_READ\_TEMPERATURE](ioctl-thermal-read-temperature.md)

[Thermal management in Windows](thermal-management-in-windows.md)

 

 







