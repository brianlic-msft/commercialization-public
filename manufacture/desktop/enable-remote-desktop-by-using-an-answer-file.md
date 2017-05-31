---
author: Justinha
Description: Enable Remote Desktop by Using an Answer File
ms.assetid: bee7ad87-7fb4-4313-baab-109a6f067ccc
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Enable Remote Desktop by Using an Answer File
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Enable Remote Desktop by Using an Answer File


To enable remote desktop connections during an unattended installation, you must configure several settings and enable the Remote Desktop group in Windows® Firewall with Advanced Security.

**To create an answer file to enable remote desktop connections**

1.  On your technician computer, open Windows System Image Manager (Windows SIM). Click **Start**, type **Windows System Image Manager**, and then select **Windows System Image Manager**.

2.  Create a new answer file, or update an existing answer file. For more information, see [Create or Open an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915085) and [Best Practices for Authoring Answer Files](https://msdn.microsoft.com/library/windows/hardware/dn915073).

    Add these settings to your answer file in the listed configuration pass:

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Component</th>
    <th align="left">Configuration pass</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><p>Microsoft-Windows-TerminalServices-LocalSessionManager</p></td>
    <td align="left"><p><strong>4 specialize</strong></p></td>
    </tr>
    <tr class="even">
    <td align="left"><p>Networking-MPSSVC-Svc\FirewallGroups\FirewallGroup</p></td>
    <td align="left"><p><strong>4 specialize</strong></p></td>
    </tr>
    </tbody>
    </table>

     

3.  In the **Answer File** pane, configure these settings:

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Component</th>
    <th align="left">Value</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><p>Microsoft-Windows-TerminalServices-LocalSessionManager</p></td>
    <td align="left"><p><code>fDenyTSConnections=false</code></p></td>
    </tr>
    <tr class="even">
    <td align="left"><p>Networking-MPSSVC-Svc\FirewallGroups\FirewallGroup</p></td>
    <td align="left"><p><code>Active=true</code></p>
    <p><code>Group=Remote Desktop</code></p>
    <p><code>Profile=all</code></p></td>
    </tr>
    </tbody>
    </table>

     

4.  (Optional) Specify how users are authenticated. Specifying the following setting will help make sure that users can connect remotely from computers that don't run Remote Desktop by using network-level authentication. To enable remote desktop connections from computers that are running any version of Remote Desktop, add this setting to your answer file:

    <table>
    <colgroup>
    <col width="33%" />
    <col width="33%" />
    <col width="33%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Component</th>
    <th align="left">Configuration pass</th>
    <th align="left">Value</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><p>Microsoft-Windows-TerminalServices-RDP-WinStationExtensions</p></td>
    <td align="left"><p><strong>4 specialize</strong></p></td>
    <td align="left"><p><code>UserAuthentication=0</code></p></td>
    </tr>
    </tbody>
    </table>

You're now ready to install your Windows image.

For more information about Windows® components and settings that you can add to an answer file, see the [Unattended Windows Setup Reference](https://msdn.microsoft.com/library/windows/hardware/dn923277).

## <span id="related_topics"></span>Related topics


[Configure Windows Firewall with Advanced Security by Using an Answer File](configure-windows-firewall-with-advanced-security-by-using-an-answer-file.md)

[Automate Windows Setup](automate-windows-setup.md)

[Configure Network Settings in an Unattended Installation](configure-network-settings-in-an-unattended-installation.md)

[Windows Deployment Options](windows-deployment-options.md)

 

 






