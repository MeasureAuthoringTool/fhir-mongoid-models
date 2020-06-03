module FHIR
  class PrimitiveCanonical < uri
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveCanonical'
  end
end
