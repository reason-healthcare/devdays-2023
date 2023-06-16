Instance: SMR01Measure
InstanceOf: $computable-measure-cqfm
Usage: #definition
* insert DefinitionalArtifactMetadata(Measure, SMR01Measure)
* title = "SMR-01A: Percentage of patients at risk of harm due to medication errors who received a Structured Medication Review"
* description = """
SMR-01 recognises PCNs for delivering structured medication
reviews (SMRs) to patients in priority cohorts. SMRs are a
comprehensive clinical review of a patient's medicines and detailed
aspects of their health. They are delivered by facilitating shared
decision-making conversations with patients aimed at ensuring that
their medication is working well for them.
"""
* library = Canonical(SMR01Logic|0.1.0)
* scoring = http://terminology.hl7.org/CodeSystem/measure-scoring#proportion "Proportion"
* type = http://terminology.hl7.org/CodeSystem/measure-type#process
* improvementNotation = http://terminology.hl7.org/CodeSystem/measure-improvement-notation#increase "Increased score indicates improvement"
* guidance = """
Links to resources and further guidance
* Network Contract DES: [Structured Medication Review Guidance](https://www.england.nhs.uk/publication/structured-medication-reviews-and-medicines-optimisation-2021-22)
* Royal Pharmaceutical Society: [Polypharmacy best practice guide](https://www.rpharms.com/recognition/setting-professional-standards/polypharmacy-getting-our-medicines-right)
* SMR Principles - NHS England Pharmacy Integration Programme - FutureNHS Collaboration Platform
* Shared Decision Making guidance:
  * NICE
  * Keele University SDM Package
  * CPPE Training
"""
* group.population[+]
  * id = "initial-population"
  * code = $measure-population#initial-population "Initial Population"
  * description = """
Total number of patients at risk of harm due to medication errors,
as defined by any of the following:
* Patients aged 65 or over prescribed an oral NSAID and not prescribed a gastroprotective.
* Patients aged 18 or over with a history of peptic ulceration prescribed an oral NSAID
* Patients aged 18 or over with a history of peptic ulceration prescribed an anti-platelet
* Patients aged 18 or over prescribed both an oral anticoagulant and an oral NSAID within 28 days of each other
* Patients aged 18 or over prescribed both an oral anticoagulant and an anti-platelet within 28 days of each other.
* Patients aged 18 or over prescribed both an aspirin and another type of anti-platelet within 28 days of each other
* Patients aged 18 or over with an unresolved heart failure diagnosis prescribed an oral NSAID.
* Patients aged 18 or over with an eGFR of less than 45ml per minute prescribed an oral NSAID.
* Patients aged 18 or over with an unresolved asthma diagnosis prescribed a non-selective beta-blocker.
"""
  * criteria.language = #text/cql-identifier
  * criteria.expression = "Initial Population"
* group.population[+]
  * id = "numerator"
  * code = $measure-population#numerator "Numerator"
  * description = """
Of the denominator, the number who received at least one Structured Medication Review
"""
  * criteria.language = #text/cql-identifier
  * criteria.expression = "Numerator"
* group.population[+]
  * id = "denominator"
  * code = $measure-population#denominator "Denominator"
  * description = "All patients in the initial population"
  * criteria.language = #text/cql-identifier
  * criteria.expression = "Denominator"
