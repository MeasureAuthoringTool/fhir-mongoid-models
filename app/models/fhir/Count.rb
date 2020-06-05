module FHIR
  class Count < Quantity
    include Mongoid::Document
    field :typeName, type: String, default: 'Count'
  end
end
