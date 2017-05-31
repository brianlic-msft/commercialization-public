---
author: kpacquer
Description: Test an update
ms.assetid: cdeecf1c-a239-4d7a-87b8-a366e8e26f06
MSHAttr: 'PreferredLib:/library/windows/hardware'
title: Test an update
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Test an update


Update testing should begin when your first image is being developed.  Test that your drivers, preloaded apps, and other content can be updated throughout the process.

During the phase when you are building test images, you should perform local testing of updates, run the compatibility tests before and after the update, and look for the same results.  This is a time when you can more easily test a full breadth of phone features with automation and discover update issues early.  Do not wait until you are nearing manufacturing and retail device testing.

Over the Air (OTA) updates can only be tested on retail device, which is more difficult to do because of the higher security on a retail device.  Therefore, it is important that you perform deep functional testing on the test images, and focus your testing on retail phones to ensure that the OTA update is successful by following the guidance in the Network testing of updates section.

OEMs must ensure the quality of an OEM update by fully testing the update before submitting it to Microsoft. As a minimum, the OEM must do the following.

-   Verify that the packages that are updated do not contain any test certificates when testing a retail image.

-   Verify that the firmware revision numbers have changed properly by navigating to **Settings** &gt; **System** &gt; **about** on the device. For more info about versioning information, see [Update requirements](update-requirements.md).

-   Verify that the OEM update package works as designed.

-   Test the update on device that have user data to make sure that their data is preserved. The following are some examples of tests that you can perform to ensure that user data has not been modified after an update.

    -   All user settings are the same.

    -   Start screen tiles have the same position and size.

    -   User data is still on the device (pictures, apps, SMS history, music files, video files, etc.)

## <span id="Local_testing_of_updates"></span><span id="local_testing_of_updates"></span><span id="LOCAL_TESTING_OF_UPDATES"></span>Local testing of updates


Before you submit the update, test it locally. On a PC that you will use during the tests, perform the following steps:

1.  Deploy the updated test packages to the device. You can receive the update packages from the update that has already been approved for testing by using the [Get-SignedFirmwareSubmission cmdlet](get-signedfirmwaresubmission-cmdlet.md).

2.  Verify that the update was successful and that it had no unintentional effects on the behavior of the device.

## <span id="Network_testing_of_updates"></span><span id="network_testing_of_updates"></span><span id="NETWORK_TESTING_OF_UPDATES"></span>Network testing of updates


To prepare to receive an update from the Microsoft test update server, complete the following steps.

1.  Obtain a test update provisioning package from Microsoft after you have signed up to submit requests for firmware and update submissions.

2.  Apply the provisioning package to the device by using IUTool.exe.

3.  Establish a connection to a cellular or Wi-Fi network with the device and attach the device to a charger.

    **Note**  
    We recommend using Wi-Fi to download the update so that you do not run into any constraints with your mobile operator when testing. Mobile operators can specify update download size limits when using their cellular data connection.

     

4.  Initiate the update process via **Settings** &gt; **Update & recovery** &gt; **Phone update**.

5.  When the updates are presented, follow the prompts and complete the update process.

6.  Verify that the update was successful and that it had no unintentional effects on the behavior of the device.

## <span id="Test_cases_for_features_after_an_update"></span><span id="test_cases_for_features_after_an_update"></span><span id="TEST_CASES_FOR_FEATURES_AFTER_AN_UPDATE"></span>Test cases for features after an update


### Wi-Fi

Prerequisites: None

Test steps:

<ol>
<li><p>In the App list, tap <strong>Settings</strong> &gt; <strong>Network &amp; wireless</strong> &gt; <strong>Wi-Fi</strong>.</p></li>
<li><p>Select a secured wireless network. Sign in with the appropriate credentials.</p></li>
<li><p>Verify that the status to the network is shown as “Connected.”</p></li>
<li><p>Verify that the <strong>Wi-Fi</strong> icon at the top of the device appears as expected.</p>
<div class="alert">
<strong>Note</strong>  
<p>The icon should flash while the device is connecting and remain solid after the phone is connected. The icon may disappear for a few seconds after the device is connected. The icon can be displayed again by tapping the middle of the top screen.</p>
</div>
<div>
 
</div></li>
<li><p>Tap <strong>Start</strong>, and then tap <strong>Internet Explorer</strong>.</p>
<div class="alert">
<strong>Note</strong>  
<p>When the browser is launched for the first time, a dialog will pop up asking to “Use the recommended settings?” Tap the <strong>Recommended</strong> button.</p>
</div>
<div>
 
</div></li>
<li><p>Tap the address bar and enter a website URL. Tap the enter key on the virtual keyboard to go to the site.</p></li>
<li><p>Verify that the page is loaded.</p></li>
<li><p>Tap <strong>Start</strong> to return to the Start screen, and then in the App list, tap <strong>Settings</strong> &gt;<strong>Network &amp; wireless</strong> &gt; <strong>Wi-Fi</strong>.</p></li>
<li><p>Select and connect to an unsecured wireless network.</p></li>
<li><p>Press <strong>Start</strong> to return to the Start screen, and then tap <strong>Internet Explorer</strong>.</p></li>
<li><p>Tap the address bar and enter a different website URL.</p></li>
<li><p>Verify that the page is loaded properly.</p></li>
<li><p>Tap <strong>Start</strong> to return to the Start screen, and in the App list, tap <strong>Settings</strong> &gt;<strong>Network &amp; wireless</strong> &gt; <strong>Wi-Fi</strong> &gt; <strong>manage</strong>.</p></li>
<li><p>Verify that both of the network names are present in the list of Known Networks.</p></li>
<li><p>Tap and hold <strong>Open network</strong>.</p></li>
<li><p>Tap <strong>delete</strong>.</p></li>
<li><p>Verify that the device connects to the secured network automatically from Step 2.</p></li>
</ol>

### Maps

Prerequisites: None

Test steps:

<ol>
<li><p>In the App list, tap <strong>Maps</strong>.</p></li>
<li><p>Verify that the location prompt appears when Maps is launched for the first time.</p></li>
<li><p>Tap <strong>Allow</strong> to enable location awareness. The app will load the current location.</p></li>
<li><p>When Maps is completely loaded, verify the following.</p>
<ol>
<li><p>The map is zoomed in so that roads in the local area are visible.</p></li>
<li><p>The <strong>Me</strong> icon (diamond or circle shaped) is placed at the phone location.</p></li>
<li><p>The circle in the center of the <strong>Me</strong> icon should match the color of the phone theme.</p></li>
</ol></li>
<li><p>Verify that the Maps app bar is displayed at the bottom with the following four buttons.</p>
<ol>
<li><p><strong>Scout</strong> (the button is a row of buildings).</p></li>
<li><p><strong>Directions</strong> (the button is an arrow).</p></li>
<li><p><strong>Me</strong> (the button is a circle inside a circle).</p></li>
<li><p><strong>Search</strong> (the button is a magnifying glass).</p></li>
</ol>
<div class="alert">
<strong>Note</strong>  
<p>For some of the images, Scout is not available.</p>
</div>
<div>
 
