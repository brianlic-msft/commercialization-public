---
title: Modern standby roaming connectivity
description: Describes modern standby roaming connectivity scenarios including Wi-Fi roaming and Wi-Fi to MBB failover.
MS-HAID:
- 'cstandby.connected\_standby\_roaming\_connectivity'
- 'p\_weg\_hardware.modern\_standby\_roaming\_connectivity'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1FC7A818-44E7-408D-A600-042299930AA4
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Modern standby roaming connectivity


The most basic roaming connectivity scenario involves functional validation of network list offload (NLO). NLO is the capability of the Wi-Fi device to automatically roam between previously associated Wi-Fi networks, without the involvement of Windows running on the SoC.

NLO starts with Windows tracking the list of previously associated Wi-Fi networks. When the system transitions into modern standby, Windows communicates the list of previously associated Wi-Fi networks to the Wi-Fi device.

If connectivity to the associated Wi-Fi network is lost, the Wi-Fi device periodically searches for one of the previously associated Wi-Fi networks while the device operates in a very low power mode. The periodic scans for a previous network are performed without waking the SoC so that the SoC can stay in a low-power mode. When the Wi-Fi device detects a previously used network, it connects to the network and wakes the SoC. Windows completes the connection, including obtaining an IP address and re-establishing system connections, including Windows Notification Services (WNS).

Start testing Wi-Fi roaming by setting up two Wi-Fi networks (A and B) with public Internet connections. Each Wi-Fi network should have a different SSID and be sufficiently distant so that the system cannot see both networks at the same time. Manually move the system near each Wi-Fi access point and connect to each network for a few minutes with the screen on and validate that Internet connectivity is functional. After the system has been demonstrated to connect to each Wi-Fi network reliably, you can start testing Wi-Fi roaming in modern standby.

## Modern standby Wi-Fi roaming


The most basic roaming connectivity scenario involves functional validation of network list offload (NLO). NLO is the capability of the Wi-Fi device to automatically roam between previously associated Wi-Fi networks, without the involvement of Windows running on the SoC.

NLO starts with Windows tracking the list of previously associated Wi-Fi networks. When the system transitions into modern standby, Windows communicates the list of previously associated Wi-Fi networks to the Wi-Fi device.

If connectivity to the associated Wi-Fi network is lost, the Wi-Fi device periodically searches for one of the previously associated Wi-Fi networks while the device operates in a very low power mode. The periodic scans for a previous network are performed without waking the SoC so that the SoC can stay in a low-power mode. When the Wi-Fi device detects a previously used network, it connects to the network and wakes the SoC. Windows completes the connection, including obtaining an IP address and re-establishing system connections, including Windows Notification Services (WNS).

Start testing Wi-Fi roaming by setting up two Wi-Fi networks (A and B) with public Internet connections. Each Wi-Fi network should have a different SSID and be sufficiently distant so that the system cannot see both networks at the same time. Manually move the system near each Wi-Fi access point and connect to each network for a few minutes with the screen on and validate that Internet connectivity is functional. After the system has been demonstrated to connect to each Wi-Fi network reliably, you can start testing Wi-Fi roaming in modern standby.

