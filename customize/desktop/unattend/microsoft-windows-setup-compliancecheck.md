---
title: ComplianceCheck
description: ComplianceCheck
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: d37403a5-04d0-417c-8309-66d58397af12
ms.prod: W10
ms.mktglfcycl: deploy
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# ComplianceCheck


`ComplianceCheck` checks that the following requirements are fulfilled so that Windows can be installed:

-   Valid hardware configuration.

-   Power management disabled.

-   No cluster sizes of larger than 4 kilobytes (KB).

-   In-box drivers available.

-   Product key matches available hardware. Windows 7 Starter and Windows Vista Starter can be installed only on the following types of central processing unit (CPU):

    -   Intel Celeron and Intel Pentium III processors, including mobile versions, except for Intel Pentium III Xeon processors.

    -   AMD Duron, AMD Sempron, and AMD Geode processors, including mobile versions.

    -   64-bit processors work only if they belong to one of the processors listed above. However, such processors are limited to 32-bit mode.

-   No SMART failures on installation disk.

-   Sufficient disk space.

-   Valid operating system or Windows Preinstallation Environment (Windows PE).

-   All run-once items have finished.

-   There is no pending reboot on the computer.

`ComplianceCheck` also checks that the existing operating system is one of the following:

-   Windows 2000, Service Pack 4 or later.

-   Windows XP, Service Pack 2 or later.

-   Windows Server 2000, Service Pack 1 or later.

-   Windows Server 2003.

-   Windows Server 2008.

-   Windows Server 2008 R2.

-   Windows Vista.

-   Windows 7.

**Important**  
`ComplianceCheck` does not validate application compatibility. See the software vendor for application compatibility requirements.

 

The user is also warned if any of the following conditions apply (provided [DisplayReport](microsoft-windows-setup-compliancecheck-displayreport.md) is set to **OnError**). Otherwise, the user must boot from installation media and perform a clean installation instead of an upgrade.

-   There are SMART failures, and no alternate disk is available.

-   There is insufficient space for temporary files for Windows Setup or for total installation.

-   A newer version of the loader is already on the destination computer. This applies to dual-boot scenarios only.

## Child Elements


<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<tbody>
<tr class="odd">
<td><p>[DisplayReport](microsoft-windows-setup-compliancecheck-displayreport.md)</p></td>
<td><p>A string that specifies in what circumstances the user interface (UI) is displayed for this item.</p></td>
</tr>
</tbody>
</table>

 

## Valid Passes


windowsPE

## Parent Hierarchy


[microsoft-windows-setup-](microsoft-windows-setup.md) | **ComplianceCheck**

## Applies To


For a list of the supported Windows editions and architectures that this component supports, see [microsoft-windows-setup-](microsoft-windows-setup.md).

## XML Example


The following XML output changes the `ComplianceCheck` setting to run in guaranteed quiet mode.

``` syntax
<ComplianceCheck>
   <DisplayReport>Never</DisplayReport>
</ComplianceCheck>
```

## Related topics


[microsoft-windows-setup-](microsoft-windows-setup.md)

 

 

[Send comments about this topic to Microsoft](mailto:wsddocfb@microsoft.com?subject=Documentation%20feedback%20%5Bp_unattend\p_unattend%5D:%20ComplianceCheck%20%20RELEASE:%20%2810/3/2016%29&body=%0A%0APRIVACY%20STATEMENT%0A%0AWe%20use%20your%20feedback%20to%20improve%20the%20documentation.%20We%20don't%20use%20your%20email%20address%20for%20any%20other%20purpose,%20and%20we'll%20remove%20your%20email%20address%20from%20our%20system%20after%20the%20issue%20that%20you're%20reporting%20is%20fixed.%20While%20we're%20working%20to%20fix%20this%20issue,%20we%20might%20send%20you%20an%20email%20message%20to%20ask%20for%20more%20info.%20Later,%20we%20might%20also%20send%20you%20an%20email%20message%20to%20let%20you%20know%20that%20we've%20addressed%20your%20feedback.%0A%0AFor%20more%20info%20about%20Microsoft's%20privacy%20policy,%20see%20http://privacy.microsoft.com/default.aspx. "Send comments about this topic to Microsoft")





