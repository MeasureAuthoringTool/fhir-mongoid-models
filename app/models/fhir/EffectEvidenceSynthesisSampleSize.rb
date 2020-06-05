module FHIR
  class EffectEvidenceSynthesisSampleSize < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EffectEvidenceSynthesisSampleSize'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    field :numberOfStudies, type:  # primitive
    embeds_one :_numberOfStudies, class_name: 'Extension'
    field :numberOfParticipants, type:  # primitive
    embeds_one :_numberOfParticipants, class_name: 'Extension'
  end
end
