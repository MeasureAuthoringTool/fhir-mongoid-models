module FHIR
  # fhir/plan_definition_action_participant.rb
  class PlanDefinitionActionParticipant < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::ActionParticipantType'    
    embeds_one :role, class_name: 'FHIR::CodeableConcept'    
    
    def as_json(*args)
      result = super      
      unless self.type.nil? 
        result['type'] = self.type.value
        serialized = Extension.serializePrimitiveExtension(self.type)            
        result['_type'] = serialized unless serialized.nil?
      end
      unless self.role.nil? 
        result['role'] = self.role.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = PlanDefinitionActionParticipant.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = ActionParticipantType.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?
      result['role'] = CodeableConcept.transform_json(json_hash['role']) unless json_hash['role'].nil?

      result
    end
  end
end
