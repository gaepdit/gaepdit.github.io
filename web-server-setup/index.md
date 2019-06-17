---
title: Web Application Server Setup
---

# Web Application Server Setup

	=========================
	Created by: Brian Gregory
	Created on: 06/24/2016
	=========================
	Updated by: Brian Gregory
	Updated on: 06/24/2016
	=========================

## Setup steps

- Add Roles
	- File Services (default)
		- File Server
	- Web Server (IIS)
		- All Features
	- SMTP Server
- Install Offline .Net 4.6.1 (or latest) Framework and any other versions needed
- Install SAP Crystal Report runtime version 13.0.16 (or latest); 64 and 32 bit versions
- Add Feature(s)
	- Telnet Client

- In the application drive create %ROOT%\inetpub\ generally the E:\ drive
	
- IIS Logging
	- Go to IIS Logging and change the logging Directory to E: from %SystemDrive%
	
- Default Site location
	- Sites > Default Site > RC > Manage Web Site > Advanced Settings
	- change General Physical Path to E:\ from %SystemDrive%
	
- from Command Prompt (run as administrator) OR run aspnet_regiis.bat found in EPD DOIT\DataCenters\CMS - Servers

	- cd Microsoft.Net\Framework\v2. (press tab for folder)
	- run command: `aspnet_regiis -i`
	
	- cd Microsoft.Net\Framework\v4. (press tab for folder)
	- run command: `aspnet_regiis -i`
	
	- cd Microsoft.Net\Framework64\v2. (press tab for folder)
	- run command: `aspnet_regiis -i`
		
	- cd Microsoft.Net\Framework64\v4. (press tab for folder)
	- run command: `aspnet_regiis -i`
	
- Set-up SMTP
	- Go to Roles > Web Server IIS > IIS Manager > localhost > ASP.NET > SMTP Email
		- SMTP Server: smtp.gets.ga.gov port 25


## Additional details for Web Site Management

Please use the E:\inetpub\wwwroot location for all deployments. 
Make sure that you create a complete domain(sub) for the website folders. Ex. If I am deploying a website for geco.georgiaair.org, I will create a folder named geco.georgiaair.org in the wwwroot folder.

- Go to E:\inetpub\wwwroot and create the application folder e.g. geco.georgiaair.org
- Go to Server Manager > Roles > Web Server (IIS) > IIS Manager > localhost > Sites
- RC and Add Web Site...
	- Site name: same as the application folder and let IIS create the application pool
	- Physical Path E:\inetpub\wwwroot\FOLDER e.g. geco.georgiaair.org
	- Host name: godaddy url for the site - may change based on PROD, DEV, or UAT
- Add http binding

**All sites should manage their own web.config file for connection management.**

**We are not using the global web.config file for any application related settings. Please do not edit the global web.config and machine.config files.**

Nochange

## Additional Software To Install

## .NET Core

Install the [.NET Core Windows Server Hosting bundle](https://docs.microsoft.com/en-us/aspnet/core/host-and-deploy/iis/index?view=aspnetcore-2.2#install-the-net-core-hosting-bundle)

## Web Deploy

- Install the [Web Deployment Tool](https://www.iis.net/downloads/microsoft/web-deploy) (Choose "Complete" installation)

## HTTPS (URL Rewrite) 

- Install the [IIS URL Rewrite module](https://www.iis.net/downloads/microsoft/url-rewrite)
