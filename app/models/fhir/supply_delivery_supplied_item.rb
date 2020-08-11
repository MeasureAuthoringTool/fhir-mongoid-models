module FHIR
  # fhir/supply_delivery_supplied_item.rb
  class SupplyDeliverySuppliedItem < BackboneElement
    include Mongoid::Document
    embeds_one :quantity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :itemCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :itemReference, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.quantity.nil? 
        result['quantity'] = self.quantity.as_json(*args)
      end
      unless self.itemCodeableConcept.nil?
        result['itemCodeableConcept'] = self.itemCodeableConcept.as_json(*args)                        
      end          
      unless self.itemReference.nil?
        result['itemReference'] = self.itemReference.as_json(*args)                        
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SupplyDeliverySuppliedItem.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?
      result['itemCodeableConcept'] = CodeableConcept.transform_json(json_hash['itemCodeableConcept']) unless json_hash['itemCodeableConcept'].nil?
      result['itemReference'] = Reference.transform_json(json_hash['itemReference']) unless json_hash['itemReference'].nil?

      result
    end
  end
end
