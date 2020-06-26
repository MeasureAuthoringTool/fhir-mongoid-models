module FHIR
  # fhir/message_definition_allowed_response.rb
  class MessageDefinitionAllowedResponse < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MessageDefinitionAllowedResponse'
    embeds_one :message, class_name: 'PrimitiveCanonical'
    embeds_one :situation, class_name: 'PrimitiveMarkdown'

    def self.transform_json(json_hash)
      result = MessageDefinitionAllowedResponse.new
      result['message'] = PrimitiveCanonical.transform_json(json_hash['message'], json_hash['_message']) unless json_hash['message'].nil?      
      result['situation'] = PrimitiveMarkdown.transform_json(json_hash['situation'], json_hash['_situation']) unless json_hash['situation'].nil?      

      result
    end
  end
end
