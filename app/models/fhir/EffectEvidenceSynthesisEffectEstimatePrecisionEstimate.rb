module FHIR
  class EffectEvidenceSynthesisEffectEstimatePrecisionEstimate < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EffectEvidenceSynthesisEffectEstimatePrecisionEstimate'
    embeds_one :type, class_name: 'CodeableConcept'
    field :level, type:  # primitive
    embeds_one :_level, class_name: 'Extension'
    field :from, type:  # primitive
    embeds_one :_from, class_name: 'Extension'
    field :to, type:  # primitive
    embeds_one :_to, class_name: 'Extension'
  end
end
