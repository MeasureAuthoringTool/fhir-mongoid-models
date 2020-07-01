module FHIR
  # fhir/implementation_guide_definition_template.rb
  class ImplementationGuideDefinitionTemplate < BackboneElement
    include Mongoid::Document
    embeds_one :code, class_name: 'PrimitiveCode'
    embeds_one :source, class_name: 'PrimitiveString'
    embeds_one :scope, class_name: 'PrimitiveString'

    def self.transform_json(json_hash, target = ImplementationGuideDefinitionTemplate.new)
      result = self.superclass.transform_json(json_hash, target)
      result['code'] = PrimitiveCode.transform_json(json_hash['code'], json_hash['_code']) unless json_hash['code'].nil?      
      result['source'] = PrimitiveString.transform_json(json_hash['source'], json_hash['_source']) unless json_hash['source'].nil?      
      result['scope'] = PrimitiveString.transform_json(json_hash['scope'], json_hash['_scope']) unless json_hash['scope'].nil?      

      result
    end
  end
end