</div></li>
<li><p>Pan the map away from the device location and then tap on the <strong>Me</strong> button. Verify that the map returns the phone location with the <strong>Me</strong> icon at the center.</p></li>
<li><p>Tap the <strong>Scout</strong> button. Verify that Local Scout loads within several seconds and the <strong>eat+drink</strong> pivot is displayed, with a list of businesses that offer food and drink.</p>
<ol>
<li><p>Verify that each item displayed in the <strong>eat+drink</strong> pivot includes the business name and address.</p></li>
<li><p>Verify that Scout loads with two other pivots, <strong>see+do</strong> and <strong>shop</strong>.</p></li>
</ol></li>
<li><p>Return to the Map application, and then tap the <strong>Directions</strong> button.</p>
<ol>
<li><p>Leave the Start field defaulted to “my location.”</p></li>
<li><p>Tap on the End field and enter an end point (Seattle). Press the enter key on the virtual keyboard to get the directions.</p></li>
<li><p>Verify that the step-by-step directions are shown in a list form, with a map stripe at the top.</p></li>
<li><p>The Map should show an “A” at the start point.</p></li>
<li><p>Scroll through the directions. Verify that the map updates to show each new direction.</p></li>
<li><p>Scroll to the end. Verify that the map shows “B” at the end point.</p></li>
</ol></li>
<li><p>Return to the Map application. Tap the <strong>Search</strong> button.</p>
<ol>
<li><p>Enter the search term, “Restaurants in Seattle.” Tap the enter key on the virtual keyboard to execute the search.</p></li>
<li><p>Verify that up to 10 search results are displayed as pins on the map, and the first pin is expanded so that you can see its name. (The name may be cut off at the right edge).</p></li>
</ol></li>
</ol>

### Lock Screen testing

Prerequisites: None

Test steps:

<ol>
<li><p>In the App list, tap &gt; <strong>Settings</strong> &gt;<strong>Personalization</strong> &gt; <strong>Lock screen</strong>.</p></li>
<li><p>Set the “Screen times out after” field to “30 seconds.”</p></li>
<li><p>Leave the device idle for 30 seconds. After the screen goes to sleep, press and swipe the screen to verify that nothing happens and that the device is locked.</p></li>
<li><p>Press the Power button to unlock the device. Swipe up to unlock the screen.</p></li>
<li><p>Verify that the device unlocked successfully.</p></li>
<li><p>On the Lock Screen, turn the Password to “On.”</p></li>
<li><p>Create a password.</p></li>
<li><p>Leave the phone idle for 30 seconds. After the screen goes to sleep, press and swipe the screen to verify that nothing happens and the device is locked.</p></li>
<li><p>Press the Power button to unlock the device. Swipe up to unlock the screen. Verify that the prompt to enter password appears.</p></li>
<li><p>Enter an incorrect password. Verify that the device does not unlock and the correct password must be entered.</p></li>
<li><p>Enter the correct password. Verify that the device unlocks successfully.</p></li>
</ol>

### Capturing photos with the camera

Prerequisites: None

Test steps:

<ol>
<li><p>Lock the device and leave it idle to put it into Sleep Mode.</p></li>
<li><p>Press and hold the Camera hardware key to launch the camera. Then, verify that the camera launches either the default camera app or the camera app. Tap <strong>Cancel</strong> in the &quot;Allow the camera to use your location&quot; screen.</p>
<div class="alert">
<strong>Note</strong>  
<p>If the phone does not have a camera hardware button, launch the camera app directly.</p>
</div>
<div>
 
</div>
<div class="alert">
<strong>Note</strong>  
<p>The “Allow…location” prompt will remember the previous settings and may not appear if the camera has been used recently.</p>
</div>
<div>
 
</div></li>
<li><p>Verify that by default the camera is set to &quot;Picture&quot; mode.</p></li>
<li><p>Pinch in and out with your fingers on the camera screen and verify that the camera screen zooms in and out.</p></li>
<li><p>If your device has a camera hardware key, press and hold it half way and verify that a rectangular box is displayed on the screen for the auto-focus feature. Also verify that an audible tone is heard when camera focus is complete.</p></li>
<li><p>Tap on the screen or press the camera hardware button and verify that an audible tone is heard after taking a picture.</p></li>
<li><p>Swipe left to review the picture that you just took and examine for the following.</p>
<ol>
<li><p>Color errors.</p></li>
<li><p>Dust under the camera window. You will notice this if there are darker areas in the photo.</p></li>
<li><p>Blurry images</p></li>
<li><p>An excessively bright or dull image. This suggests that something is wrong with the camera sensor.</p></li>
</ol></li>
</ol>

### Recording videos with the camera

Prerequisites: None

Test steps:

<ol>
<li><p>Lock the device and leave it idle to put it into Sleep Mode.</p></li>
<li><p>Press and hold the Camera hardware key to launch the camera or launch the app directly from the Apps list. Tap <strong>Cancel</strong> in the &quot;Allow the camera to use your location&quot; screen.</p>
<div class="alert">
<strong>Note</strong>  
<p>If the device does not have a camera hardware button, launch the camera app directly.</p>
</div>
<div>
 
</div>
<div class="alert">
<strong>Note</strong>  
<p>The “Allow…location” prompt will remember previous settings and may not appear if the camera has been used recently.</p>
</div>
<div>
 
</div></li>
<li><p>Change to video capture mode.</p></li>
<li><p>Pinch in and out with fingers on the screen and verify that the camera screen zooms in and out.</p></li>
<li><p>If the device has a camera hardware button, press it to start recording a video.</p></li>
<li><p>Verify that there is a beep alert and the counter for the recording starts.</p></li>
<li><p>If the device has a camera hardware button, press it again to stop recording video after 15 seconds.</p></li>
<li><p>Swipe left on the camera screen and press <strong>Play</strong> on the captured video.</p></li>
<li><p>Verify that the video is captured properly and plays for 15 seconds.</p></li>
</ol>

### Front facing camera

Prerequisites: None

Test steps:

<ol>
<li><p>Lock the device and leave it idle to put the phone into Sleep Mode.</p></li>
<li><p>Press and hold the camera hardware key to launch the camera. Tap <strong>Cancel</strong> in the &quot;Allow the camera to use your location&quot; screen.</p>
<div class="alert">
<strong>Note</strong>  
<p>If the device does not have a camera hardware button, launch the camera app directly.</p>
</div>
<div>
 
</div>
<div class="alert">
<strong>Note</strong>  
<p>The “Allow…location” prompt will remember the previous settings and may not appear if the camera has been used recently.</p>
</div>
<div>
 
</div></li>
<li><p>Verify that by default the camera should be set to &quot;Picture&quot; mode with the rear-facing camera.</p></li>
<li><p>On the app bar, tap the <strong>Front-Facing</strong> icon</p></li>
<li><p>Verify that the front-facing <strong>camera</strong> icon is now highlighted.</p></li>
<li><p>Pinch in and out with your fingers on the camera screen and verify that the camera screen zooms in and out.</p></li>
<li><p>Press the camera hardware key all the way down, or tap the screen to take a picture if the device doesn’t have a hardware button.</p></li>
<li><p>Verify that an audible tone is heard after taking the picture.</p></li>
<li><p>Swipe left to review the picture that you just took and examine for the following.</p>
<ol>
<li><p>Color errors.</p></li>
<li><p>Dust under the camera window. You will notice this if there are darker areas in the photo.</p></li>
<li><p>Blurry images.</p></li>
<li><p>An excessively bright or dull image. This suggests that something is wrong with the camera sensor.</p></li>
</ol></li>
</ol>

