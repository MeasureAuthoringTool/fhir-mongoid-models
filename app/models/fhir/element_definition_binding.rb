module FHIR
  # fhir/element_definition_binding.rb
  class ElementDefinitionBinding < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'ElementDefinitionBinding'
    embeds_one :strength, class_name: 'BindingStrength'
    embeds_one :description, class_name: 'PrimitiveString'
    embeds_one :valueSet, class_name: 'PrimitiveCanonical'

    def self.transform_json(json_hash)
      result = ElementDefinitionBinding.new
      result['strength'] = BindingStrength.transform_json(json_hash['strength']) unless json_hash['strength'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['valueSet'] = PrimitiveCanonical.transform_json(json_hash['valueSet'], json_hash['_valueSet']) unless json_hash['valueSet'].nil?      

      result
    end
  end
end
