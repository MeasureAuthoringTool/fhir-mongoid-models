module FHIR
  class EffectEvidenceSynthesisCertainty < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EffectEvidenceSynthesisCertainty'
    embeds_many :rating, class_name: 'CodeableConcept'
    embeds_many :note, class_name: 'Annotation'
    embeds_many :certaintySubcomponent, class_name: 'EffectEvidenceSynthesisCertaintyCertaintySubcomponent'
  end
end
