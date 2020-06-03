module FHIR
  class PrimitiveCode < string
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveCode'
  end
end
