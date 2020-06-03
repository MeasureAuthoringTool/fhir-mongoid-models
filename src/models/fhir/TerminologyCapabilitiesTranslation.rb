module FHIR
  class TerminologyCapabilitiesTranslation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TerminologyCapabilitiesTranslation'
    field :needsMap, type:  # primitive
    embeds_one :_needsMap, class_name: 'Extension'
  end
end
