module FHIR
  # fhir/encounter_class_history.rb
  class EncounterClassHistory < BackboneElement
    include Mongoid::Document
    embeds_one :class, class_name: 'FHIR::Coding'    
    embeds_one :period, class_name: 'FHIR::Period'    
    
    def as_json(*args)
      result = super      
      unless self.class.nil? 
        result['class'] = self.class.as_json(*args)
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = EncounterClassHistory.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['class'] = Coding.transform_json(json_hash['class']) unless json_hash['class'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?

      result
    end
  end
end
