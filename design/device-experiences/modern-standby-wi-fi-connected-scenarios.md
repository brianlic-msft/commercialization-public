---
title: Modern standby Wi-Fi-connected scenarios
description: Describes Wi-Fi-connected modern standby test scenarios.
MS-HAID:
- 'cstandby.connected\_standby\_wi-fi-connected\_scenarios'
- 'p\_weg\_hardware.modern\_standby\_wi-fi-connected\_scenarios'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 5A1A79F6-D55E-4E7D-83D8-6EE1462F33D6
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Modern standby Wi-Fi-connected scenarios


The goal of Wi-Fi-connected testing is to identify activities that should not be happening during modern standby and resolve them. The activities might be a result of network activities, real-time notifications, or unexpected hardware interrupts.

After the system can reliably enter and exit modern standby and can achieve good results in modern standby with airplane mode on, you can validate modern standby system behaviors with Wi-Fi connected.

To prepare for WiFi-connected testing, the following two prerequisites must be met:

-   The system has a reliable Wi-Fi connection. The best way to assess this is to test the Wi-Fi connection during active use to make sure that the connection is stable and signal/speed is reasonably good.
-   The Wi-Fi device is compatible with the NDIS 6.3 feature to support wake on LAN (WoL) patterns, protocol offloads, and D0 packet coalescing. These capabilities are required so that the SoC can enter low-power states while the Wi-Fi device maintains connectivity.

