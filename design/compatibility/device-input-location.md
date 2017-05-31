---
title: Device.Input.Location
Description: 'Windows 10 location drivers can implement either GNSS drivers that are integrated with the legacy sensor class extension driver or GNSS drivers that integrate with the GNSS DDI introduced in Windows 10.'
ms.assetid: 
MSHAttr: 
author: beneluxboy
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

<!--
# Device.Input.Location

 - [Device.Input.Location](#device.input.location)
-->

<a name="device.input.location"></a>
## Device.Input.Location

*Windows 10 location drivers can implement either of the following driver models.*

-   GNSS drivers integrating with the legacy sensor class extension driver

*OR*

-   GNSS driver integrating with the GNSS DDI introduced in Windows 10

### Device.Input.Location.ActiveTracking (If Implemented)

*Active tracking breadcrumbing*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

This requirement allows a GNSS chip to actively track a user’s location based on breadcrumbing technology. The OS will offload breadcrumbing to the hardware and receive user location when needed. This features enables the OS to gather a user’s location history in a more granular manner.

### Device.Input.Location.AssistedGNSS (If Implemented)

*Only relevant if the hardware uses the location stack for Assisted GNSS of the given type.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

Assistance to the GNSS receiver is used to enable the receiver to acquire a position faster, to enable acquisition even in cases of very weak signal, and do so at lower power. The Location platform supports providing the GNSS device with a coarse position, approximate time, and it can also serve as a proxy of the proprietary ephemeris formats supported by the GNSS device.

### Device.Input.Location.Base

*Location devices must support the following basic functionality.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

Location devices must be able to interact correctly with the platform to receive location requests and provide a response with a position or an error. The exchange of capabilities must supported, as well as the configuration commands, for whichever functionality is present and mandatory in the driver interface. All location devices need to ensure that they report location data at an interval determined by the type of location session and the location session parameters. The application desired accuracy and other session parameters should be considered to provide location data as efficiently as possible.

As two driver models are supported, we have requirements specific requirements and tests for each.

***For GNSS drivers integrating with the legacy sensor class extension driver ***

The GNSS device must support the following basic requirements:

<html><!--edit: improve layout and tagging of these lists, tables, and blockquotes-->
    <ul>
        <li><p><strong>Data Field Support for Location Reports</strong></p></li>
    </ul>
    <blockquote>
        <p>- The Location API exposes location data through standard built-in reports. These reports are populated from location sensors that the Location API manages automatically.</p>
        <p>- Location sensor devices that report their category as SENSOR_CATEGORY_LOCATION (though Device Driver Interfaces ISensorDriver::OnGetSupportedSensorObjects and IsensorDriver::OnGetProperties()) must support one of the built-in reports so that the location API can manage the sensor and report its data. Each built-in report has a set of expected data fields (though Device Driver Interface IsensorDriver::OnGetSupportedDataFields() and IsensorDriver::OnGetDataFields()) that the Location API looks for.</p>
        <p>- All built-in reports require SENSOR_DATA_TYPE_TIMESTAMP to be provided in addition to the designated fields. This field reports the time the data was collected in UTC.</p>
        <p>- The Location API supports a built-in report: the LatLongReport, which requires in the response measurements for the Latitude/Longitude (lat/long) and an Error.  Support for the LatLongReport is required for all location sensors.</p>
        <p>To support LatLongReport, the following fields are required:</p>
    </blockquote>
    <table>
        <thead>
            <tr class="header">
                <th>Data field</th>
                <th>Data type</th>
                <th>Details</th>
            </tr>
        </thead>
        <tbody>
            <tr class="odd">
                <td>SENSOR_DATA_TYPE_LATITUDE_DEGREES</td>
                <td>VT_R8</td>
                <td>Shows the current latitude in degrees, which must be in the range [-90, +90]</td>
            </tr>
            <tr class="even">
                <td>SENSOR_DATA_TYPE_LONGITUDE_DEGREES</td>
                <td>VT_R8</td>
                <td>Shows the current longitude in degrees, which must be in the range [-180, +180]</td>
            </tr>
            <tr class="odd">
                <td>SENSOR_DATA_TYPE_ERROR_RADIUS_METERS</td>
                <td>VT_R8</td>
                <td>The actual latitude and longitude must be within a circle, with this radius (in meters) drawn around the reported (latitude, longitude). Enables the Location API to prioritize sensors; it should be updated dynamically and must be non-zero and positive.</td>
            </tr>
        </tbody>
    </table>
    <p>As part of the LatLongReport, the following fields are optional, but must be reported when available:</p>
    <table>
        <thead>
            <tr class="header">
                <th>Optional Data field</th>
                <th>Data type</th>
                <th>Details</th>
            </tr>
        </thead>
        <tbody>
            <tr class="odd">
                <td>SENSOR_DATA_TYPE_ALTITUDE_ELLIPSOID_METERS</td>
                <td>VT_R8</td>
                <td>The altitude with regards to the WGS84 ellipsoid (in meters)</td>
            </tr>
            <tr class="even">
                <td>SENSOR_DATA_TYPE_ALTITUDE_ELLIPSOID_ERROR_METERS</td>
                <td>VT_R8</td>
                <td>The error of the current altitude measurement (in meters)</td>
            </tr>
        </tbody>
    </table>
    <blockquote>
        <p>
            <br />
            Important: The Location API supports an additional set of data fields (which correspond to NMEA data fields). For more information, see the Sensors topic in the Device and Driver Technologies section of the WDK.
        </p>
    </blockquote>
    <p> </p>
    <blockquote>
        <p>The requirement below ensures that the driver raises location report events in the correct manner. If the correct behavior is not followed, the Location API will block the sensor, and client applications will not receive data.</p>
    </blockquote>
    <ul>
        <li>
            <p>
                <strong>Generating Sensor Data Reports</strong></p>
                <p>The device must be able to generate a series of valid ISensorDataReports for one of or both of the two Location Reports types. Each report generated must contain at least the minimum data fields for the report type.<br />
                The Sensor and Location Platform will rely on data provided to the platform via device drivers that have implemented the Sensor Device Driver Interface. In most cases devices will be verified by using the Sensor and Location Platform.
            </p>
        </li>
        <li>
            <p>
                <strong>Notes about settable properties</strong></p>
                <p>The following settable properties must be utilized in the device driver as filtering and power management criteria. Both properties must be tracked on a per-client basis.
            </p>
        </li>
    </ul>
    <blockquote>
        <p>The properties are required to be implemented as settable:</p>
    </blockquote>
    <table>
        <thead>
            <tr class="header">
                <th>Property</th>
                <th>Data type</th>
                <th>Details</th>
            </tr>
        </thead>
        <tbody>
            <tr class="odd">
                <td>SENSOR_PROPERTY_CURRENT_REPORT_INTERVAL</td>
                <td>VT_UI4</td>
                <td>Sets the minimum frequency (in milliseconds) that a client wants to receive data reports from the sensor.</td>
            </tr>
            <tr class="even">
                <td>
                    SENSOR_PROPERTY_LOCATION_DESIRED_ACCURACY<br />
                </td>
                <td>VT_UI4</td>
                <td>
                    Sets a hint as to how accurate the driver should strive to be.<br />
                    DESIRED_ACCURACY_DEFAULT: The sensor should optimize power and other cost considerations. GNS sensors will not be enumerated by the Location API unless location data is unavailable from other providers on the system or data accuracy is less than 500m.<br />
                    DESIRED_ACCURACY_HIGH: The sensor should deliver the highest accuracy report possible. The Location API will always connect to all location sensors (including GNSS) in order to acquire the most accurate position possible.
                </td>
            </tr>
        </tbody>
    </table>
    <p><em><strong>For GNSS driver integrating with the GNSS DDI introduced in Windows 10</strong></em></p>
    <p>The GNSS device must support the following basic requirements:</p>
    <table>
        <thead>
            <tr class="header">
                <th><strong>Platform and Driver Capability Exchange</strong></th>
                <td>
                    <p>Check for the exchange between the platform (GNSS_SEND_PLATFORM_CAPABILITY) and the driver (GNSS_GET_DEVICE_CAPABILITY) regarding their respective capabilities. The expectation is that the driver correctly sends to the platform its device capabilities, given that the location platform will adapt its behavior accordingly.</p>
                    <p>Capabilities such as distance tracking, and geofencing shall only be declared when they can be offloaded to the GNSS device, this is, when they do not require the application processor to do the tracking.</p>
                </td>
            </tr>
        </thead>
        <tbody>
            <tr class="odd">
                <td><strong>Driver Command check</strong></td>
                <td>Check that the basic driver commands that are required for both product and test enablement. Like, ClearAgnssData.</td>
            </tr>
            <tr class="even">
                <td><strong>Basic Single Shot check</strong></td>
                <td>Begins a single shot session and runs until a final fix is received. Expect that a final fix is delivered within 2 minutes. Assistance data could be available in this case. In case assistance data is available a final fix is expected to be delivered in 10 seconds.</td>
            </tr>
            <tr class="odd">
                <td><strong>Totally standalone basic single shot check</strong></td>
                <td>Ensures that a driver that is in a ‘cold state’, and does not have access to AGNSS of any type, can still achieve a final fix for a single shot request. Expect that a final fix is delivered within 2 minutes.</td>
            </tr>
            <tr class="even">
                <td><strong>Single Shot Multiple Adjacent Session check</strong></td>
                <td>Checks that one hundred single shot sessions can be run one after another without any issues. Expect that every single shot session reaches a final fix without issue.</td>
            </tr>
        </tbody>
    </table>
</html>


### Device.Input.Location.Geofencing (If Implemented)

*This requirement is only supported if the hardware supports Geofencing and the GNSS driver is integrating with the GNSS DDI introduced in Windows 10.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

This requirement allows the GPS to define geographical boundaries or virtual barriers. It allows an administrator of a mobile device to trigger actions or notifications when a device enters or leaves the geofence. Practical uses include the ability for a retail store owner to create a geofence around the retail store and send coupons to a customer with the retail store app on his/her mobile device.

If implemented, the device must be able to support the following requirements.

| **Geofence basic **    | GeoFence can be successfully added and deleted. Must check for consistency.                                                                                                                     |
|------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| **Geofence track 1**   | Add a Geofence around your current position with UNKNOWN state and verify ENTRY event.                                                                                                          |
| **Geofence track 2**   | Add a Geofence with ENTERED state such that your current position is just outside the Geofence. Verify Exit event.                                                                              |
| **Geofence track 3**   | Add a Geofence around your current position with ENTERED state and verify that no event is triggered                                                                                            |
| **Geofence track 4**   | Add a Geofence with EXITED state such that your current position is just outside the Geofence. Verify no event is triggered.                                                                    |
| **Geofence track 5**   | Add a Geofence around your current position with UNKNOWN state and Alert Type as EXIT only and verify that no event is recieved                                                                 |
| **Geofence track 6**   | Add a Geofence (with Entered state) such that your current position is just outside the Geofence and set the Alert type to ENTER and verify that NO event is recieved                           |
| **Reliability**        | Obtains the maximum number of geofences that the hardware supports. Set this maximum number of Geofences around current position with unknow state and expect that number of entry/exit events. |
| **Geofence purge **    | Add multiple Geofences and then purge them all at once. Must check for consistency.                                                                                                             |
| **Geofence negative ** | Add a Geofence with bad (Zero radius) parameters.                                                                                                                                               |
| **Geofence boundary ** | Add a Geofence with very small radius (5m).                                                                                                                                                     |

### Device.Input.Location.SUPL (If Implemented)

*This requirement is applicable only to a GNSS driver integrating with the GNSS DDI introduced in Windows 10.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The Secure User Plane Location (SUPL) client must be implemented by the IHV to support Mobile Operator requirements. The driver interface provides mechanisms to configure the SUPL client, with the information obtained for the Mobile Operator. The only SUPL configurations supported by the Location Platform are those associated to a Mobile Operator, and only one SUPL configuration is supported at a time.

The tests in this section ensures that the SUPL client is able to receive SUPL configuration commands from the Location Platform. There are no tests in the HLK to validate the integration between the GNSS driver and the Location Platform for the support of user notifications upon reception of NI (Network Initiated) location requests. Such validations will need to be done using dedicated systems and test suites that validate SUPL OMA conformance.

### Device.Input.Location.V2PUL (If Implemented)

*This requirement is applicable only to a GNSS driver integrating with the GNSS DDI introduced in Windows 10.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
</td></tr></table>

**Description**

The V2 User Plane Location (V2UPL) requirement applies only to devices with CDMA cellular connections, and if required by the Mobile Operator.
