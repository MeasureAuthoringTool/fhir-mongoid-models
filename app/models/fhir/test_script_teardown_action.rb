module FHIR
  # fhir/test_script_teardown_action.rb
  class TestScriptTeardownAction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptTeardownAction'
    embeds_one :operation, class_name: 'TestScriptSetupActionOperation'

    def self.transform_json(json_hash)
      result = TestScriptTeardownAction.new
      result['operation'] = TestScriptSetupActionOperation.transform_json(json_hash['operation']) unless json_hash['operation'].nil?      

      result
    end
  end
end
