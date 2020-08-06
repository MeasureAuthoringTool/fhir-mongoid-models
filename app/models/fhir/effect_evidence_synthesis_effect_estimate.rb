module FHIR
  # fhir/effect_evidence_synthesis_effect_estimate.rb
  class EffectEvidenceSynthesisEffectEstimate < BackboneElement
    include Mongoid::Document
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :variantState, class_name: 'FHIR::CodeableConcept'    
    embeds_one :value, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :unitOfMeasure, class_name: 'FHIR::CodeableConcept'    
    embeds_many :precisionEstimate, class_name: 'FHIR::EffectEvidenceSynthesisEffectEstimatePrecisionEstimate'    
    
    def as_json(*args)
      result = super      
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.type.nil? 
        result['type'] = self.type.as_json(*args)
      end
      unless self.variantState.nil? 
        result['variantState'] = self.variantState.as_json(*args)
      end
      unless self.value.nil? 
        result['value'] = self.value.value
        serialized = Extension.serializePrimitiveExtension(self.value)            
        result['_value'] = serialized unless serialized.nil?
      end
      unless self.unitOfMeasure.nil? 
        result['unitOfMeasure'] = self.unitOfMeasure.as_json(*args)
      end
      unless self.precisionEstimate.nil?  || !self.precisionEstimate.any? 
        result['precisionEstimate'] = self.precisionEstimate.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = EffectEvidenceSynthesisEffectEstimate.new)
      result = self.superclass.transform_json(json_hash, target)
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['variantState'] = CodeableConcept.transform_json(json_hash['variantState']) unless json_hash['variantState'].nil?
      result['value'] = PrimitiveDecimal.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?
      result['unitOfMeasure'] = CodeableConcept.transform_json(json_hash['unitOfMeasure']) unless json_hash['unitOfMeasure'].nil?
      result['precisionEstimate'] = json_hash['precisionEstimate'].map { |var| 
        unless var['resourceType'].nil?
          Object.const_get('FHIR::' + var['resourceType']).transform_json(var)
        else
          EffectEvidenceSynthesisEffectEstimatePrecisionEstimate.transform_json(var) 
        end
      } unless json_hash['precisionEstimate'].nil?

      result
    end
  end
end
