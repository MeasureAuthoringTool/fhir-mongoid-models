module FHIR
  class OperationKind < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'OperationKind'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
