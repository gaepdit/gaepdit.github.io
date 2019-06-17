---
title: Georgia EPD Data Exchanges
---

# Georgia EPD Data Exchanges

Brief outlines of each data exchange we manage.

[Web services](web-services.html)

## FIS (Facility Identification System)

👉 EPD facility info sent to Enfotech

### GAPDES (Georgia Pollution Discharge Elimination System)

```
*Windsor* GAPDES application
|
| web service
↓
[NODE_FLOW_FACID]
|
| [NODE_FLOW_FACID].dbo.sp_Load_FIS
↓
[MFL_GA_STG]
|
| web service
↓
*EnfoTech* FIS application
```

### Air Branch

```
IAIP/GECO applications
↓
[AIRBRANCH]
|
| [AIRBRANCH].etl.USP_IAIP_TO_STG
↓
[MFL_GA_STG]
|
| web service
↓
*EnfoTech* FIS application
```

## GEOS (Georgia EPD Online System)

👉 Permit application info received from Enfotech

### Air Branch

```
*EnfoTech* GEOS application
|
| web service
↓
[MFL_GA_STG]
|
| [MFL_GA_STG].dbo.USP_STG_TO_IAIP
↓
[AIRBRANCH].dbo.GST_*
|
| [AIRBRANCH].etl.GEOS_STG_TO_IAIP_APPLICATIONS
| [AIRBRANCH].etl.GEOS_STG_TO_IAIP_INSPECTIONS
↓
[AIRBRANCH]
↓
IAIP application
```

### GAPDES

- NPDES Municipal (in production)
- NPDES Industrial (still in planning)
- Stormwater Construction (soon)
- Stormwater Industrial (under development)

```
*EnfoTech* GEOS application
|
| web service
↓
[MFL_GA_STG]
|
| web service???
↓
*Windsor* GAPDES application
```

## FIMS (Financial Information Management System)

👉 Fee info sent to Enfotech

### SDWIS (Safe Drinking Water Information System)

```
SDWIS application
|
| web service calls stored procedure
↓
[MFL_GA_STG].sdw.*
|
| [MFL_GA_STG].dbo.USP_TRANSFER_SDWIS_DATA
↓
[MFL_GA_STG].FIMS.*
|
| web service
↓
*EnfoTech* FIMS application
```

### GAPDES

```
*EnfoTech* GEOS application
↓
*EnfoTech* FIMS application
```

## EIS (Emission Inventory System)

👉 Air emission info sent to EPA

```
GECO application
↓
[AIRBRANCH]
|
| [AIRBRANCH].etl.SP_EIS_FI_LOAD_STAGING
| [AIRBRANCH].etl.SP_EIS_PSE_LOAD_STAGING
↓
[NETWORKNODEFLOW]
|
| web service (ENSC/VES)
↓
*EPA* EIS Gateway
```

## ICIS (Integrated Compliance Information System)

👉 Facility, enforcement, and permitting data sent to EPA

### ICIS-Air

```
IAIP application
↓
[AIRBRANCH]
|
| [AIRBRANCH].etl.ICIS_*
↓
[NETWORKNODEFLOW]
|
| web service (VESA)
↓
*EPA* ICIS-Air
```

### ICIS-NPDES

```
*Windsor* GAPDES application
↓
*EPA* ICIS-NPDES
```
