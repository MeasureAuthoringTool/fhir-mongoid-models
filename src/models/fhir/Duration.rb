module FHIR
  class Duration < Quantity
    include Mongoid::Document
    field :typeName, type: String, default: 'Duration'
  end
end
