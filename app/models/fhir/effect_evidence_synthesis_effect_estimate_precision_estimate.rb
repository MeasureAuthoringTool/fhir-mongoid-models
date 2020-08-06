module FHIR
  # fhir/effect_evidence_synthesis_effect_estimate_precision_estimate.rb
  class EffectEvidenceSynthesisEffectEstimatePrecisionEstimate < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :level, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :from, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :to, class_name: 'FHIR::PrimitiveDecimal'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.level.nil? 
        result['level'] = self.level.value
        serialized = Extension.serializePrimitiveExtension(self.level)            
        result['_level'] = serialized unless serialized.nil?
      end
      unless self.from.nil? 
        result['from'] = self.from.value
        serialized = Extension.serializePrimitiveExtension(self.from)            
        result['_from'] = serialized unless serialized.nil?
      end
      unless self.to.nil? 
        result['to'] = self.to.value
        serialized = Extension.serializePrimitiveExtension(self.to)            
        result['_to'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = EffectEvidenceSynthesisEffectEstimatePrecisionEstimate.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['level'] = PrimitiveDecimal.transform_json(json_hash['level'], json_hash['_level']) unless json_hash['level'].nil?
      result['from'] = PrimitiveDecimal.transform_json(json_hash['from'], json_hash['_from']) unless json_hash['from'].nil?
      result['to'] = PrimitiveDecimal.transform_json(json_hash['to'], json_hash['_to']) unless json_hash['to'].nil?

      result
    end
  end
end
