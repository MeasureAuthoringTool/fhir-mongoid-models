module FHIR
  # fhir/example_scenario_process_step.rb
  class ExampleScenarioProcessStep < BackboneElement
    include Mongoid::Document
    embeds_many :process, class_name: 'FHIR::ExampleScenarioProcess'    
    embeds_one :pause, class_name: 'FHIR::PrimitiveBoolean'    
    embeds_one :operation, class_name: 'FHIR::ExampleScenarioProcessStepOperation'    
    embeds_many :alternative, class_name: 'FHIR::ExampleScenarioProcessStepAlternative'    
    
    def as_json(*args)
      result = super      
      unless self.process.nil?  || !self.process.any? 
        result['process'] = self.process.map{ |x| x.as_json(*args) }
      end
      unless self.pause.nil? 
        result['pause'] = self.pause.value
        serialized = Extension.serializePrimitiveExtension(self.pause)            
        result['_pause'] = serialized unless serialized.nil?
      end
      unless self.operation.nil? 
        result['operation'] = self.operation.as_json(*args)
      end
      unless self.alternative.nil?  || !self.alternative.any? 
        result['alternative'] = self.alternative.map{ |x| x.as_json(*args) }
      end
      result.delete('id')
      unless self.fhirId.nil?
        result['id'] = self.fhirId
        result.delete('fhirId')
      end  
      result
    end

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
