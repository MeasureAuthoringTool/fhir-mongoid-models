module FHIR
  # fhir/nutrition_order_supplement.rb
  class NutritionOrderSupplement < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :productName, class_name: 'FHIR::PrimitiveString'    
    embeds_many :schedule, class_name: 'FHIR::Timing'    
    embeds_one :quantity, class_name: 'FHIR::SimpleQuantity'    
    embeds_one :instruction, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.productName.nil? 
        result['productName'] = self.productName.value
        serialized = Extension.serializePrimitiveExtension(self.productName)            
        result['_productName'] = serialized unless serialized.nil?
      end
      unless self.schedule.nil?  || !self.schedule.any? 
        result['schedule'] = self.schedule.map{ |x| x.as_json(*args) }
      end
      unless self.quantity.nil? 
        result['quantity'] = self.quantity.as_json(*args)
      end
      unless self.instruction.nil? 
        result['instruction'] = self.instruction.value
        serialized = Extension.serializePrimitiveExtension(self.instruction)            
        result['_instruction'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = NutritionOrderSupplement.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['productName'] = PrimitiveString.transform_json(json_hash['productName'], json_hash['_productName']) unless json_hash['productName'].nil?
      result['schedule'] = json_hash['schedule'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          Timing.transform_json(var) 
        end
      } unless json_hash['schedule'].nil?
      result['quantity'] = SimpleQuantity.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?
      result['instruction'] = PrimitiveString.transform_json(json_hash['instruction'], json_hash['_instruction']) unless json_hash['instruction'].nil?

      result
    end
  end
end
