module FHIR
  # fhir/implementation_guide_definition_parameter.rb
  class ImplementationGuideDefinitionParameter < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImplementationGuideDefinitionParameter'
    embeds_one :code, class_name: 'GuideParameterCode'
    embeds_one :value, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target=ImplementationGuideDefinitionParameter.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = GuideParameterCode.transform_json(json_hash['code']) unless json_hash['code'].nil?      
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?      

      result
    end
  end
end
