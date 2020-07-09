module FHIR
  # fhir/quantity.rb
  class Quantity < Element
    include Mongoid::Document
    embeds_one :value, class_name: 'FHIR::PrimitiveDecimal'
    embeds_one :comparator, class_name: 'FHIR::QuantityComparator'
    embeds_one :unit, class_name: 'FHIR::PrimitiveString'
    embeds_one :system, class_name: 'FHIR::PrimitiveUri'
    embeds_one :code, class_name: 'FHIR::PrimitiveCode'

    def self.transform_json(json_hash, target = Quantity.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = PrimitiveDecimal.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?      
      result['comparator'] = QuantityComparator.transform_json(json_hash['comparator']) unless json_hash['comparator'].nil?      
      result['unit'] = PrimitiveString.transform_json(json_hash['unit'], json_hash['_unit']) unless json_hash['unit'].nil?      
      result['system'] = PrimitiveUri.transform_json(json_hash['system'], json_hash['_system']) unless json_hash['system'].nil?      
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?      

      result
    end
  end
end
