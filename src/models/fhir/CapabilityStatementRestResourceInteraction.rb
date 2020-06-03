module FHIR
  class CapabilityStatementRestResourceInteraction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CapabilityStatementRestResourceInteraction'
    embeds_one :code, class_name: 'TypeRestfulInteraction'
    field :documentation, type:  # primitive
    embeds_one :_documentation, class_name: 'Extension'
  end
end
