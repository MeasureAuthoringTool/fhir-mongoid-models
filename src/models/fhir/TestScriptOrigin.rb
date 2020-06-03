module FHIR
  class TestScriptOrigin < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptOrigin'
    field :index, type:  # primitive
    embeds_one :_index, class_name: 'Extension'
    embeds_one :profile, class_name: 'Coding'
  end
end
