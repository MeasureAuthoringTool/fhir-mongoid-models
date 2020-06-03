module FHIR
  class CapabilityStatementRestInteraction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CapabilityStatementRestInteraction'
    embeds_one :code, class_name: 'SystemRestfulInteraction'
    field :documentation, type:  # primitive
    embeds_one :_documentation, class_name: 'Extension'
  end
end
