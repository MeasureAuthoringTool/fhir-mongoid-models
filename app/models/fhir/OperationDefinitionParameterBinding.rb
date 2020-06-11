module FHIR
  class OperationDefinitionParameterBinding < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'OperationDefinitionParameterBinding'
    embeds_one :strength, class_name: 'BindingStrength'
    field :valueSet, type:  # primitive
    embeds_one :_valueSet, class_name: 'Extension'
  end
end
