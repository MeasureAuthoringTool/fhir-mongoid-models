module FHIR
  # fhir/usage_context.rb
  class UsageContext < Element
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::Coding'    
    embeds_one :valueCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :valueQuantity, class_name: 'FHIR::Quantity'    
    embeds_one :valueRange, class_name: 'FHIR::Range'    
    embeds_one :valueReference, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.code.nil? 
        result['code'] = self.code.as_json(*args)
      end
      unless self.valueCodeableConcept.nil?
        result['valueCodeableConcept'] = self.valueCodeableConcept.as_json(*args)                        
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
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = UsageContext.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = Coding.transform_json(json_hash['code']) unless json_hash['code'].nil?
      result['valueCodeableConcept'] = CodeableConcept.transform_json(json_hash['valueCodeableConcept']) unless json_hash['valueCodeableConcept'].nil?
      result['valueQuantity'] = Quantity.transform_json(json_hash['valueQuantity']) unless json_hash['valueQuantity'].nil?
      result['valueRange'] = Range.transform_json(json_hash['valueRange']) unless json_hash['valueRange'].nil?
      result['valueReference'] = Reference.transform_json(json_hash['valueReference']) unless json_hash['valueReference'].nil?

      result
    end
  end
end
