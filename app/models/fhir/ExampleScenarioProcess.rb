module FHIR
  class ExampleScenarioProcess < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExampleScenarioProcess'
    field :title, type:  # primitive
    embeds_one :_title, class_name: 'Extension'
    field :description, type:  # primitive
    embeds_one :_description, class_name: 'Extension'
    field :preConditions, type:  # primitive
    embeds_one :_preConditions, class_name: 'Extension'
    field :postConditions, type:  # primitive
    embeds_one :_postConditions, class_name: 'Extension'
    embeds_many :step, class_name: 'ExampleScenarioProcessStep'
  end
end
