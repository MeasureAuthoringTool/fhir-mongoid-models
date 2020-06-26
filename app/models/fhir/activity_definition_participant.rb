module FHIR
  # fhir/activity_definition_participant.rb
  class ActivityDefinitionParticipant < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ActivityDefinitionParticipant'
    embeds_one :type, class_name: 'ActivityParticipantType'
    embeds_one :role, class_name: 'CodeableConcept'

    def self.transform_json(json_hash)
      result = ActivityDefinitionParticipant.new
      result['type'] = ActivityParticipantType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['role'] = CodeableConcept.transform_json(json_hash['role']) unless json_hash['role'].nil?      

      result
    end
  end
end
