module FHIR
  # fhir/message_header.rb
  class MessageHeader < DomainResource
    include Mongoid::Document
    field :typeName, type: String, default: 'MessageHeader'
    embeds_one :eventCoding, class_name: 'Coding'
    embeds_one :eventuri, class_name: 'PrimitiveUri'
    embeds_many :destination, class_name: 'MessageHeaderDestination'
    embeds_one :sender, class_name: 'Reference'
    embeds_one :enterer, class_name: 'Reference'
    embeds_one :author, class_name: 'Reference'
    embeds_one :source, class_name: 'MessageHeaderSource'
    embeds_one :responsible, class_name: 'Reference'
    embeds_one :reason, class_name: 'CodeableConcept'
    embeds_one :response, class_name: 'MessageHeaderResponse'
    embeds_many :focus, class_name: 'Reference'
    embeds_one :definition, class_name: 'PrimitiveCanonical'

    def self.transform_json(json_hash)
      result = MessageHeader.new
      result['eventCoding'] = Coding.transform_json(json_hash['eventCoding']) unless json_hash['eventCoding'].nil?      
      result['eventuri'] = PrimitiveUri.transform_json(json_hash['eventuri'], json_hash['_eventuri']) unless json_hash['eventuri'].nil?      
      result['destination'] = json_hash['destination'].map { |var| MessageHeaderDestination.transform_json(var) } unless json_hash['destination'].nil?
      result['sender'] = Reference.transform_json(json_hash['sender']) unless json_hash['sender'].nil?      
      result['enterer'] = Reference.transform_json(json_hash['enterer']) unless json_hash['enterer'].nil?      
      result['author'] = Reference.transform_json(json_hash['author']) unless json_hash['author'].nil?      
      result['source'] = MessageHeaderSource.transform_json(json_hash['source']) unless json_hash['source'].nil?      
      result['responsible'] = Reference.transform_json(json_hash['responsible']) unless json_hash['responsible'].nil?      
      result['reason'] = CodeableConcept.transform_json(json_hash['reason']) unless json_hash['reason'].nil?      
      result['response'] = MessageHeaderResponse.transform_json(json_hash['response']) unless json_hash['response'].nil?      
      result['focus'] = json_hash['focus'].map { |var| Reference.transform_json(var) } unless json_hash['focus'].nil?
      result['definition'] = PrimitiveCanonical.transform_json(json_hash['definition'], json_hash['_definition']) unless json_hash['definition'].nil?      

      result
    end
  end
end
