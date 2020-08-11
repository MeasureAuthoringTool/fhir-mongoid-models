module FHIR
  # fhir/encounter_diagnosis.rb
  class EncounterDiagnosis < BackboneElement
    include Mongoid::Document
    embeds_one :condition, class_name: 'FHIR::Reference'    
    embeds_one :use, class_name: 'FHIR::CodeableConcept'    
    embeds_one :rank, class_name: 'FHIR::PrimitivePositiveInt'    
    
    def as_json(*args)
      result = super      
      unless self.condition.nil? 
        result['condition'] = self.condition.as_json(*args)
      end
      unless self.use.nil? 
        result['use'] = self.use.as_json(*args)
      end
      unless self.rank.nil? 
        result['rank'] = self.rank.value
        serialized = Extension.serializePrimitiveExtension(self.rank)            
        result['_rank'] = serialized unless serialized.nil?
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = EncounterDiagnosis.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['condition'] = Reference.transform_json(json_hash['condition']) unless json_hash['condition'].nil?
      result['use'] = CodeableConcept.transform_json(json_hash['use']) unless json_hash['use'].nil?
      result['rank'] = PrimitivePositiveInt.transform_json(json_hash['rank'], json_hash['_rank']) unless json_hash['rank'].nil?

      result
    end
  end
end
