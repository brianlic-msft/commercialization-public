---
title: IParsingErrorInfo
description: IParsingErrorInfo
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: bdec574b-3863-499f-8bf3-fe89d4400d29
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# IParsingErrorInfo


Provides functions that identify where the validation of an XML file failed. The interface derives from the COM [IErrorInfo](http://go.microsoft.com/fwlink/p/?linkid=217161) interface, which provides functions that access detailed contextual error information.

## Syntax


``` syntax
{
  [id(1), helpstring("GetColumnNumber")] HRESULT GetColumnNumber
    ([out, retval] ULONG* pColumnNumber);
  [id(2), helpstring("GetLineNumber")] HRESULT GetLineNumber
    ([out, retval] ULONG* pLineNumber);
  [id(3), helpstring("GetElementType")] HRESULT GetElementType
    ([out, retval] BSTR* pbstrElementType);
  [id(4), helpstring("GetElementId")] HRESULT GetElementId
    ([out, retval] BSTR* pbstrElementId);
};
```

## Functions


The following table describes the functions that this interface provides.

<table>
<colgroup>
<col width="50%" />
<col width="50%" />
</colgroup>
<thead>
<tr class="header">
<th>Function</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>[GetColumnNumber](getcolumnnumber.md)</p></td>
<td><p>Returns the column number of the validation error.</p></td>
</tr>
<tr class="even">
<td><p>[GetLineNumber](getlinenumber.md)</p></td>
<td><p>Returns the line number of the validation error.</p></td>
</tr>
<tr class="odd">
<td><p>[GetElementType](getelementtype.md)</p></td>
<td><p>Returns the element type at which the validation error occurred.</p></td>
</tr>
<tr class="even">
<td><p>[GetElementId](getelementid.md)</p></td>
<td><p>Returns the element identifier at which the validation error occurred.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Interfaces](interfaces-wprcontrol.md)

 

 







