module FHIR
  class RiskAssessmentPrediction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'RiskAssessmentPrediction'
    embeds_one :outcome, class_name: 'CodeableConcept'
    field :probabilityPrimitiveDecimal, type:  # primitive
    embeds_one :_probabilityPrimitiveDecimal, class_name: 'Extension'
    embeds_one :probabilityRange, class_name: 'Range'
    embeds_one :qualitativeRisk, class_name: 'CodeableConcept'
    field :relativeRisk, type:  # primitive
    embeds_one :_relativeRisk, class_name: 'Extension'
    embeds_one :whenPeriod, class_name: 'Period'
    embeds_one :whenRange, class_name: 'Range'
    field :rationale, type:  # primitive
    embeds_one :_rationale, class_name: 'Extension'
  end
end
