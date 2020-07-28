module FHIR
  # fhir/episode_of_care_status_history.rb
  class EpisodeOfCareStatusHistory < BackboneElement
    include Mongoid::Document
    embeds_one :status, class_name: 'FHIR::EpisodeOfCareStatus'    
    embeds_one :period, class_name: 'FHIR::Period'    

    def self.transform_json(json_hash, target = EpisodeOfCareStatusHistory.new)
      result = self.superclass.transform_json(json_hash, target)
      result['status'] = EpisodeOfCareStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?

      result
    end
  end
end
