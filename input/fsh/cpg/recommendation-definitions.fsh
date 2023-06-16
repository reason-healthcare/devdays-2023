Instance: SMR01A1RecommendationDefinition
InstanceOf: $cpg-recommendationdefinition
Usage: #definition
* insert DefinitionalArtifactMetadata(PlanDefinition, SMR01A1RecommendationDefinition)
/*
* relatedArtifact[+]
  * type = #supports
  * resource = Canonical(SMR01Measure|0.1.0)
*/
* description = """
Cohort SMR-01A (1) Patients aged 65+prescribed an oral NSAID without a gastroprotective
"""
* library = Canonical(GuidelineLogic|0.1.0)
* action[+]
  * title = "Recommend a SMR (structured medical review)"
  * description = """
The patient meets the IIF SMR-01A criteria (Aged 65+, on NSAID without recent
PPI) and require an SMR to be completed/recorded: consider addition of
PPI or cessation of oral NSAID
"""
  * condition
    * kind = #applicability
    * expression
      * language = #text/cql-identifier
      * expression = "Aged 65 or over prescribed an oral NSAID and not prescribed a gastroprotective and missing SMR"
  * input[+]
    * profile = Canonical(BirthdateDefinition|0.1.0)
    * type = #Observation
  * input[+]
    * profile = Canonical(GastroprotectiveDefinition|0.1.0)
    * type = #Observation
  * definitionCanonical = Canonical(StructuredMedicalReviewActivity|0.1.0)