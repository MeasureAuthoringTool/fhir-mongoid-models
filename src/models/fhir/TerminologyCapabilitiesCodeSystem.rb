module FHIR
  class TerminologyCapabilitiesCodeSystem < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TerminologyCapabilitiesCodeSystem'
    field :uri, type:  # primitive
    embeds_one :_uri, class_name: 'Extension'
    embeds_many :version, class_name: 'TerminologyCapabilitiesCodeSystemVersion'
    field :subsumption, type:  # primitive
    embeds_one :_subsumption, class_name: 'Extension'
  end
end
