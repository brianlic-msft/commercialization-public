---
author: kpacquer
Description: 'Deploy and test a user-mode test application in MMOS'
ms.assetid: f8a7c14f-66b6-4023-86cb-c10bc3f52734
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Deploy and test a user-mode test application in MMOS'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Deploy and test a user-mode test application in MMOS


To copy files to an MMOS image and run programs, you can use FTP and Telnet over a Virtual Ethernet connection.

**Important**  
The USB drivers and protocols described here must not be used in manufacturing or retail servicing. They are provided as a convenience for engineering bring-up.

 

## <span id="Preparing_the_device"></span><span id="preparing_the_device"></span><span id="PREPARING_THE_DEVICE"></span>Preparing the device


Engineering builds of the OS typically include Ping, FTP, and Telnet servers. To confirm that these are active in the OS, examine the startup configuration or establish a debug connection to MMOS to view the files that are loaded.

To configure a device to support TCP/IP over USB, you must install the necessary tools and use the BCDEdit tool to modify the device’s boot options that are stored in the BCD file.

## <span id="Running_Virtual_Ethernet_and_determining_the_IP_address_of_the_device"></span><span id="running_virtual_ethernet_and_determining_the_ip_address_of_the_device"></span><span id="RUNNING_VIRTUAL_ETHERNET_AND_DETERMINING_THE_IP_ADDRESS_OF_THE_DEVICE"></span>Running Virtual Ethernet and determining the IP address of the device


Virtual Ethernet creates a connection between the device's USB connection and the TCP/IP transport on the PC. connecting the device or powering it on, start Virtual Ethernet on the PC. VirtEth.exe is located in the “%ProgramFiles(x86)%\\Microsoft Windows Phone 8 KDBG Connectivity\\bin” folder.

A Virtual Ethernet console window will open. Leave this window open to maintain the connection to the phone; closing the window closes the connection.

1.  With Virtual Ethernet running, connect and power on the phone. When the device is connected, you will see lines of output that include the MAC address of the device. Virtual Ethernet reports the device’s MAC address in output similar to the following:

    ``` syntax
    NIC UP: 00-11-38-EA-88-7E : SUCCESS
    ```

    Note the 12-digit device MAC address from the VirtEth console window and use it in the next step to determine the device's TCP/IP address.

2.  Open a new command-prompt window and type **arp -a**. Output similar to the following will be displayed.

    ``` syntax
    C:\>arp -a

    Interface: 10.178.1.40 --- 0xb
      Internet Address      Physical Address      Type
      10.178.0.1            cc-ef-48-a7-6f-3f     dynamic
      10.178.1.94           00-11-38-ea-88-7e     dynamic
      10.178.3.255          ff-ff-ff-ff-ff-ff     static
      ... 
    ```

Use the IP address that is associated with the device MAC address to connect to the device via FTP and Telnet.

## <span id="Establishing_an_FTP_connection"></span><span id="establishing_an_ftp_connection"></span><span id="ESTABLISHING_AN_FTP_CONNECTION"></span>Establishing an FTP connection


To browse and copy files via FTP:

-   Open Windows Explorer and type: **FTP:\\\\***W.X.Y.Z* in the address bar, replacing *W.X.Y.Z* with the IP address of the device.

You should see the files on the device listed. Use Windows Explorer to copy files to or from the device, such as executable test programs or logs of test results.

To close the FTP connection, unmount the phone file system by selecting **Safely Remove Hardware** in the Windows notification area.

## <span id="Establishing_a_Telnet_session"></span><span id="establishing_a_telnet_session"></span><span id="ESTABLISHING_A_TELNET_SESSION"></span>Establishing a Telnet session


Make sure Telnet is enabled on the PC. To enable Telnet in the Windows operating system, select **Control Panel** &gt; **Programs and Features** &gt; **Turn Windows features on or off**. In the Windows Features list, select **Telnet Client**, and then click **OK**.

To establish a Telnet session with the device:

-   Open a command-prompt window and type: **telnet** *W.X.Y.Z*, replacing *W.X.Y.Z* with the IP address of the device

The command prompt window that appears is cmd.exe running on the device. From that command prompt, you can run commands on the device, such as executing test applications that you included in the MMOS image.

## <span id="Troubleshooting__Confirming_TCP_IP_connectivity"></span><span id="troubleshooting__confirming_tcp_ip_connectivity"></span><span id="TROUBLESHOOTING__CONFIRMING_TCP_IP_CONNECTIVITY"></span>Troubleshooting: Confirming TCP/IP connectivity


You can use **ping** to test the TCP/IP connection with the device:

-   Open a command-prompt window and type: **ping***W.X.Y.Z*, replacing *W.X.Y.Z* with the IP address of the device

The command should indicate that the packets were returned. If this does not work, one common issue to investigate is the firewall configuration on the PC.

## <span id="Debugging_in_MMOS"></span><span id="debugging_in_mmos"></span><span id="DEBUGGING_IN_MMOS"></span>Debugging in MMOS


To enable debugger support in MMOS, both communication and OS settings must be modified.

### <span id="Enabling_debug_support"></span><span id="enabling_debug_support"></span><span id="ENABLING_DEBUG_SUPPORT"></span>Enabling debug support

To enable debugging support in MMOS, specify the following internal optional feature in the MfgOEMInput.xml file.

``` syntax
<Microsoft>
  ...
  <Feature>KDNETUSB_ON</Feature>
   ...
</Microsoft>
```

This adds the required packages to the MMOS image. For more info about working with the MfgOEMInput.xml file, see [MMOS image definition](mmos-image-definition.md).

### <span id="Enabling_communication_settings"></span><span id="enabling_communication_settings"></span><span id="ENABLING_COMMUNICATION_SETTINGS"></span>Enabling communication settings

To enable the OS, communication settings must be changed after the image is flashed.

### <span id="Establishing_the_debug_connection"></span><span id="establishing_the_debug_connection"></span><span id="ESTABLISHING_THE_DEBUG_CONNECTION"></span>Establishing the debug connection

To connect to MMOS for debugging, use WinDbg to specify the key and port that you configured earlier by using BCDEdit.

``` syntax
windbg.exe -k net:Port=50000,Key=1.2.3.4
```

 

 





