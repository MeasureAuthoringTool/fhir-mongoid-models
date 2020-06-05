module FHIR
  class TestScriptRequestMethodCode < Element
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptRequestMethodCode'
    field :value, type: String # primitive
    embeds_one :_value, class_name: 'Extension'
  end
end
