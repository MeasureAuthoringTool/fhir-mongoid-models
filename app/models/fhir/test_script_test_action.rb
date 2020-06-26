module FHIR
  # fhir/test_script_test_action.rb
  class TestScriptTestAction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptTestAction'
    embeds_one :operation, class_name: 'TestScriptSetupActionOperation'
    embeds_one :assert, class_name: 'TestScriptSetupActionAssert'

    def self.transform_json(json_hash)
      result = TestScriptTestAction.new
      result['operation'] = TestScriptSetupActionOperation.transform_json(json_hash['operation']) unless json_hash['operation'].nil?      
      result['assert'] = TestScriptSetupActionAssert.transform_json(json_hash['assert']) unless json_hash['assert'].nil?      

      result
    end
  end
end
