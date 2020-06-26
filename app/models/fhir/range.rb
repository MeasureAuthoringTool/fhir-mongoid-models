module FHIR
  # fhir/range.rb
  class Range < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Range'
    embeds_one :low, class_name: 'SimpleQuantity'
    embeds_one :high, class_name: 'SimpleQuantity'

    def self.transform_json(json_hash)
      result = Range.new
      result['low'] = SimpleQuantity.transform_json(json_hash['low']) unless json_hash['low'].nil?      
      result['high'] = SimpleQuantity.transform_json(json_hash['high']) unless json_hash['high'].nil?      

      result
    end
  end
end
