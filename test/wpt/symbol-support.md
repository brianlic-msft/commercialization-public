---
title: Symbol Support
description: Symbol Support
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 3f4fcf1c-9d81-4842-82e5-a443f47f5255
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Symbol Support


When Windows Performance Analyzer (WPA) is correctly configured, WPA shows symbolic names from the symbol files for addresses that are found in the recording.

To decode symbols, the tools must locate the program database files, known as program database (PDB) files or symbol files, to build complete call stacks. The compiler and linker generate PDB files when the system builds a component. Microsoft provides the program database files for many Microsoft products in an online symbol server. The Microsoft Debugging Tools for Windows and WPA use the online symbol server to look up symbol information. Therefore, the computer must be connected to the Internet if the symbol files are not copied locally. The Windows Performance Toolkit uses the same symbol decoding infrastructure as the Windows debugger, **Windbg.exe**. For more information, see [WinDbg](http://go.microsoft.com/fwlink/p/?linkid=212249).

To configure symbol support, you must define the **\_NT\_SYMBOL\_PATH** environment variable. The following example sets the symbol path to use the Microsoft public symbol server together with a downstream store in C:\\symbols:

``` syntax
set _NT_SYMBOL_PATH= srv*C:\symbols*http://msdl.microsoft.com/downloads/symbols
```

Note that this example is a single command line.

The URL in this symbol path specifies the online Microsoft symbol server. The path between the asterisks (C:\\symbols) specifies the downstream store. This is a local cache in which the symbol resolution system keeps symbol files. WPA Tools also decode symbols from components that you develop. Add one or more paths to **\_NT\_SYMBOL\_PATH** that contain the PDB files for the components that you want to record. For example, the following example shows how the path was set up for the previous example:

``` syntax
set _NT_SYMBOL_PATH=c:\coding\fs\release;srv*C:\symbols*
```

When Xperf or WPA decodes symbols, Xperf or WPA caches a condensed version of the original symbol files, or PDBs, on disk in the **\\symcache** directory. To do this, Xperf or WPA uses the symbols that are available at the time. The operating system symbols that are available outside Microsoft are public symbols. These symbols contain less information than internal private symbols. In black-box testing, public symbols can also include incorrect information. Private symbols, which are more reliable, can be obtained under non-disclosure agreements. If a user has decoded a recording by using public symbols, and the user then obtains private symbols, the user must clear the **\\symcache** directory before Xperf or WPA can discover the new private symbols.

## Troubleshooting Symbol Decoding


Symbol decoding support is complex. The following requirements must be met:

-   You must specify `-symbols` on the Xperf command line or select **Load Symbols** on the **Trace** menu in WPA after you open a recording.

-   The environment variables must be configured correctly. For more information for Xperf, see [symbols](symbols.md).

-   The ETW kernel recording file must have been stopped and merged correctly. For more information, see [Stopping a Recording](stop-a-recording.md).

-   Windows Performance Recorder (WPR) or WPA merges the ETW user recording file together with a kernel recording file that is taken at the same time on the same computer.

-   You must have access to the binary and symbol sources that **\_NT\_SYMBOL\_PATH** specifies. If you use a symbol server, the symbol server is often just a redirector. In this case, you must have access to both the symbol server and the sites that the symbol server points to that host the binaries and symbols.

-   **\_NT\_SYMBOL\_PATH** must point to the correct files. If the files exist from a different build or architecture, the files will not work. If the version of the application binary files is not the same version as the symbols that **\_NT\_SYMBOL\_PATH** points to, you cannot view call stacks.

    To rule out a symbol mismatch, use **Symchk.exe** from the **Debugging Tools for Windows** distribution to ensure that the symbols match the symbol files on the computer on which the recording was taken. For example:

    ``` syntax
    symchk /v <local_file> /s <sympath_to_name.pdb>
    ```

    To rule out a binary mismatch, use the `fc /b` command to ensure that the binaries on the computer on which the recording was taken match the binaries on the drop share. For example:

    ``` syntax
    fc /b <local_file> <drop_share_file>
    ```

-   In Xperf, you must capture the ETW kernel recording by using at least the `PROC_THREAD+LOADER` flags. These flags provide basic information about process lifetime and image virtual address ranges in process memory. This information helps XPerf to decode virtual addresses to images and symbols.

    To verify that these flags have been enabled in the ETW kernel recording, check that Xperf **-process** events (**Create**, **Delete**, **Start Rundown**, **End Rundown**) and **Image** events (**Load**, **Unload**, **Start Rundown**, **End Rundown**) are present in the table that is generated by using the following command:

    ``` syntax
    xperf -i kernel.etl -a tracestats -detail
    ```

    **Note**  
    All of these events might not be listed in the table, depending on whether these events occurred.

     

### Limitation in Xperf Symbol Decoding

Xperf defaults to the system drive if a drive is not specified for an executable image (such as **\\Path\\Library.dll**). When you run the `-d/-merge` command, if Xperf cannot find an executable image that existed in a running process during the recording, Xperf cannot retrieve the corresponding image and symbol file identity information and add the information to the merged recording. Without that information, Xperf cannot perform symbol decoding for that image in that recording.

This issue does not affect other file paths, such as the paths in disk I/O or file I/O.

To enable symbol decoding and to help enable correct image load and unload paths in Xperf ETW recordings, you should store all executable images for which you might require symbol decoding or image load and unload paths on the system drive. Then, run the images from that drive. If that is not possible, create a mirror of the images on the system drive, even if you run the images from another drive. For example, if C: is your system drive, create an identical copy of **D:\\game\\bin\\binkw32.dll** at **C:\\game\\bin\\binkw32.dll**.

## Related topics


[Windows Performance Toolkit](index.md)

[symbols](symbols.md)

[Using CLR 4.0 NGEN PDB Support](using-clr-40-ngen-pdb-support.md)

[Common In-Depth Analysis Issues](../assessments/common-in-depth-analysis-issues.md)

 

 







