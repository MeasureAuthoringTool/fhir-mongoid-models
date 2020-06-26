module FHIR
  # fhir/substance_amount_reference_range.rb
  class SubstanceAmountReferenceRange < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'SubstanceAmountReferenceRange'
    embeds_one :lowLimit, class_name: 'Quantity'
    embeds_one :highLimit, class_name: 'Quantity'

    def self.transform_json(json_hash)
      result = SubstanceAmountReferenceRange.new
      result['lowLimit'] = Quantity.transform_json(json_hash['lowLimit']) unless json_hash['lowLimit'].nil?      
      result['highLimit'] = Quantity.transform_json(json_hash['highLimit']) unless json_hash['highLimit'].nil?      

      result
    end
  end
end
