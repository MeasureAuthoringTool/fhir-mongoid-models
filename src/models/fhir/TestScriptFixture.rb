module FHIR
  class TestScriptFixture < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptFixture'
    field :autocreate, type:  # primitive
    embeds_one :_autocreate, class_name: 'Extension'
    field :autodelete, type:  # primitive
    embeds_one :_autodelete, class_name: 'Extension'
    embeds_one :resource, class_name: 'Reference'
  end
end
