module FHIR
  class ExampleScenarioInstance < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExampleScenarioInstance'
    field :resourceId, type:  # primitive
    embeds_one :_resourceId, class_name: 'Extension'
    embeds_one :resourceType, class_name: 'FHIRResourceType'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_many :version, class_name: 'ExampleScenarioInstanceVersion'
    embeds_many :containedInstance, class_name: 'ExampleScenarioInstanceContainedInstance'
  end
end
