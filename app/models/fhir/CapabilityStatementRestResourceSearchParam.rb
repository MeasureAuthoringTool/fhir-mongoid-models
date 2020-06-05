module FHIR
  class CapabilityStatementRestResourceSearchParam < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CapabilityStatementRestResourceSearchParam'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :definition, type:  # primitive
    embeds_one :_definition, class_name: 'Extension'
    embeds_one :type, class_name: 'SearchParamType'
    field :documentation, type:  # primitive
    embeds_one :_documentation, class_name: 'Extension'
  end
end
