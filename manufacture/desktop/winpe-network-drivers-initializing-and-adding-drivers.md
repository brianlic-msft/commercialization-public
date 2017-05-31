---
author: Justinha
Description: 'WinPE Network Drivers: Initializing and adding drivers'
ms.assetid: 36eba03c-ba15-4b34-b1cb-fd83cad08d63
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'WinPE Network Drivers: Initializing and adding drivers'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# WinPE Network Drivers: Initializing and adding drivers


The Wpeutil command initializes the Windows PE (WinPE) network drivers as soon as WinPE boots. The default WinPE image includes support for many popular network adapters, and supports many of the same networking commands as in Windows.Windows PE includes a basic set of network drivers for many popular network adapters, and supports many of the same networking commands as in Windows.

The supported methods of connecting to file servers are TCP/IP and NetBIOS over TCP/IP. Windows PE doesn't support other methods, like the Internetwork Packet Exchange/Sequenced Packet Exchange (IPX/SPX) network protocol.

Windows PE supports Distributed File System (DFS) name resolution for stand-alone namespaces only. It doesn't support domain namespaces. Stand-alone DFS namespaces allow for a DFS namespace that exists only on the local PC and therefore doesn't use Active Directory® Domain Services (AD DS).

Connecting to an IPv4 network from Windows PE on an IPv6 network is not supported.

**To connect to another PC or shared folder on a network**

