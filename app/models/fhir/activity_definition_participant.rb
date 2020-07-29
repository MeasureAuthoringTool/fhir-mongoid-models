module FHIR
  # fhir/activity_definition_participant.rb
  class ActivityDefinitionParticipant < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::ActivityParticipantType'    
    embeds_one :role, class_name: 'FHIR::CodeableConcept'    

    def self.transform_json(json_hash, target = ActivityDefinitionParticipant.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = ActivityParticipantType.transform_json(json_hash['type']) unless json_hash['type'].nil?
      result['role'] = CodeableConcept.transform_json(json_hash['role']) unless json_hash['role'].nil?

      result
    end
  end
end
