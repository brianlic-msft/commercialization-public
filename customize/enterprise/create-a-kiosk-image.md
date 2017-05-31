---
title: Create a Kiosk Experience
description: A single-use device is easy to set up in Windows 10 for desktop editions (Pro, Enterprise, and Education).
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 8F0E5E87-C53C-40CE-B695-6229FD7793C8
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Create a Kiosk Experience


A single-use device is easy to set up in Windows 10 for desktop editions (Pro, Enterprise, and Education). You can use assigned access or shell launcher to set up single-function devices, such as restaurant menus or displays at trade shows.

In addition to configuring assigned access or shell launcher, you can also configure optional features to further define the Kiosk experience. Some of the optional features include power button availability, welcome screen elements, and the ability to protect your internal physical media.

For a kiosk device to run a Universal Windows app, use the [Assigned access](assigned-access.md) feature. For a kiosk device (Windows 10 Enterprise or Education) to run a Classic Windows application, use [Shell Launcher](shell-launcher.md) to set a custom user interface as the shell.

**Note**  A Universal Windows app is built on the Universal Windows Platform (UWP), which was first introduced in Windows 8 as the Windows Runtime. A Classic Windows application uses the Classic Windows Platform (CWP) (e.g., COM, Win32, WPF, WinForms, etc.) and is typically launched using an .EXE or .DLL file.

 

## Assigned access for Universal Windows apps


If an account is configured for assigned access, a Windows app of your choosing runs above the lock screen for the selected user account. Users of that account cannot access any other functionality on the device.

Assigned access Windows Powershell reference

### Prerequisites

