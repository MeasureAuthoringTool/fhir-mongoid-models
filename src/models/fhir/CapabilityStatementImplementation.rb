module FHIR
  class CapabilityStatementImplementation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CapabilityStatementImplementation'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    field :url, type:  # primitive
    embeds_one :_url, class_name: 'Extension'
    embeds_one :custodian, class_name: 'Reference'
  end
end
