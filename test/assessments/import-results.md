---
title: Import results
description: Import results
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1c4712cb-31ed-4e3b-9a54-a7d86b9c07ea
ms.prod: W10
ms.mktglfcycl: plan
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Import results


Importing results is the process of copying results from other locations to the default results library. The results that you want to import can be on the local computer, a network share, or removable media. This topic describes how to copy results to the default results library by using Windows Assessment Console.

**To import results**

1.  Click **Options**, and then click **Import Results**.

2.  In the **Import Results** dialog box, click **Browse** to locate the results that you want to import from the local computer, a network share, or removable media.

3.  Locate the folder that contains the results that you want, click the folder, and then click **Select Folder**. The path of that folder appears in the **Import from** box in the **Import Results** dialog box.

    **Note**  
    The import copies the selected folder. It doesn't move and delete items from the source folder.

     

4.  Click **Next**. The Windows Assessment Console imports the selected results into the default results library on the local computer.

    **Note**  
    The Windows Assessment Console can import results only from locations that don't contribute to the assessment results library. If you attempt to import results from any folder that's listed in the assessments results library locations, you'll receive an error message.

     

## Related topics


[Windows Assessment Console](windows-assessment-console.md)

[Windows Assessment Console common scenarios](windows-assessment-console-common-scenarios.md)

[Package a job and run it on another computer](package-a-job-and-run-it-on-another-computer.md)

[Compare results](compare-results.md)

 

 







