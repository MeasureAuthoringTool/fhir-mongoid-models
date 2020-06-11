module FHIR
  class CapabilityStatementRestSecurity < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CapabilityStatementRestSecurity'
    field :cors, type:  # primitive
    embeds_one :_cors, class_name: 'Extension'
    embeds_many :service, class_name: 'CodeableConcept'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
  end
end
