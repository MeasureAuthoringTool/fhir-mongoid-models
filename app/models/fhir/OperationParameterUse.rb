module FHIR
  class OperationParameterUse < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'OperationParameterUse'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
