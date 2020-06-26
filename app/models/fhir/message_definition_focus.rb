module FHIR
  # fhir/message_definition_focus.rb
  class MessageDefinitionFocus < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MessageDefinitionFocus'
    embeds_one :code, class_name: 'ResourceType'
    embeds_one :profile, class_name: 'PrimitiveCanonical'
    embeds_one :min, class_name: 'PrimitiveUnsignedInt'
    embeds_one :max, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = MessageDefinitionFocus.new
      result['code'] = ResourceType.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['profile'] = PrimitiveCanonical.transform_json(json_hash['profile'], json_hash['_profile']) unless json_hash['profile'].nil?      
      result['min'] = PrimitiveUnsignedInt.transform_json(json_hash['min'], json_hash['_min']) unless json_hash['min'].nil?      
      result['max'] = PrimitiveString.transform_json(json_hash['max'], json_hash['_max']) unless json_hash['max'].nil?      

      result
    end
  end
end
