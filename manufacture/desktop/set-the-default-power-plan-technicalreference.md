---
author: Justinha
Description: Set the Default Power Plan
ms.assetid: e6c722ae-29f4-4249-adbe-9121fdadcf4c
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Set the Default Power Plan
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Set the Default Power Plan


Use these instructions to set a default power plan when deploying Windows 8 or Windows Server® 2012 PCs. A power plan is also known as a *power scheme*.

**Note**  
This page gives information about manufacturing PCs.

To modify a power plans on your own PC, see [Power Plans: Frequently asked questions](http://go.microsoft.com/fwlink/p/?linkid=278892).

 

**To set the default power plan**

1.  On your technician computer, open an elevated command prompt.

2.  If you want to use a power plan from another computer, import the power plan.

    For example, to import a power plan that is named OutdoorPlan, type the following at a command prompt:

    ``` syntax
    powercfg -IMPORT C:\OutdoorPlan.pow
    ```

3.  Type the following to find the GUID for all the power plans on the computer:

    ``` syntax
    powercfg -LIST
    ```

    The computer returns the list of available power plans. The following examples refer to these plans as *guidPlan1* and *guidPlan2*.

    ``` syntax
    Existing Power Schemes (* Active)
    -----------------------------------
    Power Scheme GUID: {guidPlan1}  (Balanced) *
    Power Scheme GUID: {guidPlan2}  (Power saver)
    ```

4.  Note the GUIDs that are listed next to the power plans that you want to change.

5.  Set the power plan that you want to set as the default as the active power plan. For example, you can use the following command:

    ``` syntax
    powercfg -SETACTIVE {guidPlan2}
    ```

    where *guidPlan2* is the name of the power plan.

    This command can be run by using a custom command in an answer file, or by opening an elevated command prompt in audit mode.

**To confirm that the default power plan**

1.  Click **Start**, and then select **Control Panel**.

2.  Click **Hardware and Sound**, and then select **Power Options**.

    The **Power Options** Control Panel opens, and the power plans appear.

3.  Review each power plan.

4.  Verify that the correct plan is set as the active power plan. The computer shows an asterisk (\*) next to the active power plan.

## <span id="related_topics"></span>Related topics


[Add a Custom Command to an Answer File](https://msdn.microsoft.com/library/windows/hardware/dn915058)

[Boot Windows to Audit Mode or OOBE](boot-windows-to-audit-mode-or-oobe.md)

[Create a Custom Power Plan](create-a-custom-power-plan-technicalreference.md)

[Power Policy Configuration and Deployment in Windows](http://go.microsoft.com/fwlink/p/?linkid=129584)

 

 






