module FHIR
  class CapabilityStatementRestResourceOperation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CapabilityStatementRestResourceOperation'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :definition, type:  # primitive
    embeds_one :_definition, class_name: 'Extension'
    field :documentation, type:  # primitive
    embeds_one :_documentation, class_name: 'Extension'
  end
end
