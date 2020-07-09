module FHIR
  # fhir/test_script_setup_action_operation_request_header.rb
  class TestScriptSetupActionOperationRequestHeader < BackboneElement
    include Mongoid::Document
    embeds_one :field, class_name: 'FHIR::PrimitiveString'
    embeds_one :value, class_name: 'FHIR::PrimitiveString'

    def self.transform_json(json_hash, target = TestScriptSetupActionOperationRequestHeader.new)
      result = self.superclass.transform_json(json_hash, target)
      result['field'] = PrimitiveString.transform_json(json_hash['field'], json_hash['_field']) unless json_hash['field'].nil?      
      result['value'] = PrimitiveString.transform_json(json_hash['value'], json_hash['_value']) unless json_hash['value'].nil?      

      result
    end
  end
end
