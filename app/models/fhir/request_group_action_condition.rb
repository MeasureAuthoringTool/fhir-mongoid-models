module FHIR
  # fhir/request_group_action_condition.rb
  class RequestGroupActionCondition < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'RequestGroupActionCondition'
    embeds_one :kind, class_name: 'ActionConditionKind'
    embeds_one :expression, class_name: 'Expression'

    def self.transform_json(json_hash)
      result = RequestGroupActionCondition.new
      result['kind'] = ActionConditionKind.transform_json(json_hash['kind']) unless json_hash['kind'].nil?      
      result['expression'] = Expression.transform_json(json_hash['expression']) unless json_hash['expression'].nil?      

      result
    end
  end
end
