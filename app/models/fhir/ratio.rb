module FHIR
  # fhir/ratio.rb
  class Ratio < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Ratio'
    embeds_one :numerator, class_name: 'Quantity'
    embeds_one :denominator, class_name: 'Quantity'

    def self.transform_json(json_hash, target=Ratio.new)
      result = self.superclass.transform_json(json_hash, target)
      result['numerator'] = Quantity.transform_json(json_hash['numerator']) unless json_hash['numerator'].nil?      
      result['denominator'] = Quantity.transform_json(json_hash['denominator']) unless json_hash['denominator'].nil?      

      result
    end
  end
end
