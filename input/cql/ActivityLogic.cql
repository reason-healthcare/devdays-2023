library ActivityLogic version '0.1.0'

using FHIR version '4.0.1'

include SharedLogic version '0.1.0' called Shared

context Patient

define "Patient Instruction for Structured Medical Review":
  if Shared."Is aged 65 or over" then
    'Since the patient is over 65, then do ABC...'
  else if Shared."Is aged 18 or over" then
    'Since the patient is over 18, but less than 65, do XYZ...'
  else
    'The patient is not over 18 or 65, this probably should not be a thing...'