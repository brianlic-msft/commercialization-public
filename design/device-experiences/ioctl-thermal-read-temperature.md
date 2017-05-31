---
title: IOCTL\_THERMAL\_READ\_TEMPERATURE
description: The IOCTL\_THERMAL\_READ\_TEMPERATURE input/output (I/O) control request is sent by the ACPI driver to a temperature sensor driver. Upon receiving this request, the driver might be required to provide the temperature of the thermal zone.
MS-HAID:
- 'cstandby.ioctl\_thermal\_read\_temperature'
- 'p\_weg\_hardware.ioctl\_thermal\_read\_temperature'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 6FB6C103-A531-4CF6-92C6-3E6917BA9129
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# IOCTL\_THERMAL\_READ\_TEMPERATURE


The IOCTL\_THERMAL\_READ\_TEMPERATURE input/output (I/O) control request is sent by the ACPI driver to a temperature sensor driver. Upon receiving this request, the driver might be required to provide the temperature of the thermal zone.

## <a href="" id="input-parameters-"></a>Input Parameters


To retrieve the input buffer, call [**WdfRequestRetrieveInputBuffer**](https://msdn.microsoft.com/library/windows/hardware/ff550014). The input buffer contains a [THERMAL\_WAIT\_READ](thermal-wait-read.md) structure. The Timeout member indicates when to return to the thermal zone's temperature after which the request will expire. If the received **Timeout** value is -1, the request never expires.

## Output Parameters


To retrieve the output buffer, call [**WdfRequestRetrieveOutputBuffer**](https://msdn.microsoft.com/library/windows/hardware/ff550018). The Buffer parameter points to a **ULONG**. Set the value to the thermal zone temperature, in tenths degree Kelvin.

## I/O Status


Complete the request by calling [**WdfRequestCompleteWithInformation**](https://msdn.microsoft.com/library/windows/hardware/ff549948) and set Status to STATUS\_SUCCESS if the request is successful. Otherwise, an appropriate NTSTATUS error condition. The driver can pass the bytes returned to sizeof(ULONG) in the Information parameter. Related topics Thermal management in Windows

## Related topics


[IOCTL\_THERMAL\_READ\_POLICY](ioctl-thermal-read-policy.md)

[Thermal management in Windows](thermal-management-in-windows.md)

 

 







