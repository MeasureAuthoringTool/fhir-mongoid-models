module FHIR
  class TestScriptSetup < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptSetup'
    embeds_many :action, class_name: 'TestScriptSetupAction'
  end
end
