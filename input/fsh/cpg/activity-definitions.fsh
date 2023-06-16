Instance: StructuredMedicalReviewActivity
InstanceOf: $cpg-servicerequestactivity
Usage: #definition
* insert DefinitionalArtifactMetadata(ActivityDefinition, StructuredMedicalReviewActivity)
* doNotPerform = false
* description = """
Defined a service request to perform a structured medical review. Also
demonstrates some dynamicValue options
"""
* kind = #ServiceRequest
* code = $SCT#312853008 "Medical records review"
* library = Canonical(ActivityLogic|0.1.0)
* dynamicValue[+]
  * path = "priority"
  * expression
    * language = #text/fhirpath
    * expression = "'asap'"
* dynamicValue[+]
  * path = "patientInstruction"
  * expression
    * language = #text/cql-identifier
    * expression = "Patient Instruction for Structured Medical Review"
