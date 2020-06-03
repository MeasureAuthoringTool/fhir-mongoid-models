module FHIR
  class PrimitivePositiveInt < integer
    include Mongoid::Document
    field :typeName, type: String, default: 'PrimitivePositiveInt'
  end
end
