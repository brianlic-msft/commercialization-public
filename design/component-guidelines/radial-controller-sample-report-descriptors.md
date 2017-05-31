---
title: Windows radial controller sample report descriptors
author: windows-driver-content
description: This topic presents a sample report descriptor and some sample descriptor excerpts for a Windows radial controller device.
ms.assetid:
keywords: radial dial, radial controller, dial
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Windows radial controller sample report descriptors

This topic presents a sample report descriptor and some sample descriptor excerpts for a Windows radial controller device.

## Sample input report descriptor
The following is a sample report descriptor for an integrated Windows radial controller top-level collection.

```cpp
// Integrated Radial Controller TLC
0x05, 0x01,		// USAGE_PAGE (Generic Desktop)          
0x09, 0x0e,		// USAGE (System Multi-Axis Controller)                      
0xa1, 0x01,		// COLLECTION (Application)         
0x85, 0x01,		//   REPORT_ID (Radial Controller)                
0x05, 0x0d,		//   USAGE_PAGE (Digitizers)
0x09, 0x21,		//   USAGE (Puck)                 
0xa1, 0x00,		//   COLLECTION (Physical)
0x05, 0x09,		//     USAGE_PAGE (Buttons)           
0x09, 0x01,		//     USAGE (Button 1)
0x95, 0x01,		//     REPORT_COUNT (1)
0x75, 0x01,		//     REPORT_SIZE (1)   
0x15, 0x00,		//     LOGICAL_MINIMUM (0)      
0x25, 0x01,		//     LOGICAL_MAXIMUM (1)         
0x81, 0x02,		//     INPUT (Data,Var,Abs)
0x05, 0x01,		//     USAGE_PAGE (Generic Desktop)          
0x09, 0x37,		//     USAGE (Dial)
0x95, 0x01,		//     REPORT_COUNT (1)
0x75, 0x0f,		//     REPORT_SIZE (15)  
0x55, 0x0f,		//     UNIT_EXPONENT (-1)           
0x65, 0x14,		  //     UNIT (Degrees, English Rotation)        
0x36, 0xf0, 0xf1,	//     PHYSICAL_MINIMUM (-3600)         
0x46, 0x10, 0x0e,	//     PHYSICAL_MAXIMUM (3600)      
0x16, 0xf0, 0xf1,	//     LOGICAL_MINIMUM (-3600)      
0x26, 0x10, 0x0e,	//     LOGICAL_MAXIMUM (3600)        
0x81, 0x06,		//     INPUT (Data,Var,Rel)  
0x09, 0x30,		//     USAGE (X)
0x75, 0x10,		//     REPORT_SIZE (16)                    
0x55, 0x0d,		//     UNIT_EXPONENT (-3)           
0x65, 0x13,		//     UNIT (Inch,EngLinear)        
0x35, 0x00,		//     PHYSICAL_MINIMUM (0)         
0x46, 0xc0, 0x5d,	//     PHYSICAL_MAXIMUM (24000)      
0x15, 0x00,		//     LOGICAL_MINIMUM (0)      
0x26, 0xff, 0x7f,	//     LOGICAL_MAXIMUM (32767)      
0x81, 0x02,		//     INPUT (Data,Var,Abs)         
0x09, 0x31,		//     USAGE (Y)                    
0x46, 0xb0, 0x36,	//     PHYSICAL_MAXIMUM (14000)      
0x81, 0x02,		//     INPUT (Data,Var,Abs)        
0x05, 0x0d,		//     USAGE_PAGE (Digitizers)
0x09, 0x48,		//     USAGE (Width)
0x36, 0xb8, 0x0b,	//     PHYSICAL_MINIMUM (3000)
0x46, 0xb8, 0x0b,	//     PHYSICAL_MAXIMUM (3000)
0x16, 0xb8, 0x0b,	//     LOGICAL_MINIMUM (3000)    
0x26, 0xb8, 0x0b,	//     LOGICAL_MAXIMUM (3000)      
0x81, 0x03		//     INPUT (Cnst,Var,Abs)				                  
0xc0,			//   END_COLLECTION
0xc0,			// END_COLLECTION
```

## Sample haptic feedback feature report descriptor

