module FHIR
  # fhir/request_group_action_related_action.rb
  class RequestGroupActionRelatedAction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'RequestGroupActionRelatedAction'
    embeds_one :actionId, class_name: 'PrimitiveId'
    embeds_one :relationship, class_name: 'ActionRelationshipType'
    embeds_one :offsetDuration, class_name: 'Duration'
    embeds_one :offsetRange, class_name: 'Range'

    def self.transform_json(json_hash, target=RequestGroupActionRelatedAction.new)
      result = self.superclass.transform_json(json_hash, target)
      result['actionId'] = PrimitiveId.transform_json(json_hash['actionId'], json_hash['_actionId']) unless json_hash['actionId'].nil?      
      result['relationship'] = ActionRelationshipType.transform_json(json_hash['relationship']) unless json_hash['relationship'].nil?      
      result['offsetDuration'] = Duration.transform_json(json_hash['offsetDuration']) unless json_hash['offsetDuration'].nil?      
      result['offsetRange'] = Range.transform_json(json_hash['offsetRange']) unless json_hash['offsetRange'].nil?      

      result
    end
  end
end
