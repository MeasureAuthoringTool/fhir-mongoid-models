module FHIR
  class ExampleScenarioInstanceVersion < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExampleScenarioInstanceVersion'
    field :versionId, type:  # primitive
    embeds_one :_versionId, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
  end
end
