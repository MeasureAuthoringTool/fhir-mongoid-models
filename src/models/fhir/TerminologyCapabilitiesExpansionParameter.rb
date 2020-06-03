module FHIR
  class TerminologyCapabilitiesExpansionParameter < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TerminologyCapabilitiesExpansionParameter'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :documentation, type:  # primitive
    embeds_one :_documentation, class_name: 'Extension'
  end
end
