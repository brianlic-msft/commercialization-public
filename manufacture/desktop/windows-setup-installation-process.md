---
author: Justinha
Description: Windows Setup Installation Process
ms.assetid: e88c0c88-cc6d-436c-a1c0-b109c923ab7e
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Windows Setup Installation Process
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows Setup Installation Process


Windows® Setup is the program that installs Windows or upgrades an existing Windows installation. It is also the basis for the following installation and upgrade methods:

-   Interactive Setup

-   Automated installation

-   Windows Deployment Services

In this topic:

-   [Windows Setup Installation Types](#installationtypes)

-   [Windows Setup Process](#windowssetupprocess)

## <span id="InstallationTypes"></span><span id="installationtypes"></span><span id="INSTALLATIONTYPES"></span> Windows Setup Installation Types


Windows Setup can perform both clean and upgrade installations. However, it does not perform computer-to-computer migrations. Instead, you must use Windows Easy Transfer, the User State Migration Tool (USMT), or another migration tool to move data from a previous installation to the new operating system.

-   **Custom installations.** Windows Setup can perform a custom installation, also known as a clean installation, which saves your previous Windows installation but does not migrate your settings. The previous Windows installation will not boot after a clean installation.

-   **Upgrade installations.** Windows Setup can perform an installation that retains your settings and preferences while upgrading your operating system.

## <span id="WindowsSetupProcess"></span><span id="windowssetupprocess"></span><span id="WINDOWSSETUPPROCESS"></span> Windows Setup Process


The Windows Setup program starts and restarts the computer, gathers information, copies files, and creates or adjusts configuration settings. The following table shows the overall process for Windows Setup:

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Windows Setup phase</th>
<th align="left">Setup actions</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p><strong>Downlevel</strong> (for custom installations and upgrades)</p>
<p>- or -</p>
<p><strong>Windows PE</strong> (for booting the Windows DVD or booting a custom Windows PE image)</p></td>
<td align="left"><ol>
<li><p>Specify Windows Setup configurations by using either the Windows Setup dialog boxes (interactive) or an answer file (unattended), or a combination of the two. Windows Setup configurations include adding a product key and configuring a disk.</p></li>
<li><p>Apply answer file settings in the [windowsPE](windowspe.md) configuration pass to configure the installation behavior and user experience.</p></li>
<li><p>Configure the disk.</p></li>
<li><p>Copy the Windows image to the disk.</p></li>
<li><p>Prepare boot information.</p></li>
<li><p>Process answer file settings in the [offlineServicing](offlineservicing.md) configuration pass. The settings are applied to the Windows image before that Windows image boots. When the computer first boots, any optional components, drivers, updates, or language packs are processed.</p></li>
</ol></td>
</tr>
<tr class="even">
<td align="left"><p><strong>Online configuration</strong></p></td>
<td align="left"><p>Create specific configurations, making the Windows installation unique.</p></td>
</tr>
<tr class="odd">
<td align="left"><p><strong>Windows Welcome</strong></p></td>
<td align="left"><ol>
<li><p>Apply answer file settings in the [oobeSystem](oobesystem.md) configuration pass.</p></li>
<li><p>Apply content file settings from the Oobe.xml file.</p></li>
<li><p>Start Windows Welcome.</p></li>
</ol></td>
</tr>
</tbody>
</table>

 

## <span id="related_topics"></span>Related topics


[Windows Setup Technical Reference](windows-setup-technical-reference.md)

[Automate Windows Setup](automate-windows-setup.md)

[Settings for Automating OOBE](settings-for-automating-oobe.md)

[Windows Setup Scenarios and Best Practices](windows-setup-scenarios-and-best-practices.md)

[Windows Setup Automation Overview](windows-setup-automation-overview.md)

[Audit Mode Overview](audit-mode-overview.md)

[Windows Setup Configuration Passes](windows-setup-configuration-passes.md)

[Windows Setup Supported Platforms and Cross-Platform Deployments](windows-setup-supported-platforms-and-cross-platform-deployments.md)

 

 






