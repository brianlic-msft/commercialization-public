---
author: Justinha
Description: 'WinPE: Debug Apps'
ms.assetid: 30fe59bc-f169-4534-b5a5-dbe58a10cb83
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'WinPE: Debug Apps'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WinPE: Debug Apps


You can use Windows Debuggers, such as Ntsd.exe, Cdb.exe, and Windbg.exe, and supporting tools to debug applications on Windows PE and to debug the Windows PE kernel. Debugging tools are included in the [Windows 10 SDK]( http://go.microsoft.com/fwlink/?LinkId=526807). You must make the debugging tools available on the Windows PE computer by either copying them locally or using them from a share.

To debug Windows PE remotely, you may need to turn off the built-in firewall on the PC:

``` syntax
wpeutil disablefirewall
```

## <span id="User-mode_debugging"></span><span id="user-mode_debugging"></span><span id="USER-MODE_DEBUGGING"></span>User-mode debugging


The easiest user-mode debugging method is to run a process server on the Windows PE computer, and connect to it by using a debugger on another computer. The process server is included with the debugging tools in the [Windows 10 SDK]( http://go.microsoft.com/fwlink/?LinkId=526807).

**To run a process server in user-mode**

1.  Copy the Windows Debugging Process Server tool: **dbgsrv.exe**, from the [Windows 10 SDK]( http://go.microsoft.com/fwlink/?LinkId=526807) debugging tools folder (example: C:\\Program Files (x86)\\Windows Kits\\10.0\\Debuggers\\x64), to the Windows PE computer.

2.  At the Windows PE command prompt, disable the firewall.

    ``` syntax
    wpeutil disablefirewall
    ```

3.  Start the Windows Debugging Process Server, specifying a connection method to the PC, for example, a TCP port:

    ``` syntax
    dbgsrv.exe -t tcp:port=1234
    ```

    For more information, see [Activating a Process Server (Windows Debuggers)]( http://go.microsoft.com/fwlink/p/?LinkId=698645).

4.  From the remote computer, use the process server to attach to or start processes on the Windows PE destination computer:

    ``` syntax
    windbg -premote tcp:server=Server, port=1234
    ```

    For more information, see [Activating a Smart Client (Windows Debuggers)](http://go.microsoft.com/fwlink/p/?LinkId=698646).

It is also possible to run the debugger directly on the Windows PE computer. However, doing so requires setting up symbol and source paths after every reboot of the Windows PE computer. We recommend that you perform debugging from a computer running a full version of Windows, as described in this procedure.

The following debugging procedure is useful when you want to bypass startnet.cmd or setup.exe, and proceed directly to a command prompt for debugging purposes. This procedure bypasses all initialization, including setup, and runs no commands, such as Wpeinit.exe. This procedure must be performed online on an online operating system.

**To enable user-mode debugging prior to any initialization**

1.  Delete the winpeshl.ini file, if it exists. If the winpeshl.ini file does not exist, then user-mode debugging can be accessed by default.

2.  Hold down the Ctrl key during boot before the command prompt is shown. A command prompt appears.

3.  Proceed with debugging.

## <span id="Kernel-mode_debugging"></span><span id="kernel-mode_debugging"></span><span id="KERNEL-MODE_DEBUGGING"></span>Kernel-mode debugging


To debug in kernel-mode, you must enable kernel-mode debugging before the system is booted. The boot configuration file has a setting for kernel mode debugging, which is enabled by using the bcdedit.exe command-line tool to modify the Boot Configuration Data (BCD) store. Kernel debugging can only be performed by using bcdedit.exe. Bcdedit.exe is located in the \\Windows\\System32 directory of the Windows partition.

The default debugger settings are as follows:

``` syntax
identifier              {dbgsettings} 
debugtype               Serial 
debugport               1 
baudrate                115200
```

For creating ISOs for VM environments, enable the kernel with BCD entries before creating the ISO.

For information about how to modify the default BCD store (default.bcd), see [How to Modify the BCD Store Using Bcdedit](http://go.microsoft.com/fwlink/p/?LinkId=698647).

**To enable kernel-mode debugging**

1.  Locate the BCD store, which is contained in a file named **bcd**. This file is located within the boot directory in the root of the media containing the Windows PE image.

2.  At the command prompt, type the following bcdedit command to set the debug flag of the BCD store used to boot the image to `debug on`:

    ``` syntax
    bcdedit /store <path to winpe>/boot/bcd /set {default} debug on
    ```

    The `{default}` might need to be replaced by the unique identifier (UID) of the boot option for Windows PE.

    Alternatively, you can also enable kernel debugging by pressing F8 during boot and selecting the debug option.

    **Note**  
    To use a symbol server from within Windows PE, use the `net use` command on the server’s symbols and file shares.

     

For more information about command-line options that control debugging, see [BCDEdit Command-Line Options](http://go.microsoft.com/fwlink/p/?LinkId=526808).

## <span id="related_topics"></span>Related topics


[WinPE for Windows 10](winpe-intro.md)

[WinPE: Mount and Customize](winpe-mount-and-customize.md)

[Wpeutil Command-Line Options](wpeutil-command-line-options.md)

[Winpeshl.ini Reference: Launching an app when WinPE starts](winpeshlini-reference-launching-an-app-when-winpe-starts.md)

[BCDEdit Command-Line Options](http://go.microsoft.com/fwlink/p/?LinkId=526808)

 

 






