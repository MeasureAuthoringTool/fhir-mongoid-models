module FHIR
  # fhir/message_header_destination.rb
  class MessageHeaderDestination < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :target, class_name: 'Reference'
    embeds_one :endpoint, class_name: 'PrimitiveUrl'
    embeds_one :receiver, class_name: 'Reference'

    def self.transform_json(json_hash, target = MessageHeaderDestination.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['target'] = Reference.transform_json(json_hash['target']) unless json_hash['target'].nil?      
      result['endpoint'] = PrimitiveUrl.transform_json(json_hash['endpoint'], json_hash['_endpoint']) unless json_hash['endpoint'].nil?      
      result['receiver'] = Reference.transform_json(json_hash['receiver']) unless json_hash['receiver'].nil?      

      result
    end
  end
end
