---
title: Data Exchange Web Services
---

# Data Exchange Web Services

## FIS (Facility Identification System)

Enfotech service runs as a Windows scheduled task.

Program location: E:\FISDataService\  
Configuration file: E:\FISDataService\FacilityProfiler.DataServices.exe.config

Windows Task Scheduler  
Task: FISDataService  
Runs: E:\FISDataService\FacilityProfiler.DataServices.exe  
Schedule: 2am every day

### Prod

Web server: 167.192.208.134  
SQL Server database: 167.192.209.7  
    Database: MFL_GA_STG  
    User: MFL_GA_STG  
Exception log: https://dx.gaepd.org/exception_log/FIS_ExceptionLog.txt

### Dev

Web server: 167.192.208.199  
SQL Server database: 167.192.209.70  
    Database: MFL_GA_STG  
    User: MFL_GA_STG  
Exception log: https://dev-dx.gaepd.org/exception_log/FIS_ExceptionLog.txt  

## GEOS (Georgia EPD Online System)

Enfotech service runs as a Windows scheduled task.

Program location: E:\GEOS_TO_IAIP\  
Configuration file: E:\GEOS_TO_IAIP\GovOnline.DataExchange.exe.config  

Windows Task Scheduler  
Task: GEOS_to_IAIP  
Runs: E:\GEOS_TO_IAIP\GovOnline.DataExchange.exe  
Schedule: 1am every day  

### Prod

Web server: 167.192.208.134  
SQL Server database: 167.192.209.7  
    Database: MFL_GA_STG  
    User: MFL_GA_STG  
Exception log: https://dx.gaepd.org/exception_log/GEOS_ExceptionLog.txt  

### Dev

Web server: 167.192.208.199  
SQL Server database: 167.192.209.70  
    Database: MFL_GA_STG  
    User: MFL_GA_STG  
Exception log: https://dev-dx.gaepd.org/exception_log/GEOS_ExceptionLog.txt

## ICIS-Air/EIS

VES service runs as a Windows Service.  
ICIS-Air data exchange runs as a scheduled task in VESA. EIS data exchanged is trigger manually by Air Branch staff.

Windows Service name: CDX Connector  
Program location: C:\Program Files\EPA.gov\VirtualNodeConnector\CDXConnectorServer.exe  
Configuration file: C:\Program Files\EPA.gov\VirtualNodeConnector\CDXConnectorServer.exe.config  

ICIS-Air VESA Schedule: [23 separate tasks](https://bitbucket.org/gaepdit/icis-air-data-exchange/src/master/docs/VESA%20tasks%20in%20order.md) run weekly, from 7pm Thursday through 12:15am Friday

### Prod

Web server: 167.192.208.134  
SQL Server database: 167.192.209.7:1433  
    Database: NETWORKNODEFLOW  
    User: NETWORKNODEFLOW  

### Dev

Web server: 167.192.208.199  
SQL Server database: 167.192.209.70:1433  
    Database: NETWORKNODEFLOW  
    User: NETWORKNODEFLOW  
