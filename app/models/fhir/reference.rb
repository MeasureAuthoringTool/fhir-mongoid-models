module FHIR
  # fhir/reference.rb
  class Reference < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'Reference'
    embeds_one :reference, class_name: 'PrimitiveString'
    embeds_one :type, class_name: 'PrimitiveUri'
    embeds_one :identifier, class_name: 'Identifier'
    embeds_one :display, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = Reference.new
      result['reference'] = PrimitiveString.transform_json(json_hash['reference'], json_hash['_reference']) unless json_hash['reference'].nil?      
      result['type'] = PrimitiveUri.transform_json(json_hash['type'], json_hash['_type']) unless json_hash['type'].nil?      
      result['identifier'] = Identifier.transform_json(json_hash['identifier']) unless json_hash['identifier'].nil?      
      result['display'] = PrimitiveString.transform_json(json_hash['display'], json_hash['_display']) unless json_hash['display'].nil?      

      result
    end
  end
end
