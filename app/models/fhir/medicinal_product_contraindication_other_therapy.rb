module FHIR
  # fhir/medicinal_product_contraindication_other_therapy.rb
  class MedicinalProductContraindicationOtherTherapy < BackboneElement
    include Mongoid::Document
    embeds_one :therapyRelationshipType, class_name: 'FHIR::CodeableConcept'    
    embeds_one :medicationCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :medicationReference, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.therapyRelationshipType.nil? 
        result['therapyRelationshipType'] = self.therapyRelationshipType.as_json(*args)
      end
      unless self.medicationCodeableConcept.nil?
        result['medicationCodeableConcept'] = self.medicationCodeableConcept.as_json(*args)                        
      end          
      unless self.medicationReference.nil?
        result['medicationReference'] = self.medicationReference.as_json(*args)                        
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = MedicinalProductContraindicationOtherTherapy.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['therapyRelationshipType'] = CodeableConcept.transform_json(json_hash['therapyRelationshipType']) unless json_hash['therapyRelationshipType'].nil?
      result['medicationCodeableConcept'] = CodeableConcept.transform_json(json_hash['medicationCodeableConcept']) unless json_hash['medicationCodeableConcept'].nil?
      result['medicationReference'] = Reference.transform_json(json_hash['medicationReference']) unless json_hash['medicationReference'].nil?

      result
    end
  end
end
