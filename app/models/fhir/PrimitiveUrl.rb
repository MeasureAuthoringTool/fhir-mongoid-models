module FHIR
  class PrimitiveUrl < uri
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitiveUrl'
  end
end
