module FHIR
  # fhir/code_system_property.rb
  class CodeSystemProperty < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'CodeSystemProperty'
    embeds_one :code, class_name: 'PrimitiveCode'
    embeds_one :uri, class_name: 'PrimitiveUri'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :type, class_name: 'PropertyType'

    def self.transform_json(json_hash)
      result = CodeSystemProperty.new
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?      
      result['uri'] = PrimitiveUri.transform_json(json_hash['uri'], json_hash['_uri']) unless json_hash['uri'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['type'] = PropertyType.transform_json(json_hash['type']) unless json_hash['type'].nil?      

      result
    end
  end
end
