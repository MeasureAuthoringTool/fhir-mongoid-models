module FHIR
  # fhir/distance.rb
  class Distance < Quantity
    include Mongoid::Document
    field :typeName, type: String, default: 'Distance'

    def self.transform_json(json_hash, target=Distance.new)
      result = self.superclass.transform_json(json_hash, target)

      result
    end
  end
end
