---
title: Load Symbols or Configure Symbol Paths
description: Load Symbols or Configure Symbol Paths
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1f29aadf-a323-4c24-8d46-3eae3e0c2b76
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Load Symbols or Configure Symbol Paths


In Windows Performance Analyzer (WPA), you can set a recording to load symbols or change symbol paths.

**To set a recording to load symbols**

-   On the **Trace** menu, click **Load Symbols**.

**Note**  
When you click **Load Symbols**, a progress bar (along with a count of the symbols found) above the Graph Explorer windows and the Analysis tab. In addition, on the graph itself, the data areas become grayed-out and a progress bar displays in each data area.

 

**To change symbol paths**

1.  On the **Trace** menu, click **Configure Symbol Paths**. By default, the dialog opens on the Paths tab

2.  Enter or select the desired paths, and then click **OK**.

**To cache symbol files to a SymCache folder**

1.  On the **Trace** menu, click **Configure Symbol Paths**. By default, the dialog opens on the Paths tab.

2.  Click **SymCache**. All stored files (with their corresponding paths) display in the body of the SymCache tab, which you can scroll to find specific SymCache file paths.

    **Note**  
    Invalid paths display in red.

     

3.  Select SymCache generation folder and then click the **Browse for Folder** icon to search for the location where your SymCache files are stored, and then click **OK** on the Browse for Folder dialog.

4.  Select each SymCache path to save to the SymCache generation folder specified in the previous steps, and then click **OK**.

5.  Select each SymCache path to save to the SymCache generation folder specified in the previous steps, and then click **OK**.

**To change load settings when configuring symbols**

1.  On the **Trace** menu, click **Configure Symbol Paths**. By default, the dialog opens on the Paths tab.

2.  Click **Load Settings**.

3.  Select how you want to load symbols based on the following options:

    -   Load symbols after load
    -   Load symbols per the following restrictions:

    **Note**  
    When selecting the **Load symbols per the following restrictions:** option, you can specify whether you want to load symbols for specifi processes or you can choose to not load symbols for specific images. You can opt to specify restrictions for both processes and images.

     

4.  Click **OK**.

## Related topics


[WPA Common Scenarios](windows-performance-analyzer-common-scenarios.md)

[Loading Symbols](loading-symbols.md)

 

 







