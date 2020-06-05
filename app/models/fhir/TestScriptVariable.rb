module FHIR
  class TestScriptVariable < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'TestScriptVariable'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :defaultValue, type:  # primitive
    embeds_one :_defaultValue, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    field :expression, type:  # primitive
    embeds_one :_expression, class_name: 'Extension'
    field :headerField, type:  # primitive
    embeds_one :_headerField, class_name: 'Extension'
    field :hint, type:  # primitive
    embeds_one :_hint, class_name: 'Extension'
    field :path, type:  # primitive
    embeds_one :_path, class_name: 'Extension'
    field :sourceId, type:  # primitive
    embeds_one :_sourceId, class_name: 'Extension'
  end
end
