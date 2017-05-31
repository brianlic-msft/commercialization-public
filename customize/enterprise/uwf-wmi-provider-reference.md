---
title: Unified Write Filter WMI provider reference
description: Unified Write Filter WMI provider reference
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: c214944f-637e-436c-96f9-6bc1bcd78602
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Unified Write Filter WMI provider reference


To help protect physical storage media, you can use the WMI providers for Unified Write Filter (UWF) to configure UWF.

This section describes the WMI provider classes for UWF.

## In this section


<a href="" id="uwf-excludedfile"></a>[UWF\_ExcludedFile](uwf-excludedfile.md)  
A container class that contains the files and folders that are currently in the file exclusion list for a volume protected by UWF.

<a href="" id="uwf-excludedregistrykey"></a>[UWF\_ExcludedRegistryKey](uwf-excludedregistrykey.md)  
A container class that contains the registry keys that are currently in the registry key exclusion list for UWF.

<a href="" id="uwf-filter"></a>[UWF\_Filter](uwf-filter.md)  
Enables or disables Unified Write Filter (UWF), resets configuration settings for UWF, and shuts down or restarts your device.

<a href="" id="uwf-overlay"></a>[UWF\_Overlay](uwf-overlay.md)  
Contains the current size of the UWF overlay and manages the critical and warning thresholds for the overlay size.

<a href="" id="uwf-overlayconfig"></a>[UWF\_OverlayConfig](uwf-overlayconfig.md)  
Manages the configuration of the UWF overlay.

<a href="" id="uwf-overlayfile"></a>[UWF\_OverlayFile](uwf-overlayfile.md)  
Displays and configures global settings for the UWF overlay. You can modify the maximum size and the type of the UWF overlay.

<a href="" id="uwf-registryfilter"></a>[UWF\_RegistryFilter](uwf-registryfilter.md)  
Adds or removes registry exclusions from UWF filtering.

<a href="" id="uwf-servicing"></a>[UWF\_Servicing](uwf-servicing.md)  
Contains properties and methods that enable you to query and control UWF servicing mode.

<a href="" id="uwf-volume"></a>[UWF\_Volume](uwf-volume.md)  
Manages a volume protected by UWF.

**Note**  
We recommend setting the authentication level to PacketIntegrity or PacketPrivacy for remote clients when you connect to WMI providers under root\\standardcimv2\\embedded when using WMI scripts or applications. For more information about how to use authentication with WMI providers, see this [WMI Enhancements in Windows PowerShell 2.0 CTP](http://go.microsoft.com/fwlink/p/?LinkId=267505) on TechNet.

 

## Requirements


Windows 10 Enterprise or Windows 10 Education.

## Related topics


[uwfmgr.exe](uwfmgrexe.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_enterprise_customizations\p_enterprise_customizations%5D:%20Unified%20Write%20Filter%20WMI%20provider%20reference%20%20RELEASE:%20%2810/17/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/en-us/default.aspx. "Send comments about this topic to Microsoft")





