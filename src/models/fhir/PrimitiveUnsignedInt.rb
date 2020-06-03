module FHIR
  class PrimitiveUnsignedInt < integer
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveUnsignedInt'
  end
end
