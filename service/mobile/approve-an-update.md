---
author: kpacquer
Description: Approve an update
ms.assetid: 766c5961-4291-4547-a3a4-8ce98d3525e5
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Approve an update
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Approve an update


After you submit an update, the OEM and Mobile Operator (MO) approve it or cancel it.

## <span id="Prerequisites_to_approve_an_update"></span><span id="prerequisites_to_approve_an_update"></span><span id="PREREQUISITES_TO_APPROVE_AN_UPDATE"></span>Prerequisites to approve an update


See [Submit an update](submit-an-update.md).

## <span id="Approving_RFUs"></span><span id="approving_rfus"></span><span id="APPROVING_RFUS"></span>Approving RFUs


Open a Team Foundation Server (TFS) Update request.

Open separate TFS update requests for updates from Windows Phone 8.0 to Windows Phone 8.1 and from Windows Phone 8.1 to Windows Phone 8.1.

1.  Add a title, using the format: “RFU approvals &lt;MOID or Multiple&gt; &lt;DeviceName or Multiple&gt;&lt;Apollo-Blue or Blue-Blue&gt;”.

2.  Complete the other TFS fields as appropriate.

3.  Attach an Excel spreadsheet (.xls) with the list of devices, including the following info:

    1.  RFU\#

    2.  RFU Ticket Number (Not Code Sign TKT)

    3.  PhoneManufacturerModelName (Not Friendly or Code name)

    4.  Phone Mobile Operator name (MOId)

    5.  Source Firmware Revision

    6.  Target Firmware Revision

    Example:

    <table>
    <colgroup>
    <col width="12%" />
    <col width="12%" />
    <col width="12%" />
    <col width="12%" />
    <col width="12%" />
    <col width="12%" />
    <col width="12%" />
    <col width="12%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">RFU#</th>
    <th align="left">RFU Ticket Number</th>
    <th align="left">PhoneManufacturerModelName</th>
    <th align="left">MOId</th>
    <th align="left">Source FW</th>
    <th align="left">Target FW</th>
    <th align="left">OS version before update</th>
    <th align="left">OS version after update</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><p>12345</p></td>
    <td align="left"><p>TKT-RFU-PROD-ABC3DEF-2</p></td>
    <td align="left"><p>OEMDeviceName</p></td>
    <td align="left"><p>000-33</p></td>
    <td align="left"><p>1.2.3.4</p></td>
    <td align="left"><p>1.2.3.5</p></td>
    <td align="left"><p>10521</p></td>
    <td align="left"><p>12397</p></td>
    </tr>
    </tbody>
    </table>

     

## <span id="Approving_Adaptation_Kit__AK__Releases__no_firmware_update_"></span><span id="approving_adaptation_kit__ak__releases__no_firmware_update_"></span><span id="APPROVING_ADAPTATION_KIT__AK__RELEASES__NO_FIRMWARE_UPDATE_"></span>Approving Adaptation Kit (AK) Releases (no firmware update)


The OEM and MO can submit and approve the release of an Adaptation Kit (AK) without an accompanying RFU. The AK-only bundle will be prepared for preview and release when the OEM submits an AK-only request through ingestion tools. Once approved, the update can be released to production. These updates should be targeted for Retail Servicing Preview if intending to go to production.

Open a TFS update request:

1.  Enter a title with the format: “Approval for AK Release Only &lt;MOID or Multiple&gt; &lt;DeviceName or Multiple&gt;&lt;Release, e.g GDR2QFE1&gt;”.

2.  Complete the other TFS fields as appropriate.

3.  Attach an Excel spreadsheet (.xls) with the list of devices, including the following info. Provide an explanation for requesting a manual cancellation of the updates.

    1.  RFU\#. Note, there will be a TFS ID associated with AK-only bundles.

        Do not mix AK only with normal RFU approvals in one TFS request, they are managed separately.

    2.  PhoneManufacturerModelName

    3.  Phone Mobile Operator name (MOId)

    4.  OS Version Before Update

    5.  OS Version After Update

    Example:

    <table>
    <colgroup>
    <col width="20%" />
    <col width="20%" />
    <col width="20%" />
    <col width="20%" />
    <col width="20%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">RFU#</th>
    <th align="left">PhoneManufacturerModelName</th>
    <th align="left">MOId</th>
    <th align="left">OS version before update</th>
    <th align="left">OS version after update</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><p>12345</p></td>
    <td align="left"><p>OEMDeviceName</p></td>
    <td align="left"><p>000-33</p></td>
    <td align="left"><p>10327</p></td>
    <td align="left"><p>10501</p></td>
    </tr>
    </tbody>
    </table>

     

## <span id="Cancelling_RFUs"></span><span id="cancelling_rfus"></span><span id="CANCELLING_RFUS"></span>Cancelling RFUs


RFUs in preview do not need to be manually canceled when replacing with same baseline. Auto-ingestion will cancel the ‘replaced’ RFU on a best-effort basis when the new firmware update goes live into preview. For canceling RFUs that are live in preview, use the [Request-UpdateCancellation cmdlet](request-updatecancellation.md). For canceling RFUs that are already live in production:

Open a TFS update request:

1.  Enter a title with the format: “&lt;OEM&gt;Request for cancellation: &lt;DeviceName&gt;&lt;MOId&gt; &lt;Explanation&gt;”.

2.  Complete the other TFS fields as appropriate.

3.  Attach an Excel spreadsheet (.xls) with the list of devices, including the following info. Provide an explanation for requesting a manual cancellation of the updates.

    1.  RFU\#

    2.  PhoneManufacturerModelName

    3.  Phone Mobile Operator name (MOId)

    4.  OS Version Before Update

    5.  OS Version After Update

    Example:

    <table>
    <colgroup>
    <col width="20%" />
    <col width="20%" />
    <col width="20%" />
    <col width="20%" />
    <col width="20%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="left">RFU#</th>
    <th align="left">PhoneManufacturerModelName</th>
    <th align="left">MOId</th>
    <th align="left">OS version before update</th>
    <th align="left">OS version after update</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="left"><p>765432</p></td>
    <td align="left"><p>OEMDeviceName</p></td>
    <td align="left"><p>000-33</p></td>
    <td align="left"><p>12345</p></td>
    <td align="left"><p>12346</p></td>
    </tr>
    </tbody>
    </table>

     

## <span id="After_the_update"></span><span id="after_the_update"></span><span id="AFTER_THE_UPDATE"></span>After the update


The update is published to Microsoft’s production update server, where your customer’s phones will download the update and install it with their consent.

## <span id="related_topics"></span>Related topics


[Update](index.md)

[Submit an update](submit-an-update.md)

 

 
