---
title: Local Video Playback
description: Local Video Playback
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: eaf18658-4d3a-472f-a88d-ce13ec04701b
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Local Video Playback


As part of the Battery Run Down job, the Local Video Playback assessment measures the usage rate of a computer’s battery during full-screen local video playback.

When playing full-screen local video, devices and software not necessary to deliver the video playback now use a minimal amount of energy, allowing for an even greater battery life.

For more information about results and issues produced by this assessment, see [Results for the Local Video Playback Assessment](results-for-the-local-video-playback-assessment.md).

## <a href="" id="beforeyoubegin"></a>Before You Begin


The first-run help tips in Windows 8.1 can negatively affect assessment results. To disable these, run the following command from an elevated command prompt, and reboot the computer: `reg.exe add "HKLM\Software\Policies\Microsoft\Windows\EdgeUI" /v DisableHelpSticker /t REG_DWORD /d "1" /f`

When running this assessment on Windows 8.1, make sure the **Collect Analysis Trace** setting is unchecked when assessing expected battery life. When checked, this option will produce an incorrect estimation.

Enable analysis trace collection only when you need additional information to investigate other energy-related problems.

If you run the Local Video Playback on a PC that has been upgraded from Windows 8 to Windows 8.1, you will be prompted to select a default program for playing MP4 files. This only affects PC that have been upgraded, and does not affect PCs with a clean Windows 8.1 installation. To run the assessment, choose the default video player when prompted. Or you can change the default program that opens MP4 files by using the Control Panel.

1.  From the **Search Charm**, type **Change the file type associated with a file extension**.

2.  Open the **Control Panel**.

3.  Choose the .mp4 extension and click **Change Program**.

4.  Select the default program you want to use to play MP4 files.

### Requirements

-   The computer must have a default media player set that is capable of playing MP4-encoded content.

-   The computer must be capable of playing a 1080p video.

-   The computer must be running on DC (battery) power. Energy efficiency jobs are designed to run only on mobile devices. If a battery is not detected, you will receive an error.

### Recommendations

Before you begin, configure the settings on the computer to create the most realistic scenario possible, reducing the risk of generating warnings in the results. The following guidelines are recommended settings. They are not required for the job to run, but the results may be adversely affected if the computer is not appropriately configured.

-   Make sure that your computer is running in Airplane mode.

-   Exit all non-essential running applications.

-   Set the screen brightness to at least 75% (200 nits).

-   Install and enable antivirus software. If antivirus software isn't enabled and running, the results might not reflect realistic scenarios.

    In Control Panel, open **Action Center**, choose **Security**, and check that the **Virus protection** is **On**. If not, choose **Change Action Center Settings** and then choose the **Virus protection** check box.

-   Make sure that the power policy is set to **Balanced**. By default, any other power policy generates a warning that may affect the results.

    In Control Panel, open **Power Options**, and then choose **Balanced**.

-   Make sure that the computer is configured so that a password isn't required when the computer resumes from a screen saver.

-   Make sure that all device drivers are correctly installed. Results might vary significantly if your computer has missing or incorrect drivers. You can use the [Driver Verification](driver-verification.md) assessment to identify driver issues on the computer that you want to assess.

-   For best results, we recommend that you run the job as a packaged job. For information about how to create and run a packaged job, see [Package a job and run it on another computer](package-a-job-and-run-it-on-another-computer.md).

### System requirements

You can run this assessment on the following operating systems:

-   Windows 8.1

-   Windows RT 8.1

-   Windows 10

Supported architectures include x86-based, x64-based, and ARM-based systems.

You can run this assessment on a Windows RT 8.1 system in either of the following ways:

-   Package the assessment job in the Windows Assessment Console, and then run it on Windows RT 8.1. For more information about this option, see [Package a job and run it on another computer](package-a-job-and-run-it-on-another-computer.md).

-   Use Windows Assessment Services. For more information, see [Windows Assessment Services](windows-assessment-services-technical-reference.md).

 

 






