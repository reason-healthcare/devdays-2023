library CaseFeature version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '0.1.0' called FHIRHelpers
include CommonLogic version '0.1.0' called Common
include CaseFeatureInference version '0.1.0' called Inference
include CaseFeatureAssertion version '0.1.0' called Assertion

context Patient

define "Birthdate":
  Coalesce(
    Assertion."Birthdate",
    Inference."Birthdate"
  )

define "Prescribed an oral NSAID":
  Coalesce(
    Assertion."Prescribed an oral NSAID",
    Inference."Prescribed an oral NSAID"
  )

define "Prescribed a gastroprotective":
  Coalesce(
    Assertion."Prescribed a gastroprotective",
    Inference."Prescribed a gastroprotective"
  )

define "At least one Structured Medical Review":
  Coalesce(
    Assertion."At least one Structured Medical Review",
    Inference."At least one Structured Medical Review"
  )