module FHIR
  # fhir/charge_item_definition_property_group_price_component.rb
  class ChargeItemDefinitionPropertyGroupPriceComponent < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::ChargeItemDefinitionPriceComponentType'    
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :factor, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :amount, class_name: 'FHIR::Money'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.factor.nil? 
        result['factor'] = self.factor.value
        serialized = Extension.serializePrimitiveExtension(self.factor)            
        result['_factor'] = serialized unless serialized.nil?
      end
      unless self.amount.nil? 
        result['amount'] = self.amount.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ChargeItemDefinitionPropertyGroupPriceComponent.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = ChargeItemDefinitionPriceComponentType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['factor'] = PrimitiveDecimal.transform_json(json_hash['factor'], json_hash['_factor']) unless json_hash['factor'].nil?
      result['amount'] = Money.transform_json(json_hash['amount']) unless json_hash['amount'].nil?

      result
    end
  end
end
