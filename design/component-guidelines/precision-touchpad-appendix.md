---
title: Appendix
description: The appendix for the Windows Precision Touchpad Validation Guide, provides information about common error messages, along with some HID-specific ones.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 1E62A61A-DDFF-4533-AD40-04851EA2B295
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Appendix


The appendix for the Windows Precision Touchpad Validation Guide, provides information about common error messages, along with some HID-specific ones.

## Error messages


<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Error message #</th>
<th>Error message</th>
<th>Explanation</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>1</td>
<td>Explicitly failed by user.</td>
<td>Operator failed the iteration/test via hotkey.</td>
</tr>
<tr class="even">
<td>2</td>
<td>Failed too many iterations:</td>
<td>Too many iterations failed. Includes the number of failed iterations.</td>
</tr>
<tr class="odd">
<td>3</td>
<td>Received input at an unexpected time.</td>
<td>The test did not expect to receive data, but data was received. For example, this can happen in the [Z-Height Detection](z-height-detection.md) test.</td>
</tr>
<tr class="even">
<td>5</td>
<td>Received too many contacts:</td>
<td>Operator placed too few contacts down. Includes the number of detected contacts.</td>
</tr>
<tr class="odd">
<td>6</td>
<td>Received too few contacts:</td>
<td>Operator placed too many contacts down. Includes the number of detected contacts.</td>
</tr>
<tr class="even">
<td>7</td>
<td>Test didn't receive enough data.</td>
<td><p>If the error occurs on contact lift, then it indicates that the test required the contacts to last a certain duration, but that duration was not met.</p>
<p>If it occurs on contact down, then indicates that the test received a zero-contact frame as the first data – this can be caused by a non-capacitive button press, but is more likely a protocol error (device sending an empty frame).</p></td>
</tr>
<tr class="odd">
<td>9</td>
<td>Received unexpected contact.</td>
<td>On a test that requires a specific number of contacts, this indicates that a contact came down after a contact went up. All contact-downs should occur before all contact-ups.</td>
</tr>
<tr class="even">
<td>10</td>
<td>Geometry data outside expected range:</td>
<td>Only on <strong>Test.Geometry</strong>. Width and/or height were outside the range expected by the test. Includes the detected width and height in himetric units.</td>
</tr>
<tr class="odd">
<td>11</td>
<td>Contact displacement too large:</td>
<td>The contact’s overall x/y displacement was too large. Includes the detected displacement in himetric units.</td>
</tr>
<tr class="even">
<td>12</td>
<td>Interaction too short:</td>
<td>The interaction length (the time from first contact down to last contact up) was too short. Includes the detected interaction length in milliseconds.</td>
</tr>
<tr class="odd">
<td>13</td>
<td>Interaction too long:</td>
<td>The interaction length (the time from first contact down to last contact up) was too long. Includes the detected interaction length in milliseconds.</td>
</tr>
<tr class="even">
<td>14</td>
<td>Packet too far from edge:</td>
<td>Indicates that the first packet was too far from the edge of the touchpad. Includes the distance from the edge in himetric units.</td>
</tr>
<tr class="odd">
<td>15</td>
<td>Contact didn't move in straight line:</td>
<td>The contact deviated too much from a line of best fit. Includes the maximum detected deviation from the line in himetric units.</td>
</tr>
<tr class="even">
<td>16</td>
<td>Line drifted off axis too much:</td>
<td>Only applies to the <strong>Test.Linearity</strong> family of tests. The contact’s displacement in either X or Y was too large. Includes the deviation in himetric units.</td>
</tr>
<tr class="odd">
<td>17</td>
<td>Not enough separation of points:</td>
<td>Only applies to the <strong>Test.ConvergeDiverge</strong> family of tests. If converging, then the beginning points were too close to each other. If diverging, then the ending points were too close to each other.</td>
</tr>
<tr class="even">
<td>18</td>
<td>Too much separation of points:</td>
<td>Only applies to the <strong>Test.ConvergeDiverge</strong> family of tests. If converging, then the ending points were too close to each other. If diverging, then the beginning points were too close to each other. Includes the distance between points in himetric units.</td>
</tr>
<tr class="odd">
<td>20</td>
<td>Positional delta too large:</td>
<td>The position delta between two packets was too large for the test. Includes the detected delta in himetric units.</td>
</tr>
<tr class="even">
<td>23</td>
<td>Device doesn't support minimum number of contacts:</td>
<td>The device doesn’t support the required minimum number of contacts. Includes the number of supported contacts.</td>
</tr>
<tr class="odd">
<td>24</td>
<td>Device supports too many contacts:</td>
<td>The device supports more than the required maximum number of contacts. Includes the number of supported contacts.</td>
</tr>
<tr class="even">
<td>25</td>
<td>Packet not in expected position:</td>
<td>Only applies to the <strong>Test.PositionalAccuracy</strong> family of tests. Indicates that the packet’s location was not in the required position. Includes the packet’s location in himetric units.</td>
</tr>
<tr class="odd">
<td>26</td>
<td>No packets outside border region.</td>
<td>On tests that involve drawing a straight line with the precision contact rig, this indicates that the entire line was in the border region of the touchpad.</td>
</tr>
<tr class="even">
<td>27</td>
<td>Saw packet travel backwards.</td>
<td>Only applies to the <strong>Test.Linearity</strong> family of tests. Indicates that a packet was seen traveling backwards in relation to the rest of the packet stream.</td>
</tr>
<tr class="odd">
<td>28</td>
<td>Too low DPI:</td>
<td>Only on <strong>Test.InputResolution</strong>. Indicates that the logical range of X/Y on the touchpad, combined with its physical dimensions, do not support the required DPI. Includes the calculated DPI.</td>
</tr>
<tr class="even">
<td>29</td>
<td>Saw confidence bit set after cleared.</td>
<td>Only on <strong>Test.Confidence</strong>. Indicates that a contact was seen setting the confidence bit after it had been cleared for that contact.</td>
</tr>
<tr class="odd">
<td>30</td>
<td>Confidence bit set too long:</td>
<td>Only on <strong>Test.Confidence</strong>. Indicates that the confidence bit was not cleared early enough in the contacts lifetime. Includes the length of time the confidence bit was set in milliseconds.</td>
</tr>
<tr class="even">
<td>31</td>
<td>Too low percent of logical coordinates found:</td>
<td>Only on <strong>Test.InputResolution</strong>. The X or Y coordinate in packets received in a given iteration must include a minimum percent of the total range. Includes the percent actually found.</td>
</tr>
<tr class="odd">
<td>32</td>
<td>You must run this test elevated.</td>
<td>PTLogo should have been launched elevated for this test.</td>
</tr>
<tr class="even">
<td>33</td>
<td>Device does not support selective reporting.</td>
<td>Device does not support selective reporting.</td>
</tr>
<tr class="odd">
<td>34</td>
<td>Duplicate packets:</td>
<td>Only applies to the <strong>Test.Linearity</strong> family of tests. Indicates that two consecutive packets had the same X/Y location, even though the contact was moving. Includes the scan time of the detected duplicate packet.</td>
</tr>
<tr class="even">
<td>35</td>
<td>Logical coordinate not found:</td>
<td>Only on <strong>Test.InputResolution</strong>. Indicates that a required X or Y coordinate was never reported by any packet during the iteration. Includes the required coordinate in logical units.</td>
</tr>
<tr class="odd">
<td>36</td>
<td>Confidence always set.</td>
<td>Only on <strong>Test.Confidence</strong>. Indicates that the confidence bit was never cleared.</td>
</tr>
</tbody>
</table>

 

