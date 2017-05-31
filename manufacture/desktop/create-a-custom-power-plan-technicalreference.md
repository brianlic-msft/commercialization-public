---
author: Justinha
Description: Create a Custom Power Plan
ms.assetid: d1d0e1b0-f15f-482c-9e9b-1b75a05dfeb3
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Create a Custom Power Plan
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Create a Custom Power Plan


A *power plan* is a collection of hardware and system settings that manages how computers use and conserve power. A power plan is also known as a *power scheme*. You can create custom power plans that are optimized for specific computers.

By default, Windows 8 and Windows Server® 2012 include three power plans: **Balanced**, **Power Saver**, and **High Performance**. You can customize these existing plans for your systems, create new plans that are based on the existing plans, or create a new power plan from scratch.

Optimizing Windows power plans can help improve battery life. However, a single poorly performing application, device, or system feature can significantly reduce battery life. For information about factors that influence battery life, see [Managing Battery Life and Power Consumption Overview](managing-battery-life-and-power-consumption-overview-technicalreference.md).

## <span id="In_this_topic"></span><span id="in_this_topic"></span><span id="IN_THIS_TOPIC"></span>In this topic


[Creating a customized power plan](#createcustomizedplan)

[Listing the available power plans](#listpowerplans)

[Deploying a power plan](#deploypowerplan)

## <span id="CreateCustomizedPlan"></span><span id="createcustomizedplan"></span><span id="CREATECUSTOMIZEDPLAN"></span>


**Creating a customized power plan**

1.  Click **Start**, and then select **Control Panel**.

2.  Click **Hardware and Sound**, and then select **Power Options**.

3.  The **Power Options** Control Panel opens, and the power plans appear.

4.  Click **Create a power plan**.

5.  Follow the on-screen instructions to create and customize a power plan file that is based on an existing plan. Name your power plan "OutdoorPlan".

    **Note**  
    You can manage most common power plan settings through Control Panel. To fine-tune settings that do not appear in Control Panel, see [Fine-Tune a Custom Power Plan](fine-tune-a-custom-power-plan-technicalreference.md).

## <span id="ListPowerPlans"></span><span id="listpowerplans"></span><span id="LISTPOWERPLANS"></span>


**Listing the available power plans**

-   On your technician computer, at an elevated command prompt, type the following:

    ``` syntax
    powercfg -LIST
    ```

    The computer will return the list of available power plans. In the following example, these plans are *Balanced*, *Power saver*, and *OutdoorPlan*.

    ``` syntax
    Existing Power Schemes (* Active)
    -----------------------------------
    Power Scheme GUID: {guidPlan1}  (Balanced) *
    Power Scheme GUID: {guidPlan2}  (Power saver)
    Power Scheme GUID: {guidPlan3}  (OutdoorPlan)
    ```

    Note the GUIDs that are listed next to the power plans that you want to capture.

## <span id="DeployPowerPlan"></span><span id="deploypowerplan"></span><span id="DEPLOYPOWERPLAN"></span>


**Deploying a power plan**

After you have created power plans that work for your system, you can deploy the power plans to your destination computers.

To export the OutdoorPlan power plan that you created on your technician computer, open an elevated command prompt, and then type the following

``` syntax
powercfg -EXPORT C:\OutdoorPlan.pow {guidPlan-New}
```

This creates a new power plan file.

To learn more, see [Set the Default Power Plan](set-the-default-power-plan-technicalreference.md).

## <span id="related_topics"></span>Related topics

[Managing Battery Life and Power Consumption Overview](managing-battery-life-and-power-consumption-overview-technicalreference.md)

[Test Battery Life and Power Consumption](test-battery-life-and-power-consumption-technicalreference.md)

[Set the Default Power Plan](set-the-default-power-plan-technicalreference.md)