The list of Wi-Fi-connected scenarios includes connectivity to communications apps (such as Live, Lync, and Skype) and downloads from the Internet. These scenarios should be tested serially to focus on issues that might fix similar issues in other scenarios.
The [Windows Hardware Certification Kit (HCK)](https://msdn.microsoft.com/windows/hardware/dn913721.aspx#test) includes tests that help validate basic NDIS 6.3 functionality for modern standby. There are individual tests for each type of network adapter, including Wi-Fi, CDMA MBB, GSM MBB, and wired LAN. Please see the test details information for each test at [Device.Network Testing](https://msdn.microsoft.com/library/windows/hardware/jj124983.aspx).

We recommend that each network adapter in the system pass the following tests before you proceed to system-level connectivity testing for modern standby:

-   WLAN Connected Standby End to End - Basic
-   Win.MBN.CDMA.TestCSConnectivity
-   Win.MBN.GSM.TestCSConnectivity
-   LAN CS Test - IPv4 Basic

## Modern standby push mail


One of the most important Wi-Fi-connected scenarios is receiving push notifications for emails. Users can receive emails through the Mail app during modern standby so that they get the most up-to-date information with no delay after the system resumes from modern standby. The goal of testing the push-mail scenario is to make sure that the system can receive real-time notification for incoming emails while the system is in modern standby.

We recommend that you create a Microsoft account for testing purposes. You can use this account to set up the system to receive emails through the Mail app. Make sure that the system is un-muted and put the system into modern standby. While the system is in modern standby, send an email to the account a few times. You should be able to hear the incoming notification sound as emails arrive while the screen is powered off. Wake up the system from modern standby and verify that all the emails are received. If Mail is configured to be on the lock screen, you should also see the badge updates occur just as the screen is powered on.

-   **Test area:** Push mail during modern standby.
-   **Purpose:** Ensure that push-mail and associated audio notifications are functional during modern standby.
-   **System configuration:**
    -   Factory image is installed on the system.
    -   All drivers are loaded in Device Manager.
    -   Factory Windows Store apps are installed.
    -   System is running on battery power.
    -   System is connected to a Wi-Fi access point (AP) that has Internet connectivity.
    -   Mail app is configured with a test Microsoft account.
    -   Email operation is first validated with the display on.

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
<td><p>The system can receive mail notifications while in modern standby.</p></td>
<td><p>If the Mail app is configured to be on the lock screen, updates should be seen on the lock screen immediately on resume from modern standby. Ensure all emails are received.</p></td>
<td><p>When a notification is not received, a trace is needed to diagnose the problem. For information about how to capture a trace and analyze the information, see [Capture and view a WPA trace for modern standby diagnostics](capture-and-view-a-wpa-trace-for-modern-standby-diagnostics.md).</p></td>
</tr>
</tbody>
</table>

 

The [Windows Hardware Certification Kit (HCK)](https://msdn.microsoft.com/windows/hardware/dn913721.aspx#test) includes modern standby tests that exercise entering and exiting modern standby on a system. Running the following tests will further validate the readiness of the system:

-   Modern standby exit latency test
-   Modern standby duration test
-   Modern standby stress with I/O

## Modern standby instant messaging and video chat


Instant-message and video-chat notifications are important Wi-Fi-connected scenarios. The goal of testing this scenario is to ensure users can receive instant messages and video calls in real-time while the system is in modern standby.

You can use the test Microsoft account to configure the system with a Lync and Skype account. To test the instant messaging scenario, make sure that the system is un-muted and then put the system in modern standby. When the system is in modern standby, send a few instant messages to the test account. You should observe that the system plays an incoming sound for each instant message that is received, and that the display stays powered off. When the system resumes from modern standby, make sure that it received all the instant messages that were sent.

After you verify that instant message notifications are working, try to make a video call and an audio conference call. When the system is in modern standby, make a video call to the Skype test account. You should observe that the system powers on the display and shows a ringing toast notification at the upper right hand corner. If you do not pick up the call and let it finish ringing, the system will immediately go back into modern standby. Repeat this testing by making an audio conference call to the Lync test account.

The messaging and video/audio call experiences are exactly the same for both Lync and Skype. When the system wakes from modern standby, make sure that all notifications are received as expected. When an instant message or a call is missed, the icon on the lock screen will show the number of missed messages and calls.

The instant messaging and video chat scenarios are enumerated in the following table. All modern standby systems should be tested for expected behavior for each scenario that is listed in the table.

-   **Test area:** Instant messaging (IM) and video chat during modern standby.
-   **Purpose:** Ensure that real-time incoming functionality is operational during modern standby.
-   **System configuration:**
    -   Factory image installed on the system.
    -   All drivers loaded in Device Manager.
    -   Factory Windows Store apps are installed.
    -   System is running on battery power.
    -   System is connected to a Wi-Fi AP with Internet connectivity.
    -   Skype app configured with test Microsoft account.
    -   Skype IM and video chat are validated to work with the screen turned on (outside of modern standby).

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
<td><p>System can receive IM notifications during modern standby.</p></td>
<td><p>When the system wakes from modern standby, check that all IM messages have been received and that the badge on the lock screen is updated appropriately.</p></td>
<td><p>If a notification is not received, a trace is needed to diagnose the problem. See [Capture and View a WPA Trace for Modern Standby Diagnostics](capture-and-view-a-wpa-trace-for-modern-standby-diagnostics.md) for information on how to capture a trace and analyze the information.</p></td>
</tr>
<tr class="even">
<td><p>System can receive video call and audio conference call notifications during modern standby.</p></td>
<td><p>Ensure that all calls received during modern standby are accompanied by notifications that do the following:</p>
<ul>
<li>Turn on the display to show a toast in the upper right-hand corner.</li>
</ul>
<p>If the call is missed, the icon on the lock screen will show the missed call when the system wakes from modern standby.</p></td>
<td><p>If a notification is not received, a trace is needed to diagnose the problem. See [Capture and view a WPA trace for modern standby diagnostics](capture-and-view-a-wpa-trace-for-modern-standby-diagnostics.md) for information on how to capture a trace and analyze the information.</p></td>
</tr>
</tbody>
</table>

 

## Modern standby background download


Background download through a Wi-Fi connection is an important modern standby scenario to test. This scenario includes downloads from Windows Update for critical updates, and downloads of music and movies while the system stays in modern standby.

The goal of testing background download is to make sure that download is done in the background and does not continuously block the system from entering the lowest power state during modern standby. Note that background download is allowed to continuously block the system from using the lowest power state when the system is running on AC power. Testing background download on battery is required.

To test background downloads, you should always try to download a file that is large enough that the download will continue to progress after the initial 20-minute period. You should also ensure the system is running on battery (not connected to AC) to get the correct behavior since systems on AC have special download policies to allow downloads to continue uninterrupted.

One way to test background download is use the inbox Video app to kick off a large download (over 3 gigabytes), and then put the system into modern standby. Windows permits the download to have approximately 20 minutes to complete after the start of a modern standby session when on battery power. After the initial 20 minutes, the download is throttled to enable only four seconds of network time every 15 minutes.

The key observation in the test is to verify that the large download does not prevent the system from entering the lowest power state after the first 20 minutes of the modern standby session.

On resume from modern standby, you can run a SleepStudy report to view the time when the system was in the lowest power state, to determine whether the background download was blocking the system from entering low power. The modern standby session should extend for one hour or more to account for the first 20 minutes of the session where background download is permitted.

-   Test area: Background file download during modern standby.
-   Purpose: Ensure that a background download is performed at low-power operation during modern standby.
-   System configuration:
    -   Factory image installed on the system.
    -   All drivers loaded in Device Manager.
    -   Factory Windows Store apps are installed.
    -   System is running on battery power.
    -   System is configured with a test Microsoft account for inbox Video app access.

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
<td><p>Background downloads</p></td>
<td><p>A large file download should not continuously prevent the system from entering the lowest power state after the first 20 minutes.</p></td>
<td><p>With the exception of Windows Update, which can be active for a long period of time due to downloads of critical/security updates, all other downloads should not be active beyond the initial 20 minutes of the modern standby session.</p>
<p>You can use SleepStudy to check whether the large file download prevented the system from entering the lowest power state for the entirety of the session.</p></td>
</tr>
</tbody>
</table>

 

 

 






