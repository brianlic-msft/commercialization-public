---
author: Justinha
Description: 'High DPI and Windows 8.1'
ms.assetid: e330d659-35f0-4178-b504-1e5a3bd169ca
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'High DPI and Windows 8.1'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# High DPI and Windows 8.1


This topic introduces the key concepts of DPI and display scaling and describes what is new in Windows 8.1.

**In this topic:**

-   [Key concepts](#key)

-   [What’s new about DPI](#newdpi)

## <span id="key"></span><span id="KEY"></span>Key concepts


### <span id="What_is_DPI"></span><span id="what_is_dpi"></span><span id="WHAT_IS_DPI"></span>What is DPI

Dots per inch (DPI)) is the physical measurement of number of pixels in a linear inch of a display. DPI is a function of display resolution and size; a higher resolution or a smaller size will lead to higher DPI, and a lower resolution or a larger size will lead to lower DPI. When a display has a higher DPI, pixels are smaller and closer together, so that the user interface (UI) and other displayed content appears smaller than intended.

### <span id="scale"></span><span id="SCALE"></span>What are Windows scale factors

Windows® ensures that everything appears on the screen at a usable and consistent size by instructing applications (including the Windows desktop shell) to resize their content by a scale factor. This number depends on the display DPI as well as other factors that impact the user’s perception of the display. Almost all desktop displays and most current laptop displays are in the range of 95-110 DPI; for these devices, no scaling is required, and Windows sets a scale factor of 100%. However, there are a number of new devices, particularly in the premium laptop and tablet markets, which have higher displays with over 200 DPI. For these devices, Windows sets higher scale factors to ensure that the user experience is comfortably viewable.

### <span id="users"></span><span id="USERS"></span>Why this matters to users

Users typically spend hours reading and working on Windows devices, so it is important to ensure that the device they are looking at is optimized for their comfort. Therefore, it is important for Windows to present the content in the most readable way so that eye fatigue is reduced, and productivity is not impacted. As display technology improves, this can be delivered in a combination of higher DPI displays and better scaling in Windows. Windows 8 provides features that automatically adjust the default scaling to better match newer, more dense DPI displays.

### <span id="enterprises"></span><span id="ENTERPRISES"></span>Why this matters to enterprises

As Windows devices improve, high density displays will become increasingly common in enterprise environments. Enterprises are also moving towards a more mobile workforce that use laptops in meetings to project, docking solutions when at the desk. To ensure optimum productivity, enterprise users should not need to manage how their screens lock when they project, or how their docking solutions present their workspace when they sit down at a desk. Windows 8 does this automatically for most users, but there remain some edge cases which IT professionals in enterprise environments might need to help support. This topic describes how Windows automatically does the right thing in most instances, and where IT might need to step in and help the user out.

## <span id="newdpi"></span><span id="NEWDPI"></span>What’s new about DPI


### <span id="Display_hardware_market_changes"></span><span id="display_hardware_market_changes"></span><span id="DISPLAY_HARDWARE_MARKET_CHANGES"></span>Display hardware market changes

With the advent of higher DPI displays. Windows devices that are available during and after 2013 will routinely feature DPIs that are much higher than what has been previously available. Instead of laptops with 13” and 1366x768 resolutions, you will see screen resolutions up to 3200x1800 at 13”. For these laptops to be usable, Windows scaling has to move from 100% (13.3” 1366x768) to 125% (13.3” 1600x900), 150% (10.6” 1920x1080) or 200% (13.3” 2560x1440). Before Windows 8, only 100%, 125% and 150% were automatically set to match the display; in Windows 8, 200% support has been added.

### <span id="Windows_8.1_changes"></span><span id="windows_8.1_changes"></span><span id="WINDOWS_8.1_CHANGES"></span>Windows 8.1 changes

Windows 8 includes a number of feature changes that are specific for high DPI, as shown in *Table 1 Windows 8.1 DPI Changes*:

**Table 1 Windows 8.1 DPI Changes**

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Feature</th>
<th align="left">Windows 8</th>
<th align="left">Windows 8.1</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left"><p>Support for 200% scaling</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>Yes</p></td>
</tr>
<tr class="even">
<td align="left"><p>Per-monitor DPI</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>Yes</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Scaling of existing DPI-aware applications</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>Yes</p></td>
</tr>
<tr class="even">
<td align="left"><p>Per-monitor DPI aware applications</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>Yes</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Viewing distance incorporated in default DPI calculation</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>Yes</p></td>
</tr>
<tr class="even">
<td align="left"><p>Logoff free DPI change</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>Yes</p></td>
</tr>
<tr class="odd">
<td align="left"><p>Per-monitor DPI aware Internet Explorer</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>Yes</p></td>
</tr>
<tr class="even">
<td align="left"><p>Auto-DPI configuration of Remote Desktop</p></td>
<td align="left"><p>No</p></td>
<td align="left"><p>Yes</p></td>
</tr>
</tbody>
</table>

 

The first two of the above features have the biggest impact on Windows 8 usability. In more detail:

1.  **Improved 200% scaling support:** Windows 8.1 identifies high DPI display devices on a dynamic basis and natively supports up to 200% scale factors. Windows 8 only identified a high DPI display during first boot, and only supported up to 150% scaling without user customization. This feature ensures that users who buy premium laptops with high DPI displays will automatically receive the 200% scaling required to make content easily visible.

2.  **Per-monitor DPI:** Windows 8.1 sets different scale factors for different displays, and can scale content appropriately. Windows 8 only sets a single scale factor that is applied to all displays. This feature ensures that users with High DPI devices (that is, 150% and 200% scaling laptops) who project or dock their devices with conventional 100% scaling projectors and desktop monitors display properly sized content on those screens.

### <span id="How_these_changes_impact_enterprise_users"></span><span id="how_these_changes_impact_enterprise_users"></span><span id="HOW_THESE_CHANGES_IMPACT_ENTERPRISE_USERS"></span>How these changes impact enterprise users

For the users on laptops with 100% scaling, the Windows 8.1 feature changes have no impact. For users who acquire new devices that have high DPI, Windows 8.1 provides a significant benefit.

It is possible that some users will acquire devices that fall in-between, featuring Windows scaling of 125%. These devices can require the user or the IT professional to configure them correctly or update/tweak applications to improve usability. The troubleshooting section of this topic can help IT professionals identify these systems, these applications, and undertake the right mitigation tactics.

## <span id="related_topics"></span>Related topics


[High DPI Support for IT Professionals](high-dpi-support-for-it-professionals.md)

 

 






