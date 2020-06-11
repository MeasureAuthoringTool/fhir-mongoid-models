module FHIR
  class TestScriptTeardown < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptTeardown'
    embeds_many :action, class_name: 'TestScriptTeardownAction'
  end
end
