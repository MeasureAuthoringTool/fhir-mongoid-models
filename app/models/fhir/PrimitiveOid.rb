module FHIR
  class PrimitiveOid < uri
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveOid'
  end
end
