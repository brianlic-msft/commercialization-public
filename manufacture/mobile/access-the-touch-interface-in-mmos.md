---
author: kpacquer
Description: Access the touch interface in MMOS
ms.assetid: 4455627d-ba59-48f1-9327-c9e2c30509da
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Access the touch interface in MMOS
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Access the touch interface in MMOS


The touch controller output can be captured and used in MMOS with proper touch driver support. The touch interface sample illustrates how you can gather touch coordinates in MMOS to implement manufacturing tests.

## <span id="Touch_sample_requirements"></span><span id="touch_sample_requirements"></span><span id="TOUCH_SAMPLE_REQUIREMENTS"></span>Touch sample requirements


The sample code requires that the Microsoft.Input.TchHID.spkg package to be included in the image (either the Main OS or MMOS). The Microsoft.Input.TchHID.spkg package includes tchhid.sys, which implements the **CreateFile** and **Readfile** functions used by the sample code.

## <span id="Touch_sample_code"></span><span id="touch_sample_code"></span><span id="TOUCH_SAMPLE_CODE"></span>Touch sample code


This sample user-mode application displays the touch coordinates received by the touch screen driver.

The sample app uses the **CreateFile** function to open an exclusive handle to the device to receive raw touch samples. The device name "TouchRaw0" is exposed by tchhid.sys, the HID touch class driver provided by Microsoft and included in Microsoft.Input.TchHID.spkg.

``` syntax
#define TOUCH_RAW_SAMPLES_DEVICE_NAME L"\\\\.\\TouchRaw0"
```

After the handle is successfully opened, the application loops until a touch contact point is received near the top-left corner of the screen. The application reads and displays the coordinates and the associated touch contact ID.

``` syntax
#include "sample.h"
#include <cfgmgr32.h>
#include <strsafe.h>

int main()
{
    HANDLE testDriver = INVALID_HANDLE_VALUE;
    BOOL exit = FALSE;
    INT32 i;
    TouchInfo touchInfo = {0};

    //
    // Open an exclusive handle to the device to get raw samples
    //
    testDriver = CreateFile(
        L"\\\\.\\TouchRaw0",
        GENERIC_READ,
        0,
        NULL,
        OPEN_EXISTING,
        0,
        NULL);


    if (INVALID_HANDLE_VALUE == testDriver)
    {
        goto exit;
    }

    //
    // Loop, printing touches to the debugger.
    // Release in upper-left corner ends the test.
    //
    while (!exit)
    {
        DWORD touchInfoBytesRead = 0;

        //
        // Wait for data
        //
        if (!ReadFile(
            testDriver,
            &touchInfo,
            sizeof(TouchInfo),
            &touchInfoBytesRead,
            NULL))
        {
            goto exit;
        }

        if (touchInfoBytesRead == 0)
        {
            goto exit;
        }

        //
        // Print to debugger
        //
        for (i=0; i<touchInfo.ContactCount; i++)
        {
            WCHAR infoString[MAX_PATH] = {0};

            StringCchPrintf(
                infoString,
                MAX_PATH,
                L"%d: Contact ID %d, at (%d,%d) is %s\r\n",
                GetTickCount(),
                touchInfo.ContactArray[i].ContactID,
                touchInfo.ContactArray[i].ScreenX,
                touchInfo.ContactArray[i].ScreenY,
                FLAGS_TO_STRING(touchInfo.ContactArray[i].Flags));
                
            OutputDebugString(infoString);
        }

        //
        // Look for program exit
        //
        for (i=0; i<touchInfo.ContactCount; i++)
        {
            if ((touchInfo.ContactArray[i].ScreenX < 50) &&
                (touchInfo.ContactArray[i].ScreenY < 50) &&
                (touchInfo.ContactArray[i].Flags & InputEventFlag_Up))
            {
                OutputDebugString(L"Touch below (50,50), quitting!\r\n");
                exit = TRUE;
            }
        }
    }

exit:
    if (testDriver != INVALID_HANDLE_VALUE)
    {
        CloseHandle(testDriver);
    }

    return 0;
}
```

The application uses the TouchInfo and TouchContact data structures, which are defined in %WPDKCONTENTROOT%\\include\\um\\WinPhoneInput.h. The header code is shown here.

``` syntax
#pragma once

#include <windows.h>
#include <initguid.h>
#include <devguid.h>

//
// This device name is used to access raw touch samples from user mode.
//

#define TOUCH_RAW_SAMPLES_DEVICE_NAME L"\\\\.\\TouchRaw0"

enum InputEventFlag
{
    InputEventFlag_None     = 0x0000,
    
    InputEventFlag_Down     = 0x0001,
    InputEventFlag_Move     = 0x0002,
    InputEventFlag_Hold     = 0x0002,
    InputEventFlag_Up       = 0x0004,
    
    InputEventFlag_Empty    = 0x1000,
    InputEventFlag_Invalid  = 0x2000,
    
    InputEventFlag_TestSync = 0x8000
};

typedef struct _TouchContact
{
    UINT16         ContactID;
    UINT16         Flags;            // See InputEventFlag_*
    INT16          ScreenX;          // Screen Space X-Position
    INT16          ScreenY;          // Screen Space Y-Position
    INT16          WindowX;          // Ignore
    INT16          WindowY;          // Ignore
} TouchContact;

typedef struct _TouchInfo
{
    UINT16         Size;             // Size, in bytes, of this structure (includes n contacts)
    UINT16         Flags;            // Ignore
    UINT32         TimeStamp;        // Driver timestamp
    HANDLE         Source;           // Ignore
    UINT32         SessionID;        // Ignore
    INT32          ContactCount;     // Count of touch contact data points
    TouchContact   ContactArray[10]; // Collection of contacts
} TouchInfo;

#define FLAGS_TO_STRING(x) \
    (x & InputEventFlag_Down) ? L"Down" : \
    (x & InputEventFlag_Move) ? L"Move" : \
    (x & InputEventFlag_Up)   ? L"Up"   : \
    L"Unknown"
```

## <span id="Building_and_deploying_the_sample_application"></span><span id="building_and_deploying_the_sample_application"></span><span id="BUILDING_AND_DEPLOYING_THE_SAMPLE_APPLICATION"></span>Building and deploying the sample application


To build the user-mode test application, complete the following steps.

1.  Create a new user-mode application project in Visual Studio. For more info, see [Develop MMOS test applications](develop-mmos-test-applications.md)

2.  Add the sample code and the header file to the project.

3.  Build the solution, ensuring that it is generated successfully.

4.  Disable code integrity in MMOS, or sign the test executable. For more info, see "Security in MMOS," in [Develop MMOS test applications](develop-mmos-test-applications.md).

5.  Deploy the executable to the device and run the application. For more information, see [Deploy and test a user-mode test application in MMOS](deploy-and-test-a-user-mode-test-application-in-mmos.md).

 

 





