module FHIR
  class TerminologyCapabilitiesSoftware < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TerminologyCapabilitiesSoftware'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :version, type:  # primitive
    embeds_one :_version, class_name: 'Extension'
  end
end
