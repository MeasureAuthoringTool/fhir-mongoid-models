module FHIR
  # fhir/count.rb
  class Count < Quantity
    include Mongoid::Document
    field :typeName, type: String, default: 'Count'

    def self.transform_json(json_hash, target=Count.new)
      result = self.superclass.transform_json(json_hash, target)

      result
    end
  end
end
