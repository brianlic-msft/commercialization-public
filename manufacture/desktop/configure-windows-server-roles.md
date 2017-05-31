---
author: Justinha
Description: Configure Windows Server Roles
ms.assetid: c7ad0ffa-30a5-4fb3-9e69-b70fed86b694
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Configure Windows Server Roles
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Configure Windows Server Roles


To configure one or more Server Roles during an unattended installation, you can use the PowerShell or Server Manager command-line tool. For more information about Server Roles, see this [Microsoft Web site](http://go.microsoft.com/fwlink/?LinkId=140100).

You can create `FirstLogonCommands` in your answer file that specifies the proper parameters for the server role you want to configure. The `FirstLogonCommands` setting is configured in the [oobeSystem](oobesystem.md) configuration pass. The `FirstLogonCommands` setting is run immediately after a user logs onto the computer and before the desktop is displayed.

**Note**  
You must run PowerShell and Server Manager commands from an account with administrator privileges.

 

For more information about adding the `FirstLogonCommands` setting, see [Add a Custom Command to an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915058).

The following example shows the PowerShell.exe syntax for installing the ServerManager module and the DHCP, FAX, DNS, and File-Services roles.

``` syntax
<FirstLogonCommands>
   <SynchronousCommand wcm:action="add">
      <Order>1</Order>
      <CommandLine> Powershell.exe –command Import-Module ServerManager; Install-WindowsFeature DHCP,FAX,DNS,File-Services</CommandLine>
      <Description>Configure Server Role</Description>
   </SynchronousCommand>
</FirstLogonCommands>
```

**Note**  
Not all server roles support Sysprep. You must configure some server roles after imaging and deployment. For more information, see [Sysprep Support for Server Roles](sysprep-support-for-server-roles.md).

 

## <span id="related_topics"></span>Related topics


[Windows Deployment Options](windows-deployment-options.md)

 

 






