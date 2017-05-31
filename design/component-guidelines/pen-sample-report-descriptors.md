---
title: Sample Report Descriptors
description: This topic presents a sample report descriptor and some sample descriptor excerpts for a Windows pen device.
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: C81F79C8-CA53-4064-AAF6-6F8FBFB78353
ms.author: windows-hardware-design-content
ms.date: 05/02/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# Sample Report Descriptors


This topic presents a sample report descriptor and some sample descriptor excerpts for a Windows pen device.

## Sample Report Descriptor


The following is a report descriptor for an integrated Windows Pen top-level collection.

``` syntax
// Integrated Windows Pen TLC
    0x05, 0x0d,                         // USAGE_PAGE (Digitizers)          
    0x09, 0x02,                         // USAGE (Pen)                      
    0xa1, 0x01,                         // COLLECTION (Application)         
    0x85, REPORTID_PEN,                 //   REPORT_ID (Pen)                
    0x09, 0x20,                         //   USAGE (Stylus)                 
    0xa1, 0x00,                         //   COLLECTION (Physical)          
    0x09, 0x42,                         //     USAGE (Tip Switch)           
    0x09, 0x44,                         //     USAGE (Barrel Switch)        
    0x09, 0x3c,                         //     USAGE (Invert)               
    0x09, 0x45,                         //     USAGE (Eraser Switch)        
    0x15, 0x00,                         //     LOGICAL_MINIMUM (0)          
    0x25, 0x01,                         //     LOGICAL_MAXIMUM (1)          
    0x75, 0x01,                         //     REPORT_SIZE (1)              
    0x95, 0x04,                         //     REPORT_COUNT (4)             
    0x81, 0x02,                         //     INPUT (Data,Var,Abs)         
    0x95, 0x01,                         //     REPORT_COUNT (1)             
    0x81, 0x03,                         //     INPUT (Cnst,Var,Abs)         
    0x09, 0x32,                         //     USAGE (In Range)             
    0x81, 0x02,                         //     INPUT (Data,Var,Abs)         
    0x95, 0x02,                         //     REPORT_COUNT (2)             
    0x81, 0x03,                         //     INPUT (Cnst,Var,Abs)         
    0x05, 0x01,                         //     USAGE_PAGE (Generic Desktop) 
    0x09, 0x30,                         //     USAGE (X)                    
    0x75, 0x10,                         //     REPORT_SIZE (16)             
    0x95, 0x01,                         //     REPORT_COUNT (1)             
    0xa4,                               //     PUSH                         
    0x55, 0x0d,                         //     UNIT_EXPONENT (-3)           
    0x65, 0x13,                         //     UNIT (Inch,EngLinear)        
    0x35, 0x00,                         //     PHYSICAL_MINIMUM (0)         
    0x46, 0x3a, 0x20,                   //     PHYSICAL_MAXIMUM (8250)      
    0x26, 0xf8, 0x52,                   //     LOGICAL_MAXIMUM (21240)      
    0x81, 0x02,                         //     INPUT (Data,Var,Abs)         
    0x09, 0x31,                         //     USAGE (Y)                    
    0x46, 0x2c, 0x18,                   //     PHYSICAL_MAXIMUM (6188)      
    0x26, 0x6c, 0x3e,                   //     LOGICAL_MAXIMUM (15980)      
    0x81, 0x02,                         //     INPUT (Data,Var,Abs)         
    0xb4,                               //     POP                          
    0x05, 0x0d,                         //     USAGE_PAGE (Digitizers)      
    0x09, 0x30,                         //     USAGE (Tip Pressure)         
    0x26, 0xff, 0x00,                   //     LOGICAL_MAXIMUM (255)        
    0x81, 0x02,                         //     INPUT (Data,Var,Abs)         
    0x75, 0x08,                         //     REPORT_SIZE (8)              
    0x09, 0x3d,                         //     USAGE (X Tilt)               
    0x15, 0x81,                         //     LOGICAL_MINIMUM (-127)       
    0x25, 0x7f,                         //     LOGICAL_MAXIMUM (127)        
    0x81, 0x02,                         //     INPUT (Data,Var,Abs)         
    0x09, 0x3e,                         //     USAGE (Y Tilt)               
    0x15, 0x81,                         //     LOGICAL_MINIMUM (-127)       
    0x25, 0x7f,                         //     LOGICAL_MAXIMUM (127)        
    0x81, 0x02,                         //     INPUT (Data,Var,Abs)         
    0xc0,                               //   END_COLLECTION                 
    0xc0                                // END_COLLECTION                
```

## Sample Report Descriptor Excerpt - (Latency Mode Feature Report)


The following is a report descriptor excerpt from the integrated Windows Pen top-level collection, for the optional (but highly recommended) support of the latency mode feature report.

``` syntax
    0x05, 0x0d,                         //    USAGE_PAGE (Digitizer)
    0x85, REPORTID_LATENCY,             //    REPORT_ID (Latency)              
    0x09, 0x60,                         //    USAGE(Latency Mode)
    0x75, 0x01,                         //    REPORT_SIZE (1) 
    0x95, 0x01,                         //    REPORT_COUNT (1)
    0x15, 0x00,                         //    LOGICAL_MINIMUM (0)
    0x25, 0x01,                         //    LOGICAL_MAXIMUM (1)
    0xb1, 0x02,                         //    FEATURE (Data,Var,Abs)
    0x95, 0x07,                         //    REPORT_COUNT (7)             
    0xb1, 0x03,                         //    FEATURE (Cnst,Var,Abs)            
```

## Sample Report Descriptor Excerpt - (Device Certification Status Feature Report)


The following is a report descriptor excerpt from the integrated Windows Pen top-level collection, for the optional (but highly recommended) support of the device certification status feature report.

``` syntax
    0x06, 0x00, 0xff,                   //    USAGE_PAGE (Vendor Defined)
    0x85, REPORTID_PENHQA,              //    REPORT_ID (PTPHQA)  
    0x09, 0xC5,                         //    USAGE (Vendor Usage 0xC5)    
    0x15, 0x00,                         //    LOGICAL_MINIMUM (0)          
    0x26, 0xff, 0x00,                   //    LOGICAL_MAXIMUM (0xff) 
    0x75, 0x08,                         //    REPORT_SIZE (8)             
    0x96, 0x00, 0x01,                   //    REPORT_COUNT (0x100 (256))             
    0xb1, 0x02,                         //    FEATURE (Data,Var,Abs)
```

 

 