1.  While in Windows PE, you can connect (or map) to a shared network folder by using the [net use](http://technet.microsoft.com/library/bb490717.aspx) command. If you’re connecting to a domain-joined PC, Windows PE prompts for a username and password.

    ``` syntax
    net use n: \\server\share
    ```

2.  You can also host Windows PE from a network by using Preboot Execution Environment (PXE), which is part of [Windows Deployment Services](http://technet.microsoft.com/library/hh831764).

**Troubleshooting networking problems**

1.  Try adding a driver for your network device.

    We recommend [WinPE: Mount and Customize](winpe-mount-and-customize.md), especially for any driver that requires a reboot during the installation process.

    You may also be able to use the [Drvload Command-Line Options](drvload-command-line-options.md) to load some drivers while Windows PE is running. However, any updates made to the registry during the installation process will not persist after a reboot, even when Windows PE is running in a [WinPE: Install on a Hard Drive (Flat Boot or Non-RAM)](winpe-install-on-a-hard-drive--flat-boot-or-non-ram.md).

2.  Run [Wpeinit and Startnet.cmd: Using WinPE Startup Scripts](wpeinit-and-startnetcmd-using-winpe-startup-scripts.md) to initialize the network. By default, wpeinit runs when Windows PE starts.

3.  In some cases, you may need to configure firewall settings on the PC that you are trying to connect to. Windows PE supports [IPSec configuration](http://go.microsoft.com/fwlink/p/?linkid=81713).

4.  Note, you cannot join Windows PE to a domain, or run Windows PE as a server. For more information, see [WinPE for Windows 10](winpe-intro.md).

**To connect to a wired network using 802.1x authentication protocols**

1.  Create a custom Windows PE image that includes the **WinPE-Dot3Svc** optional component.

2.  Boot a PC to Windows PE.

3.  Start the dot3svc service.

    ``` syntax
    net start dot3svc
    ```

4.  Add a LAN profile. For example:

    ``` syntax
    netsh lan add profile="G:\EthernetLANProfile.xml"
    ```

    Sample LAN Profile:

    ``` syntax
    <?xml version="1.0"?>
    <!-- Sample LAN profile: EthernetLANProfile.xml" -->
    <LANProfile xmlns="http://www.microsoft.com/networking/LAN/profile/v1">
      <MSM>
        <security>
          <OneXEnforced>false</OneXEnforced>
          <OneXEnabled>true</OneXEnabled>
          <OneX xmlns="http://www.microsoft.com/networking/OneX/v1">
            <cacheUserData>true</cacheUserData>
            <authMode>user</authMode>
            <EAPConfig><EapHostConfig 
              xmlns="http://www.microsoft.com/provisioning/EapHostConfig"><EapMethod><Type 
              xmlns="http://www.microsoft.com/provisioning/EapCommon">25</Type><VendorId 
              xmlns="http://www.microsoft.com/provisioning/EapCommon">0</VendorId><VendorType 
              xmlns="http://www.microsoft.com/provisioning/EapCommon">0</VendorType><AuthorId 
              xmlns="http://www.microsoft.com/provisioning/EapCommon">0</AuthorId></EapMethod><Config 
              xmlns="http://www.microsoft.com/provisioning/EapHostConfig"><Eap 
              xmlns="http://www.microsoft.com/provisioning/BaseEapConnectionPropertiesV1">
            <Type>25</Type><EapType 
              xmlns="http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV1">
            <ServerValidation>
              <DisableUserPromptForServerValidation>false</DisableUserPromptForServerValidation>
              <ServerNames></ServerNames>
              <TrustedRootCA>1a 2b 3c 4d 56 78 90 aa bb cc dd ee ff 1a 2b 3c 4d 5e 6f</TrustedRootCA>
              </ServerValidation><FastReconnect>true</FastReconnect>
              <InnerEapOptional>false</InnerEapOptional><Eap 
                xmlns="http://www.microsoft.com/provisioning/BaseEapConnectionPropertiesV1">
              <Type>26</Type><EapType 
                xmlns="http://www.microsoft.com/provisioning/MsChapV2ConnectionPropertiesV1">
              <UseWinLogonCredentials>false</UseWinLogonCredentials></EapType></Eap>
              <EnableQuarantineChecks>false</EnableQuarantineChecks>
              <RequireCryptoBinding>false</RequireCryptoBinding><PeapExtensions>
              <PerformServerValidation 
                xmlns="http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV2">false
              </PerformServerValidation><AcceptServerName 
                xmlns="http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV2">false
                </AcceptServerName><PeapExtensionsV2 
                xmlns="http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV2">
              <AllowPromptingWhenServerCANotFound 
                xmlns="http://www.microsoft.com/provisioning/MsPeapConnectionPropertiesV3">true
              </AllowPromptingWhenServerCANotFound></PeapExtensionsV2></PeapExtensions></EapType>
            </Eap></Config></EapHostConfig></EAPConfig>
          </OneX>
        </security>
      </MSM>
    </LANProfile>
    ```

5.  Link the EAP User Data with the profile. For example:

    ``` syntax
    netsh lan set eapuserdata filename="g:\EAP_UserData.xml" alluser=yes Interface="ethernet"
    ```

    Sample EAP User Data file:

    ``` syntax
    <?xml version="1.0"?>
    <!-- Sample EAP user data: EAP_UserData.xml" -->
    <EapHostUserCredentials 
      xmlns="http://www.microsoft.com/provisioning/EapHostUserCredentials" 
      xmlns:eapCommon="http://www.microsoft.com/provisioning/EapCommon" 
      xmlns:baseEap="http://www.microsoft.com/provisioning/BaseEapMethodUserCredentials">
      <EapMethod>
        <eapCommon:Type>25</eapCommon:Type>
        <eapCommon:AuthorId>0</eapCommon:AuthorId>
      </EapMethod>
      <Credentials
        xmlns:eapUser="http://www.microsoft.com/provisioning/EapUserPropertiesV1" 
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" 
        xmlns:baseEap="http://www.microsoft.com/provisioning/BaseEapUserPropertiesV1" 
        xmlns:MsPeap="http://www.microsoft.com/provisioning/MsPeapUserPropertiesV1" 
        xmlns:MsChapV2="http://www.microsoft.com/provisioning/MsChapV2UserPropertiesV1">
        <baseEap:Eap>
          <baseEap:Type>25</baseEap:Type>
          <MsPeap:EapType>
            <MsPeap:RoutingIdentity>onex\administrator</MsPeap:RoutingIdentity>
            <baseEap:Eap>
              <baseEap:Type>26</baseEap:Type>
              <MsChapV2:EapType>
                <MsChapV2:Username>actualuser</MsChapV2:Username>
                <MsChapV2:Password>actualpassword</MsChapV2:Password>
                <MsChapV2:LogonDomain>actualdomain</MsChapV2:LogonDomain>
              </MsChapV2:EapType>
            </baseEap:Eap>
          </MsPeap:EapType>
        </baseEap:Eap>
      </Credentials>
    </EapHostUserCredentials>
    ```

6.  For more info, see [How to enable computer-only authentication for an 802.1X-based network in Windows Vista, in Windows Server 2008, and in Windows XP Service Pack 3](http://support.microsoft.com/kb/929847).

## <span id="related_topics"></span>Related topics


[WinPE for Windows 10](winpe-intro.md)

[WinPE: Mount and Customize](winpe-mount-and-customize.md)

[Wpeinit and Startnet.cmd: Using WinPE Startup Scripts](wpeinit-and-startnetcmd-using-winpe-startup-scripts.md)

[Drvload Command-Line Options](drvload-command-line-options.md)

 

 






