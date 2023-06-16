Instance: ActivityLogic
InstanceOf: $cpg-publishablelibrary
Description: """
This library defines logic for the activity definitions.
"""
Usage: #definition
* insert CPGKnowledgeExtensions
* insert DefinitionalLibraryMetadata(Library, ActivityLogic)


Instance: CaseFeature
InstanceOf: $cpg-publishablelibrary
Description: """
This library is used to define CPG feature expressions
(http://hl7.org/fhir/uv/cpg/StructureDefinition-cpg-featureExpression.html).

Defines formal computational semantics for the feature, combining the inference
and assertion expressions. This is typically only required if the feature is of
a different type than the profile (e.g. a boolean feature).
"""
Usage: #definition
* insert CPGKnowledgeExtensions
* insert DefinitionalLibraryMetadata(Library, CaseFeature)


Instance: CaseFeatureInference
InstanceOf: $cpg-publishablelibrary
Description: """
This library is used to define CPG inference expressions
(http://hl7.org/fhir/uv/cpg/StructureDefinition-cpg-inferenceExpression.html).

Defines formal computational semantics for calculating the case feature if it
is not asserted.
"""
Usage: #definition
* insert CPGKnowledgeExtensions
* insert DefinitionalLibraryMetadata(Library, CaseFeatureInference)


Instance: CaseFeatureAssertion
InstanceOf: $cpg-publishablelibrary
Description: """
This library is used to define CPG inference expressions
(http://hl7.org/fhir/uv/cpg/StructureDefinition-cpg-assertionExpression.html).

Defines formal computational semantics for asserting the case feature.
"""
Usage: #definition
* insert CPGKnowledgeExtensions
* insert DefinitionalLibraryMetadata(Library, CaseFeatureAssertion)


Instance: CommonLogic
InstanceOf: $cpg-publishablelibrary
Usage: #definition
* insert CPGKnowledgeExtensions
* insert DefinitionalLibraryMetadata(Library, CommonLogic)


Instance: FHIRHelpers
InstanceOf: $cpg-publishablelibrary
Description: """
Copy of FHIR Helpers.
"""
Usage: #definition
* insert CPGKnowledgeExtensions
* insert DefinitionalLibraryMetadata(Library, FHIRHelpers)



Instance: GuidelineLogic
InstanceOf: $cpg-publishablelibrary
Description: """
This library defines logic for the applicability conditions in the guidelines.
"""
Usage: #definition
* insert CPGKnowledgeExtensions
* insert DefinitionalLibraryMetadata(Library, GuidelineLogic)



Instance: SharedLogic
InstanceOf: $cpg-publishablelibrary
Description: """
This library defines logic shared between measures and guidelines.
"""
Usage: #definition
* insert CPGKnowledgeExtensions
* insert DefinitionalLibraryMetadata(Library, SharedLogic)



Instance: SMR01Logic
InstanceOf: $cpg-publishablelibrary
Description: """
This library defines logic for the applicability conditions in the guidelines.
"""
Usage: #definition
* insert CPGKnowledgeExtensions
* insert DefinitionalLibraryMetadata(Library, SMR01Logic)
