module FHIR
  # fhir/participant_status.rb
  class ParticipantStatus < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ParticipantStatus'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ParticipantStatus.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
