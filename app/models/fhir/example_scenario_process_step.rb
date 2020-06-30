module FHIR
  # fhir/example_scenario_process_step.rb
  class ExampleScenarioProcessStep < BackboneElement
    include Mongoid::Document
    field :typeName, type: String, default: 'ExampleScenarioProcessStep'
    embeds_many :process, class_name: 'ExampleScenarioProcess'
    embeds_one :pause, class_name: 'PrimitiveBoolean'
    embeds_one :operation, class_name: 'ExampleScenarioProcessStepOperation'
    embeds_many :alternative, class_name: 'ExampleScenarioProcessStepAlternative'

    def self.transform_json(json_hash, target=ExampleScenarioProcessStep.new)
      result = self.superclass.transform_json(json_hash, target)
      result['process'] = json_hash['process'].map { |var| ExampleScenarioProcess.transform_json(var) } unless json_hash['process'].nil?
      result['pause'] = PrimitiveBoolean.transform_json(json_hash['pause'], json_hash['_pause']) unless json_hash['pause'].nil?      
      result['operation'] = ExampleScenarioProcessStepOperation.transform_json(json_hash['operation']) unless json_hash['operation'].nil?      
      result['alternative'] = json_hash['alternative'].map { |var| ExampleScenarioProcessStepAlternative.transform_json(var) } unless json_hash['alternative'].nil?

      result
    end
  end
end
