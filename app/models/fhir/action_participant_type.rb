module FHIR
  # fhir/action_participant_type.rb
  class ActionParticipantType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ActionParticipantType'
    field :value, type: String

    def self.transform_json(json_hash)
      result = ActionParticipantType.new
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
