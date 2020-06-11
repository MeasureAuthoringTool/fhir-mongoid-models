module FHIR
  class RiskEvidenceSynthesisRiskEstimate < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'RiskEvidenceSynthesisRiskEstimate'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :type, class_name: 'CodeableConcept'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
    embeds_one :unitOfMeasure, class_name: 'CodeableConcept'
    field :denominatorCount, type:  # primitive
    embeds_one :_denominatorCount, class_name: 'Extension'
    field :numeratorCount, type:  # primitive
    embeds_one :_numeratorCount, class_name: 'Extension'
    embeds_many :precisionEstimate, class_name: 'RiskEvidenceSynthesisRiskEstimatePrecisionEstimate'
  end
end
