module FHIR
  # fhir/encounter_status_history.rb
  class EncounterStatusHistory < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'EncounterStatusHistory'
    embeds_one :status, class_name: 'EncounterStatus'
    embeds_one :period, class_name: 'Period'

    def self.transform_json(json_hash)
      result = EncounterStatusHistory.new
      result['status'] = EncounterStatus.transform_json(json_hash['status']) unless json_hash['status'].nil?      
      result['period'] = Period.transform_json(json_hash['period']) unless json_hash['period'].nil?      

      result
    end
  end
end
