module FHIR
  # fhir/distance.rb
  class Distance < Quantity
    include Mongoid::Document
    field :typeName, type: String, default: 'Distance'

    def self.transform_json(json_hash)
      result = Distance.new

      result
    end
  end
end
