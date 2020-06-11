module FHIR
  class TerminologyCapabilitiesImplementation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TerminologyCapabilitiesImplementation'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
  end
end
