---
title: Step 1 Opening and Analyzing ETL Files in WPA
description: This section presents a detailed walkthrough of the capabilities of the Windows Performance Analyzer (WPA) user interface (UI).
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: D0B39B45-5258-4258-951C-DCC68CAC8D8D
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Step 1: Opening and Analyzing ETL Files in WPA


This section presents a detailed walkthrough of the capabilities of the Windows Performance Analyzer (WPA) user interface (UI).

## Step 1: Opening an ETL File


WPA can open any event trace log (ETL) files that are created by using Windows Performance Recorder (WPR) or Xperf.

**To open an ETL file in WPA**

1.  On the File menu, click Open.
2.  If you have saved your ETL file to a location other than the default, navigate to that location. By default, WPR saves ETL files in your Documents\\WPR Files folder.
3.  Select the desired file, and click Open.

    You can also open WPA from the results page of assessments that are created by using the Assessment Platform.

**To open WPA from an assessment**

-   After you have run the job, click the WPA in-depth analysis link in the Issues pane on the View Results page. You may have to expand the issue to see this link.

## Step 2: Selecting Graphs


All available graphs for a recording are visible in the Graph Explorer window. Expand any node by clicking the small triangle. Then, drag the graphs to the Analysis tab to view the full-size version of the graph and its associated data table. You can also double-click the graph to open it on the Analysis tab.

By using the layout icons on the right of the graph title bar, you can select to view only the graph, only the data table, or both.

## Step 3: Selecting a Time Interval


On the Analysis tab, you can select a time interval by dragging the pointer horizontally across a section of the graph. The timeline at the bottom of the tab applies to all graphs on the tab.

## <a href="" id="step-4--zooming-in-on--a-time-interval"></a>Step 4: Zooming in on a Time Interval


After you have selected a time interval, you can zoom in to expand that time interval to the full width of the Analysis tab. To do this, right-click the interval, and then select Zoom to selected time range. You can repeat this step several times to see very fine detail of a very small time interval.

All graphs on the Analysis tab use the same timeline. Therefore, this action expands the same time interval for all those graphs.

## Step 5: Highlighting a Selected Time Interval


After you have selected a time interval, you can also highlight that time interval in all graphs on the Analysis tab and in the Graph Explorer window. To do this, right-click the interval, and then select Highlight Selection. This action freezes the selection regardless of where else you click. To clear the selection, right-click the interval, and then select Clear Selection.

## Step 6: Customizing a Data Table


You can drag columns to any position in the data table. You can click the table header over any column to sort by that column. You can also click the table header again to reverse the sorting. When you change the data table, the changes are also reflected in the Legend control of the graph. The Legend column of the data table matches the Legend control of the graph.

You can customize data tables by selecting what columns to display. To open the Column Chooser box, right-click the table header. You can then select columns individually or create or apply preset combinations of columns to display.

Data tables are pivot tables. The columns to the left of the vertical gold bar are keys. The columns between the vertical gold bar and the vertical blue bar are the data columns. If you do not see the vertical gold bar, scroll to the right.

You can drag any column to the left of the vertical gold bar to make it a key. You can also drag some columns to the right of the vertical blue bar to make them graphing elements.

You can freeze a small selection of columns by right-clicking to show vertical gray freeze bars. Then, the scroll bar scrolls only between the columns between the freeze bars. You can drag the freeze bars to include any number of columns.

## Step 7: Opening a new Analysis Tab


All graphs and tables on an Analysis tab share the same timeline and are zoomed in and out together. If you want to view some graphs on a different timeline, you can open an additional Analysis tab. To do this, click New Analysis View on the Window menu, and then drag the desired graphs to the new tab.

## Step 8: Opening or Closing Windows


On the Window menu, select the windows that you want to open or close.

## Step 9: Creating and Applying a View Profile


After you have set the layout in the way that you want, you can create a view profile that reproduces the current layout either every time that you open WPA or only for specific types of recordings. On the Profiles menu, click Export to create a view profile, click Apply to apply a view profile that you previously created, or click Save Startup Profile to see the current layout view every time that you open WPA.

## Step 10: Searching and Filtering


You can filter the data in a graph and its associated data table by right-clicking the graph Legend control and enabling or disabling the desired items. To show only the selected row or rows, right-click the data table, and then click Filter To Selection.

To select the columns to display in the data table, right-click the table header, and then select or clear the columns in the Column Chooser box.

To search the text in the data table, right-click the table, and then select Find, Find Next, or Find Previous.

## Step 11: Setting User Preferences


Currently, you can set WPA to load symbols, and you can set symbol paths. These options are available on the Trace menu.

## Step 12: Using the Diagnostic Console


This window lists exceptions that occurred in the analysis workflow. You can diagnose symbol decoding issues from this console.

## Step 13: Viewing Assessment Analysis and Issue Details


When you open WPA from an assessment that was run in the Assessment Console and that provides additional analysis, the issues that the assessment identifies appear in the Issues window. If you click one of these issues, details and a recommended solution appear in the Analysis tab under Issue Details. You can also search the list of issues by using the Search options at the top of the Issues window. More information about this functionality is available in Issues Window.

 

 






