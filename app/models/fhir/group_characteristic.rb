module FHIR
  # fhir/group_characteristic.rb
  class GroupCharacteristic < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::CodeableConcept'    
    embeds_one :valueCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :valueBoolean, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :valueQuantity, class_name: 'FHIR::Quantity'    
    embeds_one :valueRange, class_name: 'FHIR::Range'    
    embeds_one :valueReference, class_name: 'FHIR::Reference'    
    embeds_one :exclude, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :period, class_name: 'FHIR::Period'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.valueCodeableConcept.nil?
        result['valueCodeableConcept'] = self.valueCodeableConcept.as_json(*args)                        
      end          
      unless self.valueBoolean.nil?
        result['valueBoolean'] = self.valueBoolean.value                        
        serialized = Extension.serializePrimitiveExtension(self.valueBoolean) 
        result['_valueBoolean'] = serialized unless serialized.nil?
      end          
      unless self.valueQuantity.nil?
        result['valueQuantity'] = self.valueQuantity.as_json(*args)                        
      end          
      unless self.valueRange.nil?
        result['valueRange'] = self.valueRange.as_json(*args)                        
      end          
      unless self.valueReference.nil?
        result['valueReference'] = self.valueReference.as_json(*args)                        
      end          
      unless self.exclude.nil? 
        result['exclude'] = self.exclude.value
        serialized = Extension.serializePrimitiveExtension(self.exclude)            
        result['_exclude'] = serialized unless serialized.nil?
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = GroupCharacteristic.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = CodeableConcept.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['valueCodeableConcept'] = CodeableConcept.transform_json(json_hash['valueCodeableConcept']) unless json_hash['valueCodeableConcept'].nil?
      result['valueBoolean'] = PrimitiveBoolean.transform_json(json_hash['valueBoolean'], json_hash['_valueBoolean']) unless json_hash['valueBoolean'].nil?
      result['valueQuantity'] = Quantity.transform_json(json_hash['valueQuantity']) unless json_hash['valueQuantity'].nil?
      result['valueRange'] = Range.transform_json(json_hash['valueRange']) unless json_hash['valueRange'].nil?
      result['valueReference'] = Reference.transform_json(json_hash['valueReference']) unless json_hash['valueReference'].nil?
      result['exclude'] = PrimitiveBoolean.transform_json(json_hash['exclude'], json_hash['_exclude']) unless json_hash['exclude'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?

      result
    end
  end
end
