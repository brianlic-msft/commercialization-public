---
author: kpacquer
Description: 'Update the time server on IoT Core devices'
MSHAttr: 'PreferredLib:/library'
title: 'Update the time server'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Update the time server

Synchronize the system time between IoT Core devices and a time server. Windows 10, version 1607 defaults to using the Windows Time Service at http://time.windows.com. You can change the time server or add multiple time servers for when your devices are on different network environments.

##Update the server from a command line (for example, using a tool like PuTTY):

1.	 Add the time server using a registry key
     ``` syntax
     reg add HKLM\SYSTEM\CurrentControlSet\Services\w32time\Parameters /v NtpServer /t REG_SZ /d "time.windows.com,0x9 tick.usno.navy.mil,0x9 europe.pool.ntp.org,0x9 asia.pool.ntp.org,0x9" /f >nul 2>&1
     ```

2.	Stop and restart the network services
    
	``` syntax
    net stop
    net start
	```

##Update the server in an IoT Core image

1.	Create a package definition file, and add it to the image. To learn more, see [Lab 1c: Add a file and a registry setting to an image](add-a-registry-setting-to-an-image.md). Sample script: 

	``` syntax
    <OSComponent> 
      <RegKeys> 
         <RegKey KeyName="$(hklm.software)\CurrentControlSet\Services\w32time\Parameters">
            <RegValue Name="NtpServer" Value="time.windows.com,0x9 tick.usno.navy.mil,0x9 europe.pool.ntp.org,0x9 asia.pool.ntp.org,0x9" Type="REG_SZ"/>
        </RegKey>
      </RegKeys>
    </OSComponent>
    ```