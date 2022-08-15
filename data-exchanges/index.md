---
title: Georgia EPD Data Exchanges
---

Brief outlines of each data exchange we manage.

See also:

* [Diagram of all data exchanges](data-exchange-diagram.pdf) (original at `\\dnr-n3400-05a\dnr-tt-dat\SHARED\DO\EPD DOIT\Data Exchanges\Diagrams\`)
* [Description of web services](web-services.html)

## FIS (Facility Identification System)

👉 EPD facility info sent to Enfotech

### GAPDES (Georgia Pollution Discharge Elimination System)

```mermaid
flowchart TD;

    A(Windsor GAPDES application)
    A -- web service --> B
    B[(NODE_FLOW_FACID)]
    B -- NODE_FLOW_FACID.dbo.sp_Load_FIS --> C
    C[(MFL_GA_STG)]
    C -- web service --> D
    D(EnfoTech FIS application)
```

### Air Branch

```mermaid
flowchart TD;

A(IAIP/GECO applications)
A --> B
B[(AIRBRANCH)]
B -- AIRBRANCH.etl.USP_IAIP_TO_STG --> C
C[(MFL_GA_STG)]
C -- web service --> D
D(EnfoTech FIS application)
```

## GEOS (Georgia EPD Online System)

👉 Permit application info received from Enfotech

### Air Branch

```mermaid
flowchart TD;

A(EnfoTech GEOS application)
A -- web service --> B
B[(MFL_GA_STG)]
B -- MFL_GA_STG.dbo.USP_STG_TO_IAIP --> C
C[(AIRBRANCH.dbo.GST_*)]
C -- AIRBRANCH.etl.GEOS_STG_TO_IAIP_* --> D
D[(AIRBRANCH)]
D --> E
E(IAIP application)
```

### GAPDES

* NPDES Municipal (in production)
* NPDES Industrial (still in planning)
* Stormwater Construction (soon)
* Stormwater Industrial (under development)

```mermaid
flowchart TD;

A(EnfoTech GEOS application)
A -- web service --> B
B[(MFL_GA_STG)]
B -- web service? --> C
C(Windsor GAPDES application)
```

## FIMS (Financial Information Management System)

👉 Fee info sent to Enfotech

### SDWIS (Safe Drinking Water Information System)

```mermaid
flowchart TD;

A(SDWIS application)
A -- web service calls stored procedure --> B
B[(MFL_GA_STG.sdw.*)]
B -- MFL_GA_STG.dbo.USP_TRANSFER_SDWIS_DATA --> C
C[(MFL_GA_STG.FIMS.*)]
C -- web service --> D
D(EnfoTech FIMS application)
```

### GAPDES

```mermaid
flowchart LR;

A(EnfoTech GEOS application) --> B(EnfoTech FIMS application)
```

## EIS (Emissions Inventory System)

👉 The Emissions Inventory is now handled by EPA's CAERS.

## ICIS (Integrated Compliance Information System)

👉 Facility, enforcement, and permitting data sent to EPA

### ICIS-Air

```mermaid
flowchart TD;

A(IAIP application) --> 
B[(AIRBRANCH)]
B -- AIRBRANCH.etl.ICIS_* --> C
C[(NETWORKNODEFLOW)]
C -- "web service (VESA)" --> D
D(EPA ICIS-Air)
```

### ICIS-NPDES

```mermaid
flowchart LR;

A(Windsor GAPDES application) --> B(EPA ICIS-NPDES)
```
