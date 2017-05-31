---
title: Exercise 1 - Identify Problems with Spurious Wakes
description: Devices should avoid unexpectedly waking up the SoC through interrupts (for example, interrupt storms, bad debouncing, etc.).
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: FEC9383F-3643-4CF3-82FA-34FD6C535483
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Exercise 1 - Identify Problems with Spurious Wakes


Devices should avoid unexpectedly waking up the SoC through interrupts (for example, interrupt storms, bad debouncing, etc.). Waking up the SoC causes the system to exit **DRIPS**, increases the average power floor and reduces battery life. This is known as a spurious wake.

The analysis process related to spurious wakes is fairly straightforward.

1.  Download the pre-generated **sleepstudy-report\_1.html** report [here](http://download.microsoft.com/download/2/6/6/2662D67D-58CC-4823-8812-AD215DD9778F/sleepstudy-report_1.mdl).

2.  Open **sleepstudy-report\_1.html** with your favorite browser.

3.  Click on **Session 2**. The system consumes 1.818 Watts of energy during 19 hours and the **DRIPS %** is 92%.

    ![Screenshot shows a sample of Connected Standby Session 2](images/standbylab1.png)

4.  Look at the **Top Offenders** table. The networking wireless device is listed as active 7% of the time during the session.

    ![Screenshot shows a sample of top offenders of battery consumption.](images/standbylab2.png)

5.  Click on the networking device row to obtain details about this offender.

    ![Screenshot shows detailed information about the networking device that is consuming the most power.](images/standbylab3.png)

Spurious wakes are clearly identified by the report. There are 80 of them in this example. A follow-up discussion should happen with the IHV to determine why the wireless adapter is waking up the SoC unexpectedly. The underlying problem could be a bad device firmware implementation.

 

 






