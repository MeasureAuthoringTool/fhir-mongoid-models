module FHIR
  class PrimitiveUuid < uri
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveUuid'
  end
end
