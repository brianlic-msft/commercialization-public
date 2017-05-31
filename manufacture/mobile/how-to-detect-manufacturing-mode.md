---
author: kpacquer
Description: 'You can determine whether the device is in Manufacturing Mode or not by using either a kernel mode or user mode API.'
ms.assetid: fc888a9a-a004-4689-9972-a40b4d5ba50c
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Detect Manufacturing Mode
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Detect Manufacturing Mode


You can determine whether the device is in Manufacturing Mode or not by using either a kernel mode or user mode API.

In kernel mode, a new API has been defined in wdm.h:

``` syntax
_IRQL_requires_max_(APC_LEVEL)
NTKERNELAPI
BOOLEAN
ExIsManufacturingModeEnabled (
    VOID
    );
```

Here's an example of how you might use it:

``` syntax
BOOLEAN ManufacturingModeEnabled = FALSE;

NTSTATUS
DriverEntry(
    PDRIVER_OBJECT DriverObject,
    PUNICODE_STRING RegistryPath
    )
{
...
    ManufacturingModeEnabled = ExIsManufacturingModeEnabled();
...
}

NTSTATUS
DoManufacturingOperation(
    VOID
    )
{
    if (ManufacturingModeEnabled == FALSE) {
        return STATUS_NOT_SUPPORTED;
    }
...
    return STATUS_SUCCESS;
}
```

In user mode, the API is defined in sysinfoapi.h:

``` syntax
WINBASEAPI
BOOL
WINAPI
GetOsManufacturingMode(
    _Out_ PBOOL pbEnabled
    );
```

Here's an example of how you might use it:

``` syntax
DWORD
DoManufacturingOperation(
    VOID
    )
{
    DWORD Error = ERROR_SUCCESS;
    BOOL ManufacturingModeEnabled = FALSE;

    if (!GetOsManufacturingMode(&ManufacturingModeEnabled)) {
        Error = GetLastError();
    }

    if ((Error != ERROR_SUCCESS) ||
        (ManufacturingModeEnabled == FALSE)) {
        return ERROR_NOT_SUPPORTED;
    }
...
    return ERROR_SUCCESS;
}
```

 

 





