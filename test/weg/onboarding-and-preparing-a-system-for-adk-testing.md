---
title: Onboarding and preparing a system for ADK testing
description: How to prepare a system for ADK testing
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Onboarding and preparing a system for ADK testing

**To set up the device**

1.	Plug in to an AC power source the Device Under Test (DUT) and turn it on.

2.	Enter the firmware settings page (e.g., press F2 while booting).

3.	On the firmware settings page, do the following:

	-   Restore all default settings.

	-   Ensure that the DUT is configured to boot using UEFI without CSM.

4.	Install the OEM image to the DUT. If the OEM image is already installed, skip this step.

	Running Sysprep specializes on the factory floor and other processes should be part of the OEM deployment process.

5.	Complete the First Boot Experience.

	Use &lt;*system model*&gt;-&lt;*hardware stage* (EV, DV, or PV)	&gt;-&lt;*revision number*&gt; as the Computer Name (for example, Frabrikam-ModelXYZ-PV-REV1). Always use the same computer name when testing any given model.

6.	For testing, you can use a local admin account instead of a Microsoft account.

## Policies for setting up the device

-   Use wired or OEM-provided network adaptors instead of USB adapters.

	-   If you use local testing with WAC or prepackaged jobs, wired LAN doesn't apply.

	-   If you use WAS, we recommended that you deploy assessments through a wired LAN. If that isn't possible, use wireless.

	-   Don’t enable sharing when connecting to a network.

-   UEFI should be enabled on all DUTs.

-   All DUTs should have all signed/certified Windows 8 drivers before you run the assessments.

-   External devices should not be plugged in unless they are provided with the system.

	
## Testing the device

**To test the device**

1. Activate the system using the appropriate product key.

2. Some operating system components change their behaviors based on some WinSAT metrics. Verify that the WinSAT datastore is populated in the following path: ```%WINDIR%\performance\winsat\datastore\```

   Run **Winsat prepop** on an elevated command line or follow the [deployment guidance](https://technet.microsoft.com/en-us/library/jj573887.aspx).

3. Run Windows Update and install all driver and Windows updates (even optional ones).</p>

4. Disable Automatic Updates by selecting **Never check updates** in the Windows Update settings. You can automate this step by running the following command from an elevated command prompt:

   **reg &quot;HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update&quot; /v AUOptions /t REG_DWORD /d 1 /f**

5. Use Device Manager to verify that the DUT has no problems with drivers or devices.

   <img src="images/weg-device-manager-dysfunctional-device.png" width="311" height="74" alt="A dysfunctional device is identified in Device Manager."/>

   Investigate and fix all devices marked with a &quot;!&quot;.

6. Download the latest virus definition files and perform a scan using the default antimalware app.

7. Force execution of IdleTasks once a day (when system is under test) to ensure that no maintenance tasks interfere with ADK assessment execution. Run the following command from an elevated command prompt:

   **rundll32.exe advapi32.dll,ProcessIdleTasks**

8. Disable Windows Store updates, after applying all available updates.

   a. Open the Store settings and go to <strong>App updates</strong>.

   b. Set <strong>Automatically download updates for my apps</strong> to <strong>No</strong>.

   c. You can automate this step by running the following command from an elevated command prompt:

   **reg add &quot;HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsStore\WindowsUpdate&quot; /v AutoDownload /t REG_DWORD /d 2 /f**

9. Enable autologon.

   - Certain assessments reboot the PC and require the user to log on before continuing the assessment run. Because the assessments are often measuring the boot time, delays caused by the user logging on to the PC can cause unpredictable variance in the metrics.

   - A best practice is to enable automatic logon for the user account running the assessments. You can configure automatic logon in the registry under the following key: ```HKLM\Software\Microsoft\Windows NT\CurrentVersion\WinLogon```

   Configure the following five values:

   | Value name      | Value type    | Data              |
   |-----------------|---------------|-------------------|
   | DefaultUserName | REG_SZ        | <*TestUserName*>  | 
   | DefaultPassword | REG_SZ        | <*LOCALPASSWORD*> | 
   | AutoAdminLogon  | REG_SZ        | 1                 | 

10. If the system has access to a timer server, verify the clock has been synchronized with the server time. If the clock time changes during assessment execution, it might cause failures.

11. Run the following commands to disable Windows system restore to prevent System Restore point creation during the test, which will skew test results:

    **reg add &quot;HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore&quot; /v RPSessionInterval /t REG_DWORD /d 0 /f**

    **reg DELETE &quot;HKLM\Software\Microsoft\Windows NT\CurrentVersion\SPP\Clients&quot; /f**

12. Run the following command to disable scheduled hard drive defragmentation:

    **schtasks /change /tn &quot;Microsoft\Windows\Defrag\ScheduledDefrag&quot; /disable**

13. Verify all .NET compilation targets are up to date:

    ```C:\Windows\Microsoft.NET\Framework\v4.0.30319\ngen.exe executequeueditems```

    ```C:\Windows\Microsoft.NET\Framework64\v4.0.30319\ngen.exe executequeueditems```

14. Restart the DUT.



