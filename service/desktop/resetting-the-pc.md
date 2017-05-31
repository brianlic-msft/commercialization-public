---
author: kpacquer
Description: 'Reset the PC to repair the device or transfer it to another owner.'
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Resetting a desktop PC
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Resetting a desktop device


Resetting the device addresses a number of key scenarios:

-   A user may want to reset a device to transfer it to another owner.
-   The device belongs to an organization, and the organization wants to reset the device. For example, when an employee leaves the organization.
-   The device has malfunctioned and the user wants to reset the device.
-   An OEM has completed factory testing and wants to reset the device (optionally preserving preloaded map data).

**Important**  
When you reset a device, it does not return it to the original factory state. For example, any packages that were added or modified during an update remain. To return the device to the original factory state, you must flash it with the original factory image.

 

## <span id="Ways_to_reset_a_desktop_pc"></span><span id="ways_to_reset_a_desktop_pc"></span><span id="WAYS_TO_RESET_A_DESKTOP_PC"></span>Ways to reset a desktop PC


If Settings is accessible:

1. Click **Settings** &gt; **Update & security** &gt; **Recovery** &gt; under Reset this PC, click **Get started**.

2. Select either **Keep my files** to repair the PC, or **Remove everything** to prepare the PC for a new user.

    **Note**  
    If the device is not responsive, try restarting it first.

If Settings is not accessible:

1.  Click the power button, then hold down **Shift** while choosing **Restart**.  This opens the recovery menu. This works even if you're not logged into Windows.

2.  Click **Troubleshoot**.

3.  Select either **Refresh your PC** to repair the PC, or **Reset your PC** to prepare the PC for another user.

	
For PCs, there isn't a built-in way to reset a device remotely. However, you can install third-party tools that allow you to do this.
 





