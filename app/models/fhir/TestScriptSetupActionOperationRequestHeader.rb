module FHIR
  class TestScriptSetupActionOperationRequestHeader < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptSetupActionOperationRequestHeader'
    field :field, type:  # primitive
    embeds_one :_field, class_name: 'Extension'
    field :value, type:  # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
