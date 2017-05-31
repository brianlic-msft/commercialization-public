---
title: Using CLR 4.0 NGEN PDB Support
description: Using CLR 4.0 NGEN PDB Support
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 0297661e-99bf-44fa-9d1c-f624d6a96f41
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Using CLR 4.0 NGEN PDB Support


Both Xperf and Windows Performance Recorder (WPR) can run with Common Language Runtime (CLR) 4.0 Native Image Generator (NGEN) PDB support enabled.

**Note**  WPR handles CLR symbols directly, so no flags are necessary when configuring and using NGEN support.

 

When you start a recording in the WPR user interface (UI), NGEN program database files (PDBs) are generated next to the saved recording. These PDBs decode symbols of modules that were created by using NGEN for managed scenarios. For **Recording.etl**, the NGEN PDBs are in the **Recording.etl.NGENPDB** folder.

## Using NGEN support with WPR


We recommend the following setup before running WPR with NGEN support enabled:

-   (Optional, but recommended) Set the SymCache path environment variable to a local directory

## Using NGEN support with Xperf


To use NGEN support with Xperf, do the following:

1.  At an elevated command prompt, type the following:

    ``` syntax
    set _NT_SYMBOL_PATH=srv*C:\Symbols.NGEN;srv*http://msdl.microsoft.com/download/symbols
    ```

2.  Type the following to start the kernel session:

    ``` syntax
    xperf -on Base -stackwalk Profile -f kernel.etl
    ```

3.  Type the following to start the CLR runtime session recording:

    ``` syntax
    xperf -start ClrSession -on ClrAll:0x98:5 -f clr.etl -buffersize 128 -minbuffers 256 -maxbuffers 512
    ```

4.  Run your scenario.

5.  Type the following to start the CLR rundown session:

    ``` syntax
    xperf -start ClrRundownSession -on ClrAll:0x118:5+a669021c-c450-4609-a035-5af59af4df18:0x118:5 -f clr_DCend.etl -buffersize 128 -minbuffers 256 -maxbuffers 512
    ```

6.  Type the following to allow time for CLR rundown to complete by setting the timeout to 15:

    ``` syntax
    timeout /t 15
    ```

7.  Type the following to stop the CLR runtime session, CLR rundown session, and kernel session, and to merge them into a single file:

    ``` syntax
    xperf -stop ClrSession ClrRundownSession -stop -d recording.etl
    ```

## Decoding a recording that has CLR 4.0 NGEN PDB support enabled


At an elevated command prompt, type the following:

``` syntax
set _NT_SYMBOL_PATH=srv*C:\Symbols.NGEN;srv*http://msdl.microsoft.com/download/symbols
```

## Transferring a recording that has CLR 4.0 NGEN PDB support enabled


To transfer a recording with CLR 4.0 NGEN PDB support enabled, include the following in the symbol path:

``` syntax
srv*C:\Symbols.NGEN
```

To transfer the recording to a different computer, make sure that both **Recording.etl** and the entire folder **C:\\Symbols.NGEN** (along with its subfolders) are transferred.

## Related topics


[Symbol Support](symbol-support.md)

[symbols](symbols.md)

 

 







