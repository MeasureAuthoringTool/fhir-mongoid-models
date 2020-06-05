module FHIR
  class TerminologyCapabilitiesValidateCode < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TerminologyCapabilitiesValidateCode'
    field :translations, type:  # primitive
    embeds_one :_translations, class_name: 'Extension'
  end
end
