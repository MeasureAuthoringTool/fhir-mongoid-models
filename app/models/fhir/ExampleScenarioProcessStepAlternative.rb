module FHIR
  class ExampleScenarioProcessStepAlternative < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExampleScenarioProcessStepAlternative'
    field :title, type:  # primitive
    embeds_one :_title, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    embeds_many :step, class_name: 'ExampleScenarioProcessStep'
  end
end
