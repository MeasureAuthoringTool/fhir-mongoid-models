module FHIR
  # fhir/test_script_variable.rb
  class TestScriptVariable < BackboneElement
    include Mongoid::Document
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :defaultValue, class_name: 'PrimitiveString'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :expression, class_name: 'PrimitiveString'
    embeds_one :headerField, class_name: 'PrimitiveString'
    embeds_one :hint, class_name: 'PrimitiveString'
    embeds_one :path, class_name: 'PrimitiveString'
    embeds_one :sourceId, class_name: 'PrimitiveId'

    def self.transform_json(json_hash, target = TestScriptVariable.new)
      result = self.superclass.transform_json(json_hash, target)
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['defaultValue'] = PrimitiveString.transform_json(json_hash['defaultValue'], json_hash['_defaultValue']) unless json_hash['defaultValue'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['expression'] = PrimitiveString.transform_json(json_hash['expression'], json_hash['_expression']) unless json_hash['expression'].nil?      
      result['headerField'] = PrimitiveString.transform_json(json_hash['headerField'], json_hash['_headerField']) unless json_hash['headerField'].nil?      
      result['hint'] = PrimitiveString.transform_json(json_hash['hint'], json_hash['_hint']) unless json_hash['hint'].nil?      
      result['path'] = PrimitiveString.transform_json(json_hash['path'], json_hash['_path']) unless json_hash['path'].nil?      
      result['sourceId'] = PrimitiveId.transform_json(json_hash['sourceId'], json_hash['_sourceId']) unless json_hash['sourceId'].nil?      

      result
    end
  end
end
