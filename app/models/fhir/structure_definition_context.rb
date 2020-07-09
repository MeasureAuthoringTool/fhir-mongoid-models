module FHIR
  # fhir/structure_definition_context.rb
  class StructureDefinitionContext < BackboneElement
    include Mongoid::Document
    embeds_one :type, class_name: 'FHIR::ExtensionContextType'
    embeds_one :expression, class_name: 'FHIR::PrimitiveString'

    def self.transform_json(json_hash, target = StructureDefinitionContext.new)
      result = self.superclass.transform_json(json_hash, target)
      result['type'] = ExtensionContextType.transform_json(json_hash['type']) unless json_hash['type'].nil?      
      result['expression'] = PrimitiveString.transform_json(json_hash['expression'], json_hash['_expression']) unless json_hash['expression'].nil?      

      result
    end
  end
end
