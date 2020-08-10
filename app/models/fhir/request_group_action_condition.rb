module FHIR
  # fhir/request_group_action_condition.rb
  class RequestGroupActionCondition < BackboneElement
    include Mongoid::Document
    embeds_one :kind, class_name: 'FHIR::ActionConditionKind'    
    embeds_one :expression, class_name: 'FHIR::Expression'    
    
    def as_json(*args)
      result = super      
      unless self.kind.nil? 
        result['kind'] = self.kind.value
        serialized = Extension.serializePrimitiveExtension(self.kind)            
        result['_kind'] = serialized unless serialized.nil?
      end
      unless self.expression.nil? 
        result['expression'] = self.expression.as_json(*args)
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

    def self.transform_json(json_hash, target = RequestGroupActionCondition.new)
    
      result = self.superclass.transform_json(json_hash, target)
      result['kind'] = ActionConditionKind.transform_json(json_hash['kind'], json_hash['_kind']) unless json_hash['kind'].nil?
      result['expression'] = Expression.transform_json(json_hash['expression']) unless json_hash['expression'].nil?

      result
    end
  end
end