-   Windows 10 Enterpriseor Windows 10 Education, or Windows 10 Pro .
-   A domain or local user account
-   The user account must have logged on at least once before you set up assigned access, or no apps will be available for that account. To set up assigned access using MDM, you need the user account (domain\\account).
-   A Universal Windows app that is installed for that account and is an above lock screen app. For details on building an above lock screen app, [Kiosk apps for assigned access: Best practices](https://msdn.microsoft.com/en-us/windows/hardware/drivers/partnerapps/create-a-kiosk-app-for-assigned-access)

The app can be your own company app that you have made available in your own app Store. To set up assigned access using MDM or PowerShell, you also need the Application User Model ID (AUMID) for the app. [Find the Application User Model ID of an installed app](find-the-application-user-model-id-of-an-installed-app.md).

The Universal Windows app must be able to handle multiple views and cannot launch other apps or dialogs.

**Create user and app accounts for the Kiosk in PC settings**

1.  Log in as administrator.
2.  Go to **Start** &gt; **Settings** &gt; **Accounts** &gt; **Other users**.
3.  Choose **Set up assigned access**.
4.  Choose an app. Only apps that can run above the lock screen will be displayed.
5.  Close **Settings**--your choices are saved automatically, and will be applied the next time that user account logs on.

### <a href="" id="kiosk-icd"></a>

**Create user and app accounts for the Kiosk using Windows Imaging and Configuration Designer (ICD)**

1.  Open Windows Imaging and Configuration Designer (ICD) (by default, %windir%\\Program Files (x86)\\Windows Kits\\10\\Assessment and Deployment Kit\\Imaging and Configuration Designer\\x86\\ICD.exe).
2.  Choose **New provisioning package**.
3.  Name your project, and click **Next**.
4.  Choose **Common to all Windows desktop editions** and click **Next.**
5.  On **New project**, click **Finish**. The workspace for your package opens.
6.  Expand **Runtime settings** &gt; **AssignedAccess**, and click **AssignedAccessSettings**.
7.  Enter a string to specify the user account and app (by AUMID). For example:

    "Account":"contoso\\\\kiosk","AUMID":"8f82d991-f842-44c3-9a95-521b58fc2084"

8.  On the **File** menu, select **Save.**
9.  On the **Export** menu, select **Provisioning package**.
10. Change **Owner** to **IT Admin**, which will set the precedence of this provisioning package higher than provisioning packages applied to this device from other sources, and then select **Next.**
11. Optional. In the **Provisioning package security** window, you can choose to encrypt the package and enable package signing.
    -   **Enable package encryption** - If you select this option, an auto-generated password will be shown on the screen.
    -   **Enable package signing** - If you select this option, you must select a valid certificate to use for signing the package. You can specify the certificate by clicking **Select** and choosing the certificate you want to use to sign the package.

12. Click **Next** to specify the output location where you want the provisioning package to go when it's built. By default, Windows ICD uses the project folder as the output location.
13. Click **Next.**
14. Click **Build** to start building the package. The provisioning package doesn't take long to build. The project information is displayed in the build page and the progress bar indicates the build status.
15. If your build fails, an error message will show up that includes a link to the project folder. You can scan the logs to determine what caused the error. Once you fix the issue, try building the package again.

    If your build is successful, the name of the provisioning package, output directory, and project directory will be shown.

    -   If you choose, you can build the provisioning package again and pick a different path for the output package. To do this, click **Back** to change the output package name and path, and then click **Next** to start another build.
    -   If you are done, click **Finish** to close the wizard and go back to the **Customizations Page**.

**Apply the provisioning package**

1.  Select the provisioning package that you want to apply, double-click the file, and then allow admin privileges.
2.  Consent to allow the package to be installed.

After you allow the package to be installed, the settings will be applied to the device.

### Set up assigned access using Windows PowerShell

You can use any of the following PowerShell cmdlets to set up assigned access on multiple devices. To open PowerShell on Windows 10, search for PowerShell and find **Windows PowerShell Desktop app** in the results.

```
Set-AssignedAccess -AppUserModelId <AUMID> -UserName <username>
```

```
Set-AssignedAccess -AppUserModelId <AUMID> -UserSID <usersid>
```

```
Set-AssignedAccess -AppName <CustomApp> -UserName <username>
```

```
Set-AssignedAccess -AppName <CustomApp> -UserSID <usersid>
```

## <a href="" id="other-aa-settings"></a>Complementary settings for assigned access


### <a href="" id="auto-logon"></a>Automatic logon

When your kiosk device restarts, whether from an update or power outage, you can log on the assigned access account manually or you can configure the device to log on to the assigned access account automatically.

Edit the registry to have an account automatically logged on.

1.  Open Registry Editor (regedit.exe).

    **Note**  If you are not familiar with Registry Editor, [learn how to modify the Windows registry](http://go.microsoft.com/fwlink/p/?LinkId=615002).

     

2.  Go to

    **to HKEY\_LOCAL\_MACHINE\\SOFTWARE\\Microsoft\\WindowsNT\\CurrentVersion\\Winlogon**

3.  Set the values for the following keys.
    -   AutoAdminLogon: set value as **1**.
    -   DefaultUserName: set value as the account that you want logged in.
    -   DefaultPassword: set value as the password for the account.
        **Note**  If DefaultUserName and DefaultPassword aren't there, add them as New &gt; String Value.

         

    -   DefaultDomainName: set value for domain, only for domain accounts. For local accounts, do not add this key.

4.  Close Registry Editor. The next time the computer restarts, the account will be logged on automatically.

### <a href="" id="aa-signout"></a>Sign out of assigned access

To sign out of an assigned access account, press **Ctrl + Alt + Del**, and then sign in using another account. When you press **Ctrl + Alt + Del** to sign out of assigned access, the kiosk app will exit automatically. If you sign in again as the assigned access account or wait for the login screen timeout, the kiosk app will be re-launched.

If you press **Ctrl + Alt + Del** and do not sign in to another account, after a set time, assigned access will resume. The default time is 30 seconds, but you can change that in the following registry key:

**HKEY\_LOCAL\_MACHINE\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Authentication\\LogonUI**

To change the default time for assigned access to resume, add IdleTimeOut (DWORD) and enter the value data as milliseconds in hexadecimal.

## Shell Launcher for Classic Windows applications


Using Shell Launcher, you can configure a kiosk device that runs a Classic Windows application as the user interface. The application that you specify replaces the default shell (explorer.exe) that usually runs when a user logs on.

### Requirements

-   A domain or local user account
-   A Classic Windows application that is installed for that account. The app can be your own company application or a common app like Internet Explorer.

### Configure Shell Launcher

To set a Classic Windows application as the shell, you first turn on the [Shell Launcher](shell-launcher.md) feature, and then you can set your custom shell as the default using Windows PowerShell.

**To turn on Shell Launcher in Windows features**

1.  Go to **Control Panel** &gt; **Programs and Features** &gt; Turn **Windows features on or off**.
2.  Select **Embedded Shell Launcher** and **OK**.

Alternatively, you can turn on Shell Launcher using the Deployment Image Servicing and Management (DISM.exe) tool.

**To turn on Shell Launcher using DISM**

1.  Open a command prompt as an administrator.
2.  Enter the following command.

```
Dism /online /Enable-Feature /FeatureName:Client-EmbeddedShellLauncher
```

[Set your custom shell](shell-launcher.md#custom-shell)

## <a href="" id="lockdown-settings"></a>Other settings to lock down


For a more secure kiosk experience, we recommend that you make the following configuration changes to the device:

-   Put device in **Tablet mode**.

    If you want users to be able to use the touch (on screen) keyboard, go to **Settings** &gt; **System** &gt; **Tablet mode** and choose **On.**

-   Hide **Ease of access** feature on the logon screen.

    Go to **Control Panel** &gt; **Ease of Access** &gt; **Ease of Access Center**, and turn off all accessibility tools.

-   Disable the hardware power button.

    Go to **Power Options** &gt; **Choose what the power button does**, change the setting to **Do nothing**, and then **Save changes**.

-   Disable the camera.

    Go to **Settings** &gt; **Privacy** &gt; **Camera**, and turn off **Let apps use my camera**.

-   Turn off app notifications on the lock screen.

    Go to **Group Policy Editor** &gt; **Computer Configuration** &gt; **Administrative Templates\\System\\Logon\\Turn off app notifications on the lock screen**.

-   Disable removable media.

    Go to **Group Policy Editor** &gt; **Computer Configuration** &gt; **Administrative Templates\\System\\Device Installation\\Device Installation Restrictions\\Prevent installation of devices not described by other policy settings**.

**Note**  To prevent this policy from affecting a member of the Administrators group, in **Device Installation Restrictions**, enable **Allow administrators to override Device Installation Restriction policies**.

 

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20Create%20a%20Kiosk%20Experience%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")




