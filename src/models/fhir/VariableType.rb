module FHIR
  class VariableType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'VariableType'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