### Calling with a Bluetooth device

Prerequisites: 

<ul>
<li><p>Bluetooth device to connect to the test device</p></li>
<li><p>Second phone to test call functionality.</p></li>
</ul>

Test steps:

<ol>
<li><p>In the App list, tap <strong>Settings</strong> &gt; <strong>Devices</strong> &gt;<strong>Bluetooth</strong>, Turn Bluetooth on.</p></li>
<li><p>Connect/pair a Bluetooth device with the test device</p></li>
<li><p>Call the test device</p></li>
<li><p>Verify that the call appears on the test device with an on-screen notice.</p></li>
<li><p>Verify that the call ringtone can be heard through the Bluetooth device that is connected with the test device</p></li>
<li><p>Answer the call on the test device using the connected Bluetooth device.</p></li>
<li><p>Verify that the audio from the second device can be heard on the test device through the Bluetooth device.</p></li>
<li><p>Verify that the audio from the test device through the Bluetooth device can be heard on the second device.</p></li>
<li><p>End the call using the Bluetooth device.</p></li>
</ol>

### Bluetooth and NFC (Tap+Send)

Prerequisites: 

<ul>
<li><p>Bluetooth must be turned on.</p></li>
<li><p>Second phone to verify tap+send functionality.</p></li>
</ul>

Test steps:

<ol>
<li><p>Go to <strong>Photos</strong> &gt; <strong>Albums</strong> and select a photo.</p></li>
<li><p>Select the options for the Photo.</p></li>
<li><p>Share the photo through NFC/Tap+send.</p></li>
<li><p>A pop-up screen for transfer will appear on the second device. Tap <strong>Accept</strong> and wait for the transfer to finish.</p></li>
<li><p>Go to <strong>Photos</strong> &gt; <strong>Albums</strong> &gt; <strong>Saved Pictures</strong>.</p></li>
<li><p>Verify that the transferred photo appears in the album.</p></li>
</ol>

### Proximity Sensor

Prerequisites: None

Test steps:

<ol>
<li><p>On the Start screen, tap <strong>Phone</strong>.</p></li>
<li><p>Make a call to the second device</p></li>
<li><p>Put your finger over the earpiece area. Verify that the display turns off.</p></li>
<li><p>Disconnect the call.</p></li>
</ol>

### Video streaming

Prerequisites: 

<ul>
<li><p>The device must be connected to Wi-Fi or have an internet connection to use the web browser.</p></li>
<li><p>A second device to call with.</p></li>
<li><p>A Bluetooth device.</p></li>
</ul>

Test steps:

<ol>
<li><p>On the Start screen, tap <strong>Internet Explorer</strong>.</p>
<div class="alert">
<strong>Note</strong>  
<p>When the browser is launched for the first time, a dialog will pop up asking to &quot;Use recommended settings?&quot; Tap the <strong>Recommended</strong> button.</p>
</div>
<div>
 
</div></li>
<li><p>Tap the address bar and go to a website that supports videos.</p></li>
<li><p>Select a video from the website and tap <strong>play</strong>.</p></li>
<li><p>Verify that the video starts buffering and eventually starts playing. Depending on the network connection speed, it may take 15-20 seconds for the video to start playing.</p></li>
<li><p>Tap the <strong>Pause</strong> button on the video screen.</p></li>
<li><p>Verify that the video is paused.</p></li>
<li><p>Tap the <strong>Play</strong> button on the video screen.</p></li>
<li><p>Verify that the video resumes and plays without any problems.</p></li>
<li><p>Verify that an alert for the incoming call is heard over Bluetooth and the audio stops playing.</p></li>
<li><p>Receive the incoming call by pressing the Bluetooth button, and verify that the call connects.</p></li>
<li><p>Disconnect the call through Bluetooth and tap the <strong>Play</strong> button on the video screen.</p></li>
<li><p>Verify that the video starts playing and the audio is routed through the Bluetooth device.</p></li>
<li><p>From the second device, send a text message to the test device.</p></li>
<li><p>Verify that a text notification on the phone and an audio notification on the Bluetooth for the incoming message is received. Tap <strong>Ignore</strong> to ignore the text message.</p>
<div class="alert">
<strong>Note</strong>  
<p>For some regions, speech is not supported, and a message is displayed on the device. Tap <strong>Close</strong> and proceed with the testing.</p>
</div>
<div>
 
</div></li>
<li><p>Tap the <strong>Play</strong> button on the video screen.</p></li>
<li><p>Verify that the video starts playing without any problems and that the audio is routed through Bluetooth.</p></li>
</ol>

### Audio streaming

Prerequisites: 

<ul>
<li><p>Second device for call support.</p></li>
<li><p>An A2DP Bluetooth device.</p></li>
<li><p>Desi Music app downloaded.</p></li>
</ul>

Test steps:

<ol>
<li><p>Sign in using your Microsoft Account.</p></li>
<li><p>In the App list, tap <strong>Settings</strong> &gt; <strong>Devices</strong> &gt; <strong>Bluetooth</strong>. Turn Bluetooth on.</p></li>
<li><p>Put an A2DP Bluetooth device in paring mode. When it is listed on the search results on the device, tap on it. Verify that the status of the Bluetooth device shows as “Connected Voice Music.”</p></li>
<li><p>Press the hardware back <strong>button</strong> to return to the App list. Tap on the “Desi Music” app.</p></li>
<li><p>Swipe left to the <strong>New</strong> pivot and tap on an album.</p></li>
<li><p>Tap on one of the tracks of the album.</p></li>
<li><p>Verify that the track starts buffering and eventually starts playing over Bluetooth. Depending on the network connection speed, it may take up to 15-20 seconds for the audio to start playing.</p></li>
<li><p>From the second device, make a call to the test device.</p></li>
<li><p>Verify that an alert for the incoming call is heard over Bluetooth and the audio pauses.</p></li>
<li><p>Receive the incoming call using the Bluetooth button.</p></li>
<li><p>Verify that the call connects.</p></li>
<li><p>Disconnect the call through the Bluetooth device.</p></li>
<li><p>Verify that the track resumes automatically.</p></li>
<li><p>From the second device, send a text message to the test device.</p></li>
<li><p>Verify that a text notification is displayed on the device and an audio notification is received on the Bluetooth device for the incoming message.</p></li>
<li><p>Tap on the text notification and send a response.</p></li>
<li><p>Verify that the audio continues to play without any problems.</p></li>
<li><p>Tap twice on the Bluetooth <strong>Back</strong> button.</p></li>
<li><p>Press the Bluetooth <strong>Forward</strong> button.</p></li>
<li><p>Verify that the next track starts playing.</p></li>
<li><p>Press the Bluetooth <strong>Rewind</strong> button.</p></li>
<li><p>Verify that the previous track starts playing.</p></li>
<li><p>Press the Bluetooth <strong>Pause</strong> button.</p></li>
<li><p>Verify that the track pauses.</p></li>
<li><p>Press the Bluetooth <strong>Pause</strong> button again.</p></li>
<li><p>Verify that the track resumes playing.</p></li>
</ol>

