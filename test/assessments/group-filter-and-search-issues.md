---
title: Group, filter, and search issues
description: Group, filter, and search issues
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: dfc198ee-d037-4a34-b309-ee8786026716
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Group, filter, and search issues


This topic provides an overview of assessment results. It also describes how to open multiple results and then group, filter, and sort the issues to find the information that you need.

Results show information about what the assessment discovered when it ran. The results include metrics that describe what the assessment measured, issues that the assessment found based on the measurements, and recommendations to help you resolve any issues. Some recommendations include links to additional information or links to Windows Performance Analyzer (WPA). These links help you trace the cause of an issue back to the source.

You can open individual results or multiple results from a list of all results. A summary view is available for comparing multiple results. But by default, when you open results in the Windows Assessment Console, they open in the details view. The details view of results consists of:

-   **Run information.** The first table in the details view contains the run information. The run information provides data about the computer that the job ran on, in addition to the total issues, errors, and warnings that the job produced on that computer. Click **Select rows** to add or remove run information from the table.

-   **Assessment results.** Assessment results for each assessment that the job ran appear after the run information table. The assessment results contain 5 categories of information: errors, warnings, issues, metrics, and assessment settings. To expand or collapse a row, click the chevron at the start of each row.

-   **A details pane.** When you click an individual cell in the tables, more information appears in the details pane on the right. The details pane is visible by default, but you can collapse it to give more screen space to results.

-   **A metric chart.** Each assessment has a chart icon by the assessment name. You can click the chart icon to graph all the metrics. The top-level metrics also have associated bar charts. To simplify or extend the graph, click the colored bar next to the result that you want to add to the graph or remove from the graph. To return to the original graph, click the colored bar next to the assessment name.

Issues are a key part of the results. They identify potential problems with a computer configuration or performance based on measurements that the assessment records. The job reports the total number of issues that it found and the number of issues that it found for each assessment. If more than one issue occurs, you can expand the issue to see more information. You can also click an individual issue to see recommended remediation and more analysis information in the details pane.

**To open results**

1.  In the Windows Assessment Console, click **Options**, and then click **Open Results**. A list of all results from the results library appears.

2.  Select one or more results, and then click **Open**.

    -   To select an individual result, select the check box that appears in the left column.

    -   To select multiple results, click the data and drag the mouse, or click the data and then use either the Shift key or the Ctrl key to select the results that you want.

**To group issues in the assessment results table**

1.  On the **View Results** page, in the assessment results table, click the chevron next to **Issues** to expand the issues.

2.  Right-click **Issues**, and then on the **Group by** menu, select a category to group by.

    Each assessment can have different grouping categories. For example, you might see:

    -   **(None)**. Don’t group issues.

    -   **Category**. Group issues by category. Each issues is categorized by the type of performance impact that the assessment has detected.

    -   **Type ID**. Group issues based on an ID. Each issue is associated with a type ID that defines a group of similar issues across multiple categories.

    -   **Test case**. Group issues based on which test case or workload was being exercised when the assessment discovered the issue.

    -   **Manufacturer**. Group issues based on the manufacturer, if the manufacturer is identified in the issue.

    -   **Process**. Group issues based on processes, if they're identified in the issue.

    **Note**  
    You can also right-click **Total issues** in the run information table to group issues in that table.

     

**To sort issues across multiple jobs**

1.  On the **View Results** page, in the assessment results table, click the chevron next to **Issues** to expand the issues.

2.  Right-click **Issues**, and then click either **Sort ascending** or **Sort descending** to sort the columns for various job results.

    **Note**  
    You can also right-click **Total issues** in the run information table to sort the columns for various job results based on the number of total issues in each job.

     

**To search for issues in the details pane**

1.  On the **View Results** page, in the assessment results table, click **Issues**.

    Details for each issue appear in the details pane on the right.

2.  In the details pane, type any word in the **Filter issues** box.

**To filter issues in the details pane**

1.  On the **View Results** page, in the assessment results table, click **Issues**.

    Details for each issue appear in the details pane on the right.

2.  In the details pane, click the green plus sign (**+**) next to the **Filter issues** box, and then select filter criteria. Different assessments have different filter criteria.

    The default relational expression appears next to the filter criteria that you selected.

3.  Click the relational expression and select one that you want to use.

    Depending on the metadata filters that you use, these relational expressions are available:

    -   equals

    -   not equals

    -   less than

    -   greater than

    -   less than or equal

    -   greater than or equal

    -   starts with

    -   ends with

    -   contains

    -   not contains

    -   between

    -   regex

        **Note**  
        The term *regex* refers to regular expressions. For more information, see [Regular Expression Language Elements](http://go.microsoft.com/fwlink/?LinkId=235292).

         

4.  In the box, enter the metadata value that you want to filter on.

    -   To add filter criteria, repeat these steps.

    -   To remove filter criteria, click the **X** next to them.

## Related topics


[Windows Assessment Console](windows-assessment-console.md)

[Windows Assessment Console common scenarios](windows-assessment-console-common-scenarios.md)

[Compare results](compare-results.md)

[Import results](import-results.md)

[Filter results](filter-results.md)

 

 







