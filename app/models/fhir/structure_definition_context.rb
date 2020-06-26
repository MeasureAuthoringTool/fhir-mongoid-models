module FHIR
  # fhir/structure_definition_context.rb
  class StructureDefinitionContext < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'StructureDefinitionContext'
    embeds_one :type, class_name: 'ExtensionContextType'
    embeds_one :expression, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = StructureDefinitionContext.new
      result['type'] = ExtensionContextType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['expression'] = PrimitiveString.transform_json(json_hash['expression'], json_hash['_expression']) unless json_hash['expression'].nil?      

      result
    end
  end
end
