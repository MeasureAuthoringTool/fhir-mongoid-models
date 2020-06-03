module FHIR
  class TestScriptDestination < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptDestination'
    field :index, type:  # primitive
    embeds_one :_index, class_name: 'Extension'
    embeds_one :profile, class_name: 'Coding'
  end
end
