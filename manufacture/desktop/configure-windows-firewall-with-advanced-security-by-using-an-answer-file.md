---
author: Justinha
Description: Configure Windows Firewall with Advanced Security by Using an Answer File
ms.assetid: 6243caf7-3b74-431e-b6f9-76b98106bf42
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Configure Windows Firewall with Advanced Security by Using an Answer File
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Configure Windows Firewall with Advanced Security by Using an Answer File


For unattended installations, you can configure Windows® Firewall with Advanced Security settings in an answer file by using the Networking-MPSSVC-Svc component. In addition to the answer file (Unattend.xml) settings for Windows Firewall with Advanced Security, you can create a **RunSynchronous** command that runs **Netsh advfirewall** commands during the [auditUser](audituser.md) or [oobeSystem](oobesystem.md) configuration pass.

## <span id="Adding__Modifying__or_Deleting_Rules_for_Windows_Firewall_with_Advanced_Security"></span><span id="adding__modifying__or_deleting_rules_for_windows_firewall_with_advanced_security"></span><span id="ADDING__MODIFYING__OR_DELETING_RULES_FOR_WINDOWS_FIREWALL_WITH_ADVANCED_SECURITY"></span>Adding, Modifying, or Deleting Rules for Windows Firewall with Advanced Security


Use **RunSynchronous** commands only to add, modify, or delete rules for Windows Firewall with Advanced Security. To modify rule groups, use the **FirewallGroups** setting in the **Networking-MPSSVC-Svc** component. For more information about Windows components and settings that you can add to an answer file, see the [Unattended Windows Setup Reference Guide](http://go.microsoft.com/fwlink/?LinkId=206281).

**To add a Netsh command to an answer file**

1.  On your technician computer, open Windows System Image Manager (Windows SIM). Click **Start**, type **Windows System Image Manager**, and then select **Windows System Image Manager**.

2.  Create a new answer file, or update an existing answer file. For more information, see [Create or Open an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915085) and [Best Practices for Authoring Answer Files](https://msdn.microsoft.com/library/windows/hardware/dn915073).

3.  On the **Insert** menu, click **RunSynchronous**.

4.  Select the configuration pass where you want to install the command. This can be the [auditUser](audituser.md) or [oobeSystem](oobesystem.md) configuration pass.

    **Note**  
    Don't use the **RunSynchronousNetsh advfirewall** command during the [specialize](specialize.md) configuration pass.

     

5.  The **Create Synchronous Command** dialog box appears.

6.  In the **Enter command line** box, type the command-line syntax, like **Netsh advfirewall firewall**. For more information, see the [Network Shell (Netsh) Technical Reference](http://go.microsoft.com/fwlink/?LinkId=234733).

7.  In the **Order** box, select the order of the commands that will run, and then click **OK**.

    The command is added to the answer file in the selected configuration pass, as follows:

    1.  Commands that are added to the **6 auditUser passes** configuration pass appear in the setting Microsoft-Windows-Deployment\\RunSynchronous.

    2.  Commands that are added to the **7 oobeSystem** configuration pass appear in the setting Microsoft-Windows-Shell-Setup\\FirstLogonCommands.

8.  In the **SynchronousCommand Properties** pane, in the **Settings** section next to **Description**, enter a description like **Enable Windows Messenger**.

9.  The command is added to the answer file under the configuration pass that you selected. This example illustrates how an incoming rule for Windows Messenger is configured:

    ``` syntax
          <RunSynchronous>
             <RunSynchronousCommand wcm:action="add">
                <Path>Netsh advfirewall firewall 
                      add rule name="allow messenger" dir=in 
                      program="c:\programfiles\messenger\msmsgs.exe"
                      action=allow
                </Path>
                <Description>Enable Windows Messenger</Description>
                <Order>1</Order>
             </RunSynchronousCommand>
          </RunSynchronous>
    ```

**Note**  
The **Netsh advfirewall** command requires administrator permissions to run. If the **RunSynchronous** command runs in a configuration pass that runs in user context, that user account must have administrator permissions.

 

## <span id="Using_the_Netsh_Advfirewall_Command-Line_Tool"></span><span id="using_the_netsh_advfirewall_command-line_tool"></span><span id="USING_THE_NETSH_ADVFIREWALL_COMMAND-LINE_TOOL"></span>Using the Netsh Advfirewall Command-Line Tool


The following example illustrates how to add a new outgoing firewall rule to block a port by using the **Netsh advfirewall** command-line tool.

**To add a new outgoing firewall rule**

-   At an elevated command prompt, enter syntax that adds a new outgoing firewall rule to block a port. For example:

    ``` syntax
    Netsh advfirewall firewall add rule name="allow80" protocol=TCP
    dir=out localport=80 action=block
    ```

    where the blocked port is TCP port 80.

You can convert **Netsh** commands to Windows PowerShell commands. For more information, see the [Netshell to Powershell Conversion Guide](http://go.microsoft.com/fwlink/?LinkId=234734).

## <span id="related_topics"></span>Related topics


[Windows Deployment Options](windows-deployment-options.md)

 

 






