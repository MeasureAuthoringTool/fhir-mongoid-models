module FHIR
  # fhir/episode_of_care_status_history.rb
  class EpisodeOfCareStatusHistory < BackboneElement
    include Mongoid::Document
    embeds_one :status, class_name: 'FHIR::EpisodeOfCareStatus'    
    embeds_one :period, class_name: 'FHIR::Period'    
    
    def as_json(*args)
      result = super      
      unless self.status.nil? 
        result['status'] = self.status.value
        serialized = Extension.serializePrimitiveExtension(self.status)            
        result['_status'] = serialized unless serialized.nil?
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

    def self.transform_json(json_hash, target = EpisodeOfCareStatusHistory.new)
      result = self.superclass.transform_json(json_hash, target)
      result['status'] = EpisodeOfCareStatus.transform_json(json_hash['status'], json_hash['_status']) unless json_hash['status'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?

      result
    end
  end
end
