library SharedLogic version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '0.1.0' called FHIRHelpers
include CaseFeature version '0.1.0' called CaseFeature

context Patient

define "Has been prescribed an oral NSAID":
  CaseFeature."Prescribed an oral NSAID".value.value as System.Boolean

define "Has been prescribed a gastroprotective":
  CaseFeature."Prescribed a gastroprotective".value.value as System.Boolean

define "Has at least one Structured Medical Review":
  CaseFeature."At least one Structured Medical Review".value.value as System.Boolean

define "Patient Age in Years":
  Abs(difference in years between Now() and CaseFeature."Birthdate".value)

define "Is aged 18 or over":
  "Patient Age in Years" >= 18

define "Is aged 65 or over":
  "Patient Age in Years" >= 65

define "Aged 65 or over prescribed an oral NSAID and not prescribed a gastroprotective":
  "Is aged 65 or over" and
  "Has been prescribed an oral NSAID" and
  not "Has been prescribed a gastroprotective"
