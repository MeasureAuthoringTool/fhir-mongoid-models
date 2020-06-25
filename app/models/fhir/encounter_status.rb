module FHIR
  # fhir/encounter_status.rb
  class EncounterStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'EncounterStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = EncounterStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
