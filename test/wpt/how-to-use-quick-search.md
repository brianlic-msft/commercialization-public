---
title: How to Use Quick Search
description: How to Use Quick Search
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 56F9E3CE-9584-411C-B55F-8E15E1073FAB
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# How to Use Quick Search


In Windows Performance Analyzer (WPA), you can perform a quick search across all the rows in data tables. This differs from a regular data search ([Search or Filter Data](search-or-filter-data.md)) in that you do not have to specify search parameters such as a query, process (for example, equal, not equal to, or contains) or filters such as match case, search up, etc.

**Note**  You can, however, add a query to fine tune your quick search.

 

**To use Quick Search**

1.  Click the magnifying glass icon on the title bar of the graph. A popup menu opens.

2.  Enter the desired text. When you enter partial text (for example, entering CO for COM Call) WPA will filter the data in all rows using that string. If the text doesn't match any of the data in the rows, the field becomes red (even before you click ) when the text is entered.

3.  To find and highlight all instances of the text you entered, click **Find All**.

    WPA highlights all the rows (in the table) that contain the text you entered. If a row does not contain the text you entered, it is not highlighted but remains in its table row; this is important as it differs from how WPA returns search results when you use **Filter To** as described in Step 4.

4.  To return only the instances that contain the text you entered, click **Filter To**. WPA then only displays the rows that contain the text you entered and removes all rows whose data does not contain the text you entered.

    WPA only displays the rows that contain the text you entered and removes all the rows that do not contain the text you entered.

5.  To add a query and/or filter to your quick search, click **...** and then click **+** to display a dropdown of queries you can add.

6.  To add a Delay Type, click the **contains** dropdown, select the criteria you want to use (for example, equals, contains, etc.), and then enter the search string you want to use.
    **Tip**  To remove the Delay Type, click the **X** in the row that contains the Delay Type (as you can have more than one) you want to delete. By default, the Query includes Delay Type **contains**, which you can also delete.

     

7.  To fine tune your query, select one of the options, such as Match Case or Search collapsed rows).
8.  Click **Find All** to find all data rows that meet your search criteria.
9.  Click **Find Next** to find the next data row that meets your search criteria.
10. Click **Cancel** to not include the query in your quick search.

## Related topics


[Search or Filter Data](search-or-filter-data.md)

 

 







