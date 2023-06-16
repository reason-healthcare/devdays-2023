// Patient over 65 on NSAID, and not prescribed gastroprotective drug
Instance: patient-3-70y-NSAID-nogastro-bundle
InstanceOf: Bundle
Usage: #example
* meta
  * tag = #testcase
* type = #transaction
* entry[+]
  * fullUrl = "#Practitioner-global"
  * resource = Practitioner-global
  * request
    * method = #PUT
    * url = "Practitioner/Practitioner-global"
* entry[+]
  * fullUrl = "#patient-3-70y-NSAID-nogastro"
  * resource = patient-3-70y-NSAID-nogastro
  * request
    * method = #PUT
    * url = "Patient/patient-3-70y-NSAID-nogastro"
* entry[+]
  * fullUrl = "#patient-3-70y-NSAID-nogastro-medicationrequest-1"
  * resource = patient-3-70y-NSAID-nogastro-medicationrequest-1
  * request
    * method = #PUT
    * url = "MedicationRequest/patient-3-70y-NSAID-nogastro-medicationrequest-1"

Instance: patient-3-70y-NSAID-nogastro
InstanceOf: Patient
* identifier
  * system = "http://cds.optum.com/fhir/test-cases|0.1.0"
  * value = "patient-3-70y-NSAID-nogastro"
* name
  * family = "TEST"
  * given = "patient-3-70y-NSAID-nogastro"
* gender = #male
* birthDate = "1955-01-01"
* deceasedBoolean = false
* extension[0]
  * url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"
  * extension[0]
    * url = "ombCategory"
    * valueCoding = urn:oid:2.16.840.1.113883.6.238#2028-9 "Asian"
  * extension[+]
    * url = "text"
    * valueString = "Asian"
* extension[+]
  * url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-ethnicity"
  * extension[0]
    * url = "ombCategory"
    * valueCoding = urn:oid:2.16.840.1.113883.6.238#2135-2 "Hispanic or Latino"
  * extension[+]
    * url = "text"
    * valueString = "Hispanic or Latino"

Instance: patient-3-70y-NSAID-nogastro-medicationrequest-1
InstanceOf: MedicationRequest
* identifier
  * system = "http://cds.optum.com/fhir/test-cases|0.1.0"
  * value = "patient-3-70y-NSAID-nogastro-medicationrequest-1"
* status = #active
* intent = #order
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-category#outpatient "Outpatient"
* medicationCodeableConcept = http://snomed.info/sct#10198211000001109 "Meloxicam 7.5mg tablets (IVAX Pharmaceuticals UK Ltd) (product)"
  * text = "Meloxicam 7.5mg tablets (IVAX Pharmaceuticals UK Ltd) (product)"
* subject = Reference(patient-3-70y-NSAID-nogastro)
* authoredOn = "2022-06-01"
* requester = Reference(Practitioner-global)
* dosageInstruction.text = "Once daily"
* dispenseRequest.validityPeriod.start = "2022-06-01"