### SMS/MMS Messaging

Prerequisites: 

<ul>
<li><p>Two extra device to test the messaging services.</p></li>
<li><p>Have a photograph and a video on the devices</p></li>
</ul>

Test steps:

<ol>
<li><p>On the Start screen, tap <strong>Messaging</strong>, and then tap <strong>New</strong>.</p></li>
<li><p>Create a new text message.</p></li>
<li><p>Verify that the chat card is opened with an empty address bar and reply box.</p></li>
<li><p>Type the phone number of the second device in the “To” field.</p></li>
<li><p>Type a short text &quot;Hello&quot; into the reply box and send the message.</p></li>
<li><p>Verify that the sent message shows up in the chat card.</p></li>
<li><p>Verify that the second device received the message successfully.</p></li>
<li><p>On the chat card, tap <strong>Attachment</strong> button and choose to attach a picture.</p></li>
<li><p>Select a picture from the camera roll and then send the message.</p></li>
<li><p>Verify that the second device receives the picture successfully.</p></li>
<li><p>Reply from the second device with a picture attachment.</p></li>
<li><p>Verify that the test device receives the picture message.</p></li>
<li><p>Reply from the test device with a video attachment.</p></li>
<li><p>Verify that the second device receives and can play the video.</p></li>
<li><p>Reply from the second device with a video attachment.</p></li>
<li><p>Verify that the test device receives the video and can play it.</p></li>
<li><p>On the test device, press the hardware back button and create another SMS message.</p></li>
<li><p>Verify that the chat card is opened and has an empty address bar and reply box.</p></li>
<li><p>Type one phone number, then enter a semicolon, and type another contact’s phone number into the “To” field.</p></li>
<li><p>Type a message with more than 320 characters into the reply box and tap <strong>Send</strong>.</p></li>
<li><p>Verify that the character counter appears before or when the character limit is reached.</p></li>
<li><p>Verify that the sent message shows up in a chat card.</p></li>
<li><p>Verify that the multi-part SMS message is received successfully on the second and third devices</p></li>
<li><p>Send an SMS reply message from either the second or the third device to the test device.</p></li>
<li><p>Verify on the test device that the audio notification is heard for the incoming SMS message.</p></li>
<li><p>Verify that the reply shows up in a chat card as the latest message.</p></li>
</ol>

### FM Radio

Prerequisites: 

<ul>
<li><p>A set of headphones to serve as an antenna for the FM radio.</p></li>
<li><p>A second device for call support.</p></li>
</ul>

Test steps:

<ol>
<li><p>Plug in a pair of headphones.</p></li>
<li><p>In the App list, tap <strong>FM Radio</strong>.</p>
<div class="alert">
<strong>Note</strong>  
<p>Allow the FM Radio access to location services, if requested.</p>
</div>
<div>
 
</div></li>
<li><p>Press <strong>Forward</strong> or <strong>Back</strong> buttons to scan through the stations. Verify that the tuner scans through the stations appropriately.</p></li>
<li><p>Tap <strong>Pause</strong> button and verify that the radio pauses. Tap <strong>Play</strong> and verify that radio play resumes.</p></li>
<li><p>From a second device, make a call to the test device.</p></li>
<li><p>Verify that an alert for the incoming call is heard over Bluetooth and the audio stops playing.</p></li>
<li><p>Receive the incoming call by pressing the Bluetooth button and verify that the call connects.</p></li>
<li><p>Disconnect the call through Bluetooth and verify that the radio resumes automatically.</p></li>
<li><p>Press <strong>Add Favorite</strong> button to save the current station to Favorites.</p></li>
<li><p>Scroll through the stations by swiping the screen and verify that the tuner is able to pick up various stations.</p></li>
<li><p>Press <strong>Start</strong> to return to the Start Screen. Verify that the radio continues to play.</p></li>
<li><p>In the App list, tap <strong>Settings</strong> &gt; <strong>Devices</strong> &gt; <strong>Bluetooth</strong>. Turn Bluetooth off.</p></li>
<li><p>Press the hardware Back button. Turn Airplane Mode on and then verify that the radio stops playing. Turn Airplane Mode off.</p></li>
<li><p>In the App list, tap <strong>FM Radio</strong>.</p></li>
<li><p>Tap <strong>Favorites</strong>. Verify that the previously added favorite station appears, then select that station and verify that the radio tunes to that Favorite station.</p></li>
<li><p>Tap <strong>…</strong>in the bottom right. Tap <strong>switch to speakers</strong> Verify that the audio comes out of speakers.</p></li>
<li><p>From a second device, make a call to the test device.</p></li>
<li><p>Verify that an alert for the incoming call is heard and the audio stops playing.</p></li>
<li><p>Receive the incoming call and verify that the call connects.</p></li>
<li><p>Disconnect the call and verify that the radio resumes automatically.</p></li>
</ol>

### Rebooting the device

Prerequisites: None

Test steps:

<ol>
<li><p>Press and hold the Power button on the device</p></li>
<li><p>Verify that the &quot;Slide Down to power off&quot; screen is shown and swipe the screen down.</p></li>
<li><p>Verify that the device is powered off.</p></li>
<li><p>Press and hold the Power button again.</p></li>
<li><p>Verify that the device boots to the main OS screen successfully without crashing.</p></li>
<li><p>Repeat Steps 1-5.</p></li>
</ol>

### Messaging/Family room

Prerequisites: 

<ul>
<li><p>Two other Microsoft accounts.</p></li>
<li><p>Two other devices.</p></li>
</ul>

Test steps:

<ol>
<li><p>Add the numbers for the second and third device to the test device’s contact list.</p></li>
<li><p>In the app list, tap <strong>People</strong> and swipe left to the <strong>together</strong> pivot.</p></li>
<li><p>Tap the <strong>Add (+)</strong> button and from the &quot;Add New&quot; screen, tap <strong>Room</strong>.</p></li>
<li><p>Verify that the &quot;Name Your Room&quot; screen is displayed to enter a friendly name for the Room. Then, tap <strong>Save</strong>.</p></li>
<li><p>From the &quot;Edit Room&quot; screen, tap <strong>Invite</strong> button from the app bar to add the contacts created in Step 1.</p></li>
<li><p>Accept the invitation from the other device</p></li>
<li><p>Verify that all the contacts that you created are listed in the members screen.</p></li>
<li><p>Swipe left to the <strong>Chat</strong> pivot and enter some text in the message box.</p></li>
<li><p>Verify that the text that you sent is received by all the group members.</p></li>
<li><p>Respond to the post from the second device and verify that all the group members (including the test device) are receiving the message.</p></li>
<li><p>From the test device, tap the hardware back button and swipe left again to the <strong>Calendar</strong> pivot.</p></li>
<li><p>Tap the <strong>New</strong> icon from the app bar and create a new appointment for the upcoming hours.</p></li>
<li><p>Verify that the new appointment is displayed in the <strong>Calendar</strong> pivot for the test device as well as the other phones.</p></li>
<li><p>Launch the <strong>Photos</strong> pivot and tap the <strong>Add</strong> button in the app bar to add a &quot;Photo and Video&quot;.</p></li>
<li><p>Verify that the uploaded photo and video is shown in the <strong>Photo</strong> pivot of the test phone as well as the other devices.</p></li>
<li><p>Swipe left to the <strong>Notes</strong> pivot and tap on the <strong>Add</strong> button in the app bar to add a note.</p></li>
<li><p>Verify that the created note is saved on the <strong>Note</strong> pivot of the test device as well as on the other devices.</p></li>
</ol>

