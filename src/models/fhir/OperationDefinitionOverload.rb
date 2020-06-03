module FHIR
  class OperationDefinitionOverload < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'OperationDefinitionOverload'
    field :parameterName, type: Array # primitive
    embeds_many :_parameterName, class_name: 'Extension'
    field :comment, type:  # primitive
    embeds_one :_comment, class_name: 'Extension'
  end
end
