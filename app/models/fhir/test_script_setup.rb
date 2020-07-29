module FHIR
  # fhir/test_script_setup.rb
  class TestScriptSetup < BackboneElement
    include Mongoid::Document
    embeds_many :action, class_name: 'FHIR::TestScriptSetupAction'    

    def self.transform_json(json_hash, target = TestScriptSetup.new)
      result = self.superclass.transform_json(json_hash, target)
      result['action'] = json_hash['action'].map { |var| TestScriptSetupAction.transform_json(var) } unless json_hash['action'].nil?

      result
    end
  end
end
