---
author: kpacquer
Description: Calling SetScreenOff to enter connected standby
ms.assetid: b9fddd1f-485b-4b09-9b18-93b994ebc076
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Calling SetScreenOff to enter connected standby
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Calling SetScreenOff to enter connected standby


Calling the **SetScreenOff** function turns the screen and backlight off, which causes the phone to enter the connected standby power state. This lower power state can be helpful for testing power usage.

**Important**  
This function is for use only in the Microsoft Manufacturing OS.

 

## <span id="Syntax"></span><span id="syntax"></span><span id="SYNTAX"></span>Syntax


``` syntax
HRESULT SetScreenOff();
```

## <span id="Parameters"></span><span id="parameters"></span><span id="PARAMETERS"></span>Parameters


None

## <span id="Return_Value"></span><span id="return_value"></span><span id="RETURN_VALUE"></span>Return Value


HRESULT

## <span id="Remarks"></span><span id="remarks"></span><span id="REMARKS"></span>Remarks


There is not an equivalent function to return the device to a full power state.

## <span id="Example"></span><span id="example"></span><span id="EXAMPLE"></span>Example


To use SetScreenOff, include the header and call without any parameters.

``` syntax
#include <ManufacturingConnectedStandbyControl.h>
SetScreenOff();
```

## <span id="Requirements"></span><span id="requirements"></span><span id="REQUIREMENTS"></span>Requirements


**Header:** ManufacturingConnectedStandbyControl.h

**Library:** ManufacturingConnectedStandbyControl.lib

 

 





