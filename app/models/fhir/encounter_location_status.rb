module FHIR
  # fhir/encounter_location_status.rb
  class EncounterLocationStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'EncounterLocationStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = EncounterLocationStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
