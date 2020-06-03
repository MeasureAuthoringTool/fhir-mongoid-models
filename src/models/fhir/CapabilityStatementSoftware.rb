module FHIR
  class CapabilityStatementSoftware < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CapabilityStatementSoftware'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :version, type:  # primitive
    embeds_one :_version, class_name: 'Extension'
    field :releaseDate, type:  # primitive
    embeds_one :_releaseDate, class_name: 'Extension'
  end
end
