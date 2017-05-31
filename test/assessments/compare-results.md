---
title: Compare results
description: Compare results
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 0945053c-1eee-48b9-8909-e9a49a01fd97
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Compare results


This topic describes how to compare results in the Windows Assessment Console.

By default, the results from each job that you run are saved in the results library at %UserProfile%\\Documents\\Assessment Results. Over time, you can compare results to see how changes that you've made to the computer affect performance. Or, if you run assessments on a separate computer, you can compare those results to results for the local computer to see which computer has better performance. In the Windows Assessment Console, when you select more than one result file to view, the results appear side by side for comparison purposes. If a long list of results is available, you can filter the results to quickly find the result that you're interested in.

**To compare results**

1.  In the Windows Assessment Console, click **Options**, and then click **Open Results** to see all the job results that are available for viewing.

2.  In the **Select Results** window, select the results that you want to view.

    -   To select an individual result, select the check box that appears in the left column.

    -   To select multiple results, click the data and drag the mouse, or click the data and then use either the Shift key or the Ctrl key to select the results that you want.

    -   To add results that are stored on removable media or locations other than the default results library, in the **View Results** window, click **Add Results**, and then click **Browse** to locate and open the results.

3.  Click **Open** to open the results in details view.

4.  You can filter results to show only the differences between results set. Click **Select rows** and then click **Show differences**.

When comparing two or more results, the best metrics when applicable are highlighted in blue.

**Note**  
If you want to compare only the summaries of the results, select the **Use summary view to open results** check box before you click **Open**. You can use the summary view to compare a few metrics across many jobs.

 

## Related topics


[Windows Assessment Console](windows-assessment-console.md)

[Windows Assessment Console common scenarios](windows-assessment-console-common-scenarios.md)

[Filter results](filter-results.md)

[Import results](import-results.md)

[Package a job and run it on another computer](package-a-job-and-run-it-on-another-computer.md)

 

 







