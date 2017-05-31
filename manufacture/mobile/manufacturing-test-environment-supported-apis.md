---
author: kpacquer
Description: Manufacturing test environment supported APIs
ms.assetid: a51f7722-ccca-4571-9f07-3ff512a0ddaa
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Manufacturing test environment supported APIs
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Manufacturing test environment supported APIs


The manufacturing test environment (MTE) supports APIs and techniques that are designed for use only in manufacturing. This section describes the specific libraries that are supported in MTE.

## <span id="mmos.lib"></span><span id="MMOS.LIB"></span>MMOS.Lib


MMOS.Lib provides a mirror interface to the Windows 8 mincore.lib. For general information about mincore.lib, see [Windows API sets](http://msdn.microsoft.com/library/windows/desktop/Hh802935.aspx).

The primary user-mode native APIs for use in MTE are defined in the MMOS library (.lib) files installed by the Windows Driver Kit (WDK) as %WPDKCONTENTROOT%\\Lib\\ folder.

## <span id="Supported_APIs"></span><span id="supported_apis"></span><span id="SUPPORTED_APIS"></span>Supported APIs


The following sections provide a preview of the features that the provided MMOS APIs allow for testing. Additional information about the MMOS supported APIs will be provided in a later release of this documentation. The API header sub-folders and Windows SDK headers are located in the “%ProgramFiles(x86)%\\Windows Kits\\10\\include\\” folder. These APIs can be used in user-mode applications for MMOS. For more info on creating and running MMOS applications, see the [Develop MMOS test applications](develop-mmos-test-applications.md) topic.

### <span id="Microphone__audio_and_audio_routing"></span><span id="microphone__audio_and_audio_routing"></span><span id="MICROPHONE__AUDIO_AND_AUDIO_ROUTING"></span>Microphone, audio and audio routing

The audio and audio routing APIs allow test apps to test the audio and audio routing capabilities. Some scenarios that test apps can test are playing frequencies on each of the different audio end-points. The microphone can be tested using the audio APIs. The following header files contain the audio and audio routing APIs.

-   Mmos\\audiotunerapi.h

-   Mmos\\audiotunerdef.h

-   Mmos\\audiotunerprop.h

-   Km\\ksmedia\_phone.h

-   Um\\initguid.h

-   Um\\avrt.h (Windows SDK)

-   ctime.h (Windows SDK)

-   Um\\audioclient.h (Windows SDK)

-   Um\\mmdeviceapi.h (Windows SDK)

-   Um\\functiondiscoverykeys.h (Windows SDK)

### <span id="Display"></span><span id="display"></span><span id="DISPLAY"></span>Display

You can use the Direct3D to display information. For general info, see this MSDN link [Direct3D 11 Graphics](http://msdn.microsoft.com/library/windows/desktop/ff476080.aspx). The following header files contain the D3D APIs.

-   Um\\D3DWrapper.h

-   Um\\D3D11.h (Windows SDK)

### <span id="Camera"></span><span id="camera"></span><span id="CAMERA"></span>Camera

You can use the Media Foundation CaptureEngine APIs to work with the camera. For general info about working with Media Foundation, see [Media Foundation Programming Reference](http://msdn.microsoft.com/library/windows/desktop/ms704847.aspx) on MSDN. For information about the IMFCaptureEngine interface, see this MSDN topic, [IMFCaptureEngine interface](http://msdn.microsoft.com/library/windows/desktop/hh447846.aspx). The following header files contain interfaces that may be useful for camera testing.

-   Um\\mfapi.h

-   Um\\mfobjects.h

-   Um\\mfidl.h

-   Um\\mfreadwrite.h

-   Um\\mfcaptureengine.h

-   Um\\wincodec.h

### <span id="Sensors"></span><span id="sensors"></span><span id="SENSORS"></span>Sensors

For more information about sensors and APIs that are used for testing in MMOS, see the Sensors topic.

### <span id="LED"></span><span id="led"></span>LED

The LED APIs allow test apps to test the notification LED by calling different IOCTLs to cause the notification LED to turn on, turn off, or blink. The following header file contains the LED APIs.

-   Mmos\\hwn.h

### <span id="SD_Card"></span><span id="sd_card"></span><span id="SD_CARD"></span>SD Card

The SD card APIs allow test apps to test the SD card driver by calling different IOCTLs to test cases such as reading and writing to the card. The following header file contains the SD card APIs.

-   Um\\sffdisk.h

### <span id="Touch"></span><span id="touch"></span><span id="TOUCH"></span>Touch

For more info about testing the Touch controller, see the [Access the touch interface in MMOS](access-the-touch-interface-in-mmos.md) topic. The following header files contain the touch APIs.

-   Um\\InputDriverRawSamples.h

-   Um\\WinPhoneInput.h

### <span id="Vibrator"></span><span id="vibrator"></span><span id="VIBRATOR"></span>Vibrator

The vibrator APIs allow test apps to test the vibrator on the device by calling different IOCTLs. The IOCTLs allow the apps to test various speeds and periods of the vibrator driver on the device. The following header file contains the vibrator APIs.

-   Mmos\\hwn.h

### <span id="Hardware_buttons"></span><span id="hardware_buttons"></span><span id="HARDWARE_BUTTONS"></span>Hardware buttons

For more information about hardware buttons, see the Hardware buttons topic. The following header file contains the hardware button APIs.

-   UM\\ntddkbd.h

### <span id="FM_radio"></span><span id="fm_radio"></span><span id="FM_RADIO"></span>FM radio

The FM radio APIs allow test apps to test the FM radio tuner on the phone by calling FM IOCTLs. The IOCTLs allow apps to test various scenarios such as tuning to a frequency or seeking. The following header files contain the FM radio APIs.

-   Mmos\\audiotunerapi.h

-   Mmos\\audiotunerprop.h

### <span id="Wi-Fi"></span><span id="wi-fi"></span><span id="WI-FI"></span>Wi-Fi

For more information about Wi-Fi testing APIs, see the [Wi-Fi manufacturing API](wi-fi-manufacturing-api.md) topic. The following header file contains the Wi-Fi APIs.

-   Um\\wifimte.h

## <span id="related_topics"></span>Related topics


[Calling SetScreenOff to enter connected standby](calling-setscreenoff-to-enter-connected-standby.md)

 

 






