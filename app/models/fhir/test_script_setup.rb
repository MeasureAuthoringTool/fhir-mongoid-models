module FHIR
  # fhir/test_script_setup.rb
  class TestScriptSetup < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptSetup'
    embeds_many :action, class_name: 'TestScriptSetupAction'

    def self.transform_json(json_hash)
      result = TestScriptSetup.new
      result['action'] = json_hash['action'].map { |var| TestScriptSetupAction.transform_json(var) } unless json_hash['action'].nil?

      result
    end
  end
end
