module FHIR
  # fhir/action_participant_type.rb
  class ActionParticipantType < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ActionParticipantType'
    field :value, type: String

    def self.transform_json(json_hash, target=ActionParticipantType.new)
      result = self.superclass.transform_json(json_hash, target)
      result['value'] = json_hash['value'] unless json_hash['value'].nil?

      result
    end
  end
end
