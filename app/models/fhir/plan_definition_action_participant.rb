module FHIR
  # fhir/plan_definition_action_participant.rb
  class PlanDefinitionActionParticipant < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'PlanDefinitionActionParticipant'
    embeds_one :type, class_name: 'ActionParticipantType'
    embeds_one :role, class_name: 'CodeableConcept'

    def self.transform_json(json_hash, target=PlanDefinitionActionParticipant.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = ActionParticipantType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['role'] = CodeableConcept.transform_json(json_hash['role']) unless json_hash['role'].nil?      

      result
    end
  end
end
