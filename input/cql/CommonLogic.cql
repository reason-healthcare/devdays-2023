library CommonLogic version '0.1.0'

using FHIR version '4.0.1'

include FHIRHelpers version '0.1.0' called FHIRHelpers

codesystem "ConditionClinicalStatusCodes": 'http://terminology.hl7.org/CodeSystem/condition-clinical'
codesystem "ConditionVerificationStatusCodes": 'http://terminology.hl7.org/CodeSystem/condition-ver-status'
codesystem "ObservationStatusCodes": 'http://hl7.org/fhir/observation-status'
codesystem "MedicationStatusCodes": 'http://hl7.org/fhir/CodeSystem/medication-status'
codesystem "MedicationRequestStatusCodes": 'http://hl7.org/fhir/CodeSystem/medicationrequest-status'
codesystem "MedicationRequestStatusReasonCodes": 'http://terminology.hl7.org/CodeSystem/medicationrequest-status-reason'
codesystem "AllergyTypeCodes": 'http://hl7.org/fhir/allergy-intolerance-type'
codesystem "AllergyCategoryCodes": 'http://hl7.org/fhir/allergy-intolerance-category'
codesystem "AllergyClinicalStatusCodes": 'http://terminology.hl7.org/CodeSystem/allergyintolerance-clinical'
codesystem "AllergyVerificationStatusCodes": 'http://terminology.hl7.org/CodeSystem/allergyintolerance-verification'
codesystem "EncounterStatusCodes": 'http://hl7.org/fhir/encounter-status'

// Condition Clinical Status Codes - Consider value sets for these
code "activeClinicalStatus": 'active' from "ConditionClinicalStatusCodes"
code "recurrence": 'recurrence' from "ConditionClinicalStatusCodes"
code "relapse": 'relapse' from "ConditionClinicalStatusCodes"
code "inactive": 'inactive' from "ConditionClinicalStatusCodes"
code "remission": 'remission' from "ConditionClinicalStatusCodes"
code "resolved": 'resolved' from "ConditionClinicalStatusCodes"

// Condition Verification Status Codes - Consider value sets for these
code "unconfirmed": 'unconfirmed' from ConditionVerificationStatusCodes
code "provisional": 'provisional' from ConditionVerificationStatusCodes
code "differential": 'differential' from ConditionVerificationStatusCodes
code "confirmed": 'confirmed' from ConditionVerificationStatusCodes
code "refuted": 'refuted' from ConditionVerificationStatusCodes
code "condition-entered-in-error": 'entered-in-error' from ConditionVerificationStatusCodes

// Observation Status Codes - Consider value sets for these
code "registered": 'registered' from ObservationStatusCodes
code "preliminary": 'preliminary' from ObservationStatusCodes
code "final": 'final' from ObservationStatusCodes
code "amended": 'amended' from ObservationStatusCodes
code "corrected": 'corrected' from ObservationStatusCodes
code "observation-entered-in-error": 'entered-in-error' from ObservationStatusCodes
code "unknown": 'unknown' from ObservationStatusCodes

// Medication Status Codes - Consider value sets for these
code "activeMedicationStatus": 'active' from "MedicationStatusCodes"

// MedicationRequest Status Codes - Consider value sets for these
code "activeMedicationRequestStatus": 'active' from "MedicationRequestStatusCodes"
code "completedMedicationRequestStatus": 'completed' from "MedicationRequestStatusCodes"
code "stoppedMedicationRequestStatus": 'stopped' from "MedicationRequestStatusCodes"

// MedicationRequest StatusReason Codes - Consider value sets for these
code "suspectedAllergy": 'salg' from "MedicationRequestStatusReasonCodes"
code "suspectedIntolerance": 'sintol' from "MedicationRequestStatusReasonCodes"

// Allergy Intolerance Codes
code "allergyTypeAllergy": 'allergy' from "AllergyTypeCodes"
code "intoleranceTypeAllergy": 'intolerance' from "AllergyTypeCodes"
code "allergyCategoryMedication": 'medication' from "AllergyCategoryCodes"
code "activeAllergyClinicalStatus": 'active' from "AllergyClinicalStatusCodes"
code "confirmedAllergyStatus": 'confirmed' from "AllergyVerificationStatusCodes"

