module FHIR
  # fhir/plan_definition_action_related_action.rb
  class PlanDefinitionActionRelatedAction < BackboneElement
    include Mongoid::Document
    embeds_one :actionId, class_name: 'FHIR::PrimitiveId'    
    embeds_one :relationship, class_name: 'FHIR::ActionRelationshipType'    
    embeds_one :offsetDuration, class_name: 'FHIR::Duration'    
    embeds_one :offsetRange, class_name: 'FHIR::Range'    
    
    def as_json(*args)
      result = super      
      unless self.actionId.nil? 
        result['actionId'] = self.actionId.value
        serialized = Extension.serializePrimitiveExtension(self.actionId)            
        result['_actionId'] = serialized unless serialized.nil?
      end
      unless self.relationship.nil? 
        result['relationship'] = self.relationship.value
        serialized = Extension.serializePrimitiveExtension(self.relationship)            
        result['_relationship'] = serialized unless serialized.nil?
      end
      unless self.offsetDuration.nil?
        result['offsetDuration'] = self.offsetDuration.as_json(*args)                        
      end          
      unless self.offsetRange.nil?
        result['offsetRange'] = self.offsetRange.as_json(*args)                        
      end          
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = PlanDefinitionActionRelatedAction.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['actionId'] = PrimitiveId.transform_json(json_hash['actionId'], json_hash['_actionId']) unless json_hash['actionId'].nil?
      result['relationship'] = ActionRelationshipType.transform_json(json_hash['relationship'], json_hash['_relationship']) unless json_hash['relationship'].nil?
      result['offsetDuration'] = Duration.transform_json(json_hash['offsetDuration']) unless json_hash['offsetDuration'].nil?
      result['offsetRange'] = Range.transform_json(json_hash['offsetRange']) unless json_hash['offsetRange'].nil?

      result
    end
  end
end
