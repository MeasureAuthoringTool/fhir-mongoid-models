module FHIR
  # fhir/operation_definition_parameter_binding.rb
  class OperationDefinitionParameterBinding < BackboneElement
    include Mongoid::Document
    embeds_one :strength, class_name: 'FHIR::BindingStrength'    
    embeds_one :valueSet, class_name: 'FHIR::PrimitiveCanonical'    

    def self.transform_json(json_hash, target = OperationDefinitionParameterBinding.new)
      result = self.superclass.transform_json(json_hash, target)
      result['strength'] = BindingStrength.transform_json(json_hash['strength']) unless json_hash['strength'].nil?
      result['valueSet'] = PrimitiveCanonical.transform_json(json_hash['valueSet'], json_hash['_valueSet']) unless json_hash['valueSet'].nil?

      result
    end
  end
end
