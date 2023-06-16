library GuidelineLogic version '0.1.0'

using FHIR version '4.0.1'

include SharedLogic version '0.1.0' called Shared

context Patient

define "Aged 65 or over prescribed an oral NSAID and not prescribed a gastroprotective and missing SMR":
  Shared."Aged 65 or over prescribed an oral NSAID and not prescribed a gastroprotective"
  and not Shared."Has at least one Structured Medical Review"
