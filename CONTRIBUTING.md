# Contributing to niveristand-custom-device-wizard

Contributions to niveristand-custom-device-wizard are welcome from all!

niveristand-custom-device-wizard is managed via [git](https://git-scm.com), with the canonical upstream
repository hosted on [GitHub](https://github.com/ni/niveristand-custom-device-wizard/).

niveristand-custom-device-wizard follows a pull-request model for development.  If you wish to
contribute, you will need to create a GitHub account, fork this project, push a
branch with your changes to your project, and then submit a pull request.

See [GitHub's official documentation](https://help.github.com/articles/using-pull-requests/) for more details.

# Getting Started

- Use LabVIEW 2016 or later.
- Sync the source into the [LabVIEW 20xx]\ProjectTemplates folder in the following manner:
	- "ProjectTemplate\MetaData\NI_VeriStandCustomDevice_TemplateMetaData.xml" into the "ProjectTemplates\MetaData" folder
	- "ProjectTemplate\Source\NI VeriStand\Custom Device\*" into the "ProjectTemplates\Source\NI VeriStand\Custom Device" folder:
		- NI_VS_Consolidated_CDW_MetaDataObj
		- Template Classes
		- Template Files
		- Null.lvproj
		- Consolidated Custom Device.lvproj (only necessary for development)
- Ensure the following dependent packages are installed:
	- NI Compiled HTML Menu Tool 1.0.0.12 or later
	- NI Keyed Array Library 2.0.0.11 or later
	- NI String Tools Library 2.0.0.5 or later
	- NI VeriStand .NET Assembly Binding Redirection Configuration Files 1.0.0.2 or later
	- NI VeriStand Advanced SysDef API 1.1.1.6 or later
	- NI VeriStand Custom Device Import and Export Tool 1.0.0.7 or later
	- NI VeriStand Error API 1.0.0.3 or later
	- NI Veristand Inline Async API 1.0.0.31 or later
- Select File > Create Project in LabVIEW and select the "CONSOLIDATED NI VeriStand Custom Device" project template.


# Testing

- Create an instance of each of the custom device projects listed in the project template UI and ensure they are created properly without errors.

# Developer Certificate of Origin (DCO)

   Developer's Certificate of Origin 1.1

   By making a contribution to this project, I certify that:

   (a) The contribution was created in whole or in part by me and I
       have the right to submit it under the open source license
       indicated in the file; or

   (b) The contribution is based upon previous work that, to the best
       of my knowledge, is covered under an appropriate open source
       license and I have the right under that license to submit that
       work with modifications, whether created in whole or in part
       by me, under the same open source license (unless I am
       permitted to submit under a different license), as indicated
       in the file; or

   (c) The contribution was provided directly to me by some other
       person who certified (a), (b) or (c) and I have not modified
       it.

   (d) I understand and agree that this project and the contribution
       are public and that a record of the contribution (including all
       personal information I submit with it, including my sign-off) is
       maintained indefinitely and may be redistributed consistent with
       this project or the open source license(s) involved.

(taken from [developercertificate.org](https://developercertificate.org/))

See [LICENSE](https://github.com/ni/niveristand-custom-device-wizard/blob/master/LICENSE)
for details about how niveristand-custom-device-wizard is licensed.
