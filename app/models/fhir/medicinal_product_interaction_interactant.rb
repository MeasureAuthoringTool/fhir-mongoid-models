module FHIR
  # fhir/medicinal_product_interaction_interactant.rb
  class MedicinalProductInteractionInteractant < BackboneElement
    include Mongoid::Document
    embeds_one :itemReference, class_name: 'FHIR::Reference'    
    embeds_one :itemCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.itemReference.nil?
        result['itemReference'] = self.itemReference.as_json(*args)                        
      end          
      unless self.itemCodeableConcept.nil?
        result['itemCodeableConcept'] = self.itemCodeableConcept.as_json(*args)                        
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicinalProductInteractionInteractant.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['itemReference'] = Reference.transform_json(json_hash['itemReference']) unless json_hash['itemReference'].nil?
      result['itemCodeableConcept'] = CodeableConcept.transform_json(json_hash['itemCodeableConcept']) unless json_hash['itemCodeableConcept'].nil?

      result
    end
  end
end
