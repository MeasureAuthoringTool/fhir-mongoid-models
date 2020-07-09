module FHIR
  # fhir/example_scenario_process_step.rb
  class ExampleScenarioProcessStep < BackboneElement
    include Mongoid::Document
    embeds_many :process, class_name: 'FHIR::ExampleScenarioProcess'
    embeds_one :pause, class_name: 'FHIR::PrimitiveBoolean'
    embeds_one :operation, class_name: 'FHIR::ExampleScenarioProcessStepOperation'
    embeds_many :alternative, class_name: 'FHIR::ExampleScenarioProcessStepAlternative'

    def self.transform_json(json_hash, target = ExampleScenarioProcessStep.new)
      result = self.superclass.transform_json(json_hash, target)
      result['process'] = json_hash['process'].map { |var| ExampleScenarioProcess.transform_json(var) } unless json_hash['process'].nil?
      result['pause'] = PrimitiveBoolean.transform_json(json_hash['pause'], json_hash['_pause']) unless json_hash['pause'].nil?      
      result['operation'] = ExampleScenarioProcessStepOperation.transform_json(json_hash['operation']) unless json_hash['operation'].nil?      
      result['alternative'] = json_hash['alternative'].map { |var| ExampleScenarioProcessStepAlternative.transform_json(var) } unless json_hash['alternative'].nil?

      result
    end
  end
end