// Encounter Status Codes
code "plannedEncounterStatus": 'planned' from "EncounterStatusCodes"
code "arrivedEncounterStatus": 'arrived' from "EncounterStatusCodes"
code "triagedEncounterStatus": 'triaged' from "EncounterStatusCodes"
code "inprogressEncounterStatus": 'in-progress' from "EncounterStatusCodes"
code "onleaveEncounterStatus": 'onleave' from "EncounterStatusCodes"
code "finishedEncounterStatus": 'finished' from "EncounterStatusCodes"
code "cancelledEncounterStatus": 'cancelled' from "EncounterStatusCodes"
code "enteredinerrorEncounterStatus": 'entered-in-error' from "EncounterStatusCodes"

parameter "Asserted Lookback Duration" System.Quantity default 6 months

context Patient

define function QualifiedObservations(value List<FHIR.Observation>):
  value Observation
    where (Observation.status ~ "final".code
        or Observation.status ~ "amended".code
        or Observation.status ~ "corrected".code
      )

define function QualifiedConditions(value List<FHIR.Condition>):
  value Condition
      where Condition.clinicalStatus ~ "activeClinicalStatus"
          and Condition.verificationStatus ~ "confirmed"

define function QualifiedMedications(value List<FHIR.Medication>):
  value Medication

define function QualifiedEncounters(value List<FHIR.Encounter>):
  value Encounter
    where Encounter.status !~ "cancelledEncounterStatus".code
      and Encounter.status !~ "enteredinerrorEncounterStatus".code

define function ActiveMedicationRequests(value List<FHIR.MedicationRequest>):
  value MedicationRequest
      where MedicationRequest.status ~ "activeMedicationRequestStatus".code

define function ActiveMedicationRequestWithMedications(value List<FHIR.Medication>):
  (ActiveMedicationRequests([MedicationRequest])) QualifiedMedicationRequest
    where exists (
      (QualifiedMedications(value)) QualifiedMedication
        where GetId(QualifiedMedicationRequest.medication.reference.value) ~ QualifiedMedication.id.value
    )

define function StoppedMedicationRequests(value List<FHIR.MedicationRequest>):
  value MedicationRequest
      where MedicationRequest.status ~ "stoppedMedicationRequestStatus".code

define function StoppedMedicationRequestWithMedications(value List<FHIR.Medication>):
  (StoppedMedicationRequests([MedicationRequest])) QualifiedMedicationRequest
    where exists (
      (QualifiedMedications(value)) QualifiedMedication
        where GetId(QualifiedMedicationRequest.medication.reference.value) ~ QualifiedMedication.id.value
    )

define function StoppedDueToIntoleranceMedicationRequests(value List<FHIR.MedicationRequest>):
  (StoppedMedicationRequests(value)) StoppedMedicationRequest
    where (StoppedMedicationRequest.statusReason ~ "suspectedAllergy"
      or StoppedMedicationRequest.statusReason ~ "suspectedIntolerance"
      )

define function StoppedDueToIntoleranceMedicationRequestWithMedications(value List<FHIR.Medication>):
  (StoppedDueToIntoleranceMedicationRequests([MedicationRequest])) QualifiedMedicationRequest
    where exists (
      (QualifiedMedications(value)) QualifiedMedication
        where GetId(QualifiedMedicationRequest.medication.reference.value) ~ QualifiedMedication.id.value
    )

define function MedicationRequestWithMedications(value List<FHIR.Medication>):
([MedicationRequest]) QualifiedMedicationRequest
    where exists (
      (value) QualifiedMedication
        where GetId(QualifiedMedicationRequest.medication.reference.value) ~ QualifiedMedication.id.value
    )

define function QualifiedAllergies(value List<FHIR.AllergyIntolerance>):
  value Allergy
      where Allergy.type ~ "allergyTypeAllergy".code
        and Allergy.clinicalStatus ~ "activeAllergyClinicalStatus"
        and Allergy.verificationStatus ~ "confirmedAllergyStatus"
        and exists (
          Allergy.category Category
            where Category ~ "allergyCategoryMedication".code
        )

