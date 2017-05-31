---
author: Justinha
Description: Add a Custom Script to Windows Setup
ms.assetid: a22c2f2f-c297-4027-9712-d747b08f7476
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Add a Custom Script to Windows Setup
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Add a Custom Script to Windows Setup


**Windows Setup scripts**: **Setupcomplete.cmd** and **ErrorHandler.cmd** are custom scripts that run during or after the Windows Setup process. They can be used to install applications or run other tasks by using **cscript/wscript** scripts.

-   **%WINDIR%\\Setup\\Scripts\\SetupComplete.cmd**: This script runs immediately after the user sees the desktop. This setting is disabled when using OEM product keys. It runs with local system permission.
-   **%WINDIR%\\Setup\\Scripts\\ErrorHandler.cmd**: This script runs automatically when Setup encounters a fatal error. It runs with local system permission.

**Windows Unattend scripts**: Create an Unattend.xml file with one of these settings to run during the Windows Setup process. This can be used with OEM product keys.

To run services or commands that can start at the same time, use RunAsynchronousCommands. To run commands that need to finish before other commands can start, use RunSynchronousCommands.

**Note**  As of Windows 10, [Microsoft-Window-Shell-Setup\\LogonCommands\\AsynchronousCommand](https://msdn.microsoft.com/library/windows/hardware/dn915476) now works like LogonCommands\\AsynchronousCommand: all commands using these unattend settings are now started at the same time, and no longer wait for the previous command to finish.

 

Some of these settings run in the user context, others run in the system context depending on the configuration pass.

-   Add [Microsoft-Windows-Setup\\RunAsynchronousCommand](https://msdn.microsoft.com/library/windows/hardware/dn915798) or [RunSynchronousCommand](https://msdn.microsoft.com/library/windows/hardware/dn915802) to run a script as Windows Setup starts. This can be helpful for setting hard disk partitions.
-   Add [Microsoft-Windows-Deployment\\RunAsynchronousCommand](https://msdn.microsoft.com/library/windows/hardware/dn915797) or [RunSynchronousCommand](https://msdn.microsoft.com/library/windows/hardware/dn915801) to the **auditUser** configuration pass to run a script that runs when the PC enters audit mode. This can be helpful for tasks like automated app installation or testing.
-   Add [Microsoft-Windows-Shell-Setup\\LogonCommands\\AsynchronousCommand](https://msdn.microsoft.com/library/windows/hardware/dn915476) or [FirstLogonCommands\\SynchronousCommand](https://msdn.microsoft.com/library/windows/hardware/dn922797) to run after the Out of Box Experience (OOBE) but before the user sees the desktop. This can be especially useful to set up language-specific apps or content after the user has already selected their language.

    Use these scripts sparingly because long scripts can prevent the user from reaching the Start screen quickly. For retail versions of Windows, additional restrictions apply to these scripts. For info, see the Licensing and Policy guidance on the [OEM Partner Center](http://go.microsoft.com/fwlink/?LinkId=131358).

    **Note**   When you add a script using FirstLogonCommands, it will be triggered on the next boot, even if you boot into audit mode using Ctrl+Shift+F3. To boot to audit mode without triggering these scripts, add the setting: Microsoft-Windows-Deployment\\Reseal\\[Mode](https://msdn.microsoft.com/library/windows/hardware/dn923110) = Audit.

     

## <span id="run_a_script_after_setup_is_complete__setupcomplete.cmd_"></span><span id="RUN_A_SCRIPT_AFTER_SETUP_IS_COMPLETE__SETUPCOMPLETE.CMD_"></span>Run a script after setup is complete (SetupComplete.cmd)


**Order of operations**

1.  After Windows is installed but before the logon screen appears, Windows Setup searches for the **SetupComplete.cmd** file in the **%WINDIR%\\Setup\\Scripts\\ directory**.
2.  If a **SetupComplete.cmd** file is found, Windows Setup runs the script. Windows Setup logs the action in the **C:\\Windows\\Panther\\UnattendGC\\Setupact.log** file.

    Setup does not verify any exit codes or error levels in the script after it executes **SetupComplete.cmd**.

    **Warning**  You cannot reboot the system and resume running **SetupComplete.cmd**. You should not reboot the system by adding a command such as **shutdown -r**. This will put the system in a bad state.

     

3.  If the computer joins a domain during installation, the Group Policy that is defined in the domain is not applied to the computer until **Setupcomplete.cmd** is finished. This is to make sure that the Group Policy configuration activity does not interfere with the script.

## <span id="run_a_script_if_windows_setup_encounters_a_fatal_error__errorhandler.cmd_"></span><span id="RUN_A_SCRIPT_IF_WINDOWS_SETUP_ENCOUNTERS_A_FATAL_ERROR__ERRORHANDLER.CMD_"></span>Run a script if Windows Setup encounters a fatal error (ErrorHandler.cmd)


This script is useful when you're installing many systems at the same time. This helps you detect when an error occurs during Windows Setup. When it does, Setup automatically runs a script that can contain custom commands or actions to address the cause of the error.

If Windows Setup encounters a fatal error and is prevented from completing the installation, Windows Setup searches for a command script in the following directory: **%WINDIR%\\Setup\\Scripts\\ErrorHandler.cmd**. One of two actions will occur, depending on whether the script is found.

-   If the script is not found, a dialog box is displayed with the error text. A user must dismiss the dialog box before Windows Setup exits.
-   If the script is found, the script executes synchronously. No dialog box or error text is displayed. After the **ErrorHandler.cmd** script has finished running, Windows Setup exits.

Depending on the phase of Windows Setup, the computer will return to the environment from which Windows Setup was executed, such as an earlier version of the operating system or Windows Preinstallation Environment (Windows PE), for example.

There may be instances when Windows Setup encounters more than one error and runs the ErrorHandler.cmd script more than once. When developing the code for **ErrorHandler.cmd**, make sure that you can run this script multiple times.


**To use ErrorHandler.cmd**, you can do either of the following:

-   Mount the image, and add it to the image, in **%WINDIR%\\Setup\\Scripts\\ErrorHandler.cmd**. Unmount the image.

    -or-

-   Add **ErrorHandler.cmd** to a temporary file location (for example, C:\\Temp\\ErrorHandler.cmd), and then run Windows Setup using the **/m** option.
    ``` syntax
    Setup /m:C:\Temp
    ```

    To learn more, see [Windows Setup Command-Line Options](windows-setup-command-line-options.md).

## <span id="related_topics"></span>Related topics


[Windows Setup Technical Reference](windows-setup-technical-reference.md)

[Boot from a DVD](boot-from-a-dvd.md)

[Use a Configuration Set with Windows Setup](use-a-configuration-set-with-windows-setup.md)

[Deploy a Custom Image](deploy-a-custom-image.md)

[Boot Windows to Audit Mode or OOBE](boot-windows-to-audit-mode-or-oobe.md)

[Add Device Drivers to Windows During Windows Setup](add-device-drivers-to-windows-during-windows-setup.md)

 

 






