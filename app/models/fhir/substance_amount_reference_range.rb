module FHIR
  # fhir/substance_amount_reference_range.rb
  class SubstanceAmountReferenceRange < Element
    include Mongoid::Document
    embeds_one :lowLimit, class_name: 'Quantity'
    embeds_one :highLimit, class_name: 'Quantity'

    def self.transform_json(json_hash, target = SubstanceAmountReferenceRange.new)
      result = self.superclass.transform_json(json_hash, target)
      result['lowLimit'] = Quantity.transform_json(json_hash['lowLimit']) unless json_hash['lowLimit'].nil?      
      result['highLimit'] = Quantity.transform_json(json_hash['highLimit']) unless json_hash['highLimit'].nil?      

      result
    end
  end
end
