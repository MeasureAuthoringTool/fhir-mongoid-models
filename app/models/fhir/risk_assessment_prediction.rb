module FHIR
  # fhir/risk_assessment_prediction.rb
  class RiskAssessmentPrediction < BackboneElement
    include Mongoid::Document
    embeds_one :outcome, class_name: 'FHIR::CodeableConcept'    
    embeds_one :probabilityDecimal, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :probabilityRange, class_name: 'FHIR::Range'    
    embeds_one :qualitativeRisk, class_name: 'FHIR::CodeableConcept'    
    embeds_one :relativeRisk, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :whenPeriod, class_name: 'FHIR::Period'    
    embeds_one :whenRange, class_name: 'FHIR::Range'    
    embeds_one :rationale, class_name: 'FHIR::PrimitiveString'    
    
    def as_json(*args)
      result = super      
      unless self.outcome.nil? 
        result['outcome'] = self.outcome.as_json(*args)
      end
      unless self.probabilityDecimal.nil?
        result['probabilityDecimal'] = self.probabilityDecimal.value                        
        serialized = Extension.serializePrimitiveExtension(self.probabilityDecimal) 
        result['_probabilityDecimal'] = serialized unless serialized.nil?
      end          
      unless self.probabilityRange.nil?
        result['probabilityRange'] = self.probabilityRange.as_json(*args)                        
      end          
      unless self.qualitativeRisk.nil? 
        result['qualitativeRisk'] = self.qualitativeRisk.as_json(*args)
      end
      unless self.relativeRisk.nil? 
        result['relativeRisk'] = self.relativeRisk.value
        serialized = Extension.serializePrimitiveExtension(self.relativeRisk)            
        result['_relativeRisk'] = serialized unless serialized.nil?
      end
      unless self.whenPeriod.nil?
        result['whenPeriod'] = self.whenPeriod.as_json(*args)                        
      end          
      unless self.whenRange.nil?
        result['whenRange'] = self.whenRange.as_json(*args)                        
      end          
      unless self.rationale.nil? 
        result['rationale'] = self.rationale.value
        serialized = Extension.serializePrimitiveExtension(self.rationale)            
        result['_rationale'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = RiskAssessmentPrediction.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['outcome'] = CodeableConcept.transform_json(json_hash['outcome']) unless json_hash['outcome'].nil?
      result['probabilityDecimal'] = PrimitiveDecimal.transform_json(json_hash['probabilityDecimal'], json_hash['_probabilityDecimal']) unless json_hash['probabilityDecimal'].nil?
      result['probabilityRange'] = Range.transform_json(json_hash['probabilityRange']) unless json_hash['probabilityRange'].nil?
      result['qualitativeRisk'] = CodeableConcept.transform_json(json_hash['qualitativeRisk']) unless json_hash['qualitativeRisk'].nil?
      result['relativeRisk'] = PrimitiveDecimal.transform_json(json_hash['relativeRisk'], json_hash['_relativeRisk']) unless json_hash['relativeRisk'].nil?
      result['whenPeriod'] = Period.transform_json(json_hash['whenPeriod']) unless json_hash['whenPeriod'].nil?
      result['whenRange'] = Range.transform_json(json_hash['whenRange']) unless json_hash['whenRange'].nil?
      result['rationale'] = PrimitiveString.transform_json(json_hash['rationale'], json_hash['_rationale']) unless json_hash['rationale'].nil?

      result
    end
  end
end
