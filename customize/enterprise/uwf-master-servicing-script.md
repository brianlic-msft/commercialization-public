---
title: UWF master servicing script
description: UWF master servicing script
MS-HAID:
- 'p\_embedded.uwf\_master\_servicing\_script\_blue'
- 'p\_enterprise\_customizations.uwf\_master\_servicing\_script'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 62687446-2009-4ca9-a9ba-c85172c2b47f
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# UWF master servicing script


The UWF master servicing script (UwfServicingMasterScript.cmd) is located in the \\Windows\\System32 folder.

## UwfServicingMasterScript.cmd


The full UWF master servicing script follows:

``` syntax
REM servicing of the device with UWF installed. The script will 
REM call UWF manager application to update the system with the 
REM latest available updates.
REM The script will detect whether the update operation 
REM ended successfully or requires a reboot.
REM
REM The script will change the "SERVICING" state of the device
REM only when the update operation results in a "SUCCESS".
REM A state change of the device requires a reboot.
REM
REM If the update operation requires a "REBOOT" the script will
REM reboot device without changing the "SERVICING" state. The 
REM Will then run again on the following reboot until
REM the update operation either return a "SUCCESS" or a "ERROR"
REM
REM Any third-party script that needs to run before the state
REM change should run in the UPDATE_SUCCESS block
REM
REM Environment :
REM It is expected that UWF is turned "OFF", "SERVICING" mode 
REM enabled and all other preconditions
REM for servicing are in place. 
REM
REM
REM 


echo UpdateAgent starting.
uwfmgr servicing update-windows
if ERRORLEVEL 3010 goto UPDATE_REBOOT
if ERRORLEVEL 0 goto UPDATE_SUCCESS
echo UpdateAgent returned error =%ERRORLEVEL%
 
:UPDATE_ERROR
uwfmgr servicing disable
echo Restarting system
goto UPDATE_EXIT

:UPDATE_REBOOT
echo UpdateAgent requires a reboot.
echo UpdateAgent restarting system
goto UPDATE_EXIT

:UPDATE_SUCCESS
echo UpdateAgent returned success.
REM
REM echo UpdateAgent executing OEM script
REM OEM can call their custom scripts
REM at this point through a "call".
REM
REM The OEM script should hand control
REM back to this script once it is done.
REM
REM Any error recovery for OEM script
REM should be handled outside of this script
REM post a reboot.
REM
uwfmgr servicing disable
echo Restarting system
goto UPDATE_EXIT

:UPDATE_EXIT
echo UpdateAgent exiting.
shutdown -r -t 5
EXIT /B
```

## Related topics


[Service UWF-protected devices](service-uwf-protected-devices.md)

[Unified Write Filter](unified-write-filter.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_embedded%5D:%20UWF%20master%20servicing%20script%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





