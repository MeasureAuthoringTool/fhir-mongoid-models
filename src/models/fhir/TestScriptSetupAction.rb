module FHIR
  class TestScriptSetupAction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptSetupAction'
    embeds_one :operation, class_name: 'TestScriptSetupActionOperation'
    embeds_one :assert, class_name: 'TestScriptSetupActionAssert'
  end
end
