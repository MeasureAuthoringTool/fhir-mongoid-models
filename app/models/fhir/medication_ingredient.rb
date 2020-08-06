module FHIR
  # fhir/medication_ingredient.rb
  class MedicationIngredient < BackboneElement
    include Mongoid::Document
    embeds_one :itemCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :itemReference, class_name: 'FHIR::Reference'    
    embeds_one :isActive, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :strength, class_name: 'FHIR::Ratio'    
    
    def as_json(*args)
      result = super      
      unless self.itemCodeableConcept.nil?
        result['itemCodeableConcept'] = self.itemCodeableConcept.as_json(*args)                        
      end          
      unless self.itemReference.nil?
        result['itemReference'] = self.itemReference.as_json(*args)                        
      end          
      unless self.isActive.nil? 
        result['isActive'] = self.isActive.value
        serialized = Extension.serializePrimitiveExtension(self.isActive)            
        result['_isActive'] = serialized unless serialized.nil?
      end
      unless self.strength.nil? 
        result['strength'] = self.strength.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicationIngredient.new)
      result = self.superclass.transform_json(json_hash, target)
      result['itemCodeableConcept'] = CodeableConcept.transform_json(json_hash['itemCodeableConcept']) unless json_hash['itemCodeableConcept'].nil?
      result['itemReference'] = Reference.transform_json(json_hash['itemReference']) unless json_hash['itemReference'].nil?
      result['isActive'] = PrimitiveBoolean.transform_json(json_hash['isActive'], json_hash['_isActive']) unless json_hash['isActive'].nil?
      result['strength'] = Ratio.transform_json(json_hash['strength']) unless json_hash['strength'].nil?

      result
    end
  end
end
