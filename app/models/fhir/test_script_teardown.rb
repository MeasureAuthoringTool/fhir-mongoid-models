module FHIR
  # fhir/test_script_teardown.rb
  class TestScriptTeardown < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptTeardown'
    embeds_many :action, class_name: 'TestScriptTeardownAction'

    def self.transform_json(json_hash)
      result = TestScriptTeardown.new
      result['action'] = json_hash['action'].map { |var| TestScriptTeardownAction.transform_json(var) } unless json_hash['action'].nil?

      result
    end
  end
end