### Search

Prerequisites: 

<ul>
<li><p>Connected to Wi-Fi.</p></li>
<li><p>Signed in with a Microsoft account.</p></li>
</ul>

Test steps:

<ol>
<li><p>Tap the Search button on the phone to launch search.</p></li>
<li><p>Tap inside the search edit box and enter the search term &quot;dogs.”</p></li>
<li><p>Press enter to search.</p></li>
<li><p>Verify the search results on multiple pivots.</p></li>
<li><p>Verify that all pivots are populated with relevant results or that there is messaging that indicates that there are no results.</p>
<div class="alert">
<strong>Note</strong>  
<p>For non-US images, the search results may vary. All pivots might not be present.</p>
</div>
<div>
</div></li>
</ol>

### Alarm

Prerequisites: None

Test steps:

<ol>
<li><p>In the App list, tap <strong>Alarms &amp; Clock</strong>.</p></li>
<li><p>Create a new alarm.</p></li>
<li><p>Save the new alarm.</p></li>
<li><p>Verify that the alarm is created with the correct information.</p></li>
<li><p>Verify that the alarm rings at the specified time with the correct Alarm Tone and Name.</p></li>
</ol>

### Themes

Prerequisites: None

Test steps:

<ol>
<li><p>In the App list, tap <strong>Settings</strong> &gt; <strong>Personalization</strong> &gt; <strong>Theme</strong>.</p></li>
<li><p>Change the values for <strong>Background</strong> and <strong>Accent color</strong>.</p></li>
<li><p>Press <strong>Start</strong> to return to the Start screen.</p></li>
<li><p>Verify that the device's theme was modified.</p></li>
</ol>

### Contacts

Prerequisites: None

Test steps:

<ol>
<li><p>On the Start screen, tap the <strong>People</strong> tile.</p></li>
<li><p>From the <strong>Contacts</strong> pivot, tap the <strong>Add (+)</strong> button on the app bar.</p></li>
<li><p>Enter a phone number and save it.</p></li>
<li><p>Verify that the new number is saved to the Contacts page.</p></li>
<li><p>Select the saved contact number.</p></li>
<li><p>Tap <strong>Edit</strong> to modify the selected number. Enter a name for the contact, and then save it.</p></li>
<li><p>Verify that the contact is modified correctly.</p></li>
<li><p>Verify that the new contact is saved to the Contacts page under the correct name.</p></li>
<li><p>Select the saved contact.</p></li>
<li><p>Tap <strong>Options</strong>.</p></li>
<li><p>Tap <strong>Delete</strong>.</p></li>
<li><p>Verify that the contact has been removed from the Contacts list.</p></li>
</ol>

### Email

Prerequisites: 

Several valid email accounts from compatible providers.

Test steps:

<ol>
<li><p>In the App list, tap <strong>Settings</strong> &gt; <strong>Accounts</strong> &gt; <strong>Email &amp; accounts</strong>.</p></li>
<li><p>Tap <strong>add an account</strong> &gt; <strong>Microsoft account</strong> to add account.</p></li>
<li><p>On the Outlook screen, enter a valid email address and password.</p></li>
<li><p>Verify that the account is created and that it syncs up properly without any issues.</p></li>
<li><p>Press <strong>Start</strong> and then tap the <strong>Email</strong> tile.</p></li>
<li><p>Verify that the email appears as expected.</p></li>
<li><p>Tap the <strong>New mail</strong> (+) icon.</p></li>
<li><p>Compose and send an email to your account with a Subject, Body, and Microsoft Excel or Word document attached.</p></li>
<li><p>Verify that the email can be opened and read from the account on a PC. Reply to that email from your PC in response.</p></li>
<li><p>Verify that the test device receives an indication of the new email and that the tile updates to show the new message.</p></li>
<li><p>Verify that the message can be opened and read.</p></li>
<li><p>Repeat the steps using all the different types of email accounts.</p></li>
</ol>

### Microsoft Office

Prerequisites: None

Test steps:

<ol>
<li><p>In the App list, tap <strong>Office</strong>.</p></li>
<li><p>Swipe left to the <strong>Recent</strong> pivot.</p></li>
<li><p>Verify that there are at least three sample documents present:</p>
<ol>
<li><p>Sample document.</p></li>
<li><p>Sample presentation.</p></li>
<li><p>Sample spreadsheet.</p></li>
</ol></li>
<li><p>Tap <strong>Sample document</strong>.</p></li>
<li><p>Verify that the document is rendered correctly and that you can scroll through the document.</p></li>
<li><p>Press the hardware Back button to close the document.</p></li>
<li><p>Tap <strong>Sample spreadsheet</strong>.</p></li>
<li><p>Verify that the table is rendered correctly (i.e. rows 1, 2, etc. and columns A, B, etc. appear in view) and that you can scroll through the document.</p></li>
<li><p>Tap <strong>Sample presentation</strong>.</p></li>
<li><p>Verify that the presentation is shown in the orientation of the phone by rotating the phone to/from portrait/landscape view. Transition through 2 to 3 slides by swiping from right to left and rotate the phone.</p></li>
<li><p>Verify that the content is rendered correctly.</p></li>
<li><p>Press the hardware Back button to close the presentation.</p></li>
<li><p>On the <strong>Recent</strong> pivot, tap the <strong>Add (+)</strong> button to create a new Word document.</p></li>
<li><p>Open a blank Word document and enter some content. Tap on <strong>More (...)</strong> and then tap <strong>Save</strong>.</p></li>
<li><p>Select &quot;Phone&quot; as the location to save the data. Tap the <strong>Save</strong> button to save the created Word document.</p></li>
<li><p>Verify that the Word document that you created is shown in the <strong>Recent</strong> pivot of the Office app.</p></li>
<li><p>Repeat steps 10-13 for an Excel document.</p></li>
</ol>

### Calendar

Prerequisites: None

Test steps:

