module FHIR
  # fhir/clinical_impression_finding.rb
  class ClinicalImpressionFinding < BackboneElement
    include Mongoid::Document
    embeds_one :itemCodeableConcept, class_name: 'FHIR::CodeableConcept'    
    embeds_one :itemReference, class_name: 'FHIR::Reference'    
    embeds_one :basis, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.itemCodeableConcept.nil? 
        result['itemCodeableConcept'] = self.itemCodeableConcept.as_json(*args)
      end
      unless self.itemReference.nil? 
        result['itemReference'] = self.itemReference.as_json(*args)
      end
      unless self.basis.nil? 
        result['basis'] = self.basis.value
        serialized = Extension.serializePrimitiveExtension(self.basis)            
        result['_basis'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = ClinicalImpressionFinding.new)
      result = self.superclass.transform_json(json_hash, target)
      result['itemCodeableConcept'] = CodeableConcept.transform_json(json_hash['itemCodeableConcept']) unless json_hash['itemCodeableConcept'].nil?
      result['itemReference'] = Reference.transform_json(json_hash['itemReference']) unless json_hash['itemReference'].nil?
      result['basis'] = PrimitiveString.transform_json(json_hash['basis'], json_hash['_basis']) unless json_hash['basis'].nil?

      result
    end
  end
end
