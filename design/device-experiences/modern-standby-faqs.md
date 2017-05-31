---
title: Modern Standby FAQs
description: Typical questions related to Modern Standby are answered here.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 08E6F079-A7F9-4DD9-95C2-A9A6B3350594
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Modern Standby FAQs


Typical questions related to Modern Standby are answered here.

-   **Q:** Which versions of Windows support Modern Standby?

    **A:** Modern Standby is supported on Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) and Windows 10 Mobile. In Windows 8.0 and 8.1, the only supported standby power models were Connected Standby (CS) and S3.

-   **Q:** Can I switch between S3 and Modern Standby by changing a setting in the BIOS? 

    **A:** No, switching the power model is not supported in Windows without a complete OS re-install.

-   **Q:** What if I have a platform that needs to support both Windows 10 and older versions of Windows?

    **A:** The following table describes what happens with platforms in each of a number of configurations. Investigations are still ongoing to determine the behavior of a system configured for Modern Standby that is installed with Windows 8 or Windows 8.1.

    **Note**  The S3 object is not required for Connected Standby or Modern Standby support. However, if it is not available, S3 support won’t be available.

    <table>
    <colgroup>
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    <col width="25%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th>Flags</th>
    <th>Windows 7</th>
    <th>Windows 8.1</th>
    <th>Windows 10</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td><p>ACPI_S0_LOW_POWER_IDLE FADT flag</p>
    <p>All built-in networking devices support WoL patterns, protocol offloads, and D0 packet coalescing</p>
    <p>Primary storage is SSD or hybrid drive (seek latency)</p>
    <p>ACPI firmware provides an S3 object</p></td>
    <td><p>S3</p></td>
    <td><p>CS</p></td>
    <td><p>Connected Modern Standby</p></td>
    </tr>
    <tr class="even">
    <td><p>ACPI_S0_LOW_POWER_IDLE FADT flag</p>
    <p>ACPI firmware provides an S3 object</p></td>
    <td><p>S3</p></td>
    <td><p>S3</p></td>
    <td><p>Disconnected Modern Standby</p></td>
    </tr>
    <tr class="odd">
    <td><p>ACPI firmware provides an S3 object</p></td>
    <td><p>S3</p></td>
    <td><p>S3</p></td>
    <td><p>S3</p></td>
    </tr>
    </tbody>
    </table>

     

 

 






