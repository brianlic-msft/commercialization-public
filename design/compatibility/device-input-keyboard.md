---
title: Device.Input.Keyboard
Description: 'Logo requirements detailing the implementation details of a keyboard important to Microsoft operating systems.'
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
# Device.Input.Keyboard

 - [Device.Input.Keyboard](#device.input.keyboard)
-->

<a name="device.input.keyboard"></a>
## Device.Input.Keyboard

*Logo requirements detailing the implementation details of a keyboard important to Microsoft operating systems.*

### Device.Input.Keyboard.BrowserMultimediaKeysUseMSApis

*Keys for Internet browser and multimedia must use Microsoft APIs.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

If a keyboard or peripheral implements multimedia or Internet browser keys, it must use the registry keys associated with the WM\_APPCOMMAND API to access those functions as described in the Windows Driver Kit. Registry keys can be programmed by using INF files to install special entries as defaults or through a customized interface provided to the user.

*Design Notes*

See the Microsoft Platform SDK, "WM\_APPCOMMAND."

### Device.Input.Keyboard.CharmsKey

*If any of the Windows Charms keys are implemented on keyboards, then it must implement the correct scan codes and proper glypths.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Keyboards that implement buttons to launch any of the Windows Charms must use the correct scan codes and glyphs on those buttons. The glyphs that go on the buttons are defined in the Windows Glyphs addendum to the Windows Logo License agreement for Hardware available at [*http://go.microsoft.com/fwlink/?LinkId=279574.*](http://go.microsoft.com/fwlink/?LinkId=279574.)

The charm button must send the correct scan code corresponding to the charm. No other glyph can be used on the button when using a scan code that relates to invoking one of the Windows 8 charms.

### Device.Input.Keyboard.DynamicKeyboards

*Dynamic keyboards must meet the requirements listed here.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

-   When a system is displaying the security desktop, a keyboard capable of altering the keycaps to reflect different glyphs or legends dynamically must present a keyboard layout to match the language the current user has active on the system.

-   When using a keyboard capable of altering the keycaps to reflect different glyphs or legends dynamically, the keyboards must reboot into the default system language layout as selected in Control Panel -&gt; Regional and Language Options -&gt; Keyboards and Languages.

-   When using a keyboard capable of altering the keycaps to reflect different glyphs or legends dynamically, the keyboards must change the keyboard layout and language as selected by a user at the login screen.

-   When using a keyboard capable of altering the keycaps to reflect different glyphs or legends dynamically, the keyboards must reflect the currently selected layout and language preference when the Windows desktop has focus.

-   When using a keyboard capable of altering the keycaps to reflect different glyphs or legends dynamically, the keyboard may allow for the repositioning of the Windows key; however, that key must remain visible to user in all configurations/layouts. By default, this key must be present in the lower left of the keyboard, between the control and alternate keys when at a login, welcome, or password entry screen. Once the user has logged in, the location of the key may be repositioned by user preference.

-   When using a keyboard capable of altering the keycaps to reflect different glyphs or legends dynamically, the displayed keyboard layout and language must match the installed language of the operating system.

-   A self-powered keyboard capable of altering the keycaps to reflect different glyphs or legends dynamically, must allow for the keyboard to be reset via a switch or keystroke sequence, independently of a software reset or power cycling of the device.

### Device.Input.Keyboard.HotKeyFunctionAPI

*Devices that implement Hot-Key functionality must implement the corresponding API notifications.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Pointing and drawing devices and keyboards, that implement buttons used as application or function hot keys for which there exists WM\_APPCOMMAND API shall implement the corresponding API notification. 
This includes, but is not limited to the following functions:

-   Volume up/down

-   Mute

-   Browser back/forward

-   Play/pause

*Design Notes*

Best practices for supporting pointing and drawing devices and keyboards can be found at <http://msdn.microsoft.com/en-us/library/ms997498.aspx>.
API for WM\_APPCOMMAND notifications can be found at <http://msdn.microsoft.com/en-us/library/ms646275.aspx>.
HID Usage Page and ID information for these functions can be found at <http://www.microsoft.com/whdc/archive/scancode.mspx> and <http://www.usb.org/developers/hidpage>.
 

### Device.Input.Keyboard.KernelModeDriversUseWdfKmdf

*Keyboard kernel-mode drivers must use the WDF-KMDF.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

Third-party keyboard kernel-mode drivers must be ported to the WDF KMDF model.

### Device.Input.Keyboard.LogoFlagKey

*Windows symbol key is implemented on all keyboards supporting more than 50 keys. The Windows symbol design is required after December 31<sup>st</sup>, 2013.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

All keyboards that support more than 50 keys must implement the Windows Symbol key. The printed Windows flag logo version of the key design may be logo qualified on mobile systems and standalone keyboards until the transition date. The Windows flag trademark must be clearly distinguished on the key top according to *The Microsoft Windows Logo Key Logo License Agreement* and the "Key Support, Keyboard Scan Codes, and Windows" document at <http://go.microsoft.com/fwlink/?LinkId=116451>.

### Device.Input.Keyboard.MultipleKeyboard

*No interference occurs between multiple keyboards.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

If the system includes more than one keyboard, there must be no conflicts. For example, a docked mobile computer can have more than one keyboard attached to the system. The keyboard ports on a mobile computer and a docking station must be able to resolve conflicts between the two ports when the mobile computer is docked.

### Device.Input.Keyboard.ScanCode

*Scan codes must comply with industry standards.*

<table>
<tr>
<th>Applies to</th>
<td>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x64</p>
<p>Windows 10 for desktop editions (Home, Pro, Enterprise, and Education) x86</p>
<p>Windows 10 Mobile ARM</p>
<p>Windows 10 Mobile x86</p>
<p>Windows Server 2016 x64</p>
</td></tr></table>

**Description**

The following are requirements for a keyboard design that includes any Windows logo keys:

-   The keyboard must be developed according to technical requirements in "Key Support, Keyboard Scan Codes, and Windows."

-   The keyboard must be compatible at the Windows virtual key-code level.

-   The Windows logo key must function as a modifier (CTRL, SHIFT, or ALT).

-   Keyboard manufacturers must use consumer control or vendor-specific, top-level collections for HID hot buttons.

*Design Notes*

See "Key Support, Keyboard Scan Codes, and Windows" at <http://go.microsoft.com/fwlink/?LinkId=36767>.
Additional software or drivers can be written to provide software remapping functionality.

