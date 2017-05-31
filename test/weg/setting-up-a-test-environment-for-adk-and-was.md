---
title: Setting up a test environment for ADK and WAS
description: Setting up a test environment for ADK and WAS
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

# Setting up a test environment for ADK and WAS

Although installing Windows Assessment Service (WAS) server to a server machine is straightforward, configuring the network environment might not be so simple. Incorrect network topology can cause assessment job failures for various reasons. It’s important to understand your organization’s requirements, network policy, and so on.

Before you begin, become familiar with those two resources:

-   [Windows Assessment Services Step-by-Step Guide](https://msdn.microsoft.com/en-us/library/windows/hardware/hh825315.aspx)

-   [Installing Windows Assessment Services](https://msdn.microsoft.com/library/windows/hardware/hh825515)

## Network topology considerations

This section covers considerations for implementing a WAS infrastructure in your lab, and some optional items to achieve
additional features and automations. The objective is to set up a local network to better simulate the “quiet” environment that customers experience at home.

The items in the following table are required.

| Item               | Type              | Note |
|--------------------|-------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Ethernet           | Hardware          | WAS requires Ethernet. For robustness and efficiency, we recommend gigabit Ethernet. |
| Symbols            | Internet access   | ADK’s auto-analysis feature does not work without symbol files. Because operating system binaries are updated via Windows Update after a Windows version is released, it is not practical to collect updated symbol files. We recommend that you use a public symbol server and cache the symbol files locally for re-use.<br/><br/>For Connect operating system downloads, use the provided symbols packages and cache them locally on the WAS server. ||
| Wi-Fi Access Point | Hardware          | It is recommended to connect to a Wi-Fi network when you run Energy Efficiency assessments. |
| DHCP Server        | Hardware/Software | PXE Boot requires DHCP. *The WAS server can be a DHCP server as well*. You can use a Wi-Fi router as a DHCP server. If you don’t plan to push the operating system image by using WAS via PXE boot, you don’t need to have DHCP. |
| File Share         | Hardware          | Depends on the method you use to store your results files. *Results can be stored on the WAS server as well.* |
| USB Flash Drives   | Hardware          | For example, you can boot into Windows PE to inventory a bare metal machine to WAS. |

These items are not required, but are often necessary depending on your needs and corporate network policy:

| Item                    | Type              | Note |
|-------------------------|-------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| DNS Server              | Hardware/Software | Typically not required, as your test network is single subnet. If you need to configure multiple subnets, you must have name resolution capability (such as a DNS Server). |
| IP Control Power Switch | Hardware          | You can buy a power switch that you can control remotely. You can use this to fully automate Energy Efficiency assessments. |
| USB to Ethernet Adapter | Hardware          | Some form factors don’t have Ethernet. You can also use Wi-Fi. We recommend that you use an USB Ethernet adapter with inbox driver support so that you don’t have to customize Relax Windows PE. |

The following diagram illustrates one possible network configuration.

![Diagram of an example network of devices and connections](images/web-diagram-network-example-configuration.png)

Typical corporations require this type of test environment to be isolated from the corporate network. For example, corporate IT policy doesn’t allow you to have your own DHCP server. However, you might want to access WAS so that you can remotely schedule jobs, monitor progress, and review results. In addition, performance data might be affected if you have DUTs on the corporate network because the corporate network might generate special network traffic.

Servers are typically equipped with a multiport Ethernet adapter or multiple Ethernet adapters. You can consider making your WAS server a multi-home server; a multi-home server has one Ethernet adapter connected to an isolated test network and another to your corporate network. With this configuration, people in your organization can access WAS without being connected to your test lab via WASC or Remote Desktop.

## Optional SQL database

Windows Assessment Services lets you import results from one or more Windows Assessment Services labs into a central SQL database for generating consolidated reports. The SQL database is an optional component of the WAS infrastructure.

Results stored in this optional SQL Server database do not include the Assessment Platform presentation layer and cannot be
viewed in the Windows Assessment Services - Client (Windows ASC). This component lets you develop custom reporting solutions to fulfill any needs not covered by the default WAS/WAC reporting layer.

You can use the ResultsUtil command to configure the WAS server to automatically use the database or to import existing results. For more information, see [ResultsUtil Command-Line Options](https://msdn.microsoft.com/library/windows/hardware/hh825313.aspx).

## Symbol files, symbol server, symbol cache

By Default, WAS sets the following symbol information. If you have other symbol servers or locations, you can override these settings with the setx command.

```
set _NT_SYMBOL_PATH=

\\<WASServer>\Relax\Symbols;srv*http://msdl.microsoft.com/download/symbols

set _NT_SYMCACHE_PATH=\\<WASServer>\Relax\Symcache
```

