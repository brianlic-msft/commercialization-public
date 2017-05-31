---
title: Creating a Regions of Interest File
description: Creating a Regions of Interest File
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: e8818fd2-3536-4b02-840d-f7d2eb4fbd91
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Creating a Regions of Interest File


A Regions of Interest file is a valid XML file that contains the following nodes:

-   **InstrumentationManifest**

-   **Instrumentation**

-   **Regions**

-   **RegionsRoot**, a container for all of the defined regions

-   One or more **Region** nodes

**Note**  
In a region's definition, the *version* attribute in the XML declaration, such as `version='1.0'`, is optional.

 

The following example is a complete Regions of Interest file that defines a simple region. Explanations for the attributes and nodes within **Region** are described after the example.

``` syntax
<?xml version='1.0' encoding='utf-8' standalone='yes'?>
<?Copyright (c) Microsoft Corporation. All rights reserved.?>
<InstrumentationManifest>
   <Instrumentation>
      <Regions>
         <RegionRoot Guid="{EFA7A927-BAE3-48F6-92E1-000000000000}"
                     Name="Sample Region File Root"
                     FriendlyName="Root">
            <Region Guid="{d8d639a0-cf4c-45fb-976a-000111000100}"
                    Name="FastStartup-Suspend-UserSession-Shutdown"
                    FriendlyName="User Session Shutdown">
               <Start>
                  <Event Provider="{dbe9b383-7cf3-4331-91cc-a3cb16a3b538}" Id="301" Version="0" />
               </Start>
               <Stop>
                  <Event Provider="{331c3b3a-2005-44c2-ac5e-77220c37d6b4}" Id="22" Version="0" />
               </Stop>
            </Region>
         </RegionRoot>
      </Regions>
   </Instrumentation>
</InstrumentationManifest>
```

This topic has the following contents:

