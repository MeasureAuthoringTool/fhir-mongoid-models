module FHIR
  # fhir/example_scenario_process.rb
  class ExampleScenarioProcess < BackboneElement
    include Mongoid::Document
    embeds_one :title, class_name: 'FHIR::PrimitiveString'    
    embeds_one :description, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :preConditions, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_one :postConditions, class_name: 'FHIR::PrimitiveMarkdown'    
    embeds_many :step, class_name: 'FHIR::ExampleScenarioProcessStep'    

    def self.transform_json(json_hash, target = ExampleScenarioProcess.new)
      result = self.superclass.transform_json(json_hash, target)
      result['title'] = PrimitiveString.transform_json(json_hash['title'], json_hash['_title']) unless json_hash['title'].nil?
      result['description'] = PrimitiveMarkdown.transform_json(json_hash['description'], json_hash['_description']) unless json_hash['description'].nil?
      result['preConditions'] = PrimitiveMarkdown.transform_json(json_hash['preConditions'], json_hash['_preConditions']) unless json_hash['preConditions'].nil?
      result['postConditions'] = PrimitiveMarkdown.transform_json(json_hash['postConditions'], json_hash['_postConditions']) unless json_hash['postConditions'].nil?
      result['step'] = json_hash['step'].map { |var| ExampleScenarioProcessStep.transform_json(var) } unless json_hash['step'].nil?

      result
    end
  end
end
