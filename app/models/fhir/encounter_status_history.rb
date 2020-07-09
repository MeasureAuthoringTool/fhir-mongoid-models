module FHIR
  # fhir/encounter_status_history.rb
  class EncounterStatusHistory < BackboneElement
    include Mongoid::Document
    embeds_one :status, class_name: 'FHIR::EncounterStatus'
    embeds_one :period, class_name: 'FHIR::Period'

    def self.transform_json(json_hash, target = EncounterStatusHistory.new)
      result = self.superclass.transform_json(json_hash, target)
      result['status'] = EncounterStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      

      result
    end
  end
end
