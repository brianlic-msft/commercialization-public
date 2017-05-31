---
title: Modern standby SleepStudy report
description: Describes the contents of a modern standby SleepStudy report.
MS-HAID:
- 'cstandby.connected\_standby\_sleepstudy\_report'
- 'p\_weg\_hardware.modern\_standby\_sleepstudy\_report'
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: FC47163A-2089-4307-9AE7-020766656855
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Modern standby SleepStudy report


The SleepStudy report is organized as a series of modern standby sessions. A modern standby session is defined as one instance of the screen turning off and then back on again.

For each session, an overview is provided at the top of the report with a hyperlink to a detailed section for each session in the HTML report.

The SleepStudy report also contains:

-   Static configuration information about the hardware platform, its operating system installation, and firmware version.
-   A graphical view of the usage trend over the last 72 hours.
-   A summary table of each modern standby session, which includes:
    -   Session start time, end time, and duration.
    -   Power source (AC or battery power).
    -   Battery power consumed and average power consumption.
-   Detailed information for each modern standby session, which includes:
    -   The information contained in the summary table.
    -   A histogram chart of idle time.
    -   The five most active components ("top offenders") in the modern standby session. The information shown for each component includes the component type, name, and device path (if applicable).
-   Information about the system battery configuration, including design capacity and cycle count.

The remainder of this topic describes a sample SleepStudy report, and explains how to interpret the report and understand the information that it contains.

## System information


Every SleepStudy report begins with basic system information, which includes system name and firmware version. This information is essential because changes to the operating system, firmware, and BIOS can have significant impact on modern standby battery life.

## Usage trends


Every SleepStudy report includes a graphical view of system usage that includes modern standby periods.

The graph is color-coded. Green, orange, and red segments correspond to low, medium, and high system activity, respectively.

The default period that the graph covers is three days.

The graph consists of dotted, solid, and no-line segments, which indicate AC power, battery power, and system-off periods, respectively. The following graph legend is included with each SleepStudy report.

## Summary information


Each SleepStudy report includes a table that summarizes the modern standby sessions that are evaluated in the report.

Each row in the summary table contains information about one modern standby session. The rows in the summary table are color-coded to identify sessions that should be investigated for improvement.

The color coding for each session is based on a combination of the drain rate and the deepest runtime idle platform state (DRIPS) rate (percent low power). The color is determined by the worst performance of either drain rate or DRIPS rate, according to the following rules:

-   Red indicates at least one of the following:
    -   The DRIPS rate is &lt; 80 percent.
    -   The drain rate is &gt;= 1 percent per hour. (If the drain rate is &gt;= 1 percent per hour, the modern standby battery life will be at most four days.)
-   Orange indicates at least one of the following:
    -   The DRIPS rate is between 80 and 94 percent.
    -   The drain rate is between 0.333 and 1 percent. (If the drain rate is under 0.333 percent, the platform will achieve 12+ days battery life in modern standby.)
-   Green indicates all other cases.

By design, some sessions are active (red rows). But most sessions can be expected to reflect low activity and low power (green). The color scheme is designed to make potential high-drain sessions easy to identify. You should be most concerned about long sessions (of several hours) that show high sustained battery drain—these sessions have the most impact on the battery.

SleepStudy calculates drain rate by using remaining capacity information that is provided by the platform battery and charging subsystem. The battery capacity, in milliwatt-hours, is recorded at the start and end of each SleepStudy session. The battery capacity information is provided by the platform through the ACPI \_BST control method under the battery device object in the ACPI namespace.

The summary table includes the following basic information (from left to right):

-   The session number (left column) starts with one, and increments for each session that is reported during this period. The default report period covers the last three days.
-   START TIME (local time) is shown in YYYY-MM-DD HH:MM:SS format. Additional sessions on the same day do not repeat the year-month-day information.
-   DURATION, in hours:minutes:seconds, of the modern standby session. This duration time covers the approximate period between the transition to screen off and subsequent transition to screen on.
-   ENERGY CHANGE shows the number of absolute milliwatt-hours (mWh) that are consumed and the relative percentage of the battery's last full-charge capacity. A session in which no change occurs in remaining capacity is indicated by a hyphen (-), as shown in session 6 in the summary table in the preceding example.
-   ENERGY CHANGE shows the number of absolute milliwatt-hours (mWh) that are consumed and the relative percentage of the battery's last full-charge capacity. A session in which no change occurs in remaining capacity is indicated by a hyphen (-), as shown in session 6 in the summary table in the preceding example.
-   CHANGE RATE, in milliwatts, and AC (Charge) or DC (Drain) power source indicator. The change rate is calculated by dividing the ENERGY CHANGE value by the DURATION value.
-   % LOW POWER STATE TIME shows the DRIPS rate and (if applicable) hardware DRIPS as the percentage of time in which the SoC resides in the lowest power state (DRIPS). Hardware DRIPS (denoted by HW: preceding the residency percentage) is available on Intel and Qualcomm SoC-based Windows PCs only.

modern standby sessions of less than ten minutes are not tracked by the SleepStudy report. To measure modern standby performance, session duration should be greater than ten minutes. Longer periods (more than one hour) are reflective of real user experience.

Energy change is not tracked for AC sessions (indicated by the Charge keyword under CHANGE RATE). This information is captured in other reports, such as the report that the powercfg/energy command generates, because energy policies that are used when the platform runs on AC power are different from the policies that are used when the platform runs on battery (DC) power. In general, these policies are less strict and allow for different use cases. Every row in the summary table is a hyperlink to per-session details that are presented in the SleepStudy report.

## Session details


A per-session details section of the report starts by repeating the session information from the summary table.

The table can show the following types of offenders:

-   Fx Device. A device that has a driver that implements support for the Windows power framework (PoFx). Typically, this type of device resides on the SoC itself.
-   Activator. A software component that can keep the system active to perform valuable work during modern standby. (In the preceding example, the name BI identifies the broker infrastructure, which is a Windows software component that coordinates background task execution.)
-   Networking. A networking subsystem device or component.
-   Processor. CPU active time that occurs outside of an activator being enabled.
-   PDC Phase. Time that is spent in the different phases of entering or exiting modern standby.
-   Other. Includes miscellaneous tracking information. For example, CPU utilization outside of an enabled activator is listed under TYPE as Other.

Each component in the Top Offenders table is color-coded by activity time. If it is over ten percent busy, the row is highlighted in red. If the component is between five and ten percent active, it is colored orange. Otherwise, the component row is highlighted in green. All rows in the preceding example are green because all five components are less than five percent active.

The preceding example session does not display any top offenders that exceed the ten percent active time, but the session itself is orange. That's because the session exceeded the expected drain rate of 0.333 percent per hour but is below one percent per hour, resulting in an orange color code for the session.

 

 






