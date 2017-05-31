---
title: Analyze results on another device
description: Analyze results on another device
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 2775a4c2-6eb5-467c-b7b3-35529930cc16
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Analyze results on another device


You can run an assessment to collect traces on one PC, and analyze the data on another PC or at another time. You might want to collect traces without analysis in order to:

-   Run analysis on a PC with more memory or a faster processor

-   Delay analysis to free up time for other high priority uses of the machines

-   Run on a PC that already has symbols configured

-   Reanalyze assessment data later with updated diagnostic modules or symbols

-   Collect the data on all devices, but analyze only those that meet specific criteria

**To collect trace files without running analysis**

1.  Select a job or assessment to run.

2.  On the **Configure job** screen, select **Collect traces only**.

3.  Run the job.

4.  Trace files for the assessment will be saved to *%UserProfile%\\Documents\\Assessment Results*.

    **Note**  
    Collecting trace files without analysis is not available for all jobs and assessments.

     

## Run analysis on another device


You can load symbols on the PC where you want to analyze trace files. For more information, see [Symbol Support](../wpt/symbol-support.md).

**To run analysis on trace files using WAC**

1.  In the Windows Assessment Console, click **Options**, and then click **Open Results** to see all the job results that are available for viewing.

2.  In the **Select Results** window, select the results that you want to analyze.

3.  Click **Open** to open the results in details view.

    The **Analysis complete** row of the results shows **False**.

4.  Click **Analyze**.

    If you have multiple results open that can be analyzed, you can select which ones to analyze.

## Related topics


[Package a job and run it on another computer](package-a-job-and-run-it-on-another-computer.md)

[Import results](import-results.md)

 

 







