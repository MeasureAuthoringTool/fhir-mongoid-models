module FHIR
  class EffectEvidenceSynthesisEffectEstimate < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EffectEvidenceSynthesisEffectEstimate'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :type, class_name: 'CodeableConcept'
    embeds_one :variantState, class_name: 'CodeableConcept'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
    embeds_one :unitOfMeasure, class_name: 'CodeableConcept'
    embeds_many :precisionEstimate, class_name: 'EffectEvidenceSynthesisEffectEstimatePrecisionEstimate'
  end
end
