module FHIR
  # fhir/encounter_participant.rb
  class EncounterParticipant < BackboneElement
    include Mongoid::Document
    embeds_many :type, class_name: 'FHIR::CodeableConcept'    
    embeds_one :period, class_name: 'FHIR::Period'    
    embeds_one :individual, class_name: 'FHIR::Reference'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil?  || !self.type.any? 
        result['type'] = self.type.map{ |x| x.as_json(*args) }
      end
      unless self.period.nil? 
        result['period'] = self.period.as_json(*args)
      end
      unless self.individual.nil? 
        result['individual'] = self.individual.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = EncounterParticipant.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = json_hash['type'].map { |var| CodeableConcept.transform_json(var) } unless json_hash['type'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?
      result['individual'] = Reference.transform_json(json_hash['individual']) unless json_hash['individual'].nil?

      result
    end
  end
end
