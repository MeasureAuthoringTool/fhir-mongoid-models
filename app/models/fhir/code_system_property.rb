module FHIR
  # fhir/code_system_property.rb
  class CodeSystemProperty < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'FHIR::PrimitiveCode'    
    embeds_one :uri, class_name: 'FHIR::PrimitiveUri'    
    embeds_one :description, class_name: 'FHIR::PrimitiveString'    
    embeds_one :type, class_name: 'FHIR::PropertyType'    

    def self.transform_json(json_hash, target = CodeSystemProperty.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?
      result['uri'] = PrimitiveUri.transform_json(json_hash['uri'], json_hash['_uri']) unless json_hash['uri'].nil?
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['type'] = PropertyType.transform_json(json_hash['type']) unless json_hash['type'].nil?

      result
    end
  end
end
