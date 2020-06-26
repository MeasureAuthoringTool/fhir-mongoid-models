module FHIR
  # fhir/supply_request_parameter.rb
  class SupplyRequestParameter < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'SupplyRequestParameter'
    embeds_one :code, class_name: 'CodeableConcept'
    embeds_one :valueCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :valueQuantity, class_name: 'Quantity'
    embeds_one :valueRange, class_name: 'Range'
    embeds_one :valueboolean, class_name: 'PrimitiveBoolean'

    def self.transform_json(json_hash)
      result = SupplyRequestParameter.new
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['valueCodeableConcept'] = CodeableConcept.transform_json(json_hash['valueCodeableConcept']) unless json_hash['valueCodeableConcept'].nil?      
      result['valueQuantity'] = Quantity.transform_json(json_hash['valueQuantity']) unless json_hash['valueQuantity'].nil?      
      result['valueRange'] = Range.transform_json(json_hash['valueRange']) unless json_hash['valueRange'].nil?      
      result['valueboolean'] = PrimitiveBoolean.transform_json(json_hash['valueboolean'], json_hash['_valueboolean']) unless json_hash['valueboolean'].nil?      

      result
    end
  end
end
