module FHIR
  # fhir/adverse_event_suspect_entity_causality.rb
  class AdverseEventSuspectEntityCausality < BackboneElement
    include Mongoid::Document
    embeds_one :assessment, class_name: 'FHIR::CodeableConcept'    
    embeds_one :productRelatedness, class_name: 'FHIR::PrimitiveString'    
    embeds_one :author, class_name: 'FHIR::Reference'    
    embeds_one :method, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.assessment.nil? 
        result['assessment'] = self.assessment.as_json(*args)
      end
      unless self.productRelatedness.nil? 
        result['productRelatedness'] = self.productRelatedness.value
        serialized = Extension.serializePrimitiveExtension(self.productRelatedness)            
        result['_productRelatedness'] = serialized unless serialized.nil?
      end
      unless self.author.nil? 
        result['author'] = self.author.as_json(*args)
      end
      unless self.method.nil? 
        result['method'] = self.method.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = AdverseEventSuspectEntityCausality.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['assessment'] = CodeableConcept.transform_json(json_hash['assessment']) unless json_hash['assessment'].nil?
      result['productRelatedness'] = PrimitiveString.transform_json(json_hash['productRelatedness'], json_hash['_productRelatedness']) unless json_hash['productRelatedness'].nil?
      result['author'] = Reference.transform_json(json_hash['author']) unless json_hash['author'].nil?
      result['method'] = CodeableConcept.transform_json(json_hash['method']) unless json_hash['method'].nil?

      result
    end
  end
end
