module FHIR
  class TerminologyCapabilitiesClosure < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TerminologyCapabilitiesClosure'
    field :translation, type:  # primitive
    embeds_one :_translation, class_name: 'Extension'
  end
end
