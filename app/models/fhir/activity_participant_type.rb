module FHIR
  # fhir/activity_participant_type.rb
  class ActivityParticipantType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ActivityParticipantType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ActivityParticipantType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
