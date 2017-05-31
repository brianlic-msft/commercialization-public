---
title: Find ETW providers on Windows 10 Mobile
description: Here we give examples of how to find the ETW providers on a Windows 10 Mobile device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 918791F9-B627-4AA6-A6FC-39A0B376834B
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Find ETW providers on Windows 10 Mobile


Here we give examples of how to find the ETW providers on a Windows 10 Mobile device. This step is useful only for engineers.

## Field Medic Appx


Locate FieldMedic.appx with the MobileOS packages.

Change the name of FieldMedic.appx to FieldMedic.zip.

Open FieldMedic.zip, and then open the ProfileXMLs folder.

In the ProfileXMLs folder, open any profile XML file to see the GUIDs of the ETW providers that belong to the profile. For example, open FieldMedic-Performance.xml.

``` syntax
<EventProvider Name="A6BF0DEB-3659-40ad-9F81-E25AF62CE3C7" …/>
<EventProvider Name="331C3B3A-2005-44C2-AC5E-77220C37D6B4" …/>
<EventProvider Name="0F67E49F-FE51-4E9F-B490-6F2948CC6027" …/>
<EventProvider Name="C514638F-7723-485B-BCFC-96565D735D4A" …/>
<EventProvider Name="5412704E-B2E1-4624-8FFD-55777B8F7373" …/>
<EventProvider Name="59819D0A-ADAF-46B2-8D7C-990BC39C7C15" …/>
<EventProvider Name="5C103042-7E75-4629-A748-BDFA67607FAC" …/>
```

## Manifest files in the Windows Driver Kit


Locate the Manifests folder in the Windows Driver Kit.

Example: C:\\Program Files (x86)\\Windows Kits\\10\\Manifests

In the Manifests folder, open any manifest (.mc) file to see the ETW provider name and GUID. For example, open microsoft-windowsphone-mtp.mc.

``` syntax
<provider name="Microsoft-WindowsPhone-Mtp"
          guid="{13D97131-EE68-43F4-A1D0-9E762D2A4729}"
```

## XPerf


Establish a TShell connection between a computer and the device.

On the computer, in TShell, enter this command:

``` syntax
exec-device xperf –providers I
```

The output is similar to this:

``` syntax
…
0063715b-eeda-4007-9429-ad526f62696e             : Microsoft-Windows-Services
00a083e0-1eda-4c82-9a16-e62b1bbc0659             : Microsoft-WindowsPhone-WboExt
02292a7f-12e0-4de6-8fb0-cb93cc1126d3             : Microsoft-WindowsPhone-MMResourceRegistrar
048970b2-e55c-4d10-bbc8-2ee964b745a4             : Microsoft-WindowsMobile-SyncMLDPU-Provider
04a490d4-84c6-4920-9c22-51c80825ff2c             : Microsoft-WindowsPhone-Comms-PhoneUtil
…
```

## Reg-Device


In TShell, enter this command:

``` syntax
reg-device query HKLM\Software\Microsoft\Windows\CurrentVersion\WINEVT\Publishers /s > publishers.txt
```

The output is similar to this:

``` syntax
HKEY_LOCAL_MACHINE\...\Publishers\{0063715B-EEDA-4007-9429-AD526F62696E}
    (Default)    REG_SZ    Microsoft-Windows-Services
    Enabled    REG_DWORD    0x1
    MessageFileName    REG_SZ    C:\windows\System32\services.exe
    ResourceFileName    REG_SZ    C:\windows\System32\services.exe

HKEY_LOCAL_MACHINE\...\Publishers\{00A083E0-1EDA-4c82-9A16-E62B1BBC0659}
    (Default)    REG_SZ    Microsoft-WindowsPhone-WboExt
    Enabled    REG_DWORD    0x1
    MessageFileName    REG_SZ    C:\windows\System32\WboExt.dll
    ResourceFileName    REG_SZ    C:\windows\System32\WboExt.dll
…
```

## Tracelog


In TShell, enter these commands:

For production images, you might be interested in the WinPhoneCritical and WinPhoneCircular sessions.

``` syntax
 Copy imageCopy code  
exec-device tracelog –q WinPhoneCritical -lp
exec-device tracelog –q WinPhoneCircular -lp
```

The output is similar to this:

``` syntax
Logger Name:            WinPhoneCritical
…
Log Mode:               AddToTriageDump  Buffering-only
…
Log Filename:

Enabled Providers:
## Guid                                  Level  Flags

531ab09a-fd58-4d14-bace-bdd7f8e910eb      2  0xffffffffffffffff
ebfe7216-281a-4601-875f-17d1cabed9e0      2  0x00000007
08dde8cc-029f-4e95-9d84-259ccf3a6808      2  0x00000007
…
21f1f21b-c2f6-47d0-bafc-5b75a86f5343      2  0x00000001
Total of 154 providers
```

 

 






