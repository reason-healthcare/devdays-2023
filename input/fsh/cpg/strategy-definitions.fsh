Instance: SMR01StrategyDefinition
InstanceOf: $cpg-strategydefinition
Usage: #definition
* insert DefinitionalArtifactMetadata(PlanDefinition, SMR01StrategyDefinition)
* relatedArtifact[+]
  * type = #documentation
  * label = "DevDays Decision Support"
* description = """
This is a point-of-care strategy to give a provide recommendations based on the
rules defined in the Investment and Impact Fund (IIF) forms part of the Network
Contract Directed Enhanced Service (DES).

It supports primary care networks (PCNs) to deliver high quality care to their
population, as well as supporting the delivery of priority objectives
articulated in the NHS Long Term Plan and in Investment and Evolution; a
five-year GP contract framework to implement the NHS Long Term Plan.
"""
* action[+]
  * title = "IFF Structured medication reviews and medicines optimisation recommendations"
  * description = """
SMR-01A: Improve patients at risk of harm due to medication errors who received
a Structured Medication Review
"""
  * code = $cpg-common-process#guideline-based-care
  * trigger
    * type = #named-event
    * name = "patient-view"
  * action[+]
    * definitionCanonical = Canonical(SMR01A1RecommendationDefinition|0.1.0)