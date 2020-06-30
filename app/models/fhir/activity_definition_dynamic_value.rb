module FHIR
  # fhir/activity_definition_dynamic_value.rb
  class ActivityDefinitionDynamicValue < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ActivityDefinitionDynamicValue'
    embeds_one :path, class_name: 'PrimitiveString'
    embeds_one :expression, class_name: 'Expression'

    def self.transform_json(json_hash, target=ActivityDefinitionDynamicValue.new)
      result = self.superclass.transform_json(json_hash, target)
      result['path'] = PrimitiveString.transform_json(json_hash['path'], json_hash['_path']) unless json_hash['path'].nil?      
      result['expression'] = Expression.transform_json(json_hash['expression']) unless json_hash['expression'].nil?      

      result
    end
  end
end
