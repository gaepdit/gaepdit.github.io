---
title: Data Exchange Web Services
---

# Data Exchange Web Services

## Servers

All listed data exchanges run on the following servers.

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

### Configuration

Application: `D:\Services\FISDataService\FacilityProfiler.DataServices.exe`  
Configuration file: `D:\Services\FISDataService\FacilityProfiler.DataServices.exe.config`  

## GEOS (Georgia EPD Online System)

Enfotech service runs as a Windows scheduled task.

Task: "GEOS_to_IAIP"  
Schedule: 1am daily

### Configuration

Application: `D:\Services\GEOSDataService\GovOnline.DataExchange.exe`  
Configuration file: `D:\Services\GEOSDataService\GovOnline.DataExchange.exe`  

## ICIS-Air

VES Connector runs as a Windows Service named "VES Connector".

The ICIS-Air data exchange runs as scheduled tasks in VESA. Schedule: [23 separate tasks](https://github.com/gaepdit/icis-air-data-exchange/blob/main/docs/VESA%20tasks%20in%20order.md)

Database: NETWORKNODEFLOW  
User: NETWORKNODEFLOW  

### Configuration

Service program location: `D:\Services\VESConnector\VESConnectorServer.exe`  
Configuration file: `D:\Services\VESConnector\VESConnectorServer.exe.config`  
