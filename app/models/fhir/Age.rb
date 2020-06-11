module FHIR
  class Age < Quantity
    include Mongoid::Document
    field :typeName, type: String, default: 'Age'
  end
end
