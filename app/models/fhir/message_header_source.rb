module FHIR
  # fhir/message_header_source.rb
  class MessageHeaderSource < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'MessageHeaderSource'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :software, class_name: 'PrimitiveString'
    embeds_one :version, class_name: 'PrimitiveString'
    embeds_one :contact, class_name: 'ContactPoint'
    embeds_one :endpoint, class_name: 'PrimitiveUrl'

    def self.transform_json(json_hash, target=MessageHeaderSource.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['software'] = PrimitiveString.transform_json(json_hash['software'], json_hash['_software']) unless json_hash['software'].nil?      
      result['version'] = PrimitiveString.transform_json(json_hash['version'], json_hash['_version']) unless json_hash['version'].nil?      
      result['contact'] = ContactPoint.transform_json(json_hash['contact']) unless json_hash['contact'].nil?      
      result['endpoint'] = PrimitiveUrl.transform_json(json_hash['endpoint'], json_hash['_endpoint']) unless json_hash['endpoint'].nil?      

      result
    end
  end
end