<ol>
<li><p>In the App list, tap <strong>Calendar</strong>.</p></li>
<li><p>Verify that the Calendar app is launched.</p></li>
<li><p>Tap on the <strong>Calendar View</strong> button and select a month.</p></li>
<li><p>Verify that you are able to scroll through the months on the calendar.</p></li>
<li><p>Tap on the <strong>view</strong> button again and select a day.</p></li>
<li><p>Verify that you are taken to the Day screen.</p></li>
<li><p>Tap on one of the empty grids in the upcoming hours.</p></li>
<li><p>Verify that an inline edit box and the virtual keyboard is launched.</p></li>
<li><p>Enter “Subject” text in the edit box.</p></li>
<li><p>Tap the <strong>Save</strong> app bar button.</p></li>
<li><p>Verify that the appointment is saved and displayed with the correct subject and time.</p></li>
<li><p>Tap <strong>Start</strong> to return to the Start screen.</p></li>
<li><p>Verify that the appointment is displayed correctly in the Calendar tile.</p></li>
<li><p>Press the device’s Power button to lock the device. Press the button again to view the lock screen.</p></li>
<li><p>Verify that the calendar appointment is shown on the lock screen.</p></li>
</ol>

### Internet Explorer

Prerequisites: 

<ul>
<li><p>Bluetooth must be turned on.</p></li>
<li><p>Second device for Tap+Send testing.</p></li>
</ul>

Test steps:

<ol>
<li><p>Tap Internet Explorer from the Start screen.</p>
<div class="alert">
<strong>Note</strong>  
<p>When the browser is launched for the first time, a dialog will pop up asking &quot;Use recommended settings?&quot; Tap the <strong>Recommended</strong> button.</p>
</div>
<div>
 
</div></li>
<li><p>Verify that Internet Explorer launches.</p></li>
<li><p>Tap on the address bar. Begin typing the name of a website.</p></li>
<li><p>Verify that auto-suggestions show up as the URL is entered.</p></li>
<li><p>Verify that the page loads the content for the URL that was entered.</p></li>
<li><p>Verify that the page can be added to Favorites.</p></li>
<li><p>Pinch and stretch to zoom in and out. Pan around the page. Scroll up and down the page. Verify that these gestures work correctly.</p></li>
<li><p>Remain idle for 30-60 seconds.</p></li>
<li><p>Verify that there are no issues with the page after leaving the device idle.</p></li>
<li><p>Rotate the device.</p></li>
<li><p>Verify that the transition from portrait to landscape is smooth.</p></li>
<li><p>Verify that the browser transitions to the correct orientation and that the app bar menus are visible.</p></li>
<li><p>Tap <strong>More (…)</strong> in the lower right side of the app bar and tap <strong>Favorites</strong>.</p></li>
<li><p>Verify that you can navigate to a website listed in your favorites.</p></li>
<li><p>Share the website with the second phone using NFC/Tap+Send.</p>
<div class="alert">
<strong>Note</strong>  
<p>If the browser is launched for the first time on the second device, a dialog will pop up asking &quot;Use recommended settings?&quot; Tap <strong>Recommended</strong>.</p>
</div>
<div>
 
</div></li>
<li><p>Verify that the shared website opens on the browser of the second device</p></li>
</ol>

### Charging

Prerequisites: None

Test steps:

<ul>
<li><p>Connect a wall charger to the device and check that the <strong>charging</strong> icon is displayed. You should hear an audible indication after you plug in the cable. Unplug the charger.</p>
<div class="alert">
<strong>Note</strong>  
<p>The device does not have to be turned on for wireless charging to work.</p>
</div>
<div>
 
</div></li>
</ul>

### PC Companion

Prerequisites: None

Test steps:

<ol>
<li><p>Connect the device to a computer with a USB cable.</p></li>
<li><p>Check that the device starts to charge.</p></li>
<li><p>Verify that the PC Companion tool starts automatically on the PC after a few seconds.</p></li>
</ol>

### Ambient Light Sensor

Prerequisites: None

Test steps:

<ol>
<li><p>In the App list, tap <strong>Settings</strong> &gt; <strong>System</strong> &gt; <strong>Display</strong>.</p></li>
<li><p>Verify that the <strong>Automatically adjust display brightness</strong> option is turned on.</p></li>
<li><p>Press <strong>Start</strong> to return to the Start screen.</p></li>
<li><p>Shine a flashlight/torch at the top of the device</p></li>
<li><p>Verify that the contrast of display changes in response to the light.</p></li>
</ol>

### Display and Accelerometer

Prerequisites: None

Test steps:

<ol>
<li><p>In portrait mode, run your finger over the whole keyboard.</p></li>
<li><p>Verify that a message is created as expected.</p></li>
<li><p>Rotate the device to the left and right sides.</p></li>
<li><p>Verify that the screen orientation changes smoothly.</p></li>
</ol>

### Download Keyboard

Prerequisites: None

Test steps:

<ol>
<li><p>In the App list tap <strong>Settings</strong> &gt; <strong>Devices</strong> &gt; <strong>Keyboard</strong>.</p></li>
<li><p>Tap <strong>add keyboards</strong>.</p></li>
<li><p>Select a keyboard.</p></li>
<li><p>Verify that the Keyboard language that you selected is displayed as &quot;Preparing download...&quot;</p></li>
<li><p>Verify that after the download is ready, the user is given option to install the keyboard.</p></li>
<li><p>Install the keyboard.</p></li>
<li><p>Verify that the device reboots and the updates are installed.</p></li>
<li><p>From the Start screen, launch the Messaging app.</p></li>
<li><p>Create a new SMS message.</p></li>
<li><p>Tap and hold the <strong>ENG</strong> button on the virtual keyboard. Select the newly downloaded language from the menu.</p></li>
<li><p>Verify that the keyboard changes to the new language keyboard.</p></li>
<li><p>Create and send a new SMS message.</p></li>
<li><p>Verify that the SMS message is sent successfully and received in the same language on the second device</p></li>
</ol>

### Download app from Store

Prerequisites: 

Wi-Fi must be connected.

Test steps:

<ol>
<li><p>From the Start screen, tap <strong>Store</strong>.</p></li>
<li><p>Verify that the Store launches</p></li>
<li><p>Select an app or game from the Store front page and install it.</p></li>
<li><p>Verify that you can watch the download progress of app/game.</p></li>
<li><p>Verify that the game download completes in less than 5 minutes and the progress bar is gone.</p></li>
<li><p>Verify that the app/game can be launched after it is downloaded.</p></li>
</ol>

### Skype (Video calling)

Prerequisites: 

<ul>
<li><p>You must be connected to Wi-Fi.</p></li>
<li><p>Bluetooth device.</p></li>
<li><p>Second phone</p></li>
<li><p>Two Microsoft account (one for each device) to use Skype.</p></li>
</ul>

Test steps:

<ol>
<li><p>From the Start screen, tap <strong>Store</strong>.</p></li>
<li><p>Search for and download the Skype app.</p></li>
<li><p>In the app list, tap <strong>Settings</strong> &gt; <strong>Devices</strong> &gt; <strong>Bluetooth</strong>. Turn Bluetooth on.</p></li>
<li><p>Put the Bluetooth device in paring mode, and then pair the test device to the Bluetooth device.</p></li>
<li><p>Launch the Skype app.</p></li>
<li><p>Verify that the Terms and Conditions page pops up.</p></li>
<li><p>Tap <strong>Accept</strong>.</p></li>
<li><p>Verify the Login screen is shown.</p></li>
<li><p>Scroll to bottom of Login page and log in using a Microsoft Account.</p></li>
<li><p>Verify that the 'Allow message notifications?' message pops up with <strong>yes</strong> and <strong>no</strong> buttons.</p></li>
<li><p>Tap <strong>no</strong>.</p>
<div class="alert">
<strong>Note</strong>  
<p>Follow the same steps on the second device to prepare for Skype testing.</p>
</div>
<div>
 
