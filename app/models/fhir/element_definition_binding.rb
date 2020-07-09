module FHIR
  # fhir/element_definition_binding.rb
  class ElementDefinitionBinding < Element
    include Mongoid::Document
    embeds_one :strength, class_name: 'FHIR::BindingStrength'
    embeds_one :description, class_name: 'FHIR::PrimitiveString'
    embeds_one :valueSet, class_name: 'FHIR::PrimitiveCanonical'

    def self.transform_json(json_hash, target = ElementDefinitionBinding.new)
      result = self.superclass.transform_json(json_hash, target)
      result['strength'] = BindingStrength.transform_json(json_hash['strength']) unless json_hash['strength'].nil?      
      result['description'] = PrimitiveString.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['valueSet'] = PrimitiveCanonical.transform_json(json_hash['valueSet'], json_hash['_valueSet']) unless json_hash['valueSet'].nil?      

      result
    end
  end
end
