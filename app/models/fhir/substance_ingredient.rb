module FHIR
  # fhir/substance_ingredient.rb
  class SubstanceIngredient < BackboneElement
    include Mongoid::Document
    embeds_one :quantity, class_name: 'FHIR::Ratio'    
    embeds_one :substanceCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :substanceReference, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.quantity.nil? 
        result['quantity'] = self.quantity.as_json(*args)
      end
      unless self.substanceCodeableConcept.nil?
        result['substanceCodeableConcept'] = self.substanceCodeableConcept.as_json(*args)                        
      end          
      unless self.substanceReference.nil?
        result['substanceReference'] = self.substanceReference.as_json(*args)                        
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = SubstanceIngredient.new)
      result = self.superclass.transform_json(json_hash, target)
      result['quantity'] = Ratio.transform_json(json_hash['quantity']) unless json_hash['quantity'].nil?
      result['substanceCodeableConcept'] = CodeableConcept.transform_json(json_hash['substanceCodeableConcept']) unless json_hash['substanceCodeableConcept'].nil?
      result['substanceReference'] = Reference.transform_json(json_hash['substanceReference']) unless json_hash['substanceReference'].nil?

      result
    end
  end
end