The following is a report descriptor snippet for a haptic feedback collection to be included in an integrated Windows radial controller top-level collection.
```cpp
0x85, 0x02,            // REPORT_ID (Haptic Feedback)                
0x05, 0x0e,            // USAGE_PAGE (Haptics)          
0x09, 0x01,            // USAGE (Simple Haptic Controller)                      
0xa1, 0x02,            // COLLECTION (Logical)
0x09, 0x20,            //   USAGE (Auto Trigger)
0x16, 0x00, 0x10,        //   LOGICAL_MINIMUM (0x1000)    
0x26, 0x04, 0x10,        //   LOGICAL_MAXIMUM (0x1004)
0x95, 0x01,            //   REPORT_COUNT (1)
0x75, 0x10,            //   REPORT_SIZE (16)
0xb1, 0x02,            //   FEATURE (Data,Var,Abs)
0x09, 0x21,            //   USAGE (Manual Trigger)
0x91, 0x02,            //   OUTPUT (Data,Var,Abs)
0x09, 0x22,            //   USAGE (Auto Trigger Associated Control)
0x17, 0x37, 0x00, 0x01, 0x00,     //   LOGICAL_MINIMUM (0x00010037)    
0x27, 0x37, 0x00, 0x01, 0x00,    //   LOGICAL_MAXIMUM (0x00010037)
0x95, 0x01,            //   REPORT_COUNT (1)
0x75, 0x20,            //   REPORT_SIZE (32)
0xb1, 0x03,            //   FEATURE (Cnst,Var,Abs)
0x09, 0x23,            //   USAGE (Intensity)
0x15, 0x00,            //   LOGICAL_MINIMUM (0)    
0x25, 0x7f,            //   LOGICAL_MAXIMUM (127)
0x75, 0x08,            //   REPORT_SIZE (8)
0x91, 0x02,            //   OUTPUT (Data,Var,Abs)
0x09, 0x23,            //   USAGE (Intensity)
0xb1, 0x02,            //   FEATURE (Data,Var,Abs)
0x09, 0x24,            //   USAGE (Repeat Count)
0x91, 0x02,            //   OUTPUT (Data,Var,Abs)
0x09, 0x24,            //   USAGE (Repeat Count)
0xb1, 0x02,            //   FEATURE (Data,Var,Abs)
0x09, 0x25,            //   USAGE (Retrigger Period)
0x91, 0x02,            //   OUTPUT (Data,Var,Abs)
0x09, 0x25,            //   USAGE (Retrigger Period)
0xb1, 0x02,            //   FEATURE (Data,Var,Abs)
0x09, 0x28,            //   USAGE (Waveform Cutoff Time)
0x26, 0xff, 0x7f,        //   LOGICAL_MAXIMUM (32,767)
0x75, 0x10,            //   REPORT_SIZE (16)
0xb1, 0x02,            //   FEATURE (Data,Var,Abs)
0x05, 0x0e,            //   USAGE_PAGE (Haptics)          
0x09, 0x10,            //   USAGE (Waveform List)                     
0xa1, 0x02,            //   COLLECTION (Logical)
0x05, 0x0A,            //     USAGE_PAGE (Ordinal)          
0x09, 0x03,            //     USAGE (Ordinal 3)
0x95, 0x01,            //     REPORT_COUNT (1)
0x75, 0x08,            //     REPORT_SIZE (8)
0x15, 0x03,            //     LOGICAL_MINIMUM (3)
0x25, 0x03,            //     LOGICAL_MAXIMUM (3)
0x36, 0x03, 0x10,        //     PHYSICAL_MINIMUM (0x1003)
0x46, 0x03, 0x10,        //     PHYSICAL_MAXIMUM (0x1003)
0xb1, 0x03,            //     FEATURE (Cnst,Var,Abs)
0x09, 0x04,             //     USAGE (Ordinal 4)
0x15, 0x04,             //     LOGICAL_MINIMUM (4)
0x25, 0x04,            //     LOGICAL_MAXIMUM (4)
0x36, 0x04, 0x10,        //     PHYSICAL_MINIMUM (0x1004)
0x46, 0x04, 0x10,        //     PHYSICAL_MAXIMUM (0x1004)
0xb1, 0x03            //     FEATURE (Cnst,Var,Abs)
0xc0,                //   END_COLLECTION         
0x05, 0x0e,            //   USAGE_PAGE (Haptics)          
0x09, 0x11,            //   USAGE (Duration List)                     
0xa1, 0x02,            //   COLLECTION (Logical)
0x05, 0x0a            //     USAGE_PAGE (Ordinal)          
0x09, 0x03,            //     USAGE (Ordinal 3)
0x09, 0x04,            //     USAGE (Ordinal 4)
0x15, 0x00,            //     LOGICAL_MINIMUM (0)
0x26, 0xff, 0x0f,        //     LOGICAL_MAXIMUM (4095)
0x95, 0x02,            //     REPORT_COUNT (2)
0x75, 0x08,            //     REPORT_SIZE (8)
0xb1, 0x02,            //     FEATURE (Data,Var,Abs)
0xc0,                //   END_COLLECTION

```
