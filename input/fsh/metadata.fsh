RuleSet: DefinitionalLibraryMetadata(type, id)
* insert CommonMetadata
* insert CPGKnowledgeExtensions
* url = "http://devdays.com/cpg-example/{type}/{id}"
* version = "0.1.0"
* name = "{id}"
* title = "{id}"
* description = "{id}"
* type = $library-type#logic-library
* content.id = "ig-loader-{id}.cql"

RuleSet: DefinitionalArtifactMetadata(type, id)
* insert CommonMetadata
* insert CPGKnowledgeExtensions
* url = "http://devdays.com/cpg-example/{type}/{id}"
* name = "{id}"

RuleSet: CommonMetadata
* version = "0.1.0"
* date = "2023-06-05"
* status = #draft
* experimental = true
* publisher = "DevDays"
* copyright = "(c) 2023+"
* approvalDate = "2023-06-05"
* lastReviewDate = "2023-06-05"


RuleSet: CPGKnowledgeExtensions
* extension[$cpg-knowledgeCapability][+].valueCode = #shareable
* extension[$cpg-knowledgeCapability][+].valueCode = #publishable
* extension[$cpg-knowledgeCapability][+].valueCode = #computable

RuleSet: CaseFeatureDefinitionMetadata
* ^meta.profile = $cpg-casefeaturedefinition
* ^extension[$cpg-knowledgeCapability][+].valueCode = #shareable
* ^extension[$cpg-knowledgeCapability][+].valueCode = #publishable
* ^extension[$cpg-knowledgeCapability][+].valueCode = #computable
* ^extension[$cpg-knowledgeRepresentationLevel].valueCode = #structured
* ^experimental = true
* ^publisher = "DevDays"

RuleSet: CaseFeatureInferenceExpression(expression, reference)
* ^extension[$cpg-inferenceExpression].valueExpression.language = #text/cql-identifier
* ^extension[$cpg-inferenceExpression].valueExpression.expression = "{expression}"
* ^extension[$cpg-inferenceExpression].valueExpression.reference = Canonical({reference}|0.1.0)

RuleSet: CaseFeatureAssertionExpression(expression, reference)
* ^extension[$cpg-assertionExpression].valueExpression.language = #text/cql-identifier
* ^extension[$cpg-assertionExpression].valueExpression.expression = "{expression}"
* ^extension[$cpg-assertionExpression].valueExpression.reference = Canonical({reference}|0.1.0)

RuleSet: CaseFeatureFeatureExpression(expression, reference)
* ^extension[$cpg-featureExpression].valueExpression.language = #text/cql-identifier
* ^extension[$cpg-featureExpression].valueExpression.expression = "{expression}"
* ^extension[$cpg-featureExpression].valueExpression.reference = Canonical({reference}|0.1.0)
