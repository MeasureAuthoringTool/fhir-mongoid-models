module FHIR
  # fhir/count.rb
  class Count < Quantity
    include Mongoid::Document
    field :typeName, type: String, default: 'Count'

    def self.transform_json(json_hash)
      result = Count.new

      result
    end
  end
end
