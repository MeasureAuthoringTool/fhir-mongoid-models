module FHIR
  # fhir/quantity_comparator.rb
  class QuantityComparator < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'QuantityComparator'
    field :value, type: String

    def self.transform_json(json_hash)
      result = QuantityComparator.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
