---
title: Data Exchange Web Services
---

# Data Exchange Web Services

## Servers

All listed data exchanges run on the following servers.

### CMS

Prod web server: 167.192.208.134  
Prod database: 167.192.209.7  

Dev web server: 167.192.208.199  
Dev database: 167.192.209.70  

### SEI

Prod web server: 10.149.210.227 (internal), 167.200.249.130 (external)  
Prod database: 10.149.210.242  

Test web server: 10.149.211.66 (internal), 167.200.249.132 (external)  
Test database: 10.149.211.83  

## FIS (Facility Identification System)

Enfotech service runs as a Windows scheduled task.

Task: "FISDataService"  
Schedule: 2am daily

Database: MFL_GA_STG  
User: MFL_GA_STG  

### CMS Configuration

Application: `E:\FISDataService\FacilityProfiler.DataServices.exe`  
Configuration file: `E:\FISDataService\FacilityProfiler.DataServices.exe.config`

### SEI Configuration

Application: `D:\Services\FISDataService\FacilityProfiler.DataServices.exe`  
Configuration file: `D:\Services\FISDataService\FacilityProfiler.DataServices.exe.config`  

## GEOS (Georgia EPD Online System)

Enfotech service runs as a Windows scheduled task.

Task: "GEOS_to_IAIP"  
Schedule: 1am daily

### CMS Configuration

Application: `E:\GEOS_TO_IAIP\GovOnline.DataExchange.exe`  
Configuration file: `E:\GEOS_TO_IAIP\GovOnline.DataExchange.exe.config`  

### SEI Configuration

Application: `D:\Services\GEOSDataService\GovOnline.DataExchange.exe`  
Configuration file: `D:\Services\GEOSDataService\GovOnline.DataExchange.exe`  

## ICIS-Air/EIS

VES Connector runs as a Windows Service named "VES Connector".

* ICIS-Air data exchange runs as scheduled tasks in VESA. Schedule: [23 separate tasks](https://github.com/gaepdit/icis-air-data-exchange/blob/master/docs/VESA%20tasks%20in%20order.md) run weekly, from 7pm Thursday through 12:15am Friday.
* EIS data exchanged is trigger manually by Air Branch staff.

Database: NETWORKNODEFLOW  
User: NETWORKNODEFLOW  

### CMS Configuration

Service: `C:\Program Files\EPA.gov\VESConnector\VESConnectorServer.exe`  
Configuration file: `C:\Program Files\EPA.gov\VESConnector\VESConnectorServer.exe.config`  

### SEI Configuration

Service program location: `D:\Services\VESConnector\VESConnectorServer.exe`  
Configuration file: `D:\Services\VESConnector\VESConnectorServer.exe.config`  
