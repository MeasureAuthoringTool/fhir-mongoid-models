module FHIR
  class PrimitiveId < string
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveId'
  end
end
