---
author: Justinha
Description: Determine the Actual Size of the WinSxS Folder
ms.assetid: 059afbeb-3911-4e50-9ba5-ffd4fe6f38a4
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Determine the Actual Size of the WinSxS Folder
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Determine the Actual Size of the WinSxS Folder


Why is the WinSxS folder so big? The short answer to this commonly asked question is that the component store (WinSxS folder) contains all the components that make-up Windows to allow you operate your system. These components are kept to rollback any problematic change or to repair a file that becomes corrupted. For more information about the component store, see [Manage the Component Store](manage-the-component-store.md). For information on how to delete files in the WinSxS folder, see [Clean Up the WinSxS Folder](clean-up-the-winsxs-folder.md).

For operating system files, it can appear that more than one copy of the same version of a file is stored in more than one place on the operating system, but there’s usually only one real copy of the file. The rest of the copies are just “projected” by hard linking from the component store. A *hard link* is a file system object that lets two files refer to the same location on disk. Some tools, such as the File Explorer, determine the size of directories without taking into account that the contained files might be hard linked. This might lead you to think that the WinSxS folder takes up more disk space than it really does.

**Warning**  
Some important system files are located only in the WinSxS folder. Deleting files from the WinSxS folder or deleting the entire WinSxS folder might severely damage your system, so that your PC might not boot, and make it impossible to update.

 

A new option has been added to the DISM tool for Windows 8.1 to help determine how much disk space the WinSxS folder really uses.

**Analyze the size of the component store (WinSxS folder)**

-   Open an elevated command window and type:

    ``` syntax
    Dism.exe /Online /Cleanup-Image /AnalyzeComponentStore
    ```

    **Note**  
    The **/AnalyzeComponentStore** option isn’t recognized on Windows 8 and earlier.

     

   The information returned is:

    <table>
    <colgroup>
    <col width="50%" />
    <col width="50%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">Title</th>
    <th align="left">Description</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><p>Windows Explorer Reported Size of Component Store</p></td>
    <td align="left"><p>This value the size of the WinSxS folder if computed by Windows Explorer. This value doesn’t factor in the use of hard links within the WinSxS folder.</p></td>
    </tr>
    <tr class="even">
    <td align="left"><p>Actual Size of Component Store</p></td>
    <td align="left"><p>This value factors in hard links within the WinSxS folder. It doesn’t exclude files that are shared with Windows by using hard links.</p></td>
    </tr>
    <tr class="odd">
    <td align="left"><p>Shared with Windows</p></td>
    <td align="left"><p>This value provides the size of files that are hard linked so that they appear both in the component store and in other locations (for the normal operation of Windows). This is included in the actual size, but shouldn’t be considered part of the component store overhead.</p></td>
    </tr>
    <tr class="even">
    <td align="left"><p>Backups and Disabled Features</p></td>
    <td align="left"><p>This is the size of the components that are being kept to respond to failures in newer components or to provide the option of enabling more functionality. It also includes the size of component store metadata and side-by-side components.</p>
    <p>This is included in the actual size and is part of the component store overhead.</p></td>
    </tr>
    <tr class="odd">
    <td align="left"><p>Cache and Temporary Data</p></td>
    <td align="left"><p>This is the size of files that are used internally by the component store to make component servicing operations faster. This is included in the actual size and is part of the component store overhead.</p></td>
    </tr>
    <tr class="even">
    <td align="left"><p>Date of Last Cleanup</p></td>
    <td align="left"><p>This is the date of the most recently completed component store cleanup.</p></td>
    </tr>
    <tr class="odd">
    <td align="left"><p>Number of Reclaimable Packages</p></td>
    <td align="left"><p>This is the number of superseded packages on the system that component cleanup can remove.</p></td>
    </tr>
    <tr class="even">
    <td align="left"><p>Component Store Cleanup Recommended</p></td>
    <td align="left"><p>This is a component store cleanup recommendation. Cleanup is recommended when performing a cleanup process may reduce the size of the component store overhead.</p></td>
    </tr>
    </tbody>
    </table>

     

   Based on this analysis you can determine the overhead of the WinSxS folder by taking the sum of the backups and disabled features size with the cache and temporary data size.

Example output:

```
    C:\>dism /online /cleanup-image /analyzecomponentstore

    Deployment Image Servicing and Management tool
    Version: 6.3.XXXX.0

    Image Version: 6.3.XXXX.0

    [==========================100.0%==========================]

    Component Store (WinSxS) information:

    Windows Explorer Reported Size of Component Store : 4.98 GB

    Actual Size of Component Store : 4.88 GB

        Shared with Windows : 4.38 GB
        Backups and Disabled Features : 506.90 MB
        Cache and Temporary Data : 279.52 KB

    Date of Last Cleanup : 2013-06-10 23:32:22

    Number of Reclaimable Packages : 0
    Component Store Cleanup Recommended : No

    The operation completed successfully.
```
In this example, the WinSxS folder appears to be 4.98 GB, but the actual overhead (the sum of the size of backups and disabled features and the size of cache and temporary data) is 507.18 MB.

**Determine if you should clean up the component store (WinSxS folder) based on the analysis results**

1.  Open an elevated command window and type:

    ``` syntax
    Dism.exe /Online /Cleanup-Image /AnalyzeComponentStore
    ```

2.  If cleanup is recommended then follow steps in the related topic, [Clean Up the WinSxS Folder](clean-up-the-winsxs-folder.md).

## <span id="related_topics"></span>Related topics


[Manage the Component Store](manage-the-component-store.md)

[Clean Up the WinSxS Folder](clean-up-the-winsxs-folder.md)

[Where Did My Space Go? (blog post)](http://blogs.technet.com/b/askcore/archive/2013/03/01/where-did-my-space-go.aspx)

[Servicing changes in Windows 8.1/Server 2012 R2](http://blogs.technet.com/b/joscon/archive/2013/07/29/servicing-changes-in-windows-8-1-server-2012r2.aspx)

[NTFS Metafiles blog post](http://blogs.technet.com/b/askcore/archive/2009/12/30/ntfs-metafiles.aspx)

[How to create and manipulate NTFS junction points](http://support.microsoft.com/kb/205524)

[DISM Operating System Package Servicing Command-Line Options](dism-operating-system-package-servicing-command-line-options.md)

 

 






