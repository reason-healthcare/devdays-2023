library CaseFeatureInference version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '0.1.0' called FHIRHelpers
include CommonLogic version '0.1.0' called Common

valueset "ORALNSAIDDRUG_COD": 'http://devdays.com/cpg-example/ValueSet/ORALNSAIDDRUG'
valueset "ULCERHEALDRUG_COD": 'http://devdays.com/cpg-example/ValueSet/ULCERHEALDRUG'

codesystem "LOINC": 'http://loinc.org'
codesystem "SCT": 'http://snomed.info/sct'

code "AgeCF": '424144002' from "SCT"
code "BirthsexCF": '734000001' from "SCT"
code "BodyWeightCF": '29463-7' from "LOINC"

code "StructuredMedicalReviewCode": '312853008' from "SCT"

context Patient

define "Birthdate":
  if Patient.birthDate is null then
    null
  else
    Observation {
      subject: Common.referenceTo(Patient),
      code: CodeableConcept {
        coding: {
          Coding {
            system: uri { value: 'http://snomed.info/sct' },
            code: code { value: '184099003' }
          }
        }
      },
      value: dateTime { value: ToDateTime(Patient.birthDate) }
    }


define "Oral NSAID Prescriptions":
  Common.ActiveMedicationRequests([MedicationRequest: "ORALNSAIDDRUG_COD"])

define "Latest Oral NSAID Prescription":
  Common.MostRecent("Oral NSAID Prescriptions")

define "Prescribed an oral NSAID":
  Observation {
    subject: Common.referenceTo(Patient),
    code: CodeableConcept {
      coding: {
        Coding {
          system: uri { value: 'http://snomed.info/sct' },
          code: code { value: '350321003' }
        }
      }
    },
    effective: dateTime { 
      value: Coalesce("Latest Oral NSAID Prescription".authoredOn, Now()) 
    },
    value: boolean { 
      value: "Latest Oral NSAID Prescription" is not null 
    }
  }


define "Gastroprotective Prescriptions within Fiscal Year":
  Common.ActiveMedicationRequests([MedicationRequest: "ULCERHEALDRUG_COD"])

define "Latest Gastroprotective Prescriptions within Fiscal Year":
  Common.MostRecent("Gastroprotective Prescriptions within Fiscal Year")

define "Prescribed a gastroprotective":
  Observation {
    subject: Common.referenceTo(Patient),
    code: CodeableConcept {
      coding: {
        Coding {
          system: uri { value: 'http://snomed.info/sct' },
          code: code { value: '6425004' }
        }
      }
    },
    effective: dateTime { 
      value: Coalesce("Latest Gastroprotective Prescriptions within Fiscal Year".authoredOn, Now()) 
    },
    value: boolean { 
      value: "Latest Gastroprotective Prescriptions within Fiscal Year" is not null 
    }
  }


define "Lastest structured medical review procedure":
  Common.MostRecent([Procedure: "StructuredMedicalReviewCode"])

define "At least one Structured Medical Review":
  Observation {
    subject: Common.referenceTo(Patient),
    code: CodeableConcept {
      coding: {
        Coding {
          system: uri { value: 'http://snomed.info/sct' },
          code: code { value: '312853008' }
        }
      }
    },
    effective: dateTime {
      value: Coalesce(
        "Lastest structured medical review procedure".performed,
        Now()
      )
    },
    value: boolean { value: "Lastest structured medical review procedure" is not null }
  }