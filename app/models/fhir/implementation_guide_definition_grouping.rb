module FHIR
  # fhir/implementation_guide_definition_grouping.rb
  class ImplementationGuideDefinitionGrouping < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ImplementationGuideDefinitionGrouping'
    embeds_one :name, class_name: 'PrimitiveString'
    embeds_one :description, class_name: 'PrimitiveString'

    def self.transform_json(json_hash)
      result = ImplementationGuideDefinitionGrouping.new
      result['name'] = PrimitiveString.transform_json(json_hash['name'], json_hash['_name']) unless json_hash['name'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      

      result
    end
  end
end
