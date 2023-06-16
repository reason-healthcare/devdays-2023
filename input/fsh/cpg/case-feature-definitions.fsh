Profile: BirthdateDefinition
Parent: Observation
* insert CaseFeatureDefinitionMetadata
* insert CaseFeatureAssertionExpression(Birthdate, CaseFeatureAssertion)
* insert CaseFeatureInferenceExpression(Birthdate, CaseFeatureInference)
* insert CaseFeatureFeatureExpression(Brirthdate, CaseFeature)
* ^description = "Patient date of birth"
* code = $SCT#184099003 "Date of birth"
* value[x] only dateTime

Profile: OralNSAIDDefinition
Parent: Observation
* insert CaseFeatureDefinitionMetadata
* insert CaseFeatureAssertionExpression(Prescribed an oral NSAID, CaseFeatureAssertion)
* insert CaseFeatureInferenceExpression(Prescribed an oral NSAID, CaseFeatureInference)
* insert CaseFeatureFeatureExpression(Prescribed an oral NSAID, CaseFeature)
* ^description = "Patient has been prescribed an oral NSAID"
* code = $SCT#350321003 "Ibuprofen-containing product in oral dose form"
* value[x] only boolean

Profile: GastroprotectiveDefinition
Parent: Observation
* insert CaseFeatureDefinitionMetadata
* insert CaseFeatureAssertionExpression(Prescribed a gastroprotective, CaseFeatureAssertion)
* insert CaseFeatureInferenceExpression(Prescribed a gastroprotective, CaseFeatureInference)
* insert CaseFeatureFeatureExpression(Prescribed a gastroprotective, CaseFeature)
* ^description = "Patient has been prescribed a gastroprotective"
* code = $SCT#6425004 "Histamine receptor antagonist-containing product"
* value[x] only boolean

Profile: StructuredMedicationReviewDefinition
Parent: Observation
* insert CaseFeatureDefinitionMetadata
* insert CaseFeatureAssertionExpression(At least one Structured Medical Review, CaseFeatureAssertion)
* insert CaseFeatureInferenceExpression(At least one Structured Medical Review, CaseFeatureInference)
* insert CaseFeatureFeatureExpression(At least one Structured Medical Review, CaseFeature)
* ^description = "Patient has had at least one Structured Medical Review"
* code = $SCT#312853008 "Medical records review"
* value[x] only boolean
