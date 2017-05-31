---
author: Justinha
Description: 'High DPI projection and multi-monitor configurations'
ms.assetid: 81a96303-5ab5-4002-acac-ab356e2ec829
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'High DPI projection and multi-monitor configurations'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# High DPI projection and multi-monitor configurations


Many enterprise users use secondary displays for such purposes as docking, projection, or extending their desktop to a secondary display.

These scenarios do not impact the guidance for 150% and 200% devices, but for users with 125% display devices who also use a desktop docking station or secondary monitor, we recommend the Windows 8 compatibility mode that is described in [Fixing blurry text in Windows 8.1 for IT Professionals](fixing-blurry-text-in-windows-for-it-professionals.md#unaware). Additional guidance about compatible devices and projectors is provided in this topic.

## <span id="projection"></span><span id="PROJECTION"></span>Projection experiences


Windows 8.1 has optimized support for projection experiences. In previous versions of Windows, the user of a high DPI device might see content that was too big on the low DPI projector, making it difficult to get all the appropriate content on screen for presentation purposes. There are two projection modes: *Duplicate* and *Extend*. This section describes how Windows supports each of these modes.

### <span id="Duplicate_mode__default_for_projection_and_typically_used_for_projection_"></span><span id="duplicate_mode__default_for_projection_and_typically_used_for_projection_"></span><span id="DUPLICATE_MODE__DEFAULT_FOR_PROJECTION_AND_TYPICALLY_USED_FOR_PROJECTION_"></span>Duplicate mode (default for projection and typically used for projection)

The default projection mode is called Duplicate mode. (Type **Win+P** at the keyboard to see a list of the four multi-monitor display modes: **PC screen only**, **Duplicate**, **Extend**, and **Second** screen only.) In Duplicate mode, the same content is presented on the laptop display as on the projector. This makes it easiest for the presenter to interact directly with the content being display on the screen, particularly with laptop or tablet that supports touch. In this mode, Windows will look at both displays, try to find the best common resolution, and then put both displays into that resolution. In Windows 8.1, if this resolution change has an impact on the display scale factor, Windows will then rescale based on the new scale factor, thereby ensuring the best projection experience.

### <span id="Extend_mode__typical_for_multi-monitor_desktop_scenarios_"></span><span id="extend_mode__typical_for_multi-monitor_desktop_scenarios_"></span><span id="EXTEND_MODE__TYPICAL_FOR_MULTI-MONITOR_DESKTOP_SCENARIOS_"></span>Extend mode (typical for multi-monitor desktop scenarios)

In the Extend mode, the projector is treated as a separate display from the primary display. This mode is typical for users using a multi-monitor setup or docking scenario. The user can drag or move content to the separate display by using the mouse or touchpad. This is not the default option but some users prefer this setting (to give just one example, because it allows the user to separate note taking from their presentation). In this mode, Windows 8.1 associates an appropriate scale factor for each display, and when the user moves content to the projector, Windows will rescale it appropriately, again ensuring the best projection experience.

### <span id="itpro"></span><span id="ITPRO"></span>What this means for the IT Professional

For projection scenarios, per-monitor scaling is required to provide a usable projection experience for 150% and 200% displays. In some cases, users who have 125% devices might have issues with apps that aren’t DPI-aware being fuzzier when projected. See [Fixing blurry text in Windows 8.1 for IT Professionals](fixing-blurry-text-in-windows-for-it-professionals.md#unaware) for guidance on how to turn off per-app DPI scaling in these cases.

**Important**  
Projectors work best in duplicate mode if they support resolutions and video modes that are similar to the device that is projecting. For example, if the dominant portable devices in the enterprise have 1366x768 and 1920x1080 displays, the projectors that are used should support the same resolutions for the best duplicate mode experiences.

 

## <span id="related_topics"></span>Related topics


[High DPI Support for IT Professionals](high-dpi-support-for-it-professionals.md)

 

 