</div></li>
<li><p>On the second phone, swipe to the <strong>People</strong> pivot and select the Skype account that is associated with the test device</p></li>
<li><p>Make an audio call to the test device using the second device.</p></li>
<li><p>On the test device, verify that a ringer is heard for the incoming call.</p></li>
<li><p>Answer the call using the Bluetooth device.</p></li>
<li><p>Verify that audio can be heard on both device (the audio on the test device should be routed through the Bluetooth device).</p></li>
<li><p>Verify that the mute and unmute functionality works on the test and second phone.</p></li>
<li><p>Disconnect the call using the Bluetooth device.</p></li>
<li><p>Verify that no audio is heard after the call is disconnected.</p></li>
<li><p>Turn off Bluetooth.</p></li>
<li><p>On the test device, swipe left to the <strong>People</strong> pivot and select the Skype account of the second device.</p></li>
<li><p>Make an outgoing video call to the second device.</p></li>
<li><p>Verify that the outgoing call notification is heard from the loudspeaker of the test device</p></li>
<li><p>Receive the incoming video call on the second device.</p></li>
<li><p>Verify that the call connects.</p></li>
<li><p>Verify that video and audio are working on both of the devices.</p></li>
<li><p>Verify that the mute and unmute functionality works on both devices.</p></li>
<li><p>Disconnect the call from the test device.</p></li>
<li><p>Verify that no audio is heard after the call is disconnected.</p></li>
</ol>

### Play a game

Prerequisites: 

Angry Birds game downloaded from the app store.

Test steps:

<ol>
<li><p>In the App list, launch the Angry Birds game..</p></li>
<li><p>Verify that the game loads in 15-20 seconds.</p></li>
<li><p>Verify that background music plays on the Main Menu.</p></li>
<li><p>Verify that the music can be muted and unmuted.</p></li>
<li><p>Press the <strong>Play</strong> button placed at the center of the screen.</p></li>
<li><p>Verify that the game loads to a playable level.</p></li>
<li><p>Play at this level.</p></li>
<li><p>Verify that the game visuals and audio are smooth.</p></li>
<li><p>Verify that the game does not crash.</p></li>
<li><p>Verify that you can pause and unpause the game.</p></li>
</ol>

### Backup and restore content

Prerequisites: 

<ul>
<li><p>Connected to Wi-Fi.</p></li>
<li><p>Apps downloaded to the device</p></li>
<li><p>Microsoft account.</p></li>
</ul>

Test steps:

<ol>
<li><p>In the App list, tap <strong>Settings</strong> &gt; <strong>Personalization</strong> &gt; <strong>theme</strong>.</p></li>
<li><p>Change the Background and Accent aolor.</p></li>
<li><p>In the App list, tap <strong>Settings</strong> &gt; <strong>Accounts</strong> &gt; <strong>Email &amp; accounts</strong>.</p></li>
<li><p>Sign in with your Microsoft account.</p></li>
<li><p>Launch Internet Explorer.</p></li>
<li><p>Go to a website and add it to your Favorites.</p></li>
<li><p>Go to a second website and add it to your Favorites.</p></li>
<li><p>In the App list, tap <strong>Settings</strong> &gt; <strong>Update &amp; recovery</strong> &gt; <strong>Backup</strong>.</p></li>
<li><p>Turn Backup on.</p></li>
<li><p>In the App list, tap <strong>Settings</strong> &gt; <strong>System</strong> &gt; <strong>About</strong> &gt; <strong>reset your phone</strong>.</p></li>
<li><p>A &quot;Warning!&quot; pop-up message will be shown twice. Tap &quot;yes&quot; both times to reset the device</p></li>
<li><p>Verify that the device resets, and then proceed through OOBE.</p></li>
<li><p>When prompted during OOBE, connect to a Wi-Fi network.</p></li>
<li><p>When prompted during OOBE, enter the same Microsoft account that you have been using.</p></li>
<li><p>When prompted during OOBE, select to restore the backup that was just created.</p>
<div class="alert">
<strong>Note</strong>  
<p>This backup should be the selection at the top of the backup list. Check the date and time to verify, then select the backup.</p>
</div>
<div>
 
</div></li>
<li><p>Proceed through the rest of the OOBE process.</p></li>
<li><p>At the Start screen, verify that the Background and Accent color match the changes from Step 2.</p></li>
<li><p>Launch Internet Explorer and open your Favorites.</p></li>
<li><p>Verify that the websites that you added in the previous steps are listed in Favorites.</p></li>
<li><p>In the App list, verify that your downloaded apps are still listed.</p></li>
<li><p>In the app list, tap <strong>Settings</strong> &gt; <strong>Accounts</strong> &gt; <strong>Email &amp; accounts</strong>. Tap on the signed-in account and enter the password.</p></li>
<li><p>Verify that your email account is synced.</p></li>
</ol>

### Kid’s corner

Prerequisites: 

Games installed to the device from the store.

Test steps:

<ol>
<li><p>In the App list, tap <strong>Settings</strong> &gt; <strong>kid's corner</strong>.</p></li>
<li><p>Verify that the welcome page for Kid's Corner is launched.</p></li>
<li><p>Add a game to the Kid’s Corner.</p></li>
<li><p>Add a couple of apps to the Kid’s Corner.</p></li>
<li><p>Tap <strong>Next</strong>.</p></li>
<li><p>Verify that the Password dialog pops up.</p></li>
<li><p>Create a password.</p></li>
<li><p>Tap <strong>Finish</strong>.</p></li>
<li><p>Verify that Kid's Corner is launched.</p></li>
<li><p>Swipe up on the screen. Enter the password if prompted.</p></li>
<li><p>Verify that the Home screen for Kid's Corner is launched and only the applications and the games that were checked while setting up the Kid’s Corner are present on the screen.</p></li>
<li><p>Lock and unlock the device.</p></li>
<li><p>Verify that the password dialog pops up. Enter the password and unlock the device.</p></li>
<li><p>Verify that the Start screen is displayed.</p></li>
</ol>

### NFC Tag Reading

Prerequisites: 

<ul>
<li><p>An item with a QR/NFC/URL tag to scan.</p></li>
<li><p>Connected to Wi-Fi to follow the tag path.</p></li>
</ul>

Test steps:

<ol>
<li><p>Leave the device idle so that it goes to sleep. Press the device’s Power button to bring up the lock screen.</p></li>
<li><p>Hold the <strong>camera</strong> button (while on lock screen) to bring up the camera.</p>
<div class="alert">
<strong>Note</strong>  
<p>If the phone does not have a camera button, launch the Camera app directly.</p>
</div>
<div>
 
