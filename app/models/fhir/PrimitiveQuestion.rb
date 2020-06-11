module FHIR
  class PrimitiveQuestion < string
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveQuestion'
  end
end
