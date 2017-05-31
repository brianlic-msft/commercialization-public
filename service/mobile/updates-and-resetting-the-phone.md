---
author: kpacquer
Description: Updates and resetting the device
ms.assetid: ad197224-ed30-4483-816e-a48ec385197d
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Updates and resetting the device
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Updates and resetting the device


OEMs must consider how updates are affected when the user resets the device. To understand the fundamentals of how resetting the device alters the operating system, carefully review [Resetting the device](https://msdn.microsoft.com/windows/hardware/commercialize/manufacture/mobile/resetting-a-phone-during-manufacturing).

## <span id="OS_and_BSP_updates"></span><span id="os_and_bsp_updates"></span><span id="OS_AND_BSP_UPDATES"></span>OS and BSP updates


Microsoft OS and OEM Board Support Package (BSP) updates—and any associated registry changes—persist after the device is reset. For the user, this means that updates do not need to be downloaded when the device is reset. For the OEM, this means that newer versions of the OS and BSP updates need to be designed to allow compatibility with older apps, whose updates reverted when the device is reset.

## <span id="Preloaded_apps"></span><span id="preloaded_apps"></span><span id="PRELOADED_APPS"></span>Preloaded apps


When the device is reset, preloaded apps install from the current version of the XAP that is stored on the phone. The current version is either the original XAP that shipped on the device or the most recent version that was received in an OEM over-the-air (OTA) update. The user may still need to download updates to the apps, if later versions have been published to the Store but have not been delivered as part of an OTA update.

There are additional important considerations for updating preloaded system setting apps. For more info, see [System settings apps and updates](system-settings-apps-and-updates.md).

## <span id="Placeholder_apps"></span><span id="placeholder_apps"></span><span id="PLACEHOLDER_APPS"></span>Placeholder apps


Placeholder apps are reinstalled from the current app package on the device. The current version is either the original package that shipped on the device or the most recent version that was received as part of an OTA update.

## <span id="User_apps_and_data"></span><span id="user_apps_and_data"></span><span id="USER_APPS_AND_DATA"></span>User apps and data


Any user-installed Store apps and associated data are removed when the device is reset. The user can use the backup and restore feature to restore these apps. For more info, see [Back up my stuff](http://go.microsoft.com/fwlink/p/?LinkId=331631).

## <span id="related_topics"></span>Related topics


[Update](index.md)

 

 






