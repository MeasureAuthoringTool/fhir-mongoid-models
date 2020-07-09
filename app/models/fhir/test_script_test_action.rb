module FHIR
  # fhir/test_script_test_action.rb
  class TestScriptTestAction < BackboneElement
    include Mongoid::Document
    embeds_one :operation, class_name: 'FHIR::TestScriptSetupActionOperation'
    embeds_one :assert, class_name: 'FHIR::TestScriptSetupActionAssert'

    def self.transform_json(json_hash, target = TestScriptTestAction.new)
      result = self.superclass.transform_json(json_hash, target)
      result['operation'] = TestScriptSetupActionOperation.transform_json(json_hash['operation']) unless json_hash['operation'].nil?      
      result['assert'] = TestScriptSetupActionAssert.transform_json(json_hash['assert']) unless json_hash['assert'].nil?      

      result
    end
  end
end