-   **Test area:**Wi-Fi roaming operation during modern standby.
-   **Purpose:**Ensure that the system will automatically connect to previously used Wi-Fi networks during modern standby as the user moves the system between home, work, and coffee shops.
-   **System configuration:**
    -   Factory image is installed on the system.
    -   All drivers are loaded in Device Manager.
    -   Factory Windows Store apps are installed.
    -   System is running on battery power.
    -   Wi-Fi connectivity is validated to work by connecting to the Internet while the screen is turned on.

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
<td><p>Wi-Fi connectivity is removed and the system automatically falls over to MBB while in modern standby.</p></td>
<td><p>Connect to the Wi-Fi network with MBB powered on, place the system into modern standby, and test push mail and Skype.</p>
<p>Mail and Skype calls should be received.</p>
<p>Power down the Wi-Fi access point and wait a few minutes for the system to automatically connect to the cellular network. Test push mail and Skype.</p>
<p>Mail and Skype calls should be received.</p>
<p>Power up the Wi-Fi access point again and wait a few minutes for the system to re-connect to Wi-Fi. Test push mail and Skype.</p>
<p>Mail and Skype calls should be received.</p></td>
<td><p>Make sure you first test Wi-Fi roaming in insolation before testing MBB failover.</p>
<p>Ensure that the system has a working cellular data connection.</p>
<p>If any part of the test fails, first have the Wi-Fi and MBB vendors help you verify that the device firmware has both WoL pattern and NLO capability enabled.</p></td>
</tr>
</tbody>
</table>

 

The test engineer for Wi-Fi roaming should build a close working relationship with the Wi-Fi vendor's support staff. Errors in this test should first be discussed with the Wi-Fi firmware developer.

A common problem is that the Wi-Fi device generates spurious SoC wake events because of false-positive NLO network detection events. This condition appears in SleepStudy as extra Wi-Fi device active time—typically, much more active time than any other PDC activator (such as BI, Windows Update, or WNS).

## Modern standby Wi-Fi to MBB failover


During modern standby, if Wi-Fi connectivity is lost, Windows automatically transitions to an available MBB connection. This behavior enables the system to remain constantly connected during modern standby. However, Windows will favor the cheaper, faster, and (typically) more power-efficient Wi-Fi connection over a cellular-based connection.

MBB and cellular connectivity are highly influenced by signal strength and proximity to a cellular tower. Make sure that the system under test has good cellular network connectivity before you test this scenario.

You should fully validate basic Wi-Fi roaming before you try to validate failover from Wi-Fi to MBB. The same Wi-Fi NLO technology that enables basic Wi-Fi roaming is critical to the operation of Wi-Fi to MBB failover.

The system under test should be configured to have an active cellular data plan and SIM card. The test setup should include a Wi-Fi access point with public Internet access. We recommend that you configure the system under test with a Microsoft account, and set up an additional device that is configured to initiate email and Skype calls.

Start the Wi-Fi to MBB failover testing by confirming that the system is connected to the Wi-Fi access point and has MBB access. You should validate that both network types are functional with the screen on. To do this, connect to Wi-Fi with the MBB radio off, and then connect to MBB with the Wi-Fi radio off. For each network connection, you should connect to the Internet and browse the web to verify IP connectivity.

Next, put the system in modern standby with both Wi-Fi and MBB radios turned on and the system connected to the Wi-Fi network. Use a Wi-Fi connection to test push mail and Skype during modern standby. While the system under test remains in modern standby, power down the Wi-Fi access point and wait a few minutes for the system to connect to the cellular network. After a few minutes, re-test push mail and Skype calls to validate that Windows automatically connected to the cellular network and re-established connectivity.

-   **Test area:**Wi-Fi to MBB transitions during modern standby.
-   **Purpose:**Ensure that the system automatically connects to Wi-Fi or MBB during modern standby.
-   **System configuration:**
    -   Factory image installed on the system.
    -   All drivers loaded in Device Manager.
    -   Factory Windows Store apps are installed.
    -   System is running on battery power.
    -   Wi-Fi and MBB are validated to function correctly with the screen on and manually configured connections to each network.

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
<td><p>Ensure that all IMs received during modern standby are accompanied by sound notifications, while the display remains powered off. When the system wakes from modern standby, check that all IM messages have been received and that the badge on the lock screen is updated appropriately.</p></td>
<td><p>If a notification is not received, a trace is needed to diagnose the problem. See [Capture and view a WPA trace for modern standby diagnostics](capture-and-view-a-wpa-trace-for-modern-standby-diagnostics.md) for information on how to capture a trace and analyze the information.</p></td>
</tr>
</tbody>
</table>

 

 

 






