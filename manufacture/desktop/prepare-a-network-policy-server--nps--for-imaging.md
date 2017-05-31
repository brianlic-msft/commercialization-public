---
author: Justinha
Description: 'Prepare a Network Policy Server (NPS) for Imaging'
ms.assetid: 7ac7f98a-f3db-4c54-a56a-fe766beb4344
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Prepare a Network Policy Server (NPS) for Imaging'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Prepare a Network Policy Server (NPS) for Imaging


If you intend to create an image of an installation for deployment to a different computer, and the Network Policy Server (NPS) service is installed on the source server, you may have to first remove confidential information that's stored on the server. Use these procedures to remove the relevant settings and data from the NPS configuration.

**To delete RADIUS clients from the NPS configuration**

1.  Display the list of Remote Authentication Dial-In User Service (RADIUS) clients on the NPS server. To do that, open an elevated command prompt, type this command, and then press Enter:

    ``` syntax
    Netsh nps show client
    ```

2.  Delete each RADIUS client in the list. To do that, at the elevated command prompt, type this command and then press Enter:

    ``` syntax
    Netsh nps delete client [name]
    ```

    For example, this command deletes a RADIUS client named *&lt;WirelessAP1&gt;* from the NPS server configuration:

    ``` syntax
    Netsh nps delete client name = <WirelessAP1>
    ```

    You can delete multiple RADIUS clients by inserting a comma between each client. For example:

    ``` syntax
    Netsh nps delete client name = <WirelessAP1>,<WirelessAP2>,<WirelessAP3>
    ```

    You can also remove a RADIUS client by using the following command.

    ``` syntax
    Remove-NpsRadiusClient [-Name] <Radius Client Name>-
    ```

3.  Repeat this procedure for each RADIUS client that's configured on the NPS server.

**To delete a remote RADIUS server group from the NPS server configuration**

1.  Display the list of remote RADIUS server groups that are configured on the NPS server. To do that, open an elevated command prompt, type the following command, and then press Enter:

    ``` syntax
    Netsh nps show remoteservergroup
    ```

2.  Delete each remote server group in the list. To do that, at the elevated command prompt, type this command and then press Enter:

    ``` syntax
    Netsh nps delete remoteservergroup [name =] name
    ```

    For example, this command deletes a remote RADIUS server group named *&lt;RemoteServers1&gt;* from the NPS server configuration:

    ``` syntax
    Netsh nps delete remoteservergroup name = <RemoteServers1>
    ```

    **Note**  
    When you delete a remote RADIUS server group, all RADIUS servers that are contained in the group are deleted.

     

3.  Repeat this procedure for each remote RADIUS server group that's configured on the NPS server.

You can convert **Netsh** commands to Windows PowerShell® commands. For more information, see the [Netshell to Powershell Conversion Guide](http://go.microsoft.com/fwlink/?LinkId=234734).

## <span id="related_topics"></span>Related topics


[Configure Windows Server Roles](configure-windows-server-roles.md)

[Sysprep (Generalize) a Windows installation](sysprep--generalize--a-windows-installation.md)

[Windows Server Deployment Options](windows-server-deployment-options.md)

 

 