## HID-Specific Error Messages


Here's a table of the HID-specific error messages related to the Windows Precision Touchpad device tests.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>HID error #</th>
<th>Error message</th>
<th>Explanation</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>1</td>
<td>Invalid X bit size.</td>
<td>The bit count for Tx/Cx is outside the range [1,32]. Only checked if C is present.</td>
</tr>
<tr class="even">
<td>2</td>
<td>Invalid Y bit size.</td>
<td>The bit count for Ty/Cy is outside the range [1,32]. Only checked if C is present.</td>
</tr>
<tr class="odd">
<td>3</td>
<td><p>Invalid packet transition.</p></td>
<td><p>This error message can be presented along with any of the following others:</p>
<p>o &quot;Last move location different&quot;</p>
The coordinates of the 'tip switch clear' report for a given contact are not the same as the coordinates of the 'last tip switch set' report.
<p>o &quot;Missing tip-on&quot;</p>
The first report didn't have the tip switch set, or there were two packets in a row without the tip switch set.
<p>o &quot;Missing tip&quot;</p>
A contact present in the previously-reported frame, with the tip switch set, was not found in the current frame.</td>
</tr>
<tr class="even">
<td>4</td>
<td>Invalid scan time.</td>
<td><p>This error message can be presented along with any of the following others:</p>
<p>o &quot;(Not present)&quot;</p>
The device does not support the scan time usage in its descriptor.
<p>o &quot;(Range)&quot;</p>
The scan time reported is outside the logical range..
<p>o &quot;(Delta &gt; 10ms more than 1% of the time)&quot;</p>
The delta in scan time from frame to frame exceeds 10ms more than 1% of the time.
<p>o &quot;(Delta &gt; 16.7ms)&quot;</p>
The delta in scan time from frame to frame was larger than 16.7ms.
<p>o &quot;(Duplicate)&quot;</p>
The scan time was duplicated in two sequential frames.
<p>o &quot;(Differing values in frame)&quot;</p>
The scan time value was not identical for all reported contacts of a given frame.
<p>o &quot;(Drifted from wall clock)&quot;</p>
The deltas in scan time drifted too far from system time. Scan time deltas were greater than 5% of clock time.</td>
</tr>
<tr class="odd">
<td>5</td>
<td>Invalid X, Y.</td>
<td><p>This error message can be presented along with any of the following others:</p>
<p>o &quot;(Invalid T)&quot;</p>
With C, Width, or Height present, Tx and/or Ty were not present, or not within their logical range.
<p>o &quot;(Invalid C)&quot;</p>
With T, Width, or Height present, Cx and/or Cy were not present, or not within their logical range.
<p>o &quot;(Invalid T/C combo)&quot;</p>
T was not contained within bounding box formed by C, Width, and Height.</td>
</tr>
<tr class="even">
<td>6</td>
<td>Invalid width or height.</td>
<td><p>This error message can be presented along with any of the following others:</p>
<p>o &quot;&quot;</p>
Width and/or height was present, and either one was not present, or one/both were outside their logical range.
<p>o &quot;(0)&quot;</p>
Width and/or height were present, but the logical value for one/both was zero.</td>
</tr>
<tr class="odd">
<td>8</td>
<td>Invalid contact ID.</td>
<td><p>This error message can be presented along with any of the following others:</p>
<p>o &quot;(Not present)&quot;</p>
The device does not support the ContactID usage in its descriptor.
<p>o &quot;(Dupe in frame)&quot;</p>
A contact ID was duplicated in a single frame (sometimes caused by an incomplete frame being reported).</td>
</tr>
<tr class="even">
<td>14</td>
<td>No data in frame.</td>
<td>There were no contacts in the frame, and the physical button is not down, but the physical button was not previously up.</td>
</tr>
<tr class="odd">
<td>16</td>
<td>Invalid # of contacts in frame.</td>
<td>The number of contacts in the frame did not match the reported Actual Count.</td>
</tr>
<tr class="even">
<td>17</td>
<td>More than max contacts in frame.</td>
<td>The number of contacts in the frame exceeded the maximum number of contacts the device supports per MAX COUNT.</td>
</tr>
<tr class="odd">
<td>18</td>
<td>Sampling rate out of range.</td>
<td>The sampling rate was not in the allowed range for the number of contacts reported.</td>
</tr>
<tr class="even">
<td>21</td>
<td>Invalid actual count.</td>
<td>The device does not support the <strong>ActualCount</strong> usage in its descriptor.</td>
</tr>
<tr class="odd">
<td>22</td>
<td>Invalid confidence.</td>
<td>The confidence switch was not set (and the test was not the confidence test).</td>
</tr>
</tbody>
</table>

 

## PTLogo Command Line Switches


These switches can be combined and are useful for debugging purposes only. These switches are not permissible for a certification test run.

| Switch            | Usage                                                                                                                   | Purpose                                                                                                                                              |
|-------------------|-------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| -startat \#       | “Ptlogo.exe –startat \# test.foo.json” (where \# indications the specific iteration to start at for a given .json test) | Used to skip to a specific iteration in a given test.                                                                                                |
| -NoHIDValidation  | “Ptlogo.exe –noHidValidation test.foo.json”                                                                             | Used to disable background HID validation for a specific test.                                                                                       |
| -noDesktop        | “Ptlogo.exe –noDesktop test.foo.json”                                                                                   | Used to start the test on the same input desktop from where it was launched; useful for running digiinfo in the background or other debugging tools. |
| -alliters         | “Ptlogo.exe –alliters test.foo.json”                                                                                    | Used to allow the operator to go through all iterations of a test even if more than the maximum \# of permissible failed iterations have occurred    |
| -EnableHIDLogging | “Ptlogo.exe –enableHIDLogging test.foo.json”                                                                            | Used to enable HID logging during a specific test to generate a HID.log file for detailed debugging of failures.                                     |

 

 

 






