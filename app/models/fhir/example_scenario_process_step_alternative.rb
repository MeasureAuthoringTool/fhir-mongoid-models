module FHIR
  # fhir/example_scenario_process_step_alternative.rb
  class ExampleScenarioProcessStepAlternative < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExampleScenarioProcessStepAlternative'
    embeds_one :title, class_name: 'PrimitiveString'
    embeds_one :description, class_name: 'PrimitiveMarkdown'
    embeds_many :step, class_name: 'ExampleScenarioProcessStep'

    def self.transform_json(json_hash, target=ExampleScenarioProcessStepAlternative.new)
      result = self.superclass.transform_json(json_hash, target)
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?      
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?      
      result['step'] = json_hash['step'].map { |var| ExampleScenarioProcessStep.transform_json(var) } unless json_hash['step'].nil?

      result
    end
  end
end