</div></li>
<li><p>Select the <strong>Lens</strong> button.</p></li>
<li><p>Select <strong>Bing Vision</strong>.</p></li>
<li><p>Hold the camera to a QR tag to scan.</p></li>
<li><p>Select the box image/hyperlink that appears after scanning.</p></li>
<li><p>Verify that you are taken to appropriate page associated with the tag scanned.</p></li>
<li><p>In the App list, tap <strong>Settings</strong> &gt; <strong>Personalization</strong> &gt; <strong>Lock screen</strong>.</p></li>
<li><p>Turn Password “On” and create a password.</p></li>
<li><p>Leave the device idle so that it goes to sleep. Press the device’s Power button to bring up the lock screen.</p></li>
<li><p>Hold the camera button (while on the lock screen) to bring up the camera.</p></li>
<li><p>Press the <strong>Lens</strong> button.</p></li>
<li><p>Select <strong>Bing Vision</strong>.</p></li>
<li><p>Verify that the user must enter a password before accessing Bing Vision.</p></li>
</ol>

### Lens picker

Prerequisites: 

<ul>
<li><p>You must be signed in with a Microsoft account to install lenses.</p></li>
<li><p>Bluetooth must be turned on to use NFC sharing.</p></li>
<li><p>Second device for NFC functionality.</p></li>
</ul>

Test steps:

<ol>
<li><p>Press and hold the camera hardware key to launch the camera app (or launch the app directly if the device does not have a camera button), and tap on <strong>Cancel</strong> in the &quot;Allow the camera to use your location&quot; screen.</p>
<div class="alert">
<strong>Note</strong>  
<p>The “Allow…location” prompt will remember previous settings and may not appear if the camera has been used recently.</p>
</div>
<div>
 
</div></li>
<li><p>Tap the <strong>Lens</strong> button.</p></li>
<li><p>Verify that the Lens overlay appears with the <strong>Bing Vision</strong> icon and icons for any installed lenses.</p></li>
<li><p>Select one of the installed lenses. If no lens applications have been installed, you will need to download one.</p>
<ol>
<li><p>Select “find more lenses”</p></li>
<li><p>Select and install an application from the list.</p></li>
</ol></li>
<li><p>Verify that you can take a picture using the installed lens application.</p></li>
<li><p>Verify that the picture is shown and that you can scroll between recent pictures and the camera.</p></li>
<li><p>Select a recent picture.</p></li>
<li><p>Verify that you can share the photo using NFC/Tap+Share.</p></li>
</ol>

### Local scout load time

Prerequisites: None

Test steps:

<ol>
<li><p>Launch <strong>Local Scout</strong>.</p></li>
<li><p>If you are launching Local Scout for the first time, allow access to your current location.</p></li>
<li><p>Verify that you are able to see various tabs for different types of local establishments.</p></li>
<li><p>Select a restaurant.</p></li>
<li><p>Verify that the appropriate information for a restaurant is provided.</p></li>
<li><p>Select the directions.</p></li>
<li><p>Verify that the map loads with directions to the restaurant.</p></li>
<li><p>Verify that Local Scout loads locations/results in an acceptable amount of time.</p></li>
</ol>

### Download maps

Prerequisites: 

Connected to Wi-Fi to download maps.

Test steps:

<ol>
<li><p>In the App list, tap <strong>Maps</strong> &gt; <strong>More (…)</strong> &gt; <strong>Settings</strong>.</p>
<div class="alert">
<strong>Note</strong>  
<p>If the application is launched for the first time, the app will ask for permission to access the phone location. Allow location access.</p>
</div>
<div>
 
</div></li>
<li><p>Select <strong>download maps</strong>.</p></li>
<li><p>Tap the <strong>Add (+)</strong> button.</p></li>
<li><p>Select <strong>North and Central America</strong> &gt; <strong>USA</strong> &gt; <strong>Indiana</strong>.</p></li>
<li><p>Wait for the map to finish downloading.</p></li>
<li><p>Press <strong>Start</strong> to return to the Start screen.</p></li>
<li><p>In the App list, tap <strong>Settings</strong> &gt; <strong>Airplane Mode</strong> &gt; <strong>Turn On</strong>.</p></li>
<li><p>Press <strong>Start</strong>, then in the App list, tap <strong>Maps</strong>.</p></li>
<li><p>Tap <strong>Search</strong> (magnifying glass) and search for “Butte, Montana”.</p></li>
<li><p>Verify that Butte, Montana cannot be found in the downloaded maps.</p></li>
<li><p>Search for “Indianapolis, Indiana”.</p></li>
<li><p>Verify that the map loads the downloaded map of Indianapolis, Indiana.</p></li>
</ol>

### Visual Voicemail

Prerequisites: 

You will need a second device.

Test steps:

<ol>
<li><p>Power off the test device</p></li>
<li><p>Call the test device using the second device.</p></li>
<li><p>Verify that the call goes to voice mail. Leave a voice mail.</p></li>
<li><p>Power on the test device.</p></li>
<li><p>Tap <strong>Phone</strong>.</p></li>
<li><p>Tap the <strong>voicemail</strong> icon.</p></li>
<li><p>Accept the Visual Voicemail client setup.</p></li>
<li><p>Verify that the voice mail is downloaded after setup, and that you can listen to the voice mail.</p></li>
<li><p>Call the test device from the second device again. Do not answer it.</p></li>
<li><p>Verify that the call goes to voice mail. Leave a message.</p></li>
<li><p>Verify that you receive an SMS message that indicates that a voice mail is available. Verify that the new voice mail is listed and that you can listen to the voice mail.</p></li>
<li><p>Repeat steps 9-10 and leave a second voice message.</p></li>
<li><p>Verify that an icon shows two voice mails listed.</p></li>
<li><p>Play the voice mails.</p></li>
<li><p>Delete the voice mails.</p></li>
</ol>

### Internet sharing

Prerequisites: 

<ul>
<li><p>Data Plan that permits sharing.</p></li>
<li><p>Any Wi-Fi powered device.</p></li>
</ul>

Test steps:

<ol>
<li><p>Turn on Internet Sharing.</p></li>
<li><p>Connect to the shared Wi-Fi with a second device, using the name and password on the device.</p>
<div class="alert">
<strong>Note</strong>  
<p>The second device should have its own Wi-Fi turned on.</p>
</div>
<div>
 
</div></li>
<li><p>Verify that the second device can browse the internet.</p></li>
<li><p>Verify that the device displays the number of Guests (second device) connected to shared Wi-Fi.</p></li>
</ol>

### Storage manager

Prerequisites: None

Test steps:

<ol>
<li><p>In the App list, tap <strong>Settings</strong> &gt; <strong>System</strong> &gt; <strong>Storage Sense</strong>.</p></li>
<li><p>Tap the device.</p></li>
<li><p>Verify that the data usage bars appear for the following:</p>
<ol>
<li><p>apps+games</p></li>
<li><p>maps</p></li>
<li><p>temporary files</p></li>
<li><p>photos</p></li>
<li><p>music</p></li>
<li><p>videos</p></li>
<li><p>documents</p></li>
<li><p>email+messaging</p></li>
<li><p>system</p></li>
<li><p>other</p></li>
</ol></li>
<li><p>Tap the entry.</p></li>
<li><p>Verify that you can scroll through the app’s detail page.</p></li>
<li><p>Verify that the amount of memory space per app is shown.</p></li>
</ol> 
 
 





