module FHIR
  class EffectEvidenceSynthesisResultsByExposure < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EffectEvidenceSynthesisResultsByExposure'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_one :exposureState, class_name: 'ExposureState'
    embeds_one :variantState, class_name: 'CodeableConcept'
    embeds_one :riskEvidenceSynthesis, class_name: 'Reference'
  end
end
