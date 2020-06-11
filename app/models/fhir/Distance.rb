module FHIR
  class Distance < Quantity
    include Mongoid::Document
    field :typeName, type: String, default: 'Distance'
  end
end
