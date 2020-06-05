module FHIR
  class ExampleScenarioProcessStepOperation < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExampleScenarioProcessStepOperation'
    field :number, type:  # primitive
    embeds_one :_number, class_name: 'Extension'
    field :type, type:  # primitive
    embeds_one :_type, class_name: 'Extension'
    field :name, type:  # primitive
    embeds_one :_name, class_name: 'Extension'
    field :initiator, type:  # primitive
    embeds_one :_initiator, class_name: 'Extension'
    field :receiver, type:  # primitive
    embeds_one :_receiver, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    field :initiatorActive, type:  # primitive
    embeds_one :_initiatorActive, class_name: 'Extension'
    field :receiverActive, type:  # primitive
    embeds_one :_receiverActive, class_name: 'Extension'
    embeds_one :request, class_name: 'ExampleScenarioInstanceContainedInstance'
    embeds_one :response, class_name: 'ExampleScenarioInstanceContainedInstance'
  end
end
