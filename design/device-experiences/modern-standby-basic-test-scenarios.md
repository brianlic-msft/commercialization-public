---
title: Modern standby basic test scenarios
description: Describes basic modern standby test scenarios.
MS-HAID:
- 'cstandby.connected\_standby\_basic\_test\_scenarios'
- 'p\_weg\_hardware.modern\_standby\_basic\_test\_scenarios'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 9064D169-B32F-4033-9FEE-4476F68F90C1
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Modern standby basic test scenarios


Stabilize basic modern standby functionality before progressing to more advanced test scenarios, such as those that have an active Wi-Fi connection. First, validate entry to and exit from modern standby. Then validate airplane mode and audio playback.

## Basic entry and exit testing


You should begin all testing by making sure that the system can reliably enter modern standby, and then exit modern standby after some interval of variable duration. To initiate entry to modern standby, press the power button, close the lid, or select Sleep from the power button in the Settings flyout. These actions should instantly power off the display. To wake up the system, simply press the power button or open the lid of the system. These actions should instantly power on the display.

If the system is connected to a USB mouse or keyboard, move the mouse or press any key to generate a wake event to the system and turn the display on.

The modern standby entry and exit scenarios are enumerated in the following table. All modern standby systems should be tested for expected behavior in each scenario.

-   **Test area:**Entry to and exit from modern standby.
-   **Purpose:**Ensure system can reliably and quickly enter and exit modern standby.
-   **System configuration:**
    -   Factory image is installed on the system.
    -   All drivers are loaded in Device Manager.
    -   Factory Windows Store apps are installed.
    -   System is running on battery power.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Test scenario</th>
<th>Expected result</th>
<th>Troubleshooting notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>The system can enter modern standby using the following methods:</p>
<ul>
<li>Press the power button.</li>
<li>Select Sleep from the operating system settings.</li>
<li>Close the lid (if applicable).</li>
</ul></td>
<td><p>The system instantly transitions into modern standby (display powers off).</p>
<p>No audio noises are generated.</p></td>
<td><p>If the system does not enter modern standby, a trace should be taken to diagnose the problem. See [Capture and view a WPA trace for modern standby diagnostics](capture-and-view-a-wpa-trace-for-modern-standby-diagnostics.md) for instructions on how to capture a trace and analyze the information.</p></td>
</tr>
<tr class="even">
<td><p>The system can exit modern standby using the following methods:</p>
<ul>
<li>Press the power button.</li>
<li>Open the lid (if applicable).</li>
<li>Use a USB mouse or keyboard.</li>
</ul></td>
<td><p>The system instantly transitions out of modern standby (display powers on).</p>
<p>No audio noises are generated.</p></td>
<td><p>Most failure cases in this category are the result of the system being unable to resume from modern standby.</p>
<p>To debug, you must enable both the kernel debugger and the hardware debugger on the system to catch software crashes and hardware hard hangs, which can prevent the system from resuming.</p></td>
</tr>
</tbody>
</table>

 

The [Windows Hardware Certification Kit (HCK)](https://msdn.microsoft.com/windows/hardware/dn913721.aspx#test) includes modern standby tests that exercise entering and exiting modern standby on a system. Running the following tests will further validate the readiness of the system:

-   Modern standby exit latency test
-   Modern standby duration test
-   Modern standby stress with I/O

## Basic airplane mode testing


After you have verified that the system can reliably enter and exit modern standby, you can validate system behavior during modern standby.

Modern standby battery life is directly impacted by hardware and software activity. The goal of basic airplane mode testing is to identify activities that should not be happening during modern standby. and resolve them. These activities might be a result of software in the OEM pre-installation or unexpected hardware interrupts.

Start airplane mode testing with a one-hour modern standby session with airplane mode enabled. After resuming the system from modern standby, use SleepStudy to review the activities during the session and the amount of time that the system was in a low-power state.

-   **Test area:**Airplane mode low-power state time.
-   **Purpose:**Ensure that the basic activity level of the system is minimal (less than three percent of active time) with factory image and apps installed.
-   **System configuration:**
    -   Factory image installed on the system.
    -   All drivers loaded in Device Manager.
    -   Factory Windows Store apps are installed.
    -   System is running on battery power.
    -   System is put into airplane mode.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Test scenario</th>
<th>Expected result</th>
<th>Troubleshooting notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>Stay in modern standby in airplane mode for at least one hour.</p></td>
<td><p>Using SleepStudy, observe that the system is in the lowest power state equal to or greater than 97 percent of the time.</p></td>
<td><p>Using SleepStudy, you can see which software or device component(s) is active, which prevents the system from entering the lowest power state. Contact the owner of the offending component for debugging tips and next steps.</p></td>
</tr>
</tbody>
</table>

 

To eliminate noise from system resource loading on boot, we recommend that you wait at least 90 seconds after system boot before you start testing. As a general guideline, all modern standby testing should be performed on a system that is running on DC power to so that the power impact can be measured.

## Basic audio playback testing


Audio playback during modern standby enables the system to play music while the display is powered off. The system is expected to consume less power when playing music in modern standby than playing music when the display is powered on. The goal of audio playback testing is to make sure that the system can play sound through the internal speakers and headphones, and that the user can adjust the volume by using the volume buttons during modern standby in a low-power state.

Start with a system that is un-muted and use the inbox Music app to play a 256-kilobits/second .mp3 track. Put the system into modern standby. Make sure that the sound continues to play through the speakers and that the volume can be adjusted through the volume buttons while the screen is powered off. You should also try to plug in a headphone to make sure that the sound gets transferred from the internal speakers to the headphones.

**Note**  USB, Bluetooth, HDMI and other external devices are not supported for low-power audio. Audio playback will continue after the power button is pressed for USB, Bluetooth, and HDMI output, but at an increased power consumption compared to output through the system power jack or the built-in speakers.

 

-   **Test area:**Screen-off audio playback operation and power.
-   **Purpose:**Ensure that audio playback continues without interruption when the power button is pressed during low power consumption.
-   **System configuration:**
    -   Factory image installed on the system.
    -   All drivers loaded in Device Manager.
    -   Factory Windows Store apps are installed.
    -   System is running on battery power.
    -   • Headphones are available to test output from headphone jack.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Test scenario</th>
<th>Expected result</th>
<th>Troubleshooting notes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>The system can play audio during modern standby, and sound plays from:</p>
<ul>
<li>Internal speakers</li>
<li>Headphones</li>
</ul></td>
<td><p>The system continues to play sound through the speakers/headphones and the volume can be adjusted by using the volume buttons while the screen is powered off.</p>
<p>Ensure that system is consuming the power expected for low-power audio. Consult with your System on a Chip (SoC) vendor for the expected power consumption for low-power audio.</p></td>
<td><p>If the system fails to enter a low-power state, a trace is needed to diagnose the problem. For information about how to capture a trace and analyze the information, see [Capture and view a WPA trace for modern standby diagnostics](capture-and-view-a-wpa-trace-for-modern-standby-diagnostics.md).</p>
<p>If the audio stops when the screen is powered off, this usually means the music app does not have the background transfer API implemented correctly. For more information about this API, see Writing a power savvy background media app.</p></td>
</tr>
</tbody>
</table>

 

Testing for low-power audio playback must be done on a system that is running on battery power so that the power impact can be accurately measured.

 

 






