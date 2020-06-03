module FHIR
  class ExampleScenarioInstanceContainedInstance < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExampleScenarioInstanceContainedInstance'
    field :resourceId, type:  # primitive
    embeds_one :_resourceId, class_name: 'Extension'
    field :versionId, type:  # primitive
    embeds_one :_versionId, class_name: 'Extension'
  end
end
