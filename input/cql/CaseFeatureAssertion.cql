library CaseFeatureAssertion version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '0.1.0' called FHIRHelpers
include CommonLogic version '0.1.0' called Common

codesystem "SCT": 'http://snomed.info/sct'

code "BirthDateCF": '184099003' from "SCT"
code "OralNSAIDCF": '350321003' from "SCT"
code "GastroProtectiveCF": '6425004' from "SCT"
code "StructuredMedicalReviewCF": '312853008' from "SCT"

context Patient

define "Birthdate assertions":
  Common.QualifiedObservations([Observation: "BirthDateCF"])

define "Birthdate":
  Common.MostRecent("Birthdate assertions")


define "Prescribed an oral NSAID assertions":
  Common.QualifiedObservations([Observation: "OralNSAIDCF"])

define "Prescribed an oral NSAID":
  Common.MostRecent("Prescribed an oral NSAID assertions")


define "Prescribed a gastroprotective assertions":
  Common.QualifiedObservations([Observation: "GastroProtectiveCF"])

define "Prescribed a gastroprotective":
  Common.MostRecent("Prescribed a gastroprotective assertions")


define "At least one Structured Medical Review":
  Common.MostRecent([Observation: "StructuredMedicalReviewCF"])