-   [Defining a region](#defining-a-region)
-   [Region types](#region-types)
-   [Using payload fields to identify events](#using-payload-fields-to-identify-events)
-   [Matching events for regions](#matching-events-for-regions)
-   [Filtering a region based on a condition](#filtering-a-region-based-on-a-condition)
-   [Parent-child relationships](#parent-child-relationships)
-   [Self-nesting regions](#self-nesting-regions)
-   [Instance names](#instance-names)
-   [Metadata](#metadata)

### Defining a region

A region definition contains the following attributes in the **Region** node:

-   *Guid* (required), a GUID for the region.

-   *Name* (required), a unique name for the region. A suggested format for *Name* is `Root-GrandparentName-ParentName-RegionName`.

-   *FriendlyName* (optional), an alternate name for the region.

### Region types

You can create the following types of regions based on how they start and stop:

-   [Regions based on events](#regions-based-on-events)
-   [Regions based on duration](#regions-based-on-duration)
-   [Regions based on other regions](#regions-based-on-other-regions)
-   [Regions that are containers of other regions](#regions-within-regions)

### Regions based on events

The most common type of region is one whose starting and stopping points are defined by events.

To specify an event as the starting or stopping point, you need to provide the following attributes:

-   *Provider*, a GUID that specifies the provider ID for the event.

-   *Id*, an unsigned short that specifies the ID of the event.

-   *Version*, an unsigned char that specifies the event version.

Additionally, you can further refine your definition by adding one or more **PayloadIdentifier** nodes. These tags contain two string attributes, *FieldName* and *FieldValue*, that specify a field that the event must contain. **PayloadIdentifier** tags are further described below in **Using payload fields to identify events**.

### Examples

Following is a basic example for this type of region:

``` syntax
<Region Guid="{d8d639a0-cf4c-45fb-976a-000111000100}"
        Name="FastStartup-Suspend-UserSession-Shutdown"
        FriendlyName="User Session Shutdown">
   <Start>
      <Event Provider="{dbe9b383-7cf3-4331-91cc-a3cb16a3b538}" Id="301" Version="0" />
   </Start>
   <Stop>
      <Event Provider="{331c3b3a-2005-44c2-ac5e-77220c37d6b4}" Id="22" Version="0" />
   </Stop>
</Region>
```

In the following example, the region ends only when the specified event contains a field named `StartOrStop` with a value of `Stop`:

``` syntax
<Region Guid="{d8d639a0-cf4c-45fb-976a-000111000100}"
        Name="FastStartup-Suspend-UserSession-Shutdown"
        FriendlyName="User Session Shutdown">
   <Start>
      <Event Provider="{dbe9b383-7cf3-4331-91cc-a3cb16a3b538}" Id="301" Version="0" />
   </Start>
   <Stop>
      <Event Provider="{331c3b3a-2005-44c2-ac5e-77220c37d6b4}" Id="22" Version="0" />
      <PayloadIdentifier FieldName="StartOrStop" FieldValue="Stop" />
   </Stop>
</Region>
```

### Regions based on duration

Many ETW events are defined as a single stop event with a duration payload field. We can calculate the starting point by subtracting the duration from the stop event time.

The **Duration** tag can be used within a **Start** or **Stop** tag to specify a payload field from which to grab duration information. If you define a duration for the starting point, the duration is subtracted from the stopping point. Similarly, if you define a duration for the stopping point, the duration is added to the starting point.

The **Duration** node can have the following attributes:

-   *Provider*, a GUID that specifies the provider ID for the event that contains the payload field.

-   *Id*, an unsigned short that specifies the ID of the event that contains the payload field.

-   *Version*, an unsigned char that specifies the version of the event that contains the payload field.

-   *Duration*, a string that specifies the name of the payload field.

-   *Multiplier*. WPA requires the duration to be in nanoseconds. Use this attribute to convert the duration to nanoseconds, if necessary. For example, use 1000000 (one million) to convert milliseconds to nanoseconds.

If you define a duration for the starting point, the duration is subtracted from the stopping point. Similarly, if you define a duration for the stopping point, the duration is added to the starting point.

### Example

The following example defines a region that stops when another region starts. To calculate the starting point, we subtract a duration from our stopping point. The duration is found in the HiberHiberFileTime payload field. We then multiply the duration by 1,000,000 to convert it to nanoseconds and subtract it from the stopping point.

``` syntax
<Region Guid="{7D6BA3F6-BC04-4776-8A7F-93CF7F4E2B6D}"
   Name="FastStartup-Suspend-WriteHiberFile"
   FriendlyName="Subscribers for Create Session">
   <Region Guid="{93783B2C-A67F-49cb-89BC-BF305D7E2CEA}"
         Name="FastStartup-Suspend-Winlogon-CreateSession-Subscribers-Child"
         FriendlyName="Hiberfile Write">
      <Start>
         <Duration Provider="{331c3b3a-2005-44c2-ac53-77220c37d6b4}" 
                   Id="117"
                   Version="0"
                   Duration="HiberHiberFileTime"
                   Multiplier="1000000" />
      </Start>
      <Stop>
         <Region RegionGuid="{EC1BB2D9-4AA8-4d82-84AA-6042FF4CFBE3}" />
      </Stop>
   </Region>
</Region>
```

### Regions based on other regions

You can define a region whose starting and stopping points are defined by other regions by using a **Region** node within the **Start** or **Stop** node. This Region node has one mandatory attribute, *RegionGuid*, that specifies the GUID of the target region.

By default, a region whose starting point is based on another region will start when the starting point region stops. Similarly, a region whose stopping point is based on another region will stop when the stopping point region starts. You can override this default behavior by adding an optional attribute, *Endpoint*, to the Region node. *Endpoint* can have a value of `Start` or `Stop` and specifies which endpoint of the region to use for the starting or stopping event.

### Example

The following region definition contains starting and stopping points that are defined by other regions:

``` syntax
<Region Guid="{93783B2C-A67F-49cb-89BC-BF305D7E2CEA}"
        Name="FastStartup-Suspend-HiberInitTime"
        FriendlyName="Hiberfile Initialization">
   <Start>
      <Region RegionGuid="{5E81D74C-0CCC-43f9-8119-953F827BCD12}" />
   </Start>
   <Stop>
      <Region RegionGuid="{7D6BA3F6-BC04-4776-8A7F-93CF7F4E2B6D}" />
   </Stop>
</Region>
```

### <a href="" id="regions-within-regions"></a>Regions that are containers of other regions

Regions that contain other regions are called *containers*. Containers start when the first instance of a contained region starts, and they stop when the last instance stops. These regions do not have any other attributes.

**RegionRoot** is a container for all of the regions that you define. Thus, **RegionRoot** starts when the first instance of a region starts, and it stops when the last instance of a region stops.

To define a container region, simply define a region without a starting point or a stopping point.

### Example

In the example below, *Subscribers for Create Session* is a container for *Child of Subscribers of Create Session*. Notice that *Subscribers for Create Session* does not have a starting point or a stopping point. It will start when the first instance of a child region starts and stop when the last instance of a child region stops.

``` syntax
<Region Guid="{A75D8F5D-E8F8-40b8-B453-5CC70DEAC06F}"
   Name="FastStartup-Suspend-Winlogon-CreateSession-Subscribers"
   FriendlyName="Subscribers for Create Session">
   <Region Guid="{93783B2C-A67F-49cb-89BC-BF305D7E2CEA}"
           Name="FastStartup-Suspend-Winlogon-CreateSession-Subscribers-Child"
           FriendlyName="Child of Subscribers for Create Session">
      <Start>
         <Region RegionGuid="{5E81D74C-0CCC-43f9-8119-953F827BCD12}" />
      </Start>
      <Stop>
         <Region RegionGuid="{7D6BA3F6-BC04-4776-8A7F-93CF7F4E2B6D}" 
                 Endpoint="Stop" />
      </Stop>
   </Region>
</Region>
```

### Using payload fields to identify events

Often the event ID properties (process ID, thread ID, and activity ID) are not enough to identify specific scenarios. For example, when a service starts, a generic event is fired that might not identify which service started. When this occurs, you must rely on *payload fields* for additional information. In this case, one of the additional fields should include the service name. You can use this information to further specify region starting and stopping points.

To use payload fields as additional event identifiers, add one or more **PayloadIdentifier** nodes to a **Start** or **Stop** node.

The **PayloadIdentifier** node has the following attributes:

-   *FieldName* (required), the name of the payload field.

-   *FieldValue* (required), the payload value.

-   *FieldValueRelationship* (optional). Use **IsEqual** to specify that the event must contain the payload value. Use **DoesNotContain** to specify that the event must not contain the payload value. If this attribute is not specified, the default value is **IsEqual**.

**Note**  
Payload fields are case-sensitive, and the XML definition must fully match the payload value. For example, if a payload field has a value of `00000`, the region definition must also specify `00000` as the payload value.

 

### Example

The following example contains **PayloadIdentifier** nodes for both the starting point and the stopping point:

``` syntax
<Region Guid="{AB719FB1-D863-4305-AE8E-F21281899A85}"
        Name="FastStartup-ConsoleSessionDisconnect"
        FriendlyName="Console Session Disconnect">
   <Start>
      <Event Provider="{dbe9b383-7cf3-4331-91cc-a3cb16a3b538}" Id="801" Version="0" />
      <PayloadIdentifier FieldName="Event" FieldValue="8" />
      <PayloadIdentifier FieldName="Key" FieldValue="00000" />
   </Start>
   <Stop>
      <Event Provider="{dbe9b383-7cf3-4331-91cc-a3cb16a3b538}" Id="802" Version="0" />
      <PayloadIdentifier FieldName="Event"
                         FieldValue="20"
                         FieldValueRelationship="DoesNotContain" />
   </Stop>
</Region>
```

### Matching events for regions

WPA matches starting events with stopping events to form regions in a process called *event matching*. At the event level, WPA attempts to match a single starting or stopping event based on its provider ID, event ID, event version, and any additional specified payload fields.

Matching can also be extended to the region level, where criteria can be specified that must be met by both the starting and stopping points. At the region level, you can require that both points have matching thread IDs, process IDs, and activity IDs. Additionally, you can also define payload criteria at the region level.

You can use region-level matching by including a **Match** node inside of the **Region** node. The **Match** node contains a child node, **Event**, that can have any combination of the following attributes:

-   `TID="true"` – require matching thread IDs

-   `PID="true"` – require matching process IDs

-   `AID="true"` – require matching activity IDs

The **Event** node can have an optional **Payload** child node that contains a *FieldName* attribute. This node requires that both the starting and stopping nodes contain matching payload values for the specified *FieldName*.

Alternatively, the **Payload** node can also contain an optional attribute, *TargetFieldName*. If this attribute is specified, then *FieldName* corresponds to a payload field only in the starting node, while *TargetFieldName* corresponds to a payload field in the stopping node.

### Example

The following example forms a region when the starting event contains a payload field, *SubscriberName*, whose value matches that of a payload field, *Client*, in the stopping node. The starting and stopping events must also have matching thread IDs.

``` syntax
<Region Guid="{A75D8F5D-E8F8-40b8-B453-5CCC70DEAC06F}"
        Name="FastStartup-Suspend-Winlogon-CreateSession-Subscribers"
        FriendlyName="Subscribers for Create Session">
   <Start>
      <Event Provider="{dbe9b383-7cf3-4331-91cc-a3cb16a3b538}" Id="805" Version="0" />
      <PayloadIdentifier FieldName="Event" FieldValue="0" />
   </Start>
   <Stop>
      <Event Provider="{dbe9b383-7cf3-4331-91cc-a3cb16a3b538}" Id="806" Version="0" />
      <PayloadIdentifier FieldName="Event" FieldValue="0" />
   </Stop>
   <Match>
      <Event TID="true">
         <Payload FieldName="SubscriberName" TargetFieldName="Client" />
      </Event>
   </Match>
</Region>
```

### Filtering a region based on a condition

WPA can include or exclude a region based on a condition, or *trigger*, which can be an event or another region. The trigger is specified in a **Filter** element, and the region that contains **Filter** is the *target*.

If the trigger is a *region*, then **Filter** must contain the region ID.

If the trigger is an *event*, then **Filter** must contain an **Event** element with the *ProviderId* of the ETW provider and one or more of the following attributes: *Id*, *Version*, *OpCode*, and *Type*.

*Id* and *Version* are described earlier in [Region types](#region-types). *OpCode* is whatever value you choose. *Type* specifies the mode of filtering the targeted region, including or excluding it based on the conditions described in the following table.

| Type of filter | Description                                                                                          |
|----------------|------------------------------------------------------------------------------------------------------|
| Out            | Exclude the target region when the triggering event or region is found.                              |
| OutPost        | Exclude the target region when the target occurred after the most recent triggering event or region. |
| OutPrev        | Exclude the target region when the target occurred prior to the first triggering event or region.    |
| In             | Include the target region only when the triggering event or region is found.                         |
| InPost         | Include the target region only when it occurred after the most recent triggering event or region.    |
| InPrev         | Include the target region only when it occurred prior to the first triggering event or region.       |


### Parent-child relationships

You can define a region within another to create a parent-child relationship. For a region to be a parent, it must have a start time that is earlier than or equal to the start time of the child region. It must also have a stopping time that is later than or equal to the stopping time of the child region. If these conditions are not met, a parent-child relationship cannot be formed.

To specify additional criteria for a parent region, use the **Parent** node within a **Match** node. The **Parent** node has the same attributes and child nodes as the **Event** node used in region-level matching. You can specify that the parent and child regions must have the same thread ID, process ID, activity ID, and any number of matching payload fields.

When using payload fields, if you specify only the *FieldName* attribute, then both the parent and child regions must have matching payload values for that field. If you also specify the *TargetFieldName* attribute, then the *TargetFieldName* attribute applies to the parent as well as the child, meaning that the child region must have a payload value for the *FieldName* field that matches the payload value for the *TargetFieldName* field in the parent.

If a child has more than one potential parent, the parent with the earliest starting time is chosen.

### Example

The example below defines criteria for a parent. The parent must have a matching thread ID, and a payload value for the `SubscriberName` field in the child must match a value for the `Client` field in the parent.

``` syntax
<Region Guid="{A75D8F5D-E8F8-40b8-B453-5CC70DEAC06F}"
        Name="FastStartup-Suspend-Winlogon-CreateSession-Subscribers"
        FriendlyName="Subscribers for Create Session">
   <Start>
      <Event Provider="{dbe9b383-7cf3-4331-91cc-a3cb16a3b538}" Id="805" Version="0" />
      <PayloadIdentifier FieldName="Event" FieldValue="0" />
   </Start>
   <Stop>
      <Event Provider="{dbe9b383-7cf3-4331-91cc-a3cb16a3b538}" Id="806" Version="0" />
      <PayloadIdentifier FieldName="Event" FieldValue="0" />
   </Stop>
   <Match>
      <Event TID="true">
         <Payload FieldName="SubscriberName" TargetFieldName="Client" />
      </Event>
      <Parent TID="true">
         <Payload FieldName="SubscriberName" TargetFieldName="Client" />
      </Parent>
   </Match>
</Region>
```

### Self-nesting regions

*Self-nesting* is an optional feature that optimizes parent-child relationships.

A *self-nesting region* is one whose duration is contained wholly within the duration of a sibling region. This region effectively becomes a child of its longer-lasting sibling.

For example, assume that self-nesting is enabled for the following regions:

-   Parent region A

-   Child region B1, which starts at time 0 and stops at time 6

-   Child region B2, which starts at time 2 and stops at time 5

-   Child region B3, which starts at time 3 and stops at time 4

In this example, B2 becomes a child region of B1, and B3 becomes a child region of B2. When creating this type of parent-child relationship, the parent with the starting time closest to the child starting time is chosen.

To activate self-nesting, add a **SelfNest** node inside of the **Match** node.

The **SelfNest** node has no required parameters. You can, however, use the same matching parameters that are used to create ordinary parent-child relationships. For more information, see **Parent-child relationships** earlier in this topic.

### Examples

The following example defines a **Match** tag that simply invokes self-nesting:

``` syntax
<Match>
   <SelfNest />
</Match>
```

The following example defines a more complex self-nesting scenario that requires matching thread IDs and payload fields:

``` syntax
<Match>
   <SelfNest TID="true">
      <Payload FieldName="SubscriberName" />
   </SelfNest>
</Match>
```

### Instance names

You can assign a unique name to each instance of a matched region by using the **Naming** node. Naming is useful when you have a large number of instances of the same region or when you need to categorize regions based on other criteria. Instance names can be based on either payload fields or on relationships with other regions.

Instances can be named based on payload values by using the **PayloadBased** node within a **Naming** node. The **PayloadBased** node has one required attribute, *NameField*, that specifies the payload field whose values you want to use as instance names. These payload fields can be in either the starting or stopping point for the region.

Following is an example of a region with a payload-based **Naming** node:

``` syntax
<Region Guid="{9261872F-D3A7-4d80-BDE3-8479CC920639}"
        Name="FastStartup-Suspend-Winlogon-EndShell-CallSubscriber"
        FriendlyName="Call Subscriber for End Shell">
   <Start>
      <Event Provider="{dbe9b383-7cf3-4331-91cc-a3cb16a3b538}" Id="811" Version="0" />
      <PayloadIdentifier FieldName="Event" FieldValue="13" />
   </Start>
   <Stop>
      <Event Provider="{dbe9b383-7cf3-4331-91cc-a3cb16a3b538}" Id="812" Version="0" />
      <PayloadIdentifier FieldName="Event" FieldValue="13" />
   </Stop>
   <Match>
      <Event PID="true" />
      <Parent PID="true" />
   </Match>
   <Naming>
      <PayloadBased NameField="SubscriberName" />
   </Naming>
</Region>
```

In the preceding example, the **Naming** node indicates that either the starting or the stopping event contains a payload field named `SubscriberName`. For each instance of the region that is created, the instance name is the associated payload value.

**Note**  
When naming region instances, WPA first checks the starting event for the matching payload field. If one is not found, WPA will then search the stopping event for the payload field. If a match is not found in either event, an error is printed to the console.

 

Sometimes, the information in the payload is not the only information we want. For example, if the information in the payload contained is a device ID, we may wish to map this information back to a device description and name. Supported *Type* attributes are:

-   `Device`, associates a name and description

-   `GUID`, associates the GUID with the region

-   `CLSID`, associates a class name to the class ID

-   `PID`, associates the process name with the region

``` syntax
<Naming>
   <PayloadBased NameField="SubscriberName" Type="Device" />
</Naming>
```

If it is possible for the payload value to be found in both the starting and stopping points, you can use the optional *InstanceEndpoint* attribute to specify which point to use. Possible values for *InstanceEndpoint* are `Start` and `Stop`.

``` syntax
<Naming>
   <PayloadBased NameField="SubscriberName" InstanceEndpoint="Start" />
</Naming>
```

You can also name a region based on relationships with other regions. To associate with another region, add a **RegionBased** node to a **Naming** node. The **RegionBased** node has four required attributes:

-   *RegionGuid*, the GUID of the associated region.

-   *Relation*, a conditional value that describes the relationship between the region you are defining and the region with which you are associating. Currently, the only supported relationship is `IsPresent`, meaning that the conditional is true if the associated region is found somewhere in the trace.

-   *IfRelationTrue*, string value that is used as the instance name if the relationship described by *Relation* is true.

-   *IfRelationFalse*, string value that is used as the instance name if the relationship described by *Relation* is false.

The following example defines a region that has region-based naming. If a region with a matching GUID is found somewhere in the trace, then each instance of `Launch` is named `Warm`. Otherwise, each instance is named `Cold`.

``` syntax
<Region Guid="{C99EFA90-F645-4A24-9576-740351171BD0}"
        Name="WinStoreAppActivationDuration"
        FriendlyName="Launch">
   <Start>
      <Event Provider="{315a8872-923e-4ea2-9889-33cd4754bf64}" Id="5901" Version="0" />
      <PayloadIdentifier FieldName="SqmableContractID" FieldValue="Windows.Launch" />
   </Start>
   <Stop>
      <Event Provider="{315a8872-923e-43a2-9889-33cd4754bf64}" Id="5902" Version="0" />
      <PayloadIdentifier FieldName="SqmableContractID" FieldValue="Windows.Launch" />
   </Stop>
   <Match>
      <Event PID="true" />
   </Match>
   <Naming>
      <RegionBased RegionGuid="{1539A93E-129C-4602-A011-431E7F73A353}" Relation="IsPresent" IfRelationTrue="Warm" IfRelationFalse="Cold" />
   </Naming>
</Region>
```

**Note**  
You can see instance names in WPA by hovering the mouse over a region instance in the Regions of Interest graph.

 

### Metadata

You can add additional information to a region definition in the form of *metadata*, contained within a **Metadata** node. For example, you might include information in metadata that explains the region criteria so that another user can more easily understand the purpose of the region. Metadata is simply additional data—it does not affect the processing of regions.

WPA adds this metadata to each region instance in the chart view of the Regions of Interest graph. To view metadata for matched events in WPA, simply expand the region in the chart view, and scroll to the desired metadata. WPA assigns a unique number to the metadata, and the name of the node is displayed as the column information.

### Example

The following example includes a **Metadata** node in the region definition:

``` syntax
<Region Guid="{F466EE67-192C-4772-B13D-052CCD2D70B3}"
        Name="FastStartup-Suspend-Winlogon-Logoff-Subscribers"
        FriendlyName="Subscribers for Logoff">
   <Start>
      <Event Provider="{dbe9b383-7cf3-4331-91cc-a3cb16a3b538}" Id="805" Version="0" />
      <PayloadIdentifier FieldName="Event" FieldValue="3" />
   </Start>
   <Stop>
      <Event Provider="{db39b383-7cf3-4331-91cc-a3cb16a3b538}" Id="806" Version="0" />
      <PayloadIdentifier FieldName="Event" FieldValue="3" />
   </Stop>
   <Match>
      <Event>
         <Payload FieldName="Event" />
      </Event>
   </Match>
   <Naming>
      <PayloadBased NameField="SubscriberName" />
   </Naming>
   <Metadata>
      <FAS.TestNode>yes</FAS.TestNode>
   </Metadata>
</Region>
```

## Related topics


[Regions of Interest](regions-of-interest.md)

[WPA Features](wpa-features.md)

 

 







