---
title: Troubleshooting Assessments
description: Troubleshooting Assessments
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c0ab73ed-ba51-45f7-b498-916f2492154f
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Troubleshooting Assessments


The following information can help you diagnose what causes assessments to fail.

## Assessment Didn't Produce Any Results


If you receive an error message and the assessment didn't produce any results, use this method to view the log files:

-   In the Windows Assessment Console, on the **View Results** page, choose **Total errors**, and then expand the error that appears in the details pane on the right.

-   Choose the link under **Further analysis** to open the folder where the log files are stored. The folder contains AxeLog.etl trace files that you can open in Windows Performance Analyzer (WPA). The folder also contains ErrorWarnings.xml files and AXELog.txt files. The text file is a compilation of all of the Event Trace Log (ETL) files that are produced after the job finishes.

## The Assessment fails to complete


The job completes, but the assessment doesn't run. One of the following error codes might be reported by the assessment:

-   0x80050006

-   0x80004005

This error occurs when maintenance tasks have been registered on the PC but have not completed before the assessment run. This prevents the assessment from running, as maintenance tasks often impact assessment metrics.

To resolve this issue, do one of the following:

1.  Ensure that the computer is connected to a network and is running on AC power. Manually initiate pending maintenance tasks with the following command from an elevated prompt:

    **rundll32.exe advapi32.dll,ProcessIdleTasks**

2.  Disable regular and idle maintenance tasks, and stop all maintenance tasks before running the assessment

## Related topics


[Windows Assessment Toolkit](windows-assessment-toolkit-technical-reference.md)

 

 







