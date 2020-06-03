module FHIR
  class CapabilityStatementRest < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CapabilityStatementRest'
    embeds_one :mode, class_name: 'RestfulCapabilityMode'
    field :documentation, type:  # primitive
    embeds_one :_documentation, class_name: 'Extension'
    embeds_one :security, class_name: 'CapabilityStatementRestSecurity'
    embeds_many :resource, class_name: 'CapabilityStatementRestResource'
    embeds_many :interaction, class_name: 'CapabilityStatementRestInteraction'
    embeds_many :searchParam, class_name: 'CapabilityStatementRestResourceSearchParam'
    embeds_many :operation, class_name: 'CapabilityStatementRestResourceOperation'
    field :compartment, type: Array # primitive
    embeds_many :_compartment, class_name: 'Extension'
  end
end
