---
author: Justinha
Description: 'Fine-Tune a Custom Power Plan'
ms.assetid: 3f3b0d9d-d84a-4b87-a271-159d80ebbcc7
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: 'Fine-Tune a Custom Power Plan'
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Fine-Tune a Custom Power Plan


A power plan is a collection of hardware and system settings that manages how computers use and conserve power. You can create custom power plans that are optimized for specific computers.

You can manage most common power plan settings through Control Panel. For more information, see [Create a Custom Power Plan](create-a-custom-power-plan-technicalreference.md). To fine-tune hardware-specific configurations that are not configurable through Control Panel, use the PowerCfg tool.

## <span id="ModifyPowerPlan"></span><span id="modifypowerplan"></span><span id="MODIFYPOWERPLAN"></span>Manually Modifying a Power Plan


You can customize all configurable Windows power options by using the `powercfg` command from an elevated command prompt. This includes hardware-specific configurations that are not configurable through Control Panel.

**To list the available power plans**

-   On your technician computer, at an elevated command prompt, type the following:

    ``` syntax
    powercfg -LIST
    ```

    The computer will return the list of available power plans. In the following examples, these plans are *Balanced* and *Power saver*.

    ``` syntax
    Existing Power Schemes (* Active)
    -----------------------------------
    Power Scheme GUID: {guidPlan1}  (Balanced) *
    Power Scheme GUID: {guidPlan2}  (Power saver)
    ```

    Note the GUIDs that are listed next to the power plans that you want to change. You will need these GUIDs to manually update settings and capture the power plans.

**To set the power plan to be modified as active**

-   To modify a plan, use the GUID of the power plan that you want to change to set that power plan as the active power plan. For example:

    ``` syntax
    powercfg -SETACTIVE {guidPlan2}
    ```

**To adjust the settings**

1.  This section describes how to manually configure other power configuration settings by using the `powercfg` command. Test these settings to create an optimal power plan for your system.

    **Find information about the existing power setting.**

    1.  At an elevated command prompt, type the following:

        ``` syntax
        powercfg -QUERY
        ```

        The computer displays information for all of the power settings for this plan.

    2.  Find the GUID for the subgroup of the setting that you want to change. For example, to modify a display setting, find the GUID for the Display subgroup:

        ``` syntax
        Subgroup GUID: {guidSubgroup-Display}  (Display)
        ```

    3.  Find the GUID for the setting that you want to change. For example, to modify the Display Brightness setting, find the GUID for the (Display brightness) setting:

        ``` syntax
        Power Setting GUID: {guidPowerSetting-Brightness}  (Display brightness)
        ```

    4.  Review the information from the query command, review the possible settings, and determine a value that works for your computer.

        **Note**  
        You must enter these values by using decimal integers. However, the values appear on the screen as hexadecimal values that are specific to the setting.

        For example, to set the maximum display brightness to 50 percent brightness, enter the value as 50. When you use the `powercfg -QUERY` command to confirm the setting, the value appears as 0x00000032.

        ``` syntax
        Power Setting GUID: {guidPowerSetting-Brightness}  (Display brightness)
          Minimum Possible Setting: 0x00000000
          Maximum Possible Setting: 0x00000064
          Possible Settings increment: 0x00000001
          Possible Settings units: %
         Current AC Power Setting Index: 0x00000064
         Current DC Power Setting Index: 0x00000032
        ```

2.  Adjust the value for the power setting for times when the computer is plugged in. For example, to set the display brightness level to 100 percent when the computer is plugged in, type the following:

    ``` syntax
    powercfg -SETACVALUEINDEX {guidPlan-New} {guidSubgroup-Display}  {guidPowerSetting-Brightness} 100
    ```

3.  Adjust the value for the power setting for times when the computer is on battery power. For example, to set the display brightness level to 75 percent when the computer is on battery power, type the following:

    ``` syntax
    powercfg -SETDCVALUEINDEX {guidPlan-New} {guidSubgroup-Display}  {guidPowerSetting-Brightness} 75
    ```

4.  Use the **Query** command to verify the setting. For example:

    ``` syntax
    powercfg -QUERY
    ```

    The computer shows the new power setting index in hexadecimal notation. For example:

    ``` syntax
    Power Setting GUID: {guidPowerSetting-Brightness}  (Display brightness)
          Minimum Possible Setting: 0x00000000
          Maximum Possible Setting: 0x00000064
          Possible Settings increment: 0x00000001
          Possible Settings units: %
        Current AC Power Setting Index: 0x00000064
        Current DC Power Setting Index: 0x0000004b
    ```

    The hexadecimal value 0x00000064 represents 100 percent display brightness when the computer is plugged in. The hexadecimal value 0x0000004b represents 75 percent display brightness when the computer is using battery power.

## <span id="related_topics"></span>Related topics


[Create a Custom Power Plan](create-a-custom-power-plan-technicalreference.md)

[Set the Default Power Plan](set-the-default-power-plan-technicalreference.md)

 

 






