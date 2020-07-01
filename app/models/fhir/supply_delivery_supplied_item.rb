module FHIR
  # fhir/supply_delivery_supplied_item.rb
  class SupplyDeliverySuppliedItem < BackboneElement
    include Mongoid::Document
    embeds_one :quantity, class_name: 'SimpleQuantity'
    embeds_one :itemCodeableConcept, class_name: 'CodeableConcept'
    embeds_one :itemReference, class_name: 'Reference'

    def self.transform_json(json_hash, target = SupplyDeliverySuppliedItem.new)
      result = self.superclass.transform_json(json_hash, target)
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?      
      result['itemCodeableConcept'] = CodeableConcept.transform_json(json_hash['itemCodeableConcept']) unless json_hash['itemCodeableConcept'].nil?      
      result['itemReference'] = Reference.transform_json(json_hash['itemReference']) unless json_hash['itemReference'].nil?      

      result
    end
  end
end