define function QualifiedIntolerances(value List<FHIR.AllergyIntolerance>):
  value Allergy
      where Allergy.type ~ "intoleranceTypeAllergy".code
        and Allergy.clinicalStatus ~ "activeAllergyClinicalStatus"
        and Allergy.verificationStatus ~ "confirmedAllergyStatus"
        and exists (
          Allergy.category Category
            where Category ~ "allergyCategoryMedication".code
        )

// NOTE: Asserted Goals encode the Asserted code in the measure element of the
//       0 position target element, by definition
define function AssertedGoals(value List<FHIR.Goal>):
      value Goal
      //TODO: reflect in the profile.  Possibly the structural definition as well.
      where  WithinAssertedPeriod(Goal.start)

// NOTE: Asserted Goals that encode the Asserted value, as a Quantity, in the
//       detail element of the 0 postion target element, by definition
define function AssertedGoalQuantity(value FHIR.Goal):
  singleton from value.target.detail as Quantity

define function MostRecent(value List<FHIR.Procedure>):
  First(
    value Procedure
    sort by ToDateTime(performed) descending
  )

define function MostRecent(value List<FHIR.Observation>):
  First(
    value Observation
    sort by effective descending
  )

define function MostRecent(value List<FHIR.Condition>):
  First(
    value Condition
    sort by ToDateTime(onset) descending
  )

define function MostRecent(value List<FHIR.MedicationRequest>):
  First(
    value MedicationRequest
    sort by authoredOn descending
  )

define function MostRecent(value List<FHIR.Encounter>):
  First(
    value Encounter
    sort by start of period descending
  )

// TODO: revert this to an overload once bug is fixed in CQL evaluation
define function MostRecentGoal(value List<FHIR.Goal>):
  First(
    value Goal
    sort by start.value descending
  )

define function QualifiedObservationsCF(value List<FHIR.Observation>):
    QualifiedObservations(
      value Observation
        where WithinAssertedPeriod(Observation.effective))

define function AssertedRiskAssessments(value List<FHIR.RiskAssessment>):
    value RiskAssessment
      where WithinAssertedPeriod(RiskAssessment.occurrence)

define function ValueAsBoolean(value FHIR.Observation):
  value.value as FHIR.boolean

define function WithinAssertedPeriod(value Choice<FHIR.date, FHIR.dateTime>):
  if (value is FHIR.dateTime) then
    value as FHIR.dateTime on or after (ToDateTime(Today()) - "Asserted Lookback Duration")
  else
    ToDateTime(value as FHIR.date) on or after (ToDateTime(Today()) - "Asserted Lookback Duration")

define function Has(value List<System.Any>):
  if exists value then
    true
  else
    null

define function HasSingleton(value System.Any):
  if not IsNull(value) then
    true
  else
    null

define function UnknownInference(value System.Quantity, unknownInferenceValue System.Quantity):
if IsNull(value.value) then
  unknownInferenceValue
else
  value

define function UnknownInference(value Boolean, unknownInferenceValue Boolean):
  Coalesce(value, unknownInferenceValue)

define function UnknownInference(value Integer, unknownInferenceValue Integer):
  Coalesce(value, unknownInferenceValue)

define function GetId(uri String):
  Last(Split(uri, '/'))

define function ToDate(Value DateTime):
  DateTime(
    year from Value,
    month from Value,
    day from Value,
    0, 0, 0, 0,
    timezoneoffset from Value
  )

define function CalendarAgeInYearsAt(BirthDateTime DateTime, AsOf DateTime):
  years between ToDate(BirthDateTime)and ToDate(AsOf)

define function CalendarAgeInYears(BirthDateTime DateTime):
  CalendarAgeInYearsAt(BirthDateTime, Today())

define function WithUnit(ObsList List<Observation>, Unit String):
  ObsList O where (O.value as Quantity).unit.value = Unit
    or (O.value as Quantity).code.value = Unit

define function ToCode(coding FHIR.Coding):
  if coding is null then
    null
  else
    System.Code {
      code: coding.code.value,
      system: coding.system.value,
      // version: coding.version.value,
      display: coding.display
    }

define function references(reference Reference, encounter Encounter):
  EndsWith(reference.reference, '/' + encounter.id)

define function referenceTo(encounter Encounter):
  Reference { reference: string { value: 'Encounter/' + encounter.id } }

define function referenceTo(patient Patient):
  Reference { reference: string { value: 'Patient/' + patient.id } }