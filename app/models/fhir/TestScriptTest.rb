module FHIR
  class TestScriptTest < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptTest'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_many :action, class_name: 'TestScriptTestAction'
  end
end
