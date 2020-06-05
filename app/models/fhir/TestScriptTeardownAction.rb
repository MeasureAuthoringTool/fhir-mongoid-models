module FHIR
  class TestScriptTeardownAction < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptTeardownAction'
    embeds_one :operation, class_name: 'TestScriptSetupActionOperation'
  end
end
