module FHIR
  class ExampleScenarioProcessStep < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExampleScenarioProcessStep'
    embeds_many :process, class_name: 'ExampleScenarioProcess'
    field :pause, type:  # primitive
    embeds_one :_pause, class_name: 'Extension'
    embeds_one :operation, class_name: 'ExampleScenarioProcessStepOperation'
    embeds_many :alternative, class_name: 'ExampleScenarioProcessStepAlternative'
  end
end
