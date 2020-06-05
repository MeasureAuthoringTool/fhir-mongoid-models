module FHIR
  class ExampleScenarioActor < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExampleScenarioActor'
    field :actorId, type:  # primitive
    embeds_one :_actorId, class_name: 'Extension'
    embeds_one :type, class_name: 'ExampleScenarioActorType'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
  end
end
