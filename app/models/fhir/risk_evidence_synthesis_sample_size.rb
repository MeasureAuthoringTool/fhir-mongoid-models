module FHIR
  # fhir/risk_evidence_synthesis_sample_size.rb
  class RiskEvidenceSynthesisSampleSize < BackboneElement
    include Mongoid::Document
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :numberOfStudies, class_name: 'FHIR::PrimitiveInteger'    
    embeds_one :numberOfParticipants, class_name: 'FHIR::PrimitiveInteger'    
    
    def as_json(*args)
      result = super      
      unless self.description.nil? 
        result['description'] = self.description.value
        serialized = Extension.serializePrimitiveExtension(self.description)            
        result['_description'] = serialized unless serialized.nil?
      end
      unless self.numberOfStudies.nil? 
        result['numberOfStudies'] = self.numberOfStudies.value
        serialized = Extension.serializePrimitiveExtension(self.numberOfStudies)            
        result['_numberOfStudies'] = serialized unless serialized.nil?
      end
      unless self.numberOfParticipants.nil? 
        result['numberOfParticipants'] = self.numberOfParticipants.value
        serialized = Extension.serializePrimitiveExtension(self.numberOfParticipants)            
        result['_numberOfParticipants'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = RiskEvidenceSynthesisSampleSize.new)
      result = self.superclass.transform_json(json_hash, target)
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['numberOfStudies'] = PrimitiveInteger.transform_json(json_hash['numberOfStudies'], json_hash['_numberOfStudies']) unless json_hash['numberOfStudies'].nil?
      result['numberOfParticipants'] = PrimitiveInteger.transform_json(json_hash['numberOfParticipants'], json_hash['_numberOfParticipants']) unless json_hash['numberOfParticipants'].nil?

      result
    end
  end
end
