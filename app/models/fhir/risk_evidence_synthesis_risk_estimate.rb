module FHIR
  # fhir/risk_evidence_synthesis_risk_estimate.rb
  class RiskEvidenceSynthesisRiskEstimate < BackboneElement
    include Mongoid::Document
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :value, class_name: 'FHIR::PrimitiveDecimal'    
    embeds_one :unitOfMeasure, class_name: 'FHIR::CodeableConcept'    
    embeds_one :denominatorCount, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :numeratorCount, class_name: 'FHIR::PrimitiveInteger'    
    embeds_many :precisionEstimate, class_name: 'FHIR::RiskEvidenceSynthesisRiskEstimatePrecisionEstimate'    
    
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
      unless self.value.nil? 
        result['value'] = self.value.value
        serialized = Extension.serializePrimitiveExtension(self.value)            
        result['_value'] = serialized unless serialized.nil?
      end
      unless self.unitOfMeasure.nil? 
        result['unitOfMeasure'] = self.unitOfMeasure.as_json(*args)
      end
      unless self.denominatorCount.nil? 
        result['denominatorCount'] = self.denominatorCount.value
        serialized = Extension.serializePrimitiveExtension(self.denominatorCount)            
        result['_denominatorCount'] = serialized unless serialized.nil?
      end
      unless self.numeratorCount.nil? 
        result['numeratorCount'] = self.numeratorCount.value
        serialized = Extension.serializePrimitiveExtension(self.numeratorCount)            
        result['_numeratorCount'] = serialized unless serialized.nil?
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

    def self.transform_json(json_hash, target = RiskEvidenceSynthesisRiskEstimate.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['type'] = CodeableConcept.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['value'] = PrimitiveDecimal.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?
      result['unitOfMeasure'] = CodeableConcept.transform_json(json_hash['unitOfMeasure']) unless json_hash['unitOfMeasure'].nil?
      result['denominatorCount'] = PrimitiveInteger.transform_json(json_hash['denominatorCount'], json_hash['_denominatorCount']) unless json_hash['denominatorCount'].nil?
      result['numeratorCount'] = PrimitiveInteger.transform_json(json_hash['numeratorCount'], json_hash['_numeratorCount']) unless json_hash['numeratorCount'].nil?
      result['precisionEstimate'] = json_hash['precisionEstimate'].map { |var| RiskEvidenceSynthesisRiskEstimatePrecisionEstimate.transform_json(var) } unless json_hash['precisionEstimate'].nil?

      result
    end
  end
end
