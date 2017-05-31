---
title: IProfile
description: IProfile
MSHAttr:
- 'PreferredSiteName:MSDN'
- 'PreferredLib:/library/windows/hardware'
ms.assetid: 62442c73-627c-4f91-b33e-ec3e55293d70
ms.prod: W10
ms.mktglfcycl: operate
ms.sitesec: msdn
ms.author: windows-hardware-design-content
ms.date: 05/05/2017
ms.topic: article
ms.prod: windows-hardware
ms.technology: windows-oem
---

# IProfile


Represents a profile that the client controls. The interface provides functions that loads a profile, in XML format, either from a file or from a string. The client can determine whether the user is allowed to update to the profile by adding or removing Event Tracing for Windows (ETW) providers.

## Syntax


``` syntax
{
  typedef enum
  {
    LoggingMode_Unknown,
    LoggingMode_Memory,
    LoggingMode_File,
  }
  CLoggingMode;
  typedef enum
  {
    DetailLevel_Unknown,
    DetailLevel_Light,
    DetailLevel_Verbose,
  }
  CDetailLevel;
  [propget, id(1), helpstring("IsMutable")] HRESULT IsMutable
    ([out, retval] VARIANT_BOOL* pfMutable);
  [propput, id(1), helpstring("IsMutable")] HRESULT IsMutable
    ([in] VARIANT_BOOL fMutable);  [propget, id(2), helpstring("Version")] HRESULT Version
    ([out, retval] float* pVersion);
  [propget, id(3), helpstring("Author")] HRESULT Author
    ([out, retval] BSTR* pbstrAuthor);
  [propget, id(4), helpstring("Team")] HRESULT Team
    ([out, retval] BSTR* pbstrTeam);
  [propget, id(5), helpstring("Comments")] HRESULT Comments
    ([out, retval] BSTR* pbstrComments);
  [propget, id(6), helpstring("Company")] HRESULT Company
    ([out, retval] BSTR* pbstrCompany);
  [propget, id(7), helpstring("Copyright")] HRESULT Copyright
    ([out, retval] BSTR* pbstrCopyright);
  [propget, id(8), helpstring("Tag")] HRESULT Tag
    ([out, retval] BSTR* pbstrTag);
  [propget, id(9), helpstring("Id")] HRESULT Id
    ([out, retval] BSTR* pbstrId);
  [propget, id(10), helpstring("Name")] HRESULT Name
    ([out, retval] BSTR* pbstrName);
  [propget, id(11), helpstring("Description")] HRESULT Description
    ([out, retval] BSTR* pbstrDescription);
  [propget, id(12), helpstring("LoggingMode")] HRESULT LoggingMode
    ([out, retval] CLoggingMode* pLoggingMode);
  [propget, id(13), helpstring("LoggingModeString")] HRESULT LoggingModeString
    ([out, retval] BSTR* pbstrLoggingMode);
  [propget, id(14), helpstring("DetailLevel")] HRESULT DetailLevel
    ([out, retval] CDetailLevel* pDetailLevel);
  [propget, id(15), helpstring("DetailLevelString")] HRESULT DetailLevelString
    ([out, retval] BSTR* pbstrDetailLevel);
  [propget, id(16), helpstring("IsStrict")] HRESULT IsStrict
    ([out, retval] VARIANT_BOOL* pfStrict);
  [propget, id(17), helpstring("IsDefault")] HRESULT IsDefault
    ([out, retval] VARIANT_BOOL* pfDefault);
  [propget, id(18), helpstring("ProblemCategories")] HRESULT ProblemCategories
    ([out, retval] BSTR* pbstrProblemCategories);
  [id(19), helpstring("LoadFromFile")] HRESULT LoadFromFile
    ([in] BSTR bstrProfileName,
    [in] BSTR bstrFileName);
  [id(20), helpstring("LoadFromString")] HRESULT LoadFromString
    ([in] BSTR bstrProfile);
  [id(21), helpstring("IsEqual")] HRESULT IsEqual
    ([in] IProfile* pProfile);};
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
<td><p><strong>propget</strong></p></td>
<td><p>Returns the value of the specified property.</p></td>
</tr>
<tr class="even">
<td><p><strong>propput</strong></p></td>
<td><p>Sets the specified property.</p></td>
</tr>
<tr class="odd">
<td><p>[LoadFromFile](loadfromfile.md)</p></td>
<td><p>Loads a profile from the specified file.</p></td>
</tr>
<tr class="even">
<td><p>[LoadFromString](loadfromstring.md)</p></td>
<td><p>Loads a profile from the specified XML profile definition string.</p></td>
</tr>
<tr class="odd">
<td><p>[IsEqual](isequal.md)</p></td>
<td><p>Compares two <strong>IProfile</strong> objects.</p></td>
</tr>
</tbody>
</table>

 

## Properties


This interface provides the properties described in the following table.

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th>Property</th>
<th>Parameters</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p><strong>IsMutable</strong></p></td>
<td><p><em>pfMutable</em></p></td>
<td><p>[out] Returns a Boolean value that indicates that sessions and providers can be added to an existing profile when profiles of the same name are combined with the <strong>IProfileCollection::Add</strong> method. S_OK indicates success.</p></td>
</tr>
<tr class="even">
<td><p><strong>IsMutable</strong></p></td>
<td><p><em>fMutable</em></p></td>
<td><p>[in] A Boolean value that indicates whether sessions and providers can be added to the profiles. S_OK indicates success.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Version</strong></p></td>
<td><p><em>pVersion</em></p></td>
<td><p>[out] Indicates the version of the profiles.</p></td>
</tr>
<tr class="even">
<td><p><strong>Author</strong></p></td>
<td><p><em>pbstrAuthor</em></p></td>
<td><p>[out] Indicates the author of the profiles.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Team</strong></p></td>
<td><p><em>pbstrTeam</em></p></td>
<td><p>[out] Indicates the team that created the profiles.</p></td>
</tr>
<tr class="even">
<td><p><strong>Comments</strong></p></td>
<td><p><em>pbstrComments</em></p></td>
<td><p>[out] Optional comments about the profiles.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Company</strong></p></td>
<td><p><em>pbstrCompany</em></p></td>
<td><p>[out] Indicates the company that created the profiles.</p></td>
</tr>
<tr class="even">
<td><p><strong>Copyright</strong></p></td>
<td><p><em>pbstrCopyright</em></p></td>
<td><p>[out] Indicates copyright information related to the profiles.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Tag</strong></p></td>
<td><p><em>pbstrTag</em></p></td>
<td><p>[out] Optional tagged value that can be used to differentiate between profiles.</p></td>
</tr>
<tr class="even">
<td><p><strong>Id</strong></p></td>
<td><p><em>pbstrId</em></p></td>
<td><p>[out] Indicates the identifier of the profile.</p></td>
</tr>
<tr class="odd">
<td><p><strong>Name</strong></p></td>
<td><p><em>pbstrName</em></p></td>
<td><p>[out] Indicates the name of the profile.</p></td>
</tr>
<tr class="even">
<td><p><strong>Description</strong></p></td>
<td><p><em>pbstrDescription</em></p></td>
<td><p>[out] Indicates the description of the profile.</p></td>
</tr>
<tr class="odd">
<td><p><strong>LoggingMode</strong></p></td>
<td><p><em>pLoggingMode</em></p></td>
<td><p>[out] Indicates the logging mode.</p></td>
</tr>
<tr class="even">
<td><p><strong>LoggingModeString</strong></p></td>
<td><p><em>pbstrLoggingMode</em></p></td>
<td><p>[out] Indicates the logging mode string. Possible values are &quot;memory&quot; and &quot;file&quot;.</p></td>
</tr>
<tr class="odd">
<td><p><strong>DetailLevel</strong></p></td>
<td><p><em>pDetailLevel</em></p></td>
<td><p>[out] Indicates the detail level.</p></td>
</tr>
<tr class="even">
<td><p><strong>DetailLevelString</strong></p></td>
<td><p><em>pbstrDetailLevel</em></p></td>
<td><p>[out] Indicates the detail level string. Possible values are &quot;verbose&quot; and &quot;light&quot;.</p></td>
</tr>
<tr class="odd">
<td><p><strong>IsStrict</strong></p></td>
<td><p><em>pfStrict</em></p></td>
<td><p>[out] A Boolean that indicates whether the recording rolls back if any collector or provider fails to start.</p></td>
</tr>
<tr class="even">
<td><p><strong>IsDefault</strong></p></td>
<td><p><em>pfDefault</em></p></td>
<td><p>[out] A Boolean that indicates whether this is a default profile.</p></td>
</tr>
<tr class="odd">
<td><p><strong>ProblemCategories</strong></p></td>
<td><p><em>pbstrProblemCategories</em></p></td>
<td><p>[out] Indicates the issues that this profile is designed to detect.</p></td>
</tr>
</tbody>
</table>

 

## Related topics


[Interfaces](interfaces-wprcontrol.md)

 

 







