---
title: Filter results
description: Filter results
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3125e92f-9987-4496-8585-6b469dfff3a9
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Filter results


This topic describes how to filter and sort results when you're selecting results to open in the Windows Assessment Console.

If there's a long list of results to choose from, you can filter the results to quickly find the ones that you're interested in. Or, you can search for specific results by typing a keyword in the search box.

**To filter and sort results**

1.  In the Windows Assessment Console, click **Options**, and then click **Open Results**. A list of all results from the results library appears.

2.  In the **Select Results** window, click the plus sign (**+**) next to the search box.

3.  In the drop-down list, select the metadata that you want to use to filter the results.

    You can filter results based on this metadata:

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Run information</th>
    <th>Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>Architecture</p></td>
    <td><p>The architecture of the computer that the job ran on.</p></td>
    </tr>
    <tr class="even">
    <td><p>Available memory (MB)</p></td>
    <td><p>The available memory, in megabytes, on the computer that the job ran on.</p></td>
    </tr>
    <tr class="odd">
    <td><p>Build number</p></td>
    <td><p>The build number for the Windows operating system that's installed on the computer that the job ran on.</p></td>
    </tr>
    <tr class="even">
    <td><p>CPU description</p></td>
    <td><p>A description of the CPU on the computer.</p></td>
    </tr>
    <tr class="odd">
    <td><p>File path</p></td>
    <td><p>The full path of the .xml file that contains the job results.</p></td>
    </tr>
    <tr class="even">
    <td><p>Graphics chipset</p></td>
    <td><p>The vendor's description of the graphics chipset.</p></td>
    </tr>
    <tr class="odd">
    <td><p>Graphics vendor</p></td>
    <td><p>The vendor of the primary video card.</p></td>
    </tr>
    <tr class="even">
    <td><p>ID</p></td>
    <td><p>The GUID that identifies the result file.</p></td>
    </tr>
    <tr class="odd">
    <td><p>Job name</p></td>
    <td><p>The name of the job.</p></td>
    </tr>
    <tr class="even">
    <td><p>Job start time</p></td>
    <td><p>The date and time that the job started running.</p></td>
    </tr>
    <tr class="odd">
    <td><p>Machine class</p></td>
    <td><p>The type of the computer, such as laptop or desktop.</p></td>
    </tr>
    <tr class="even">
    <td><p>Machine ID</p></td>
    <td><p>The name of the computer.</p></td>
    </tr>
    <tr class="odd">
    <td><p>Run notes</p></td>
    <td><p>Notes that were added before the job ran.</p></td>
    </tr>
    <tr class="even">
    <td><p>System disk model</p></td>
    <td><p>The model of the hard drive that the operating system is running on.</p></td>
    </tr>
    <tr class="odd">
    <td><p>System disk size</p></td>
    <td><p>The size of the computer's hard drive.</p></td>
    </tr>
    <tr class="even">
    <td><p>System disk vendor</p></td>
    <td><p>The name of the vendor, if it's available.</p></td>
    </tr>
    <tr class="odd">
    <td><p>Template settings</p></td>
    <td><p>Indicator of whether the job used template settings or custom settings.</p></td>
    </tr>
    <tr class="even">
    <td><p>Total memory (MB)</p></td>
    <td><p>The amount of total RAM, in megabytes, that's available on the computer.</p></td>
    </tr>
    <tr class="odd">
    <td><p>Windows version</p></td>
    <td><p>The full build number for the Windows operating system that's installed on the computer.</p></td>
    </tr>
    <tr class="even">
    <td><p>WinEI CPU score</p></td>
    <td><p>A Windows Experience Index score for the performance of the processor.</p>
    <p></p></td>
    </tr>
    <tr class="odd">
    <td><p>WinEI D3D score</p></td>
    <td><p>A Windows Experience Index score for the ability to run Microsoft Direct3D applications.</p>
    <p></p></td>
    </tr>
    <tr class="even">
    <td><p>WinEI disk score</p></td>
    <td><p>A Windows Experience Index score for the performance of disk drives.</p>
    <p></p></td>
    </tr>
    <tr class="odd">
    <td><p>WinEI graphic score</p></td>
    <td><p>A Windows Experience Index score for desktop performance.</p>
    <p></p></td>
    </tr>
    <tr class="even">
    <td><p>WinEI memory score</p></td>
    <td><p>A Windows Experience Index score for memory bandwidth.</p>
    <p></p></td>
    </tr>
    </tbody>
    </table>

     

    **Note**  
    The Windows Experience Index score uses a scale of 1.0 to 9.9. For more information about WinSAT, see [Winsat](http://go.microsoft.com/fwlink/?LinkId=224864).

     

4.  Click the relational expression and select one that you want to use.

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

         

5.  In the next box, enter a value that completes the expression that you're using to filter results. For example, you can use an expression like Architecture equals x86.

6.  To add more filter criteria, repeat these steps.

7.  To remove filter criteria, click the **X** next to them.

You can also search for results by typing a keyword in the search box.

## Related topics


[Windows Assessment Console](windows-assessment-console.md)

[Windows Assessment Console common scenarios](windows-assessment-console-common-scenarios.md)

[Compare results](compare-results.md)

[Import results](import-results.md)

 

 







