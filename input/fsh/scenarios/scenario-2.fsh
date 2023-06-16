// Patient over 65 on NSAID, and prescribed gastroprotective drug
Instance: patient-2-70y-NSAID-gastro-bundle
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
  * fullUrl = "#patient-2-70y-NSAID-gastro"
  * resource = patient-2-70y-NSAID-gastro
  * request
    * method = #PUT
    * url = "Patient/patient-2-70y-NSAID-gastro"
* entry[+]
  * fullUrl = "#patient-2-70y-NSAID-gastro-medicationrequest-1"
  * resource = patient-2-70y-NSAID-gastro-medicationrequest-1
  * request
    * method = #PUT
    * url = "MedicationRequest/patient-2-70y-NSAID-gastro-medicationrequest-1"
* entry[+]
  * fullUrl = "#patient-2-70y-NSAID-gastro-medicationrequest-2"
  * resource = patient-2-70y-NSAID-gastro-medicationrequest-2
  * request
    * method = #PUT
    * url = "MedicationRequest/patient-2-70y-NSAID-gastro-medicationrequest-2"

Instance: patient-2-70y-NSAID-gastro
InstanceOf: Patient
* identifier
  * system = "http://cds.optum.com/fhir/test-cases|0.1.0"
  * value = "patient-2-70y-NSAID-gastro"
* name
  * family = "TEST"
  * given = "patient-2-70y-NSAID-gastro"
* gender = #male
* birthDate = "1953-01-01"
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

Instance: patient-2-70y-NSAID-gastro-medicationrequest-1
InstanceOf: MedicationRequest
* identifier
  * system = "http://cds.optum.com/fhir/test-cases|0.1.0"
  * value = "patient-2-70y-NSAID-gastro-medicationrequest-1"
* status = #active
* intent = #order
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-category#outpatient "Outpatient"
* medicationCodeableConcept = http://snomed.info/sct#10198211000001109 "Meloxicam 7.5mg tablets (IVAX Pharmaceuticals UK Ltd) (product)"
  * text = "Meloxicam 7.5mg tablets (IVAX Pharmaceuticals UK Ltd) (product)"
* subject = Reference(patient-2-70y-NSAID-gastro)
* authoredOn = "2022-06-01"
* requester = Reference(Practitioner-global)
* dosageInstruction.text = "Once daily"
* dispenseRequest.validityPeriod.start = "2022-06-01"

Instance: patient-2-70y-NSAID-gastro-medicationrequest-2
InstanceOf: MedicationRequest
* identifier
  * system = "http://cds.optum.com/fhir/test-cases|0.1.0"
  * value = "patient-2-70y-NSAID-gastro-medicationrequest-2"
* status = #active
* intent = #order
* category = http://terminology.hl7.org/CodeSystem/medicationrequest-category#outpatient "Outpatient"
* medicationCodeableConcept = http://snomed.info/sct#10131611000001105 "Lansoprazole 15mg gastro-resistant capsules (A A H Pharmaceuticals Ltd) (product)"
  * text = "Lansoprazole 15mg gastro-resistant capsules (A A H Pharmaceuticals Ltd) (product)"
* subject = Reference(patient-2-70y-NSAID-gastro)
* authoredOn = "2022-06-01"
* requester = Reference(Practitioner-global)
* dosageInstruction.text = "Once daily"
* dispenseRequest.validityPeriod.start = "2022-06-01"