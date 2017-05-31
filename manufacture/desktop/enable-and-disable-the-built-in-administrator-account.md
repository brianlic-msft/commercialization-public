---
author: Justinha
Description: 'Enable and Disable the Built-in Administrator Account'
ms.assetid: d6011433-badb-4707-a5b9-9325f33b6a95
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Enable and Disable the Built-in Administrator Account'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Enable and Disable the Built-in Administrator Account


When manufacturing PCs, you can use the built-in Administrator account to run programs and apps before a user account is created.

**Note**  
This topic is about manufacturing PCs. For help with the admin account on your own PC, try one of these pages:

-   [Log on as an administrator](http://go.microsoft.com/fwlink/?LinkId=506857)

-   [Delete an account called "Administrator"](http://go.microsoft.com/fwlink/?LinkId=506858)

-   [User Account Control](http://go.microsoft.com/fwlink/?LinkId=277139)

 

This account is used when you log into the system by using audit mode, or when you add scripts to the [auditUser](audituser.md) configuration pass.

## <span id="Enabling_the_Built-in_Administrator_Account"></span><span id="enabling_the_built-in_administrator_account"></span><span id="ENABLING_THE_BUILT-IN_ADMINISTRATOR_ACCOUNT"></span>Enabling the Built-in Administrator Account


**You can use any of the following methods to enable the built-in Administrator account:**

1.  [Use an answer file](#useananswerfile)

2.  [Log on by using audit mode](#logonusingauditmode)

3.  [Use the Local Users and Groups MMC (Server versions only)](#usemmcconsole)

### <span id="UseAnAnswerFile"></span><span id="useananswerfile"></span><span id="USEANANSWERFILE"></span>Use an answer file

You can enable the built-in Administrator account during unattended installations by setting the `AutoLogon` setting to **Administrator** in the Microsoft-Windows-Shell-Setup component. This will enable the built-in Administrator account, even if a password is not specified in the `AdministratorPassword` setting.

You can create an answer file by using Windows® System Image Manager (Windows SIM).

The following sample answer file shows how to enable the Administrator account, specify an Administrator password, and automatically log on to the system.

**Note**  
Both the Microsoft-Windows-Shell-Setup\\`Autologon` section and the Microsoft-Windows-Shell-Setup\\`UserAccounts`\\`AdministratorPassword` section are needed for automatic logon in audit mode to work. The **auditSystem** configuration pass must include both these settings.

 

The following XML output shows how to set the appropriate values:

``` syntax
   <component name="Microsoft-Windows-Shell-Setup" processorArchitecture="x86" publicKeyToken="31bf3856ad364e35" language="neutral" versionScope="nonSxS" xmlns:wcm="http://schemas.microsoft.com/WMIConfig/2002/State" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
      <AutoLogon>
         <Password>
            <Value>SecurePasswd123</Value> 
            <PlainText>true</PlainText> 
         </Password>
         <Username>Administrator</Username> 
         <Enabled>true</Enabled> 
         <LogonCount>5</LogonCount> 
      </AutoLogon>
      <UserAccounts>
         <AdministratorPassword>
            <Value>SecurePasswd123</Value> 
            <PlainText>true</PlainText> 
         </AdministratorPassword>
      </UserAccounts>
   </component>
```

To prevent having to enter a password for the built-in Administrator account after you complete the out-of-box experience, set Microsoft-Windows-Shell-Setup\\`UserAccounts`\\`AdministratorPassword` in the **oobeSystem** configuration pass.

The following XML output shows how to set the appropriate values:

``` syntax
            <UserAccounts>
                <AdministratorPassword>
                    <Value>SecurePasswd123</Value>
                    <PlainText>true</PlainText>
                </AdministratorPassword>
            </UserAccounts>
```

For Windows Server® 2012, the built-in Administrator password must be changed at first logon. This prevents the built-in Administrator account from having a blank password by default.

### <span id="LogOnUsingAuditMode"></span><span id="logonusingauditmode"></span><span id="LOGONUSINGAUDITMODE"></span>Log on by using audit mode

If the computer has not yet gone through Out-Of-Box Experience (OOBE), you can enter the built-in Administrator account by re-entering audit mode. For more information, see [Boot Windows to Audit Mode or OOBE](boot-windows-to-audit-mode-or-oobe.md).

### <span id="UseMMCConsole"></span><span id="usemmcconsole"></span><span id="USEMMCCONSOLE"></span>Use the Local Users and Groups MMC (server versions only)

Change the properties of the Administrator account by using the Local Users and Groups Microsoft Management Console (MMC).

1.  Open MMC, and then select **Local Users and Groups**.

2.  Right-click the **Administrator** account, and then select **Properties**.

    The **Administrator Properties** window appears.

3.  On the **General** tab, clear the **Account is Disabled** check box.

4.  Close MMC.

Administrator access is now enabled.

## <span id="Disabling_the_Built-in_Administrator_Account"></span><span id="disabling_the_built-in_administrator_account"></span><span id="DISABLING_THE_BUILT-IN_ADMINISTRATOR_ACCOUNT"></span>Disabling the Built-in Administrator Account


For new installations, after the end user creates a user account in OOBE, the built-in Administrator account is disabled.

For upgrade installations, the built-in Administrator account remains enabled when there is no other active local administrator on the computer, and when the computer is not joined to a domain.

**Use either of the following methods to disable the built-in administrator account:**

1.  **Run the sysprep /generalize command**

    When you run the **sysprep /generalize** command, the next time that the computer starts, the built-in Administrator account will be disabled.

2.  **Use the net user command**

    Run the following command to disable the Administrator account:

    ``` syntax
    net user administrator /active:no
    ```

    You can run this command after you configure the computer and before you deliver the computer to a customer.

Original equipment manufacturers (OEMs) and system builders are required to disable the built-in administrator account before delivering the computers to customers. To do this, you can use either of the following methods.

## <span id="Configuring_the_Built-in_Administrator_Password"></span><span id="configuring_the_built-in_administrator_password"></span><span id="CONFIGURING_THE_BUILT-IN_ADMINISTRATOR_PASSWORD"></span>Configuring the Built-in Administrator Password


**Instructions**

-   When you run the **sysprep /generalize** command on Windows Server 2012 and Windows Server 2008 R2, the Sysprep tool resets the built-in Administrator account password. The Sysprep tool only clears the built-in Administrator account’s password for server editions, not for client editions. The next time that the computer starts, Setup displays a prompt for a password.

    **Note**  
    In Windows Server 2012, Windows Server 2008 R2, and Windows Server 2008, the default password policy requires a strong password for all user accounts. To configure a weak password, you can use an answer file that includes the Microsoft-Windows-Shell-Setup\\`UserAccounts`\\`AdministratorPassword` setting. You cannot configure a weak password, either manually or by using a script such as the **net user** command.

     

## <span id="related_topics"></span>Related topics


[Windows Deployment Options](windows-deployment-options.md)

[Audit Mode Overview](audit-mode-overview.md)

 

 






